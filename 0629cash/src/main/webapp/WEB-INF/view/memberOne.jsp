<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="cash.vo.Member" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>CASH BOOK</title>
<jsp:include page="/layout/cdn.jsp"></jsp:include>
<body>
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<div id="member">
		<h3 class="text-center text-white pt-5">member info</h3>
			<div class="container">
		            <div id="member-row" class="row justify-content-center align-items-center">
		                <div id="member-column" class="col-md-6">
		                    <div id="member-box" class="col-md-12">
		                        <form id="member-form" class="form" action="${pageContext.request.contextPath}/removeMember" method="post">

		                            <div class="form-group">
		                                <label for="username" class="text-info">Username:
		                                		<%= ((Member) request.getAttribute("member")).getMemberId() %></label><br>
		                            </div>
		                            <div class="form-group">
		                                <label for="password" class="text-info">Password:
		                                		<%= ((Member) request.getAttribute("member")).getMemberPw() %></label><br>
		                            </div>
		                            <br>
		                            <div class="form-group">
		                                <a href="${pageContext.request.contextPath}/modifyPassword" class="text-info">회원정보수정</a>
		                            </div>
		                            <br>
		                            <div class="form-group">
		                                <a href="${pageContext.request.contextPath}/removeMember" class="text-info">회원탈퇴</a>
		                            </div>
		                        </form>
	                      	</div>
                      </div>
                  </div>
	         </div>
	</div>
	<jsp:include page="/layout/footer.jsp"></jsp:include>
</body>
</html>