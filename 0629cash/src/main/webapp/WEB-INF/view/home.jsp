<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CASH BOOK</title>
<!-- css파일 -->
	<link href="<%=request.getContextPath() %>/style.css" type="text/css" rel="stylesheet">
<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body class="home-body">

<jsp:include page="/layout/header.jsp"></jsp:include>
	
	<section id="chart" class="col-lg-4">
		<div class="container">
			차트 보이기<br>
			월별 해시태그 비율<br>
			월별 소비 지출 비율<br>
		</div>
	</section>
	
	<section class="latest-expense">
		<div class="container">
			최신 소비 지출 내역(10개?)
		</div>
	</section>
	
	<section id="counter" class="counter section-bg">
	    <div class="container" data-aos="fade-up">
	      <div class="section-title">
	        <div class="row">
	          <div class="counter-info">
	            <ul class="counter-list">
	              <li>현재접속자: ${currentCounter}</li>
	              <li>오늘접속자 수: ${counter}</li>
	              <li>누적접속자 수: ${totalCounter}</li>
	            </ul>
	          </div>
	        </div>
	      </div>
	    </div>
	</section>

<jsp:include page="/layout/footer.jsp"></jsp:include>
</body>
</html>