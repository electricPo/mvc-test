<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>

<body>

<jsp:include page="/layout/header.jsp"></jsp:include>


	<div>
		현재접속자: ${currentCounter} <!-- application.getAttribute("currentCounter") -->
	</div>
	<div>
		오늘접속자 수: ${counter} <!-- request.getAttribute("counter") -->
	</div>
	<div>
		누적접속자 수: ${totalCounter} <!-- request.getAttribute("totalCounter") -->
	</div>
	

<jsp:include page="/layout/footer.jsp"></jsp:include>
</body>
</html>