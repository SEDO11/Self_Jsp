<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet" href="../css/signin.css">
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
<title>LogOut</title>
</head>
<body>
	<%
	String uid = (String) session.getAttribute("id");
	if(uid == null) {
		out.print("로그인 정보가 없습니다.");
	} else {
		out.print("메인 페이지 입니다.");
		session.setAttribute("id", uid);
	}
	%>
	<%-- "[" + (String) session.getAttribute("id") + "]" --%> 
	<form action="sessionLogout.jsp">
		<input type="submit" class="w-20 btn btn-lg btn-primary" name="name"
					value="로그아웃">
	</form>
</body>
</html>