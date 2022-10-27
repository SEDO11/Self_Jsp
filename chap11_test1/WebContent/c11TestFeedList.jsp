<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성 내역</title>
</head>
<body>
<%
	FeedDAO dao = new FeedDAO();
	String str = dao.select();
	if(!str.equals(null)){
		out.print(str);
	}
%>
</body>
</html>