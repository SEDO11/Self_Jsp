<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String res = "";
	String uid = (String) session.getAttribute("id");
	String now = (String) session.getAttribute("time");
	String counter = (String) application.getAttribute("counter");
	int count = (counter == null) ? 0 : Integer.valueOf(counter);
	
	res += "<h3>사용자 아이디: " + uid + "</h3>";
	res += "<br>로그인 시간: " + now;
	res += "<br>방문자 수" + count;
	out.println(res);
	
	session.setAttribute("id", uid);
	session.setAttribute("time", now);
	application.setAttribute("counter", String.valueOf(++count));
	%>
	<form action="testLogout.jsp">
		<input type="submit" class="w-20 btn btn-lg btn-primary" name="name"
					value="로그아웃">
	</form>
</body>
</html>