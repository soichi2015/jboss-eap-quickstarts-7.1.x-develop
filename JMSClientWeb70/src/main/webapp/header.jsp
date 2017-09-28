<%@ page contentType="text/html;charset=UTF-8" import="java.util.*" %>

<%
     // ヘッダ情報の変数名一覧を取得する
     Enumeration enum = request.getHeaderNames();

     // ヘッダ情報一覧表用のHTMLを格納する文字列
     String rows = "";

     // 各ヘッダ情報についての処理
     while(enum.hasMoreElements()) {
       // ヘッダ情報の変数名を取得
       String name = (String)enum.nextElement();

       // ヘッダ情報の値を取得
       String value = request.getHeader(name);

       // 一覧表用のHTMLを作成する
       rows += "<tr><td>" + name + "</td><td>" +
         value +"</td></tr>";
     }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>ヘッダ情報の取得</title>
</head>
<body>
<h1>ヘッダ情報の取得</h1>
<p>
<table border=1>
<tr><td>変数名</td><td>値</td></tr>
<%= rows %>
</table>
</p>
</body>
</html>
