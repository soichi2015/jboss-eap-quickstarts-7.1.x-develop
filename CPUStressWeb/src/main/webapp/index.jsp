<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Index Page</title>
</head>
<body>
<%
session = request.getSession(true);
%>
<form  name="formName" method="POST" action="/CPUStressWeb/sample/CalccosServlet">
		<p>繰り返し数：<input type="text" name="count" size="6"></p>
		<p><input type="submit" value="送信" /></p>
</form>

</body>
</html>