<%@page import="java.net.URLEncoder"%>
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
<title>JSP 파일 다운로드</title>
</head>
<body>
	<% 
	String directory = application.getRealPath("/upload/");
	
	//파일들을 리스트 형식으로 모두 가져옴	
	String files[] = new File(directory).list();
	
	for(String file : files) {
		// /downloadAction?file= O | /downloadAction/file= X
		out.write("<a href=\"" + request.getContextPath() + "/downloadAction?file="
			+ URLEncoder.encode(file, "UTF-8") + "\">" + file + "</a><br>");
	}
	%>
</body>
</html>