<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
</head>
<body>
	<jsp:include page="/layout/header.jsp"></jsp:include>
	
	<h1>로그인</h1>
	<form method="post" action="${pageContext.request.contextPath}/login">

		<div>
			아이디 : <input type="text" name="memberId" value="${loginMember}"></td>
		</div>
		<div>
			비밀번호 : <input type="password" name="memberPw"></td>
		</div>
		<div>
			<input type="checkbox" name="saveId" value="y">ID저장
		</div>
		<div>
			<button type="submit">로그인</button>
		</div>
		<a href="${pageContext.request.contextPath}/addMember">회원가입</a>
	</form>
	
	<jsp:include page="/layout/footer.jsp"></jsp:include>
</body>
</html>
