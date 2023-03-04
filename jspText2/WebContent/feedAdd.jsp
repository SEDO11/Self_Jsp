
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.FeedDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	
	FeedDAO dao = new FeedDAO();
	
	String id = (String) session.getAttribute("id");
	String content = request.getParameter("content");
	
	boolean check = dao.insert(id, content);
	if(check) {
		%>
		<script>
	    alert('저장 성공');
	    location.href="feed.jsp";
	    </script>
		<%
	} else {
		%>
		<script>
	    alert('저장 실패');
	    location.href="feed.jsp";
	    </script>
		<%
	}

	%>
</body>
</html>