<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	boolean login = false;
	String uid = request.getParameter("id");
	String upw = request.getParameter("pw");
	
	String url = "jdbc:mysql://localhost:3306/mysns";
	String sql = "SELECT id, password FROM user WHERE id = '";
	sql += uid + "'";
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(url, "root", "0000");
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	while(rs.next()){
		if(uid.equals(rs.getString("id")) && upw.equals(rs.getString("password"))){
			login = true;
			break;
		}
	}
	
	if(login){
		out.print("로그인 성공");
	} else {
		out.print("로그인 실패");
	}
	rs.close(); stmt.close(); conn.close();
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