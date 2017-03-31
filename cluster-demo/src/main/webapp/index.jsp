<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<body>
<img src="images/redhat.png" width="50" height="50">

<h2>こんにちは！</h2>

<%
    System.out.println( "Evaluating date now" );
    java.util.Date date = new java.util.Date();
    session.setAttribute("currentTime", date);
%>

現在時刻 <%= date %>

<form method="post" action="confirm.jsp">
<p>今日の天気は。。。？</p>
<input type="radio" name="q1" value="晴れ"> 晴れ
<input type="radio" name="q1" value="雨"> 雨
<input type="radio" name="q1" value="雪"> 雪
<input type="radio" name="q1" value="曇り"> 曇り
<p><input type="submit" value="送信する"></p>
</form>

</body>
</html>
