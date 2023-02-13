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
	String uname = request.getParameter("name");
	
	UserDAO dao = new UserDAO();
	
	int count = dao.insert(id, upw, uname);
	
	if(count == 0){
		out.println("회원가입이 완료 되었습니다.");
	} else if(count == 2) {
		out.println("회원가입에 실패 했습니다. \n이미 존재하는 아이디 입니다.");
	} else {
		out.println("회원가입 도중 에러가 발생했습니다.");
	}
	
	%>
</body>
</html>