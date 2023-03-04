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
	String upw1 = request.getParameter("pw1");
	String upw2 = request.getParameter("pw2");
	String uname = request.getParameter("name");
	
	if(!upw1.equals(upw2)) {
		%>
		<script>
			alert('비밀번호가 일치하지 않습니다.');
			window.location.href = "signup.html";
		</script>
		<%
	}
	
	UserDAO dao = new UserDAO();
	
	boolean count = dao.insert(id, upw1, uname);
	
	if(count){
		%>
		<script>
			alert('회원가입에 성공하였습니다.');
			window.location.href = "signup.html";
		</script>
		<%
	} else {
		%>
		<script>
			alert('회원가입에 실패 했습니다. \n이미 존재하는 아이디 입니다.');
			window.location.href = "signup.html";
		</script>
		<%
	}
	
	%>
</body>
</html>