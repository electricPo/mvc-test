<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cash.model.MemberDao, cash.vo.Member" %>

<%
//세션 유효성 검사
	HttpSession ondSession = request.getSession();
		System.out.println("로그인 성공");


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
</head>
<body>
	<h1>회원 탈퇴</h1>
	<form method="post" action="${pageContext.request.contextPath}/removeMember" >
		<table>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="memberPw"></td>
			</tr>
		</table>
		<button type="submit">탈퇴하기</button>
	</form>
	
</body>
</html>