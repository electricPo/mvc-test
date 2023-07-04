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
	<div class="container">
		<h1>${targetYear}년 ${targetMonth+1}월 ${targetDate}일</h1>
		<a href="${pageContext.request.contextPath}/calendar">이전으로</a>
		<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
		<a href="${pageContext.request.contextPath}/memberOne">회원정보</a>
		<table class="table table-bordered">
			<tr>
				<th>수입/지출</th>
				<th>금액</th>
				<th>메모</th>
				<th>작성날짜</th>
			</tr>
			<c:forEach var="c" items="${list}">
				<tr>
					<td>${c.category}</td>
					<td>${c.price}</td>
					<td>${c.memo}</td>
					<td>${c.createdate}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>
