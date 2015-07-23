<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- favicon -->
<link rel="icon" href="resources/styleBootstrap/img/question_shield.png" type="image/png">
<title>KNOW HUB</title>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- Bootstrap core CSS -->
<link href="resources/styleBootstrap/css/bootstrap.min.css"	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/styleBootstrap/css/custom.css" rel="stylesheet">

<!-- JavaScripts -->
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script src="https://code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="resources/js/validation.js"></script>

</head>

<body>

<div class="navbar">
		<div class="navbar-inner">
			<a class="brand" href="${pageContext.servletContext.contextPath}">KnowHub</a>
			<ul class="nav">
				<li class="inactive hidden"><a href="">My Question list</a></li>
				<li class="hidden" ><a href="">Tags</a></li>
				<li class="inactive hidden"><a href="">My Bookmarks</a></li>
				<li class="inactive hidden"><a href="">Add Question</a></li>
				<div id="navLinks">
					<div id="links">
						<div class="nav-left">
							<a href="" class="inactive">Sign up</a>
							<a href="">Log in</a>
							<a href="">Help</a>							
						</div>
					</div>
				</div>
			</ul>
		</div>
	</div>    
      
	<div class="container">
            <form:form commandName="newUser" method="post">
                <div class="form-horizontal" >
                    <div class="form-group" id="login-group">
                        <label for="username" class="col-sm-2 control-label">Email:</label>
                        <div class="col-sm-2">
                        	<form:input class="form-control" path="login" placeholder="user_name@epam.com" onfocus="showMessageLogin()" onblur="validateLogin()"/>
                        </div>
                        <span class="error"><form:errors path="login" /></span>
                    </div>
                    
                    <div class="form-group" id="password-group">
                        <label for="password" class="col-sm-2 control-label">Password:</label>
                        <div class="col-sm-2">
                            <form:password class="form-control" path="password" onfocus="showMessagePassword()" onblur="validatePassword()"/>
                        </div>
                        <span class="error"><form:errors path="password" /></span>
                    </div>
                    
                    <div class="form-group" id="password2-group">
                        <label for="password2" class="col-sm-2 control-label">Confirm password:</label>
                        <div class="col-sm-2">
                            <form:password class="form-control" path="password2" onfocus="showMessagePassword2()" onblur="validatePassword2()"/>
                        </div>
                        <span class="error"><form:errors path="password2"/></span>
                    </div>
                    
                    <div class="row">
                        <input type="submit" class="col-lg-offset-2 btn btn-success" onclick="return validateForm();"/>
                    </div>
                </div>
            </form:form> 
	</div>	<!-- /.container -->
	
    <footer class="footer">
		<div class="container">
			<p class="text-muted"></p>
		</div>
	</footer>
	
	<script>
		$(document).ready(function() {			
			<c:if test="${not empty signUpError}">
				loginExists();
			</c:if>
		});		
	</script>
	
</body>
</html>
