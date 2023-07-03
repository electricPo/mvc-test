<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	
	<a href="${pageContext.request.contextPath}/calendarController?targetYear=${targetYear}&targetMonth= ${targetMonth-1}">이전달</a>
	
	<a href="${pageContext.request.contextPath}/calendarController?targetYear=${targetYear}&targetMonth= ${targetMonth+1}">다음달</a>
	
	<table border="1">
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
			<c:forEach var="i" begin="0" end="${totalCell - 1}" step="1">
				<c:if test="${i!=0 && i % 7 == 0 }"> <!-- test는 원래 조건이 들어오니까 $ 안 써도 됨 -->
					</tr><tr>
				</c:if>
				
				<c:if test="${(i - beginBlank + 1) <1 || (i - beginBlank + 1) > lastDate}">
					<td></td>
				</c:if>
				
				<c:if test="${!((i - beginBlank + 1) <1 || (i - beginBlank + 1) > lastDate) }">
					<td>${i - beginBlank + 1}</td>
				</c:if>
			</c:forEach>
	</table>
	
</body>
</html>


