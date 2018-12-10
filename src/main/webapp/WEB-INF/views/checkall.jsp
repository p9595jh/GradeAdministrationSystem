<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" />
<title>학기별 이수 학점 조회</title>
</head>
<body>

<div id="content">
	<div class="reg" style="border-width:0px;">
		<br/><br/>
		<span style="float:left;">학기별 이수학점 조회</span><br/><hr/><br/>
		<table class="admintable">
			<tr>
				<th>연도</th>
				<th>학기</th>
				<th>이수 학점</th>
				<th>상세보기</th>
			</tr>
			<c:forEach var="termGrade" items="${termGrades}">
				<tr>
					<td><c:out value="${termGrade.year}"></c:out></td>
					<td><c:out value="${termGrade.term}"></c:out></td>
					<td><c:out value="${termGrade.grade}"></c:out></td>
					<td>
						<a href="${pageContext.request.contextPath}/check?year=${termGrade.year}&term=${termGrade.term}" class="link">링크</a>
					</td>
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