<%@page import="java.net.NetworkInterface"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<body>
<h2>Hello World!</h2>

<pre><font size="5">稼働環境：<font color="#0000ff"><b>
<%=System.getProperty("jboss.server.name") %>(OPENSHIFT-2号機で稼働中)</b></font></font></pre>
<pre><font size="5">IP Address:<font color="#0000ff"><b>
<%
java.net.InetAddress in = java.net.InetAddress.getLocalHost();
String localAddress = in.getHostAddress();
out.println(localAddress);
%>
</b>
</font>
</font>
</pre>

<pre><font size="5">ドメイン：<font color="#0000ff"><b>
<%=System.getenv("SERVICES_DOMAIN") %></b></font></font></pre>

<%
    Enumeration<NetworkInterface> nics = 
        NetworkInterface.getNetworkInterfaces();
    while(nics.hasMoreElements()){
        NetworkInterface nic = nics.nextElement();
        String s = "";
        byte[] hardwareAddress = nic.getHardwareAddress();
        if(hardwareAddress != null){
            for(byte b : hardwareAddress){
                s += String.format("%02X ", b);
            }
        }
        out.println(nic.getName());
        //("%s:%s - %s%n", nic.getName(), nic.getDisplayName(), s);
    }
%>

</body>
</html>
