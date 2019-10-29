<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
나는 로그인 화면
<form>
<%
String test=(String)request.getAttribute("test");
%>
<%=test %><br>
id: <input type="text" name="a">
<button>로그인</button>
</form>
</body>
</html>