<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="file.FileDAO"%>
<%@ page import="java.io.File"%>

<%-- 파일 업로드 수행 라이브러리 --%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>

<%-- com.oreilly.servlet.multipart.DefaultFileRenamePolicy
	저장하는 파일의 이름이 동일할 경우 다르게 저장하도록 처리해주는 라이브러리 --%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 파일 업로드</title>
</head>
<body>
	<% 
		String directory = application.getRealPath("/upload/");
		int maxSize = 1024 * 1024 * 100; // 최대 100MB
		String encoding = "UTF-8";
		
		// 파일 업로드 수행 객체
		MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding,
				new DefaultFileRenamePolicy());
		
		// 업로드된 파일 이름 저장
		String fileName = multipartRequest.getOriginalFileName("file");
		String fileRealName = multipartRequest.getFilesystemName("file");
		
		new FileDAO().upload(fileName, fileRealName);
		out.write("파일명: " + fileName + "<br>");
		out.write("실제 파일명: " + fileRealName + "<br>");
	%>
</body>
</html>