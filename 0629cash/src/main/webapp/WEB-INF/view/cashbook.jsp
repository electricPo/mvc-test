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
	<jsp:include page="/layout/header.jsp"></jsp:include>

	<div>
	<h3>가계부 상세</h3>
		
		<div>
			<h4>${targetYear}년 ${targetMonth}월 ${targetDate}일의 지출 입력</h4>
		</div>
			<form action="${pageContext.request.contextPath}/addCash?targetYear=${targetYear}&targetMonth=${targetMonth}&targetDate=${targetDate}" method="post">
				<input type="hidden" name="targetYear" value="${targetYear}">
				<input type="hidden" name="targetMonth" value="${targetMonth}">
				<input type="hidden" name="targetDate" value="${targetDate}">
					<table>
						<tr>
							<td>수입/지출</td>
							<td>가격</td>
							<td>memo</td>
						</tr>
						<tr>
							<td>
								<select name="category">
									<option>수입</option>
									<option>지출</option>
								</select>
							</td>
							<td><input type="number" name="price" required="required"></td>
							<td><input type="text" name="memo" placeholder="해시태그 입력 가능" required="required"></td>
						</tr>
					</table>
					<button type="submit">추가</button>
			</form>
		</div>
		<div>
			<form action="${pageContext.request.contextPath}/removeCashbook" method="post">
				<input type="hidden" name="targetYear" value="${targetYear}">
				<input type="hidden" name="targetMonth" value="${targetMonth -1}">
				<input type="hidden" name="targetDate" value="${targetDate}">
					<table>
						<tr>
							<th>id</th>
							<th>수입/지출</th>
							<th>금액</th>
							<th>메모</th>
							<th>작성일<th>
						</tr>
						<c:forEach var="c" items="${list}">
							<tr>
								<td>${c.memberId}</td>
								<td>${c.category}</td>
								<td>${c.price}</td>
								<td>${c.memo}</td>
								<td>${fn:substring(c.cashbookDate,0,11)}</td>
							</tr>
						</c:forEach>
					</table>
					<button type="submit">삭제</button>
			</form>
		</div>
	
	<jsp:include page="/layout/footer.jsp"></jsp:include>
</body>
</html>
