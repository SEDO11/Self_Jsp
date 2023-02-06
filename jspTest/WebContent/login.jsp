<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 한글 깨짐 방지 코드  --%>
	<% request.setCharacterEncoding("utf-8"); %>
	<h3>User ID = <%= request.getParameter("id") %></h3><br>
	<h3>User ID = <%= request.getParameter("pw1") %></h3><br>
	<h3>User ID = <%= request.getParameter("name") %></h3>
</body>
</html>