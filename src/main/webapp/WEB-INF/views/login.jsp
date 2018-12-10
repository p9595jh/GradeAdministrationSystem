<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style type="text/css">
body {
	background-color: rgb(247,250,255);
	margin: 0;
}
#content {
	margin: auto;
	background-color: rgb(247,250,255);
	padding: 15px;
}
.reg {
	margin: auto;
	width: 700px;
	padding: 50px;
	border:1px solid black;
	text-align:center;
}
hr {
	border: 1px solid rgb(0,91,159);
}
button, input[type=submit], input[type=button] {
	cursor: pointer;
}
</style>
</head>
<body onload='document.f.username.focus();'>

	<div id="content">
		<div class="reg" style="border-width:0px;">
			<br/><br/>
			<span style="float:left;">로그인 </span> 
			<c:if test="${not empty errorMsg}">
				<span style="color:red; float:right;">${errorMsg}</span>
			</c:if>
			<c:if test="${not empty logoutMsg}">
				<span style="color:blue; float:right;">${logoutMsg}</span>
			</c:if>
			<br/><hr/><br/><br/>
			<form name='f' action="<c:url value="/login"/>" method='POST'>
				<input type='text' name='username' value='' placeholder="아이디" style="width:300px; height:50px;" /><br/><br/>
				<input type='password' name='password' placeholder="비밀번호" style="width:300px; height:50px;" /><br/><br/>
				<input name="submit" type="submit" value="로그인" style="width:300px; height:50px;" /><br/><br/>
				<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}" />
			</form>
			<br/><hr/>
		</div>
	</div>
	<br/><br/>
	
</body>
</html>