<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
	// 날짜 구하기
	Date dt = new Date();
	
	SimpleDateFormat sdf = new SimpleDateFormat("EEE, MMM d hh:mm:ss z yyyy");
		
	String uid = request.getParameter("id");
	String res = "<h3>사용자 아이디: " + uid + "</h3>";
	res += "<br>로그인 시간: " + sdf.format(dt);
	out.print(res);
	
	String strcnt = (String) application.getAttribute("counter");
	int count = (strcnt == null) ? 0 : Integer.valueOf(strcnt);
	out.print("<br>방문자수: " + count);
	application.setAttribute("counter", String.valueOf(++count));
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