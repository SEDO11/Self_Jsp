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
	String upw1 = request.getParameter("pw1");
	String upw2 = request.getParameter("pw2");
	String uname = request.getParameter("name");
	
	if(sign.signup(uid, upw1, upw2, uname) == 0) {
		out.println("회원가입 완료");
		return;
	}
	
	if(sign.signup(uid, upw1, upw2, uname) == 1) {
		out.println("에러 발생");
		return;
	}

	
	if(sign.signup(uid, upw1, upw2, uname) == 2) {
		out.println("중복된 아이디 입니다.");
		return;
	}

	
	if(sign.signup(uid, upw1, upw2, uname) == 3) {
		out.println("비밀번호가 일치하지 않습니다.");
		return;
	}
	%>
</body>
</html>