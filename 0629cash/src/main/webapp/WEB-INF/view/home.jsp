<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>home</h1>
	<a href="${pageContext.request.contextPath}/calendar">월별보기</a>
	<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
	<a href="${pageContext.request.contextPath}/memberOne">회원정보</a>
	<div>
		현재접속자: ${currentCounter} <!-- application.getAttribute("currentCounter") -->
	</div>
	<div>
		오늘접속자 수: ${counter} <!-- request.getAttribute("counter") -->
	</div>
	<div>
		누적접속자 수: ${totalCounter} <!-- request.getAttribute("totalCounter") -->
	</div>
</body>
</html>