<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	boolean login = false;
	String uid = request.getParameter("id");
	
	String url = "jdbc:mysql://localhost:3306/mysns";
	String sql = "DELETE FROM user WHERE id = ?";
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(url, "root", "0000");
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, uid);
	int count = stmt.executeUpdate();
	
	if(count > 0){
		out.print("제거 성공");
	} else {
		out.print("제거 실패");
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