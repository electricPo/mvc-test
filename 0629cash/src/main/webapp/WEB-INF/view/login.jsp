<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CASH BOOK</title>
<jsp:include page="/layout/cdn.jsp"></jsp:include>
</head>
<body class="loginBody">
	<jsp:include page="/layout/header.jsp"></jsp:include>
	    <div id="login">
	        <h3 class="text-center text-white pt-5">Login form</h3>
	        <div class="container">
	            <div id="login-row" class="row justify-content-center align-items-center">
	                <div id="login-column" class="col-md-6">
	                    <div id="login-box" class="col-md-12">
	                        <form id="login-form" class="form" action="${pageContext.request.contextPath}/login" method="post">
	                            <h3 class="text-center login"><b>Login</b></h3>
	                            <div class="form-group">
	                                <label for="username" class="login">Username:</label><br>
	                                <input type="text" name="memberId" id="username" class="form-control" value="${loginMember}">
	                            </div>
	                            <div class="form-group">
	                                <label for="password" class="login">Password:</label><br>
	                                <input type="password" name="memberPw" id="password" class="form-control">
	                            </div>
	                            <div class="form-group">
	                                <label for="remember-me" class="login"><span>Remember me</span> <span><input id="remember-me" name="saveId" type="checkbox" value="y"></span></label><br>
	                                 <input type="submit" name="submit" class="btn btn-info btn-md" value="submit">
	                            </div>
	                            <br>
	                            <div id="register-link" class="text-right">
	                                <a href="${pageContext.request.contextPath}/addMember" class="login">Register here</a>
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
