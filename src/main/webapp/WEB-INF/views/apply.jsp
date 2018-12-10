<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" />
<title>수강 신청</title>
</head>
<body>

<div id="content">
	<div class="reg">
		<br/>
		<span style="float:left;">수강 신청</span><br/><hr/><br/>
		<sf:form method="POST" action="${pageContext.request.contextPath}/handleapply" modelAttribute="subject">
			<table class="regtable">
				<tr>
					<td>연도</td>
					<td>
						<sf:input type="number" name="year" path="year" value="${year}" class="reginput" /><br/>
						<sf:errors path="year" class="regerr" />
					</td>
				</tr>
				<tr>
					<td>학기</td>
					<td>
						<sf:input type="number" name="term" path="term" class="reginput" /><br/>
						<sf:errors path="term" class="regerr" />
					</td>
				</tr>
				<tr>
					<td>과목코드</td>
					<td>
						<sf:input type="text" name="code" path="code" class="reginput" /><br/>
						<sf:errors path="code" class="regerr" />
					</td>
				</tr>
				<tr>
					<td>과목이름</td>
					<td>
						<sf:input type="text" name="name" path="name" class="reginput" /><br/>
						<sf:errors path="name" class="regerr" />
					</td>
				</tr>
				<tr>
					<td>구분</td>
					<td>
						<sf:input type="text" name="division" path="division" class="reginput" /><br/>
						<sf:errors path="division" class="regerr" />
					</td>
				</tr>
				<tr>
					<td>학점</td>
					<td>
						<sf:input type="number" name="grade" path="grade" class="reginput" /><br/>
						<sf:errors path="grade" class="regerr" />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="신청" style="width:200px; height:50px; margin-left:20%;" />
					</td>
				</tr>
			</table>
		</sf:form><br/><hr/>
		<a href="${pageContext.request.contextPath}/main" class="link" style="float:right;">메인으로</a>
	</div>
</div><br/><br/>

</body>
</html>