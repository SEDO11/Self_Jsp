<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.FeedDAO" %>
<!DOCTYPE html>
<html onload="noBack();" onpageshow="if(event.persisted) noBack();" >
<head>
<meta charset="UTF-8">
<title>게시글 보기</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	
	String id = (String) session.getAttribute("id");
	if(id==null) {
		response.sendRedirect("logout.jsp");
	}
	
	FeedDAO dao = new FeedDAO();
	
	out.println(dao.select());
	%>
</body>
</html>