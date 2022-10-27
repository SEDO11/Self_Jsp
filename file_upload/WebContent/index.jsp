<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 파일 업로드</title>
</head>
<body>
	<%-- enctype="multipart/form-data"은 파일을 업로드 할때 꼭 사용되는 타입 --%>
	<form action="uploadAction.jsp" method="post" enctype="multipart/form-data">
		파일: <input type="file" name="file"><br>
		<input type="submit" value="업로드">
	</form>
	<a href="fileDownlaod.jsp">파일다운로드 페이지 이동</a>
</body>
</html>