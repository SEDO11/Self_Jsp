<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 객체 생성을 위한 sql 패키지 연결 -->
<%@ page import="java.sql.*" %>
<%@ page import="dao.*" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String uid = (String) session.getAttribute("id");
	if(uid == null) {
		response.sendRedirect("login.html");
		return;
	}
	session.setAttribute("id", uid);
	
	ArrayList<UserObj> users = (new UserDAO()).getList();

	// 2차원 테이블 형태의 실행 결과를 바탕으로, 사용자 아이디와 패스워드를 리스트 형태로 출력합니다.
	String str = "<table align=center>";
	str += "<tr><th colspan=3 align=center>회원명단 리스트</th>";
	str += "</tr>";
	
	for(UserObj user : users) {
		str += "<tr><th colspan=3><hr></th></tr>";
		str += "<tr><th colspan=2 align=left>" + user.getId() + "</th><th colspan=1 align=right>(" + user.getName() + ")</th></tr>";
		str += "<tr><th align=left>" + user.getTs() + "</th></tr>";
	}
	str += "</table>";
	out.print(str);
	// 모든 객체를 닫음
%>
</body>
</html>