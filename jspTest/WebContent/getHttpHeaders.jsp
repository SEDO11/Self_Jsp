<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Enumeration<String> en = request.getHeaderNames();
	while (en.hasMoreElements()) {
		String name = (String) en.nextElement();
		String value = request.getHeader(name);
		out.print(name + ": " + value + "<br>");
	}
	%>
</body>
</html>