<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.UserDAO" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String uid = request.getParameter("id");
	
	UserDAO dao = new UserDAO();
	if(dao.exists(uid) == false) { // 회원 정보가 없을 경우 여기서 종료
		out.print("회원 정보를 찾을 수 없습니다.");
		return;
	}
	
	if (dao.delete(uid)) {
		out.print("회원탈퇴가 완료되었습니다.");
	} else {
		out.print("회원탈퇴 처리 중 오류가 발생되었습니다.");
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