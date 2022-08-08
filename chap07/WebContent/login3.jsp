<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>
<%@ page import="java.time.LocalDateTime" %>
<%
	String uid = request.getParameter("id");
	if(uid == null) {
		out.print("로그인 정보가 없습니다.");
	} else {
		session.setAttribute("id", uid); // id라는 이름으로 사용자 아이디 저장
		response.sendRedirect("main3.jsp"); // main.jsp로 이동
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