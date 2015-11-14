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
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/resources/styleBootstrap/css/bootstrap.min.css"	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/resources/styleBootstrap/css/custom.css" rel="stylesheet">

<!-- JQuery style -->
<link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css" rel="stylesheet">

<!-- JavaScripts -->
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <!-- Latest compiled and minified JavaScript, for JQuery validation working -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script type="text/javascript"
            src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"></script>

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
							<a href="login">Log in</a>
							<a href="">Help</a>							
						</div>
					</div>
				</div>
			</ul>
		</div>
	</div>    
      
	<div class="container">

	<c:if test="${not empty message}">
	    <div class="alert alert-info alert-dismissible" role="alert">
	        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
	                aria-hidden="true">&times;</span></button>
	        <strong> ${message}</strong>
	    </div>
	</c:if>
	
	<c:if test="${not empty error_password}">
		<div class="alert alert-danger alert-dismissible" role="alert">
	        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
	                aria-hidden="true">&times;</span></button>
	        <strong>${error_password}</strong> 
	    </div>
	</c:if>
	
	<c:choose>
	<c:when test="${not empty error}">
	
	    <div class="alert alert-danger alert-dismissible" role="alert">
	        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
	                aria-hidden="true">&times;</span></button>
	        <strong>${error}</strong> 
	    </div>
	</c:when>

	<c:otherwise>
	
	<h1>RESET PASSWORD</h1>
            <form method="post" action="${pageContext.request.contextPath}/reset_password" class="resetPasswordForm">

                <div class="form-horizontal" >
                    
                    <input id="login" type="hidden" name="login" value="${user_login}"/>
                    
                    <div class="form-group" id="password-group">
                        <label for="password" class="col-sm-2 control-label">Password:</label>
                        <div class="col-sm-3">
                            <input id="password" name="password" type="password" class="form-control" placeholder="Enter your new password"/>
                        </div>
                        
                    </div>
                    
                    <div class="form-group" id="password2-group">
                        <label for="password2" class="col-sm-2 control-label">Confirm password:</label>
                        <div class="col-sm-3">
                            <input id="password2" name="password2" type="password" class="form-control" placeholder="Re-enter your password"/>
                        </div>
                    </div>
                    
                    <div class="row">
                        <input type="submit" value="Change password" class="col-lg-offset-2 btn" style=" color:white; border-color: #1A9CB0; background: #1A9CB0" onmouseover="this.style.backgroundColor='#A3C644'; this.style.borderColor='#A3C644'" onmouseout="this.style.backgroundColor='#1A9CB0'; this.style.borderColor='#1A9CB0'"/>
                    </div>
                    
                    <div class="row separate">
            			<label class="col-sm-2 control-label row-label"><a href="${pageContext.request.contextPath}/login">Back to Log in page</a></label>
            		</div>
                </div>
            </form>
            
            </c:otherwise>
            
		</c:choose>
             
	</div>	<!-- /.container -->
	
    <footer class="footer">
		<div class="container">
			<p class="text-muted"></p>
		</div>
	</footer>	

	<script>		
		
		$(document).ready(function() {			
			$(".resetPasswordForm").validate(
	                {
	                    rules: {
	                    		
	                        password: {
	                            required: true,
	                            minlength: 4, 
	                        },
	                        password2: {
	                            required: true,
	                            minlength: 4,
	                            equalTo: "#password"
	                        }
	                    },
	                    highlight: function (element) {
	                        $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
	                    },
	                    unhighlight: function (element) {
	                        $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
	                    },
	                });
		});
		
		
	</script>
	
</body>
</html>
