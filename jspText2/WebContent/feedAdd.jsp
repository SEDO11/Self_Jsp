<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.*" %>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String id = null, content = null, fileName = null;
	byte[] file = null;
	
	request.getParameter("utf-8");
	
	
	ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());
	
	// 사용자 입력값들 추출
	List items = sfu.parseRequest(request);
	
	// 각 요소 순차 접근
	Iterator iter = items.iterator();
	
	// 요소 처리
	while(iter.hasNext()) {
		FileItem item = (FileItem) iter.next();
		String name = item.getFieldName();
		if(item.isFormField()) { // FormField인 경우 request.getParameter()로 추출 가능, 문자열 추출
			String value = item.getString("utf-8");
			if (name.equals("id")) id = value;
			else if(name.equals("content")) content = value;
		} else { // 파일이름과 파일 컨텐츠 추출
			if (name.equals("image")) {
				fileName = item.getName();
				file = item.get();
				String root = application.getRealPath(java.io.File.separator);
				FileUtil.saveImage(root, fileName, file);
			}
			
		}
	}
	
	/*
	if(check) {
		*/
		%>
		<%-- 
		<script>
	    alert('저장 성공');
	    location.href="feed.jsp";
	    </script>
		--%>
		<%/*
	} else {
		*/
		%>
		<%--
		<script>
	    alert('저장 실패');
	    location.href="feed.jsp";
	    </script>
		 --%>
		<%
		/*
	}
	*/

	%>
</body>
</html>