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
	request.setCharacterEncoding("utf-8");
	String uid = request.getParameter("id");
	if(uid == null || uid.equals("")) {
		out.print("로그인 정보가 없습니다.");
	} else {
		String now = (new Date()).toString();
		
		session.setAttribute("id", uid);
		session.setAttribute("time", now);
		response.sendRedirect("testMain.jsp");
	}
	
	%>
</body>
</html>