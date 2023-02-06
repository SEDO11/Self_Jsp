<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty property="userID" name="user"/>
<jsp:setProperty property="userPassword" name="user"/>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 로그인 액션</title>
</head>
<body>
	<% 
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUserID(), user.getUserPassword());
		if (result == 1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'main.jsp'");
			script.println("<script>");
		}
		
		if (result == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			
			// 이전 페이지로 사용자를 돌려 보냄, 로그인 페이지로 돌아감
			script.println("history.back()");
			script.println("<script>");
		}
		
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('해당 아이디가 존재하지 않습니다.')");
			script.println("history.back()");
			script.println("<script>");
		}
		
		if (result == -2) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터 베이스 오류가 발생했습니다.')");
			
			// 이전 페이지로 사용자를 돌려 보냄, 로그인 페이지로 돌아감
			script.println("history.back()");
			script.println("<script>");
		}
	%>
</body>
</html>