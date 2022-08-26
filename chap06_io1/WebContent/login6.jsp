<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%> <!-- UTF-8을 통해서 한글 출력, get 방식만 적용 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 선언문, 메서드나 변수 선언이 가능 -->
<%! 
	String getDate() {
		return (new Date()).toString();
	}
%>

<%
	request.setCharacterEncoding("utf-8"); // post방식에서 한글을 사용할 경우 사용되는 코드
	String uid = request.getParameter("id"); // id를 문자열 형태로 저장
	String res = "<h3>사용자 아이디: " + uid + "</h3>";
	out.print(res); // out.print는 서블릿의 response.getWriter()와 같은 거
%>

<!-- 표현식, 함수나 변수의 호출이 가능 -->
로그인 시간 : <%= getDate() %>
</body>
</html>