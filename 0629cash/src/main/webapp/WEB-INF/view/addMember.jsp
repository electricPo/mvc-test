<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addMember</title>
</head>
<body>
	<jsp:include page="/layout/header.jsp"></jsp:include>
	
	<h1>회원가입</h1>
	<form method="post" action="${pageContext.request.contextPath}/addMember">
		<table border="1">
			<tr>
				<td>addMemberId</td>
				<td><input type="text" name="addMemberId"></td>
			</tr>
			<tr>
				<td>addMemberPw</td>
				<td><input type="password" name="addMemberPw"></td>
			</tr>
		</table>
		<button type="submit">회원가입</button>
	</form>
	
	<jsp:include page="/layout/footer.jsp"></jsp:include>
</body>
</html>