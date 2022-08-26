<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.jsp.*"%>
<%
request.setCharacterEncoding("utf-8");

String uid = request.getParameter("id");
int a = 1;
if (uid.equals(null)) {
	out.print("id, pw, name 이 셋중 하나가 null 값입니다.");
} else {
	Class.forName("com.mysql.jdbc.Driver");

	// db와 네트워크 연결
	// 3306->포트번호 / mysns->테이블 이름 / root->db 아이디 / 0000->db 패스워드
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysns", "root", "0000");

	// String sql = "INSERT INTO user(id, password, name) VALUES('" + uid + "', '" + upw + "', '" + uname + "')";
	String sql = "DELETE FROM user WHERE id = ?";

	// sql문을 실행할 객체 생성
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, uid);
	int count = stmt.executeUpdate();
	if (count == 1) {
		out.print("회원 탈퇴가 완료 되었습니다.");
	} else {
		out.print("해당 아이디는 회원 정보에 없습니다.");
	}
	stmt.close(); conn.close();
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