<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.UserDAO"%>
<%
	request.setCharacterEncoding("utf-8");

	String uid = request.getParameter("id");
	String upw = request.getParameter("pw");
	
	UserDAO dao = new UserDAO();
	if(dao.login(uid, upw) == 1) {
		out.print("해당 아이디는 없는 아이디 입니다.");
	} else if(dao.login(uid, upw) == 2){
		out.print("비밀번호가 일치하지 않습니다.");
	} else {
		out.print("로그인이 완료되었습니다.");
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