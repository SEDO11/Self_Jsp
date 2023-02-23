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
		// out.println("로그인에 성공했습니다.");
		session.setAttribute("id", dao.getId());
		session.setAttribute("name", dao.getName());
		response.sendRedirect("main.jsp");
	} else {
		%>
		<script type="text/javascript">
		alert('아이디 혹은 비밀번호가 일치하지 않습니다.')
		window.location.href = 'logout.jsp';
		</script>
		<%
	}
	%>
	
	
</body>
</html>