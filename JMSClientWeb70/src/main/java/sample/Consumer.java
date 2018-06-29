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

/**
 * Servlet implementation class Consumer
 */
@WebServlet("/Consumer")
public class Consumer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Consumer() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int i = 0;
		String protcol = request.getParameter("protcol");
		String port = request.getParameter("port");
		String providerUrl = protcol + port;
		
		try {
			String[] msgs = new ConsumeMsg().consumeMsg(providerUrl);
			i = msgs.length;
			request.setAttribute("msgs", msgs);
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (JMSException e) {
			e.printStackTrace();
		}
		if(i != 0){
			RequestDispatcher dispatcher = request.getRequestDispatcher("/ConsumeResult.jsp");
			dispatcher.forward(request, response);
		}else{
			RequestDispatcher dispatcher = request.getRequestDispatcher("/MsgZero.jsp");
			dispatcher.forward(request, response);
		}
		}
}
