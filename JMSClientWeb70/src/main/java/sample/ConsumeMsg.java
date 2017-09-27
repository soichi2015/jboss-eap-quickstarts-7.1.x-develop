package sample;

import java.util.Enumeration;
import java.util.Properties;
import java.util.logging.Logger;

import javax.jms.Connection;
import javax.jms.ConnectionFactory;
import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageConsumer;
import javax.jms.Queue;
import javax.jms.QueueBrowser;
import javax.jms.QueueConnection;
import javax.jms.QueueConnectionFactory;
import javax.jms.QueueSession;
import javax.jms.Session;
import javax.jms.TextMessage;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class ConsumeMsg {
	
	private static final Logger log = Logger.getLogger(ConsumeMsg.class.getName());
	private static final String DEFAULT_CONNECTION_FACTORY = "jms/RemoteConnectionFactory";
	private static final String DEFAULT_DESTINATION = "jms/queue/sampleQueue-new";
	private static final String DEFAULT_USERNAME = "quickstartUser";
	private static final String DEFAULT_PASSWORD = "quickstartPwd1!";
	private static final String INITIAL_CONTEXT_FACTORY = "org.jboss.naming.remote.client.InitialContextFactory";
    
	public String[] consumeMsg(String providerUrl) throws NamingException, JMSException{
		
		ConnectionFactory connectionFactory = null;
		Connection connection = null;
		Session session = null;
		MessageConsumer consumer = null;
		Destination destination = null;
		TextMessage message = null;
		Context context = null;
		
		try {
			final Properties env = new Properties();
			env.put(Context.INITIAL_CONTEXT_FACTORY, INITIAL_CONTEXT_FACTORY);
			env.put(Context.PROVIDER_URL, providerUrl);
			env.put(Context.SECURITY_PRINCIPAL, System.getProperty("username", DEFAULT_USERNAME));
			env.put(Context.SECURITY_CREDENTIALS, System.getProperty("password", DEFAULT_PASSWORD));
			
			context = new InitialContext(env);
			Queue queue = (Queue) context.lookup(DEFAULT_DESTINATION);
			QueueConnectionFactory connFactory = (QueueConnectionFactory) context.lookup(DEFAULT_CONNECTION_FACTORY);
			QueueConnection queueConn = connFactory.createQueueConnection(
					System.getProperty("username", DEFAULT_USERNAME), System.getProperty("password", DEFAULT_PASSWORD));
			QueueSession queueSession = queueConn.createQueueSession(false, Session.AUTO_ACKNOWLEDGE);
			QueueBrowser queueBrowser = queueSession.createBrowser(queue);
			queueConn.start();
			
			@SuppressWarnings("rawtypes")
			Enumeration e = queueBrowser.getEnumeration();
			int numMsgs = 0;
			// count number of messages
			while (e.hasMoreElements()) {
				@SuppressWarnings("unused")
				Message message1 = (Message) e.nextElement();
				numMsgs++;
			}
			System.out.println(queue + " has " + numMsgs + " messages");
			queueConn.close();
			
			if(numMsgs != 0){
			
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
			consumer = session.createConsumer(destination);
			connection.start();
			
			String msgs[] = new String[numMsgs];
			
			for (int i = 0; i < numMsgs; i++) {
				message = (TextMessage) consumer.receive(5000);
				log.info(" 受信内容： " + message.getText());
				msgs[i] = message.getText();
			} 
			return msgs;
			}
		} finally {
			if (context != null) {
				context.close();
			}
			if (connection != null) {
				connection.close();
			}
		}
		String msgs[] = new String[0];
		return msgs;
	}

}
