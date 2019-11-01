<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
처음 보이는 index<br>
<%
if(session.getAttribute("user")!=null){
	Map<String,Object> user = (Map<String,Object>)session.getAttribute("user");	
	out.print(user.get("uiName")+"님 반갑습니다.<br>");
	out.println("<a href=\"/views/user/logout\">로그아웃</a><br>");
	out.println("<a href=\"/views/board/list\">게시판</a>");
}else{
%>
<a href="/views/user/login">login</a><br>
<a href="/views/user/signup">회원가입</a><br>
<%
}	//pagecontext < request < session < application 저장영역 크기	session 타임아웃 시간이 존재 톰캣 default값: 30분
%>
</body>
</html>