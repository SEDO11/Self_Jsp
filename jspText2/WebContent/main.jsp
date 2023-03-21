<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.util.Timer" %>
<%@ page import="java.util.TimerTask" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판 작성</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="text-center">
	<%
	request.setCharacterEncoding("utf-8");
	String name = (String) session.getAttribute("name");
	// session.setMaxInactiveInterval(60); // 세션 유지 시간 1분
	%>
<<<<<<< HEAD
	<form action="feedAdd.jsp" method="post" enctype="multipart/form-data">
=======
	<main>
	<table alian="center">
		<h3 class="h3 mt-3 mb-3 fw-normal">반갑습니다. <%=name %> 님</h3>
	</table>
	<form action="feedList.jsp" target="_blank">
>>>>>>> 1b7e6aac35a4aaeb5721ff976ac7fa913e4e4a21
		<table align=center>
			<tr>
				<td colspan=2 align=center><input type="submit"
					class="w-30 my-2 btn btn-lg btn-primary"  value="게시글 보러가기"></td>
			</tr>
		</table>
	</form>
	<form action="feed.jsp" target="_blank">
		<table align=center>
			<tr>
				<td align=right>이미지 업로드&nbsp;</td>
				<!-- required는 필수로 입력되야 하는 값을 지칭한다. -->
				<td><input type="file" name="image"><br></td>
			</tr>
			<tr>
				<td colspan=2 align=center height=50><input type="submit"
					class="w-30 my-2 btn btn-lg btn-primary" value="게시글 작성하기"></td>
			</tr>
		</table>
	</form>
	<form action="logout.jsp">
		<table align=center>
			<tr>
				<td colspan=2 align=center height=50><input type="submit"
					class="w-30 my-2 btn btn-lg btn-primary" value="로그아웃하기"></td>
			</tr>
		</table>
	</form>
<<<<<<< HEAD
	<%--
	<p id="timer">시간</p>
	<button id="startButton">시간 연장</button>
	<script type="text/javascript" src="timer.js"></script>
	 --%>
=======
	<p id="timer">남은 시간: 분 초</p>
	<button id="startButton" class="w-30 btn btn-lg btn-primary">시간 연장</button>
	</main>
	<script type="text/javascript" src="./js/sessionTimer.js"></script>
	
>>>>>>> 1b7e6aac35a4aaeb5721ff976ac7fa913e4e4a21
</body>
</html>