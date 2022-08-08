<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>
<%@ page import="java.time.LocalDateTime" %>
<%
	short sTime = 8;
	short eTime = 15;
	
	// 날짜 구하기
	LocalDateTime dt = LocalDateTime.now();
	int dayOfWeekValue = dt.getDayOfWeek().getValue(); // 월~일요일까지 숫자로 표현
	
	// 시간 구하기
	int hour = dt.getHour();
	int min = dt.getMinute();
	int sec = dt.getSecond();
	
	if(dayOfWeekValue==1 && sTime <= hour && hour <= eTime){ // 오늘 날짜가 점검 기간인 경우
		String res = "<h3>매월 월요일 8~15시는 시스템 점검입니다.</h3>";
		res += "<br>15시 이후 다시 이용해주세요.";
		out.print(res);
		// response.sendRedirect("underCheck.jsp");
		return; // 코드 종료
	}
	
	String uid = request.getParameter("id");
	String res = "<h3>사용자 아이디: " + uid + "</h3>";
	res += "<br>로그인 시간: " + hour + ":" + min + ":" + sec;
	out.print(res);

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