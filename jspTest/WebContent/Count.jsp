<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Count</title>
</head>
<body>
	<%
		String check = (String) application.getAttribute("counter");
		int count = (check == null) ? 0 : Integer.valueOf(check);
		out.print("방문자수: "+ count);
		application.setAttribute("counter", String.valueOf(++count));
	%>
</body>
</html>