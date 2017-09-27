<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	</head>
<body>
	<table border="1">
		<tr bgcolor="#E0ECF8">
			<td>No</td>
			<td>メッセージ</td>
		</tr>
		<%
			String[] msgs = (String[])request.getAttribute("msgs");
			for(int i = 0 ; i < msgs.length ; i++){
		%>
		<tr>
			<td><%=i+1 %></td>
			<td><%=msgs[i] %></td>
		</tr>
		<%	
			}
		%>
	</table>
	<A href="/JMSClientWeb70/top.jsp">Go to TopPage</A>
</body>
</html>