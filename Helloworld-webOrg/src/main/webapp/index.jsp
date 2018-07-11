<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hello!Openshift.</title>
</head>
<body background="./images/<%=System.getenv("Version")%>.jpg">
<pre><font size="5">稼働環境：<font color="#0000ff"><b><%=System.getProperty("jboss.server.name") %></b></font></font></pre>
<pre><font size="5">IP Address:<font color="#0000ff"><b><%
java.net.InetAddress in = java.net.InetAddress.getLocalHost();
String localAddress = in.getHostAddress(); 
out.println(localAddress);
%>
</b></font></font></pre>
<pre><font size="7">Hello World! --- Ver<%=System.getenv("Version")%>.0</font></pre>
</body>
</html>
