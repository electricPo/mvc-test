<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cashbook</title>
</head>
<body>
	<div>
	<h1>가계부 상세</h1>
		<h1>${targetYear}년 ${targetMonth+1}월 ${targetDate}일 가계부</h1>
		<a href="${pageContext.request.contextPath}/calendar">월별보기</a>
		<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
		<a href="${pageContext.request.contextPath}/memberOne">회원정보</a>
		
		
		<table>
			<tr>
				<th>id</th>
				<th>수입/지출</th>
				<th>금액</th>
				<th>메모</th>
			</tr>
			<c:forEach var="c" items="${list}">
				<tr>
					<td>${c.memberId}</td>
					<td>${c.category}</td>
					<td>${c.price}</td>
					<td>${c.memo}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>
