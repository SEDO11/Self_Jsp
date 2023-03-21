<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.util.Timer" %>
<%@ page import="java.util.TimerTask" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 작성</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String id = (String) session.getAttribute("id");
	String name = (String) session.getAttribute("name");
	
	// session.setMaxInactiveInterval(60); // 세션 유지 시간 1분
	%>
	<form action="feedAdd.jsp" method="post" enctype="multipart/form-data">
		<table align=center>
			<tr>
				<td colspan=2 align=center height=40><b>게시판</b></td>
			</tr>
			<tr>
				<td align=right>사용자 이름&nbsp;</td>
				<td><div><%=name %></div></td>
			</tr>
			<tr>
				<td align=right>아이디&nbsp;</td>
				<td><div name="id"><%=id %></div></td>
			</tr>
			<tr>
				<td align=right>작성글&nbsp;</td>
				<!-- required는 필수로 입력되야 하는 값을 지칭한다. -->
				<td><textarea name="content" rows="5" required></textarea></td>
			</tr>
			<tr>
				<td align=right>이미지 업로드&nbsp;</td>
				<!-- required는 필수로 입력되야 하는 값을 지칭한다. -->
				<td><input type="file" name="image"><br></td>
			</tr>
			<tr>
				<td colspan=2 align=center height=50><input type="submit"
					value="업로드하기"></td>
			</tr>
		</table>
	</form>
	<form action="logout.jsp">
		<table align=center>
			<tr>
				<td colspan=2 align=center height=50><input type="submit"
					value="로그아웃하기"></td>
			</tr>
		</table>
	</form>
	<%--
	<p id="timer">시간</p>
	<button id="startButton">시간 연장</button>
	<script type="text/javascript" src="timer.js"></script>
	 --%>
</body>
</html>