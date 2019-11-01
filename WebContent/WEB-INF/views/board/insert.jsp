<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/common/header.jspf"%>
<%
if(session.getAttribute("user")==null){
	response.sendRedirect("/");
}
String msg = (String)request.getAttribute("msg");
if(msg!=null){
%>
<script>
alert('<%=msg%>');
</script>
<%	
}
Map<String,Object> user = (Map<String,Object>)session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="/board/insert" onsubmit="return checkForm()">
		
			제목 :<input type="text" name="biTitle" id="biTitle"><br>
			글쓴이 : <%=user.get("uiName") %><br>
			내용 :<textarea rows="5" cols="40" name="biContent" id="biContent"></textarea>
			<br>
			<button>글쓰기</button>	
</form>
<script>
function checkForm(){
	var biTitle = document.getElementById('biTitle').value;
	if(biTitle.trim().length<2){
		alert('제목은 2글자 이상입니다.');
		document.getElementById('biTitle').value = '';
		document.getElementById('biTitle').focus();
		return false;
	}
	var biContentObj = document.getElementById('biContent');
	if(biContentObj.value.trim().length<2){
		alert('게시물 내용은 2글자 이상입니다.');
		biContentObj.value = '';
		biContentObj.focus();
		return false;
	}
	return true;
}
</script>
</body>
</html>