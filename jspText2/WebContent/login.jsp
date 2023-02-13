<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String upw = request.getParameter("pw1");
	
	UserDAO dao = new UserDAO();
	
	boolean count = dao.login(id, upw);
	
	if(count){
		out.println("로그인에 성공했습니다.");
	} else {
		out.println("로그인에 실패했습니다. \n아이디 혹은 비밀번호가 잘 못 되었습니다.");
	}
	
	%>
</body>
</html>