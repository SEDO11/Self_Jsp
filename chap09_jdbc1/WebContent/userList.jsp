<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 객체 생성을 위한 sql 패키지 연결 -->
<%@ page import="java.sql.*" %>
<%
	//메모리에 sql 드라이버 올림
	Class.forName("com.mysql.jdbc.Driver");
	
	// db와 네트워크 연결
	// 3306->포트번호 / mysns->테이블 이름 / root->db 아이디 / 0000->db 패스워드
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysns", "root", "0000");
	
	// sql문을 실행할 객체 생성
	Statement stmt = conn.createStatement();
	
	// sql문 실행
	ResultSet rs = stmt.executeQuery("SELECT id, name FROM user");
	
	// 2차원 테이블 형태의 실행 결과를 바탕으로, 사용자 아이디와 패스워드를 리스트 형태로 출력합니다.
	String str = "";
	while(rs.next()) {
		str += rs.getString("id") + ", " + rs.getString("name") + "<br>";
	}
	out.print(str);
	// 모든 객체를 닫음
	rs.close();
	stmt.close();
	conn.close();
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