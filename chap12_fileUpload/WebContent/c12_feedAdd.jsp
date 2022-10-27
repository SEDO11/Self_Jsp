<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%
	String str = "", line = "";
	str += "Content type: " + request.getContentType() + "<br>"; // enctype에 정의된 속성 ㄱ밧 출력
	str += "Content length: " + request.getContentLength() + "<br>"; // http 요청 메세지 바디에 포함도니 데이터의 크기 출력
	str += "<hr>";
	str += "ID: " + request.getParameter("id") + "<br>";
	str += "Content: " + request.getParameter("content") + "<br>";
	str += "Image: " + request.getParameter("image") + "<br>";
	str += "<hr>";
	
	InputStreamReader isr = new InputStreamReader(request.getInputStream(), "utf-8"); //http 요청 메세지 원본을 스트림 형태로 읽어올 수 있도록 객체 생성
	BufferedReader br = new BufferedReader(isr); // 메세지 스트림을 버퍼에 저장하기 위해 객체 생성
	while((line = br.readLine()) != null) {
		str += line;
	}
	out.print(str);
	
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