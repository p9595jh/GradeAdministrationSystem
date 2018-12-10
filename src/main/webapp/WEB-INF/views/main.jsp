<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" />
<title>Main</title>
<c:if test="${applynew}">
	<script type="text/javascript">
		alert("신청이 완료되었습니다");
	</script>
</c:if>
</head>
<body>

<div id="content">
	<div class="box">
		<br/><br/>
		학점 관리 시스템<hr/><br/><br/>
		<ul>
			<li><a class="link" href="${pageContext.request.contextPath}/checkall">학기별 이수 학점 조회</a></li>
			<li><a class="link" href="${pageContext.request.contextPath}/apply">수강 신청하기</a></li>
			<li><a class="link" href="${pageContext.request.contextPath}/check?year=2019&term=1">수강 신청 조회</a></li>
			<c:if test="${pageContext.request.userPrincipal.name != null}">
				<br/>
				<li><a class="link" href="javascript:document.getElementById('logout').submit()">로그아웃</a></li>
			</c:if>
		</ul>
	</div>
</div>

<form id="logout" action="<c:url value="/logout" />" method="POST">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>

</body>
</html>