<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	Connection conn = null;
	PreparedStatement stmt = null;
	
	try{
		String uid = request.getParameter("id");
		String uname = request.getParameter("name");
		String upw = request.getParameter("pw");
		
		String sql = "INSERT INTO user(id, name, pw) VALUES(?, ?, ?)";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "0000");
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, uid);
		stmt.setString(2, uname);
		stmt.setString(3, upw);
		stmt.executeUpdate(); // 이게 있어야 mysql에 데이터가 반영 됨
		out.print("회원가입이 되었습니다.");
	} catch (Exception e) {
		out.print("회원가입이 제대로 되지 않았습니다.");
	} finally {
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 처리</title>
</head>
<body>
</body>
</html>