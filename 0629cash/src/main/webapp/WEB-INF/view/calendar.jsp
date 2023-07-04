<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%><!-- jstl substring호출 -->
<!-- jsp 컴파일 시 자바코드로 변환되는 c:...(제어문법코드) 커스텀 태그 사용 가능 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

	<!-- 변수값 or 반환값 -> EL 사용$표현식 -->
	<!-- 속성값 대신 EL 사용 
		ex)
		request.getAttribute("targetYear")
		requestScope.targetYear
		requestScope는 생략 가능
		->형변환연산이 필요없다(EL이 자동으로 처리)
		-->
	
	<!--	자바코드(제어문): JSTL(for문...) 사용-->
	
	<h1>
	${targetYear}년 ${targetMonth+1}월
	</h1>
	<!-- 이전달과 다음달로 이동하는 링크를 생성 -->
	<a href="${pageContext.request.contextPath}/calendarController?targetYear=${targetYear}&targetMonth= ${targetMonth-1}">이전달</a>
	<a href="${pageContext.request.contextPath}/calendarController?targetYear=${targetYear}&targetMonth= ${targetMonth+1}">다음달</a>
	
	<!-- 요일을 표시하는 헤더부분 -->
	<table border="1" width="80%">
		<tr>
			<th>일</th>
			<th>월</th>
			<th>화</th>
			<th>수</th>
			<th>목</th>
			<th>금</th>
			<th>토</th>
		</tr>

		<tr>
			<!-- foreach를 사용해 0부터 totalcell -1까지 반복 var=i로 현재의 값을 저장한다 -->
			<c:forEach var="i" begin="0" end="${totalCell - 1}" step="1">
			<!-- d 변수를 i-beginBlank+1(캘린더에 날짜를 표시하는 값)로 설정 -->
				<c:set var="d" value="${i-beginBlank+1 }"></c:set> 
				<!-- 매주마다 행을 나눈다 -->	
				<c:if test="${i!=0 && i % 7 == 0 }"> 
					</tr><tr>
				</c:if>
				<!-- d값이 유효한 날짜범위에 속하지 않으면 <td>를 생성 -->
				<c:if test="${d < 1 || d > lastDate}">
					<td></td>
				</c:if>
				<!-- else if문은 if문을 !으로  
					|| choose / otherwise를 쓰면 switch 가능하다-->
				<c:if test="${!(d <1 || d > lastDate) }">
					<td>
				<!-- 유효한 날짜범위에 속한다면 ${d}변수를 사용해 날짜를 출력한다 -->
						<div>${d}</div>
				<!-- list 변수에 저장된 객체목록을 c:forEach 를 사용해 반복한다 -->
						<c:forEach var="c" items="${list}">
				<!-- 값과 c.getCashbookDate()에서 추출한 날짜가 일치하는 경우 -->
							<c:if test="${d == fn:substring(c.getCashbookDate(),8,10)}">
								<div>
				<!--수입 또는 지출을 표시한다 -->
									<c:if test="${c.category == '수입'}">
										<span>+${c.price}</span>
									</c:if>
									<c:if test="${c.category == '지출'}">
										<span style="color:red;">+${c.price}</span>
									</c:if>
								</div>
							</c:if>
						</c:forEach>
					</td>
				</c:if>
			</c:forEach>
	</table>
	
</body>
</html>


