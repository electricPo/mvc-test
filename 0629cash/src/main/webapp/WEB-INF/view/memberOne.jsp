<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="cash.vo.Member" %>

<%
//���� ��ȿ�� �˻�
	HttpSession ondSession = request.getSession();
		System.out.println("�α��� ����");


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/layout/header.jsp"></jsp:include>
	
	<h1>ȸ�� ������</h1>
	<form method="post" action="${pageContext.request.contextPath}/removeMember">
		<table>
			<tr>
				<td>���̵�</td>
				<td><%= ((Member) request.getAttribute("member")).getMemberId() %></td>
			</tr>
			<tr>
				<td>��й�ȣ</td>
				<td><%= ((Member) request.getAttribute("member")).getMemberPw() %></td>
			</tr>

		</table>
		
		<a href="${pageContext.request.contextPath}/modifyMember">ȸ����������</a>
		<a href="${pageContext.request.contextPath}/removeMember">ȸ��Ż��</a>
	</form>
	
	<jsp:include page="/layout/footer.jsp"></jsp:include>
</body>
</html>