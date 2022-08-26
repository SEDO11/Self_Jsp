<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>
<%@ page import="dao.UserDAO" %>
<%
	request.setCharacterEncoding("utf-8");

	String uid = request.getParameter("id");
	String upw = request.getParameter("pw");
	
	UserDAO dao = new UserDAO();
	if(dao.login(uid, upw) == 1) {
		out.print("아이디가 존재하지 않습니다.");
	} else if (dao.login(uid, upw) == 2) {
		out.print("비밀번호가 일치하지 않습니다.");
	} else {
		session.setAttribute("id", uid);
		response.sendRedirect("c11_feedlist2.jsp");
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