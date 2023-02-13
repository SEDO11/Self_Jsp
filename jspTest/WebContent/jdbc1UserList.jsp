<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 정보</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link href="css/userList.css" rel="stylesheet">
</head>
<body>
	<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	String dbURL = "jdbc:mysql://localhost:3306/web_sns";
	String dbID = "root";
	String dbPW = "0000";
	String sql = "SELECT * FROM user";
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String str = "<table class=\"table table-success table-striped text-center w-50 align-self-center\">";
	str += "<thead><tr><th colspan=3> 가입자 정보</th></tr></thead><tbody>";
	
	try{
		conn = DriverManager.getConnection(dbURL, dbID, dbPW);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			str += "<tr>";
			str += "<td colspan=1>" + rs.getString("name") + "</td>";
			str += "<td colspan=2>" + rs.getString("id") + "</td>";
			str += "</tr>";
		}
		
	} catch(Exception e) {
		System.out.println("에러발생");
		System.out.println("에러 문구: " + e);
	} finally {
		str += "</tbody></table>";
		out.println(str);
		
		if (rs != null) rs.close();
		if (stmt != null) stmt.close();
		if (conn != null) conn.close();
	}

	%>
</body>
</html>