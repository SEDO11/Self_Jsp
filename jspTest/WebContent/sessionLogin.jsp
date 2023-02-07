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
	String uid = request.getParameter("id");
	if(uid == null || uid.equals("")) {
		out.print("로그인 정보가 없습니다.");
	} else {
		session.setAttribute("id", uid);
		response.sendRedirect("main.jsp");
	}
	%>
</body>
</html>