<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<img src="images/redhat.png" width="50" height="50"/>
<h2>セッション格納データ</h2>
 <p>
 ServerName: 
 <span style="border-bottom:solid 2px #ff0000;">
 <%
	String servername = System.getProperty("jboss.server.name");
	request.setAttribute("servername", servername);
	out.println(servername);
 %>
 </span>
 </p>
 <p>
 IP: 
 <span style="border-bottom:solid 2px #ff0000;">
 <%
	java.net.InetAddress in = java.net.InetAddress.getLocalHost();
	String localAddress = in.getHostAddress(); 
	out.println(localAddress);
%>
</span>
</p>
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
<p><a href="index.jsp" >トップに戻る</a></p>
<p><a href="javascript:location.reload();">更新する</a></p>
</body>
</html>