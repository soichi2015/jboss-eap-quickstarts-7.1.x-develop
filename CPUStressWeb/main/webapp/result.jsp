
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Result Page</title>
</head>
<body>

<h2>＋＋＋三角関数の計算処理時間＋＋＋</h2>

<p>計算回数：<%=request.getParameter("count") %>回
</p>
<p>平均処理時間：<%=request.getAttribute("resultAv") %>ms／回</p>


<a href="../index.jsp">Goto-top</a>
</body>
</html>