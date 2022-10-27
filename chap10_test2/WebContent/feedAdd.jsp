<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.ConnectionPool" %>
<%
	request.setCharacterEncoding("utf-8");
	String uid = request.getParameter("id");
	String ucontent = request.getParameter("content");
	
	String url = "jdbc:mysql://localhost:3306/mysns";
	String sql = "INSERT INTO feed(id, content) VALUES(?, ?)";
	
//	Class.forName("com.mysql.jdbc.Driver");
//	Connection conn = DriverManager.getConnection(url, "root", "0000");
	Connection conn = ConnectionPool.get();
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, uid);
	stmt.setString(2, ucontent);
	
	int count = stmt.executeUpdate();
	if(count == 1) {
		out.print("내용 입력 완료");
	} else {
		out.print("잘못 된 접근");
	}
	stmt.close(); conn.close();
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