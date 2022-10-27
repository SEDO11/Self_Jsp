<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.*" %>
<%
	request.setCharacterEncoding("utf-8");

	String uid = request.getParameter("id");
	String upw = request.getParameter("pw");
	
	UserDAO dao = new UserDAO();

	if(dao.login(uid, upw)){
		response.sendRedirect("c11TestList.jsp");
	} else {
		out.print("로그인 실패");
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