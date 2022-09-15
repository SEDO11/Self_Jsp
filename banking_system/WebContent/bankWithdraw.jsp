<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	Connection conn = null;
	PreparedStatement stmt = null;
	try{
		String uid = request.getParameter("id");
		String sql = "DELETE FROM user where id = ?";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "0000");
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, uid);
		stmt.executeUpdate();
		out.print("회원탈퇴가 성공했습니다.");
	} catch (Exception e) {
		out.print("회원탈퇴 실패 / 해당 아이디가 존재하지 않습니다.");
	} finally {
		if(stmt != null) stmt.close(); 
		if(conn != null) conn.close();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 완료</title>
</head>
<body>

</body>
</html>