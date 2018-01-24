package sample;

import java.util.Properties;
import java.util.logging.Logger;

import javax.jms.Connection;
import javax.jms.ConnectionFactory;
import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.MessageProducer;
import javax.jms.Session;
import javax.jms.TextMessage;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class SendMsg {

	private static final Logger log = Logger.getLogger(SendMsg.class.getName());
	private static final String DEFAULT_CONNECTION_FACTORY = "jms/RemoteConnectionFactory";
	private static final String DEFAULT_DESTINATION = "jms/queue/sampleQueue-new";
	private static final String DEFAULT_USERNAME = "quickstartUser";
	private static final String DEFAULT_PASSWORD = "quickstartPwd1!";
	private static final String INITIAL_CONTEXT_FACTORY = "org.jboss.naming.remote.client.InitialContextFactory";

	public void sendMsg(String msg, String count, String providerUrl) throws JMSException, NamingException {

		ConnectionFactory connectionFactory = null;
		Connection connection = null;
		Session session = null;
		MessageProducer producer = null;
		Destination destination = null;
		Context context = null;

		final Properties env = new Properties();
		env.put(Context.INITIAL_CONTEXT_FACTORY, INITIAL_CONTEXT_FACTORY);
		env.put(Context.PROVIDER_URL, System.getProperty(Context.PROVIDER_URL, providerUrl));
		env.put(Context.SECURITY_PRINCIPAL, System.getProperty("username", DEFAULT_USERNAME));
		env.put(Context.SECURITY_CREDENTIALS, System.getProperty("password", DEFAULT_PASSWORD));
		context = new InitialContext(env);

		// Perform the JNDI lookups
		String connectionFactoryString = System.getProperty("connection.factory", DEFAULT_CONNECTION_FACTORY);
		log.info("コネクションファクトリ設定 \"" + connectionFactoryString + "\"");
		connectionFactory = (ConnectionFactory) context.lookup(connectionFactoryString);
		log.info("JNDIにコネクションファクトリ検知 \"" + connectionFactoryString + "\"");
		String destinationString = System.getProperty("destination", DEFAULT_DESTINATION);
		log.info("送信先キューの設定 \"" + destinationString + "\"");
		destination = (Destination) context.lookup(destinationString);
		log.info("送信先の検知 \"" + destinationString + "\" in JNDI");

		// Create the JMS connection, session, producer, and consumer
		connection = connectionFactory.createConnection(System.getProperty("username", DEFAULT_USERNAME),
				System.getProperty("password", DEFAULT_PASSWORD));
		session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
		producer = session.createProducer(destination);
		connection.start();

		TextMessage message;
		int msgCount = Integer.parseInt(System.getProperty("message.count", count));
		for (int i = 0; i < msgCount; i++) {
			int j = i + 1;
			String content = System.getProperty("message.content", msg);
			log.info("送信数： 「" + count + "」 送信内容： " + content);

			message = session.createTextMessage(content);
			producer = session.createProducer(destination);
			producer.send(message);
			log.info(j + "件目の送信完了！");
		}

		if (context != null) {
			context.close();
		}
		if (connection != null) {
			connection.close();
		}
	}
}
