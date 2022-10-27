<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String uid = request.getParameter("id");
String upw = request.getParameter("pw");
String uname = request.getParameter("n");

UserDAO dao = new UserDAO();
if(dao.exists(uid)) {
	out.print("<script>alert('이미 가입한 회원입니다.');</script>");
	return; // 실행 종료
}

if (dao.insert(uid, upw, uname)) {
	out.print("<script>alert('회원가입이 완료 되었습니다.');</script>");
} else {
	out.print("<script>alert('회원가입 처리중 오류가 발생되었습니다.');</script>");
}
%>
</body>
</html>