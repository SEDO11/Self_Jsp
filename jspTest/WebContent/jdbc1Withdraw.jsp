<%@page import="java.io.Writer"%>
<%@page import="java.io.Console"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.script.*" %>
<%@ page import="com.Signup" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	
	Signup sign = new Signup();
	
	String uid = request.getParameter("id");
	
	if(sign.withdraw(uid) == 0) {
		out.println("회원 탈퇴 완료");
		return;
	}
	
	if(sign.withdraw(uid) == 1) {
		out.println("에러 발생");
		return;
	}
	%>
</body>
</html>