<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
</head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
	body {
	  margin: 0;
	  padding: 0;
	  background-color: #17a2b8;
	  height: 100vh;

	}
	#login .container #login-row #login-column #login-box {
	  margin-top: 120px;
	  max-width: 400px;
	  height: 320px;
	  border: 1px solid #9C9C9C;
	  background-color: #EAEAEA;
	  font-size: 1.5rem;
	}
	#login .container #login-row #login-column #login-box #login-form {
	  padding: 20px;
	  font-size: 1.5rem;
	}
	#login .container #login-row #login-column #login-box #login-form #register-link {
	  margin-top: -85px;
	  font-size: 1.5rem;
	}
</style>

<body>
	<jsp:include page="/layout/header.jsp"></jsp:include>
	    <div id="login">
	        <h3 class="text-center text-white pt-5">Login form</h3>
	        <div class="container">
	            <div id="login-row" class="row justify-content-center align-items-center">
	                <div id="login-column" class="col-md-6">
	                    <div id="login-box" class="col-md-12">
	                        <form id="login-form" class="form" action="${pageContext.request.contextPath}/login" method="post">
	                            <h3 class="text-center text-info">Login</h3>
	                            <div class="form-group">
	                                <label for="username" class="text-info">Username:</label><br>
	                                <input type="text" name="memberId" id="username" class="form-control" value="${loginMember}">
	                            </div>
	                            <div class="form-group">
	                                <label for="password" class="text-info">Password:</label><br>
	                                <input type="password" name="memberPw" id="password" class="form-control">
	                            </div>
	                            <div class="form-group">
	                                <label for="remember-me" class="text-info"><span>Remember me</span> <span><input id="remember-me" name="saveId" type="checkbox" value="y"></span></label><br>
	                                 <input type="submit" name="submit" class="btn btn-info btn-md" value="submit">
	                            </div>
	                            <br>
	                            <div id="register-link" class="text-right">
	                                <a href="${pageContext.request.contextPath}/addMember" class="text-info">Register here</a>
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
