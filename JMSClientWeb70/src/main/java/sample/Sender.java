package sample;

import java.io.IOException;

import javax.jms.JMSException;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Sender")
public class Sender extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Sender() {
		super();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String msg = request.getParameter("msg");
		String count = request.getParameter("count");
		String protcol = request.getParameter("protcol");
		String port = request.getParameter("port");
		String providerUrl = protcol + port;

		try {
			new SendMsg().sendMsg(msg, count, providerUrl);
		} catch (JMSException e) {
			System.out.println("++++++");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/err.jsp");
			dispatcher.forward(request, response);
			e.printStackTrace();
		} catch (NamingException e) {
			System.out.println("=======");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/err.jsp");
			dispatcher.forward(request, response);
			e.printStackTrace();
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("/SendResult.jsp");
		dispatcher.forward(request, response);
	}

}
