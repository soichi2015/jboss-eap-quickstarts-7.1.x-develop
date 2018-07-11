<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hello!Openshift.</title>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>

<script type="text/javascript">
    $(function(){
        $("#response").html("Response Values");

        $("#button").click( function(){
            var url = $("#url_post").val();

                var JSONdata = {
                    value1: $("#value1").val(),
                    value2: $("#value2").val()      
                };

            alert(JSON.stringify(JSONdata));

            $.ajax({
                type : 'post',
                url : url,
                data : JSON.stringify(JSONdata),
                contentType: 'application/JSON',
                dataType : 'JSON',
                scriptCharset: 'utf-8',
                success : function(data) {

                    // Success
                    alert("success");
                    alert(JSON.stringify(data));
                    $("#response").html(JSON.stringify(data));
                },
                error : function(data) {

                    // Error
                    alert("error");
                    alert(JSON.stringify(data));
                    $("#response").html(JSON.stringify(data));
                }
            });
        })
    })
</script>
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
    <p>URL: <input type="text" id="url_post" name="url" size="100" value="http://testurl/"></p>
    <p>value1: <input type="text" id="value1" size="30" value="値1"></p>
    <p>value2: <input type="text" id="value2" size="30" value="値2"></p>
    <p><button id="button" type="button">submit</button></p>
    <textarea id="response" cols=120 rows=10 disabled></textarea>
</pre>

</body>
</html>
