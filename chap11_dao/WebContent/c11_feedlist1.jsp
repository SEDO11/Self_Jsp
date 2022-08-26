<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 객체 생성을 위한 sql 패키지 연결 -->
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//메모리에 sql 드라이버 올림
	Class.forName("com.mysql.jdbc.Driver");
	
	// db와 네트워크 연결
	// 3306->포트번호 / mysns->테이블 이름 / root->db 아이디 / 0000->db 패스워드
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysns", "root", "0000");
	
	// sql문을 실행할 객체 생성
	Statement stmt = conn.createStatement();
	
	// sql문 실행
	ResultSet rs = stmt.executeQuery("SELECT id, content, ts FROM feed");
	
	// 2차원 테이블 형태의 실행 결과를 바탕으로, 사용자 아이디와 패스워드를 리스트 형태로 출력합니다.
	String str = "<table align=center>";
	str += "<tr><th colspan=2 align=left>작성글 리스트</th></tr>";
	while(rs.next()) {
		str += "<tr><th colspan=3><hr></th></tr>";
		str += "<tr><th colspan=1>" + rs.getString("id") + "</th><th colspan=2>(" + rs.getString("ts") + ")</th></tr>";
		str += "<tr><th colspan=3 align=left>" + rs.getString("content") + "</th></tr>";
	}
	str += "</table>";
	out.print(str);
	// 모든 객체를 닫음
	rs.close();
	stmt.close();
	conn.close();
%>
</body>
</html>