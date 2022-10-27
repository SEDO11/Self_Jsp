<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String uid = request.getParameter("id");
	String uname = request.getParameter("n");
	String upw = request.getParameter("pw");
	
	String url = "jdbc:mysql://localhost:3306/mysns";
	String sql = "INSERT INTO user(id, password, name) VALUES('";
	sql += uid + "', '" + upw + "', '" + uname + "')";
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(url, "root", "0000");
	Statement stmt = conn.createStatement();
	
	int count = stmt.executeUpdate(sql);
	if(count == 1) {
		out.print("회원가입 완료");
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