<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String msg = (String)request.getAttribute("msg");
String url = (String)request.getAttribute("url");	//get: 조회/ post: 새로운입력(로그인)/ put: 수정/ delete: 삭제/ option: 
%>
<script>
alert('<%=msg %>');
location.href='<%=url %>';
</script>
</body>
</html>