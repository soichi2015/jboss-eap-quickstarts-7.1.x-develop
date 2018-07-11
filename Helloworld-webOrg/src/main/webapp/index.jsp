<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hello!Openshift.</title>
</head>
<body background="./images/v<%=System.getenv("Version")%>.jpg">
<pre><font size="5">稼働環境：<font color="#0000ff"><b><%=System.getProperty("jboss.server.name") %>(OPENSHIFTで本番稼働中)</b></font></font></pre>
<pre><font size="5">IP Address:<font color="#0000ff"><b><%
java.net.InetAddress in = java.net.InetAddress.getLocalHost();
String localAddress = in.getHostAddress(); 
out.println(localAddress);
%>
<b><pre><font size="5"></font></pre></b>
<pre><font size="7">Hello World! --- Ver<%=System.getenv("Version")%>.0</font></pre>

<pre>
    <h1>HTMLファイルからPOSTでJSONデータを送信する</h1>
    <p>URL: <input type="text" id="url_post" name="url" size="100" value="http://testurl/"></p>
    <p>value1: <input type="text" id="value1" size="30" value="値1"></p>
    <p>value2: <input type="text" id="value2" size="30" value="値2"></p>
    <p><button id="button" type="button">submit</button></p>
    <textarea id="response" cols=120 rows=10 disabled></textarea>
</pre>

</body>
</html>
