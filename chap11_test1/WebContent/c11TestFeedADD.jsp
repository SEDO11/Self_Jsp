<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String uid = request.getParameter("id");
	String ucontent = request.getParameter("content");
	
	FeedDAO dao = new FeedDAO();
	if(dao.insert(uid, ucontent)) {
		out.print("성공적으로 반영되었습니다.");
	} else {
		out.print("오류가 발생했습니다.");
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