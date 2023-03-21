<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html onload="noBack();" onpageshow="if(event.persisted) noBack();">
<head>
<meta charset="UTF-8">
<title>게시글 작성 페이지</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id = (String) session.getAttribute("id");
		if(id==null) {
			response.sendRedirect("logout.jsp");
		}
	%>
	<form action="feedAdd.jsp" method="post">
		<table align=center>
			<tr>
				<td colspan=2 align=center height=40><b>게시판</b></td>
			</tr>
			<tr>
				<td align=right>아이디&nbsp;</td>
				<td><div name="id"><%=id%></div></td>
			</tr>
			<tr>
				<td align=right>작성글&nbsp;</td>
				<!-- required는 필수로 입력되야 하는 값을 지칭한다. -->
				<td><textarea name="content" rows="5" required></textarea></td>
			</tr>
			<tr>
				<td colspan=2 align=center height=50><input type="submit"
					value="업로드하기"></td>
			</tr>
		</table>
	</form>
</body>
</html>