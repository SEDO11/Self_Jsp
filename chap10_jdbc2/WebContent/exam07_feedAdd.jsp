<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="util.ConnectionPool" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String uid = request.getParameter("id");
	String ucontent = request.getParameter("content");
	if(uid.equals(null) || ucontent.equals(null)) {
		out.print("id, content 이 셋중 하나가 null 값입니다.");
	} else {
		Connection conn = ConnectionPool.get();
		
		String sql = "INSERT INTO feed(id, content) VALUES(?, ?)";
		
		// sql문을 실행할 객체 생성
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, uid);
		stmt.setString(2, ucontent);
		
		int count = stmt.executeUpdate();
		if(count == 1) {
			out.print("성공적으로 저장");
		} else {
			out.print("저장되지 않음");
		}
		conn.close(); stmt.close();
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