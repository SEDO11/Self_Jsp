<%@page import="javax.sql.DataSource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 객체 생성을 위한 sql 패키지 연결 -->
<%@ page import="java.sql.*" %>
<%@ page import="util.ConnectionPool" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//java의 함수를 호출하여 객체 정보를 얻어 옴
	Connection conn = ConnectionPool.get();
	
	// sql문을 실행할 객체 생성
	Statement stmt = conn.createStatement();
	
	// sql문 실행
	ResultSet rs = stmt.executeQuery("SELECT id, name, ts FROM user");
	
	// 2차원 테이블 형태의 실행 결과를 바탕으로, 사용자 아이디와 패스워드를 리스트 형태로 출력합니다.
	String str = "<table align=center>";
	str += "<tr><th colspan=3>가입자 리스트</th></tr>";
	while(rs.next()) {
		str += "<tr><th colspan=3><hr></th></tr>";
		str += "<tr><th>" + rs.getString("id") + "</th><th>" + rs.getString("name") + "</th><th>" + rs.getString("ts") + "</th>";
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