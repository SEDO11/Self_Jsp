<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- UTF-8을 통해서 한글 출력, get 방식만 적용 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8"); // post방식에서 한글을 사용할 경우 사용되는 코드
	String uid = request.getParameter("id");
	String res = "<h3>사용자 아이디: " + uid + "</h3>";
	out.print(res); // out.print는 서블릿의 response.getWriter()와 같은 거
%>
<%@ include file = "loginTime.jsp" %> 
<!-- include는 다른 jsp의 코드를 옮겨온다. 사용할때에는 처음에 @를 붙이고 사용해야 한다. -->
</body>
</html>