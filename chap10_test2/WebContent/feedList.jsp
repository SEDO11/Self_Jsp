<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입자 리스트</title>
</head>
<body style="background-color: yellowgreen">
	<%
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/mysns";
	String sql = "SELECT * FROM feed ORDER BY ts";
	
	Connection conn = DriverManager.getConnection(url, "root", "0000");
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	String str = "<table align=\"center\">";
	str += "<tr><th colspan=3><h3>가입자 리스트</h3></th></tr>";
	while(rs.next()){
		str += "<tr><th colspan=3><hr></th></tr>";
		str += "<tr><td>" + rs.getString("id") + " " + rs.getString("ts") + "<br>" + rs.getString("content") +"</td></tr>";
	}
	str += "</table>";
	out.print(str);
	rs.close(); stmt.close(); conn.close();
%>
</body>
</html>