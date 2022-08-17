<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="util.ConnectionPool" %>
<%
	request.setCharacterEncoding("utf-8");

	Connection con = ConnectionPool.get();

	String uid = request.getParameter("id");
	String upw = request.getParameter("pw");
	String uname = request.getParameter("n");
	
	String sql = "INSERT INTO user(id, password, name) VALUES(?, ?, ?)";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, uid);
	pstmt.setString(2, upw);
	pstmt.setString(3, uname);
	
	try {
		int count = pstmt.executeUpdate();
		if (count == 1) {
			out.print("회원가입이 완료되었습니다.");
		}
	} catch (Exception e) {
		out.print("회원가입중 오류가 발생했습니다.");
	} finally {
		pstmt.close();
		con.close();
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