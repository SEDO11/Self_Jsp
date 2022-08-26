<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.FeedDAO" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String uid = request.getParameter("id");
	String ucontent = request.getParameter("content");
	
	FeedDAO dao = new FeedDAO();
	if(dao.insert(uid, ucontent)) {
		// out.print("성공적으로 반영하였습니다.");
		response.sendRedirect("c11_feedlist2.jsp");
	} else {
		out.print("실패");
	}
	
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