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

<!-- Bootstrap core CSS -->
 <link href="resources/styleBootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/styleBootstrap/css/custom.css" rel="stylesheet">

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
<script src="resources/js/validation.js"></script>
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
      
      
    <div class="container" >  
      
    <c:choose>
    	<c:when test="${not empty error}">
	    	<div class="alert alert-danger alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">&times;</span></button>
				<strong>${error}</strong> 
			</div>
    	</c:when>
    
    	<c:otherwise>
    	
            <form:form commandName="newUser" method="post" cssClass="form-horizontal restoreForm">
            
                <div class="form-horizontal" >
                     
                    <div class="row">
	            		<h1>PASSWORD RESET</h1>
	           		</div>
                     
                    <div class="form-group" id="password-group">
                        <label for="password" class="col-sm-2 control-label">New Password:</label>
                        <div class="col-sm-2">
                            <form:password class="form-control" path="password" placeholder="Enter your new password" onfocus="showMessagePassword(passwordInstructions, errorLoginEmpty, errorLoginNotEmail)" onblur="validatePassword(errorPasswordEmpty, errorPasswordBadlyFormed, errorPasswordTooLong)"/>
                        </div>
                        <span class="error"><form:errors path="password" /></span>
                    </div>
                    
                    <div class="form-group" id="password2-group">
                        <label for="password2" class="col-sm-2 control-label">Confirm password:</label>
                        <div class="col-sm-2">
                            <form:password class="form-control" name="password2" path="password2" placeholder="Re-enter your password" onfocus="showMessagePassword2()" onblur="validatePassword2(errorPassword2Empty, errorPassword2NoMatch)"/>
                        </div>
                        <span class="error"><form:errors path="password2"/></span>
                    </div>
                    
                    <div class="row">
                        <input type="submit" value="Change password" class="col-lg-offset-2 btn" style=" color:white; border-color: #1A9CB0; background: #1A9CB0" onmouseover="this.style.backgroundColor='#A3C644'; this.style.borderColor='#A3C644'" onmouseout="this.style.backgroundColor='#1A9CB0'; this.style.borderColor='#1A9CB0'" onclick="return validateForm(errorLoginEmpty, errorLoginNotEmail, errorPasswordEmpty, errorPasswordBadlyFormed, errorPasswordTooLong, errorPassword2Empty, errorPassword2NoMatch, confirmDialogText);"/>
                    </div>
                    
                    <div class="row separate">
            			<label class="col-sm-2 control-label row-label"><a href="login">Back to login page</a></label>
            		</div>
                </div>
            </form:form> 
	
    	</c:otherwise>
    </c:choose>  
      
	</div>	<!-- /.container -->
	
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
		
		$(document).ready(function () {

	        $(".restoreForm").validate(
	                {
	                    rules: {

	                        password: {
	                            required: true,
	                            minlength: 4
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
