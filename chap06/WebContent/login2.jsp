<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String uid = request.getParameter("id");
	String res = "<h3>User ID: " + uid + "</3>";
	out.print(res); // out.print는 서블릿의 response.getWriter()와 같은 거
%>
</body>
</html>