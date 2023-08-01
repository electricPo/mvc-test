<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%><!-- jstl substring호출 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- jsp 컴파일 시 자바코드로 변환되는 c:...(제어문법코드) 커스텀 태그 사용 가능 -->
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

<script>
    function 페이지로이동(year, month, day) {
        // 애플리케이션의 기본 URL을 가져오기 위해 pageContext.request.contextPath를 사용합니다.
        let baseUrl = "${pageContext.request.contextPath}";
        let targetUrl = baseUrl + "/cashbook?targetYear=" + year + "&targetMonth=" + month + "&targetDate=" + day;
        window.location.href = targetUrl;
    }
</script>

<body class="body">

	<jsp:include page="/layout/header.jsp"></jsp:include>

	<!-- 변수값 or 반환값 -> EL 사용$표현식 -->
	<!-- 속성값 대신 EL 사용 
		ex)
		request.getAttribute("targetYear")
		requestScope.targetYear
		requestScope는 생략 가능
		->형변환연산이 필요없다(EL이 자동으로 처리)
		-->
	
	<!--	자바코드(제어문): JSTL(for문...) 사용-->
	
	<div class="container">
		<div class="row">
			<!-- 요일을 표시하는 헤더부분 -->
			
				<div class="col-lg-2" data-aos="fade-right">
					<h2><strong>이달의 #</strong></h2>
						<div>
							<ul class="cashword-info">
								<c:forEach var="m" items="${htList}">
									<li class="cashword-list">
										<a href="${pageContext.request.contextPath}/cashbookListbyTag?cashword=${m.cashword}">${m.cashword}(${m.cnt})</a>
									</li>
								</c:forEach>
							</ul>
						</div>
				</div>
				
				<div class="col-lg-10" data-aos="fade-up" data-aos-delay="100">
				<div class="head">
					<h1>
					<strong>${targetYear}년 ${targetMonth+1}월</strong>
					</h1>
					<!-- 이전달과 다음달로 이동하는 링크를 생성 -->
					<a href="${pageContext.request.contextPath}/calendar?targetYear=${targetYear}&targetMonth=${targetMonth-1}"> &#x23EA; </a>
					<a href="${pageContext.request.contextPath}/calendar?targetYear=${targetYear}&targetMonth=${targetMonth+1}"> &#x23E9; </a>
					
					<div>
						
					</div>
				</div>
					<table class="table">
					<thead>
						<tr>
							<th class=thwidth>일</th>
							<th class=thwidth>월</th>
							<th class=thwidth>화</th>
							<th class=thwidth>수</th>
							<th class=thwidth>목</th>
							<th class=thwidth>금</th>
							<th class=thwidth>토</th>
						</tr>
					</thead>
					<tbody>
					    <tr>
					        <!-- foreach를 사용해 0부터 totalcell -1까지 반복 var=i로 현재의 값을 저장한다 -->
					        <c:forEach var="i" begin="0" end="${totalCell-1}" step="1">
					            <!-- d 변수를 i-beginBlank+1(캘린더에 날짜를 표시하는 값)로 설정 -->
					            <c:set var="d" value="${i-beginBlank+1 }"></c:set> 
					            <!-- 매주마다 행을 나눈다 -->	
					            <c:if test="${i!=0 && i%7 == 0}"> 
					                </tr><tr>
					            </c:if>
					            <!-- d값이 유효한 날짜범위에 속하지 않으면 <td>를 생성 -->
					            <c:if test="${d < 1 || d > lastDate}">
					                <td class="tdheight"></td>
					            </c:if>
					            <!-- else if문은 if문을 !으로  
					                || choose / otherwise를 쓰면 switch 가능하다-->
					            <c:if test="${!(d < 1 || d > lastDate)}">
					                <td class="trheight tdheight" onclick="페이지로이동(${targetYear}, ${targetMonth + 1}, ${d})">
					                    <div>
					                        <a>${d}</a>
					                    </div>
					                    <!-- 해당 날짜에 해당하는 모든 내역 중 최대 4개만 출력 -->
					                    <c:set var="count" value="0" />
					                    <!-- 수정된 코드: 포맷터 적용 -->
										<c:forEach var="c" items="${list}">
										    <c:if test="${d == fn:substring(c.getCashbookDate(), 8, 10) && count < 4}">
										        <div>
										            <c:if test="${c.category == '수입'}">
										                <span class="income-text" style="color: blue;">+<fmt:formatNumber value="${c.price}" pattern="###,###,###,###"/></span>
										            </c:if>
										            <c:if test="${c.category == '지출'}">
										                <span class="expense-text" style="color: red;">-<fmt:formatNumber value="${c.price}" pattern="###,###,###,###"/></span>
										            </c:if>
										        </div>
										        <c:set var="count" value="${count + 1}" />
										    </c:if>
										</c:forEach>
					                </td>
					            </c:if>
					        </c:forEach>
					    </tr>
					</tbody>
				</table>
				</div>
					
		</div>

	</div>
	<jsp:include page="/layout/footer.jsp"></jsp:include>
</body>
</html>


