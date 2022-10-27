<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입자 리스트</title>
</head>
<body>
<%
	UserDAO dao = new UserDAO();
	String str = dao.select();
	if(!str.equals(null)){
		out.print(str);
	}
%>
</body>
</html>