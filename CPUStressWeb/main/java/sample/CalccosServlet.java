package sample;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Calccos
 */
@WebServlet("/Calccos")
public class CalccosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CalccosServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		String count = request.getParameter("count");
		long[] resultWT = new long[Integer.parseInt(count)];
		double ave = 0.0;
		
		for(int i=0; i < Integer.parseInt(count); ++i){
			long workTime = Calc.calcCos();
			resultWT[i] = workTime;
			System.out.println("計算時間+++ " + resultWT[i] + "ms");
		}
		ave =Calc.average(resultWT);
		String postAve = String.format("%.0f", ave);
		System.out.println("平均時間+++ " + postAve + "ms" );
		
		request.setAttribute("resultWT", resultWT);
		request.setAttribute("resultAv", postAve);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/result.jsp");
		dispatcher.forward(request, response);
	}

}
