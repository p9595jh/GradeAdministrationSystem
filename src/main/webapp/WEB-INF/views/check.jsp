<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" />
<title>수강 신청 조회</title>
</head>
<body>

<div id="content">
	<div class="reg" style="border-width:0px;">
		<br/><br/>
		<span style="float:left;"><c:out value="${year}"></c:out>년 <c:out value="${term}"></c:out>학기 수강신청목록</span><br/><hr/><br/>
		<table class="admintable">
			<tr>
				<th>과목코드</th>
				<th>과목명</th>
				<th>구분</th>
				<th>학점</th>
			</tr>
			<c:forEach var="subject" items="${subjects}">
				<tr>
					<td><c:out value="${subject.code}"></c:out></td>
					<td><c:out value="${subject.name}"></c:out></td>
					<td><c:out value="${subject.division}"></c:out></td>
					<td><c:out value="${subject.grade}"></c:out></td>
				</tr>
			</c:forEach>
		</table>
		<br/><br/>
		<a href="${pageContext.request.contextPath}/main" class="link" style="float:right;">메인으로</a>
	</div>
</div>
<br/><br/>

</body>
</html>