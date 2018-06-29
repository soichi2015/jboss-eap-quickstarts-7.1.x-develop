<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
 	String hostName = request.getHeader("Host");
 	int index = hostName.indexOf(":");
 	String ip = hostName.substring(0,index);
 %>
<p>送信完了！</p>
<A href="/JMSClientWeb70/top.jsp">Go to TopPage</A>

<form method="POST" action="/JMSClientWeb70/sample/Consumer">
	<p>+++++++++++++++</p>
		<p>
			ProviderURL：
			<select name="protcol">
			<option>http-remoting://</option>
			<option>remote://</option>
			</select>
			<input type="text" name="port" size="17" value="<%=ip%>:8080">		
	</p>
	<p><input type="submit" value="メッセージ受信" /></p>
</form>
</body>
</html>