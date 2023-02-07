<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.Time" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 한글 깨짐 방지 코드 request.setCharacterEncoding("utf-8"); --%>
	<%
	request.setCharacterEncoding("utf-8");
	Time t = new Time();
	String check = "08";
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw1");
	String name = request.getParameter("name");
	
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	String date = df.format(t.getTime1());
	
	if(date.endsWith(check)) {
		response.sendRedirect("Check.jsp");
		return;
	}
	
	String res = "";
	res += "<h3> USER ID: " + id + "</h3>";
	res += "<h3> USER PW: " + pw + "</h3>";
	res += "<h3> USER NAME: " + name + "</h3>";
	out.println(res);
	
	/*
	out.write("로그인 시간");
	out.write(t.getTime());
	*/
	
	%>
	
</body>
</html>