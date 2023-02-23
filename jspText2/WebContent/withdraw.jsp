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
	
	boolean count = dao.delete(id, upw);
	
	if(count){
		out.println("회원 탈퇴가 완료되었습니다.");
	} else {
		out.println("회원 탈퇴가 실패했습니다.");
	}
	
	%>
</body>
</html>