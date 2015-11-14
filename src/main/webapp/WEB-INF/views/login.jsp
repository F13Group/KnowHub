<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- favicon -->
<link rel="icon" href="${pageContext.request.contextPath}/resources/styleBootstrap/img/question_shield.png"
	type="image/png">
<title>KNOW HUB</title>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- Bootstrap core CSS -->
 <link href="${pageContext.request.contextPath}/resources/styleBootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/resources/styleBootstrap/css/custom.css" rel="stylesheet">

<!-- JQuery style -->
<link
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css"
	rel="stylesheet">

<!-- JavaScripts -->
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script src="https://code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/validation.js"></script>
    <!-- Latest compiled and minified JavaScript -->
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
				<li class="hidden"><a href="">Tags</a></li>
				<li class="inactive hidden"><a href="">My Bookmarks</a></li>
				<li class="inactive hidden"><a href="">Add Question</a></li>
				<div id="navLinks">
					<div id="links">
						<div class="nav-left">
							<a href="signup">Sign up</a> <a href="login" class="inactive">Log
								in</a> <a href="">Help</a>
						</div>
					</div>
				</div>
			</ul>
		</div>
	</div>

	<div class="container">
		<form:form name='loginForm' commandName="newUser" method='POST' cssClass="form-horizontal loginForm" class="form-signin">

				<c:if test="${not empty error}">
				    <div class="alert alert-danger alert-dismissible" role="alert">
				        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
				                aria-hidden="true">&times;</span></button>
				        <strong>${error}</strong> 
				    </div>
				</c:if>
				
				<c:if test="${not empty message}">
    				<div class="alert alert-info alert-dismissible" role="alert">
        				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                			aria-hidden="true">&times;</span></button>
        				<strong> ${message}</strong>
    				</div>
				</c:if>
				
				<div class="form-group"   id="login-group">
					<label for="username" class="col-sm-2 control-label">Email:</label>
					<div class="col-sm-3">
					<!-- path="login" - login is required http form-login username-parameter in spring-security-config.xml  -->
						<form:input path="login" type="text"
							class="form-control " placeholder="name_surname@epam.com"/>	
						<form:errors path="login" cssStyle="color: red;"/>
					</div>
				</div>

				<div class="form-group" id="password-group">
					<label for="password" class="col-sm-2 control-label">Password:</label>
					<div class="col-sm-3" >
						<form:input path="password" type="password" 
							class="form-control " placeholder="Enter your password"/> 
						<form:errors path="password" cssStyle="color: red;"/>
					</div>
				</div>
				
				<div class="row">
					<div class="checkbox">
 	 					<label class="col-sm-2 control-label row-label"><input type="checkbox" class="col-lg-offset-2 btn">Remember me</label>
					</div>
				</div>
					
				<div class="row">
					<input name="submit" type="submit" value="Login"
						class="col-lg-offset-2 btn"
						style="color: white; border-color: #1A9CB0; background: #1A9CB0"
						onmouseover="this.style.backgroundColor='#A3C644'; this.style.borderColor='#A3C644'"
						onmouseout="this.style.backgroundColor='#1A9CB0'; this.style.borderColor='#1A9CB0'" />
				</div>
				
				<div class="row separate">
            		<label class="col-sm-2 control-label row-label"><a href="restore">Forgot your password?</a></label>
            	</div>
            
            	<div class="row separate">
            		<label class="col-sm-2 control-label row-label">Don't have an account?</label>
            	</div>
            	
	            <div class="row">
					<a href="/knowhub/signup" class="col-lg-offset-2 btn login-btn" style=" color:white; border-color: #1A9CB0; background: #1A9CB0" onmouseover="this.style.backgroundColor='#A3C644'; this.style.borderColor='#A3C644'" onmouseout="this.style.backgroundColor='#1A9CB0'; this.style.borderColor='#1A9CB0'">Sign up</a>
	           	</div>
	           	
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			
		</form:form>
	</div>
	<!-- /.container -->

	<footer class="footer">
		<div class="container">
			<p class="text-muted"></p>
		</div>
	</footer>

	<script>
		var loginInstructions = "${fn:escapeXml(loginInstructions)}";
		var passwordInstructions = "${fn:escapeXml(passwordInstructions)}";
		var confirmDialogText = "${fn:escapeXml(confirmDialogText)}";
		var errorLoginEmpty = "${fn:escapeXml(errorLoginEmpty)}";
		var errorLoginNotEmail = "${fn:escapeXml(errorLoginNotEmail)}";
		var errorLoginExistsAlready = "${fn:escapeXml(errorLoginExistsAlready)}";
		var errorPasswordEmpty = "${fn:escapeXml(errorPasswordEmpty)}";
		var errorPasswordBadlyFormed = "${fn:escapeXml(errorPasswordBadlyFormed)}";
		var errorPasswordTooLong = "${fn:escapeXml(errorPasswordTooLong)}";
		var errorPassword2Empty = "${fn:escapeXml(errorPassword2Empty)}";
		var errorPassword2NoMatch = "${fn:escapeXml(errorPassword2NoMatch)}";
		var errorPassword2NoMatch = "${fn:escapeXml(infoPleaseEnterEmail)}";
		var errorPassword2NoMatch = "${fn:escapeXml(infoPleaseEnterPassword)}";

		$(document).ready(function() {
		
			$.validator.addMethod("customemail",
	                function (value, element) {
	                    return /^\w+_\w+@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(value);
	                    /*  ^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$  - one of the email pattern version*/
	                },
	                "Please input valid email"
	        );
			
	        $.validator.addMethod("epamEmail", 
	        		function(value, element){
	        			return this.optional(element) || /^.+@epam.com$/.test(value);
	        		}, 
	        		"Only epam.com email addresses are allowed."
	        );
 			
			$(".loginForm").validate({
	                    rules: {
	                        login: {
	                        	required: {
	                                depends: function () {
	                                    $(this).val($.trim($(this).val()));
	                                    return true;
	                                }
	                            },
	                            customemail: true,
	                            epamEmail: true,
	                            minlength: 8,
	                            maxlength: 64,
	                        },

	                        password: 
	                         {
	                            required: true,
	                            minlength: 8,
	                            maxlength: 64,
	                        }, 
	                    },
	                    highlight: function (element) {
	                        $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
	                    },
	                    unhighlight: function (element) {
	                        $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
	                    },
	                     
	                    messages: {
	                    	login: {
	                    		required: "Please enter your email",
	                    		minlength: "Your login must consist of at least 8 characters",
	                    	},
	                    	password: {
	                    		required: "Please enter your password",
	                    		minlength: "Your password must consist of at least 8 characters",
	                    	}
	                    },
	                });
			
			
		}); 
		
		
	</script>
</body>
</html>
