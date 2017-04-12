<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<img src="images/<%=System.getenv("COLOR")%>.png" width="50" height="50"/>
<h2>各種データ</h2>

<table border="1">
<tr>サーバ環境情報</tr>
		<tr>
			<td> ServerName </td>
			<td>  
				<span style="border-bottom:solid 2px #ff0000;">
			 	<%
					String servername = System.getProperty("jboss.server.name");
					out.println(servername);
			 	%>
		 		</span>
 		 	</td>
		</tr>
		<tr>
			<td>IP</td>
			<td>
				<span style="border-bottom:solid 2px #ff0000;">
				<%
					java.net.InetAddress in = java.net.InetAddress.getLocalHost();
					String localAddress = in.getHostAddress(); 
					out.println(localAddress);
				%>
				</span>
			</td>
		</tr>
		<tr>
			<td>JDK Version</td>
			<td>
				<span style="border-bottom:solid 2px #ff0000;">
			 	<%
			 		String jv = System.getProperty("java.version");
			 		out.println(jv);
			 	%>
				</span>
			</td>
		</tr>
 </table>
<p> </p>
	<table border="1">
	<tr>セッション格納情報</tr>
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