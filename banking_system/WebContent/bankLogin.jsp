<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	String uid = request.getParameter("id");
	String upw = request.getParameter("pw");
	String sql = "SELECT id, pw FROM user where id = ?";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "0000");
	stmt = conn.prepareStatement(sql);
	stmt.setString(1, uid);
	rs = stmt.executeQuery();
	while(rs.next()){
		if(!upw.equals(rs.getObject("pw"))){
			out.print("아이디 혹은 비밀번호가 일치하지 않습니다.");
		} else {
			out.print("로그인 성공");
		}
	}
	rs.close(); stmt.close(); conn.close();
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