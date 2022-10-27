<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 객체 생성을 위한 sql 패키지 연결 -->
<%@ page import="com.*" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String uid = (String) session.getAttribute("id");
	if(uid == null) {
		response.sendRedirect("login.html");
		return;
	}
	session.setAttribute("id", uid);
	
	ArrayList<FeedObj> feeds = (new FeedDAO()).getList();

	// 2차원 테이블 형태의 실행 결과를 바탕으로, 사용자 아이디와 패스워드를 리스트 형태로 출력합니다.
	String str = "<table align=center>";
	str += "<tr><th colspan=2 align=left>작성글 리스트</th>";
	str += "<th colspan=1 align=right><a href='c11_feed.html'><button>글쓰기</button></a>";
	str += "</th></tr>";
	
	for(FeedObj feed : feeds) {
		str += "<tr><th colspan=3><hr></th></tr>";
		str += "<tr><th colspan=1>" + feed.getId() + "</th><th colspan=2>(" + feed.getTs() + ")</th></tr>";
		str += "<tr><th colspan=3 align=left>" + feed.getContent() + "</th></tr>";
	}
	str += "</table>";
	out.print(str);
	// 모든 객체를 닫음
%>
</body>
</html>