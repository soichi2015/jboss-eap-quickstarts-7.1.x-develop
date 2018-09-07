<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.logging.*, javax.batch.operations.JobOperator, javax.batch.runtime.BatchRuntime"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>バッチを開始します</title>
</head>
<body>

<%
JobOperator jo = BatchRuntime.getJobOperator();
long id = jo.start("SampleJob", null); // バッチが起動したら、バッチの完了を待たずに、次の処理へすすむ。
System.out.println("Job ID: " + id); 
out.println("Jobは ID=<b>" + id + "</b> として実行されました。");
%>

    <a href="./index.html">最初に戻る</a>
    
</body>
</html>
