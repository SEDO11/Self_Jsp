<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.*"%>
<%

	request.setCharacterEncoding("utf-8");
	String uid = request.getParameter("id");
	String upw = request.getParameter("pw");

	UserDAO dao = new UserDAO();

	if(dao.withdraw(uid, upw)) {
		out.print("회원탈퇴가 완료 되었습니다.");
	} else {
		out.print("회원탈퇴가 제대로 이루어지지 않았습니다.");
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