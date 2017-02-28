 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
 <html>
 <body>
	 <img src="images/redhat.png" width="50" height="50"/>
 <h2>アクセス時刻とユーザー選択情報をセッションに格納 </h2>
 

 <%
     System.out.println( "Putting date now" );
 %>
 
 <%
	request.setCharacterEncoding("UTF-8");
 	String weather = request.getParameter("q1");
 	session.setAttribute("weather", weather); 
 %>

	<table border="1">
		<tr>
			<td> 時刻 </td>
			<td> <%=session.getAttribute("currentTime") %> </td>
		</tr>
		<tr>
			<td> 天気 </td>
			<td> <%
				request.setCharacterEncoding("UTF-8");
				out.print(session.getAttribute("weather"));
			%> </td>
		</tr>
	</table>

<p><a href="result.jsp" >確定する</a></p>

</body>

</html>




