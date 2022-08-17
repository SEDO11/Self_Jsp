<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String uid = request.getParameter("id");
	String ucontent = request.getParameter("content");
	if(uid.equals(null) || ucontent.equals(null)) {
		out.print("id, content 이 셋중 하나가 null 값입니다.");
	} else {
	String sql = "INSERT INTO feed(id, content) VALUES('" + uid + "', '" + ucontent + "')";
		
		Class.forName("com.mysql.jdbc.Driver");
		
		// db와 네트워크 연결
		// 3306->포트번호 / mysns->테이블 이름 / root->db 아이디 / 0000->db 패스워드
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysns", "root", "0000");
		
		// sql문을 실행할 객체 생성
		Statement stmt = conn.createStatement();
		int count = stmt.executeUpdate(sql);
		if(count == 1) {
			out.print("성공적으로 저장");
		} else {
			out.print("저장되지 않음");
		}
		conn.close(); stmt.close();
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