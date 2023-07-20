<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="cash.vo.Member" %>

<%
//세션 유효성 검사
	HttpSession ondSession = request.getSession();
		System.out.println("로그인 성공");


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/layout/header.jsp"></jsp:include>
	
	<h1>회원 상세정보</h1>
	<form method="post" action="${pageContext.request.contextPath}/removeMember">
		<table>
			<tr>
				<td>아이디</td>
				<td><%= ((Member) request.getAttribute("member")).getMemberId() %></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><%= ((Member) request.getAttribute("member")).getMemberPw() %></td>
			</tr>

		</table>
		
		<a href="${pageContext.request.contextPath}/modifyMember">회원정보수정</a>
		<a href="${pageContext.request.contextPath}/removeMember">회원탈퇴</a>
	</form>
	
	<jsp:include page="/layout/footer.jsp"></jsp:include>
</body>
</html>