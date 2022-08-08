<!-- request 객체 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Enumeration"%>
    
<!-- 키(이름): 값 형태로 불러옴 -->
<%
	Enumeration<String> en = request.getHeaderNames();
	while(en.hasMoreElements()) {
		String name = (String) en.nextElement();
		String value = request.getHeader(name);
		out.print(name + ": " + value + "<br>");
	}

 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>