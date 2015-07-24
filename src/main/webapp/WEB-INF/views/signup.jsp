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
<!-- <link rel="stylesheet"	href="resources/styleBootstrap/css/bootstrap.vertical-tabs.css"> -->
<!-- <script src="resources/styleBootstrap/js/ie-emulation-modes-warning.js"></script> -->
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

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
							<a href="signup">Sign up</a> <a href="">Log in</a> <a href="">Help</a>
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
                        	<form:input class="form-control" path="login" placeholder="user_name@epam.com" onfocus="showMessageLogin()" onblur="hideMessageLogin()"/>
                        </div>
                        <span class="error"><form:errors path="login" /></span>
                    </div>
                    
                    <div class="form-group" id="password-group">
                        <label for="password" class="col-sm-2 control-label">Password:</label>
                        <div class="col-sm-2">
                            <form:password class="form-control" path="password" onfocus="showMessagePassword()" onblur="hideMessagePassword()"/>
                        </div>
                        <span class="error"><form:errors path="password" /></span>
                    </div>
                    
                    <div class="form-group" id="password2-group">
                        <label for="password2" class="col-sm-2 control-label">Confirm password:</label>
                        <div class="col-sm-2">
                            <form:password class="form-control" path="password2"/>
                        </div>
                        <span class="error"><form:errors path="password2" /></span>
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
		function showMessageLogin() {
			$('.form-control').removeAttr('style');
        	$( ".error" ).remove();
			$("#login-group").append("<div id=loginInstructions>Use your corporate email as in the example.\nYou should only add your name and surname with _ symbol in between.</div>")
		}
		
		function hideMessageLogin() {
			$("#loginInstructions").remove();
		}
		
		function showMessagePassword() {
			$('.form-control').removeAttr('style');
        	$( ".error" ).remove();
			$("#password-group").append("<div id=passwordInstructions>Password must have at least 8 characters but not more than 20 characters and contain at least 2 of the following: uppercase letters, lowercase letters, numbers, and symbols including spaces.\nDo not use your email, name or surname as your password or as part of it.</div>")
		}
		
		function hideMessagePassword() {
			$("#passwordInstructions").remove();
		}
	
        function confirmation() {
            return confirm("TERMS OF AGREEMENT\nDo you agree?");
        }
        
        function validateForm() {
        	$('.form-control').removeAttr('style');
        	$( ".error" ).remove();
        	
            var login = document.forms["newUser"]["login"].value;            
            if (login == null || login == "") {                
                document.getElementById("login").style.border = "1px solid #B22746";
                document.getElementById("login").style.boxShadow = "0 0 10px #B22746";
                $("#login-group").after("<div class='error col-lg-offset-2'>This information is required.</div>");                
                return false;
            }
            if (login.indexOf("@epam.com") <= 0) {
            	document.getElementById("login").style.border = "1px solid #B22746";
                document.getElementById("login").style.boxShadow = "0 0 10px #B22746";
                $("#login-group").after("<div class='error col-lg-offset-2'>Enter the email address in the format name_surname@epam.com</div>");            	
            	return false;
            }
            
            var pass1 = document.forms["newUser"]["password"].value;
            if (pass1 == null || pass1 == "") {                
                document.getElementById("password").style.border = "1px solid #B22746";
                document.getElementById("password").style.boxShadow = "0 0 10px #B22746";
                $("#password-group").after("<div class='error col-lg-offset-2'>This information is required.</div>");                
                return false;
            }
            
            var pass2 = document.forms["newUser"]["password2"].value;
            if (pass2 == null || pass2 == "") {                
                document.getElementById("password2").style.border = "1px solid #B22746";
                document.getElementById("password2").style.boxShadow = "0 0 10px #B22746";
                $("#password2-group").after("<div class='error col-lg-offset-2'>This information is required.</div>");                
                return false;
            }
            
            var regexp1 = /((?=.*\d)(?=.*[a-z]).{8,})/;
            var regexp2 = /((?=.*\d)(?=.*[A-Z]).{8,})/;
            var regexp3 = /((?=.*\d)(?=.*[~@#$%^\+\-\=\[\]\*\(\)\/\{\}\\\?\!\|\:\;\_\<\>]).{8,})/;
            var regexp4 = /((?=.*[a-z])(?=.*[A-Z]).{8,})/;
            var regexp5 = /((?=.*[a-z])(?=.*[~@#$%^\+\-\=\[\]\*\(\)\/\{\}\\\?\!\|\:\;\_\<\>]).{8,})/;
            var regexp6 = /((?=.*[A-Z])(?=.*[~@#$%^\+\-\=\[\]\*\(\)\/\{\}\\\?\!\|\:\;\_\<\>]).{8,})/;            
            if (!regexp1.test(pass1) & !regexp2.test(pass1) & !regexp3.test(pass1) & !regexp4.test(pass1) & !regexp5.test(pass1) & !regexp6.test(pass1)) {
            	document.getElementById("password").style.border = "1px solid #B22746";
                document.getElementById("password").style.boxShadow = "0 0 10px #B22746";                
                document.getElementById("password").value = "";
                document.getElementById("password2").value = "";
                $("#password-group").after("<div class='error col-lg-offset-2'>Passwords must have at least 8 characters and contain at least two of the following: uppercase letters, lowercase letters, numbers, and symbols including spaces. Do not use your email, name or surname as your password or as part of it.</div>");            	
            	return false;
            }
            
            if (pass1.length > 20) {
            	document.getElementById("password").style.border = "1px solid #B22746";
                document.getElementById("password").style.boxShadow = "0 0 10px #B22746";                
                document.getElementById("password").value = "";
                document.getElementById("password2").value = "";
                $("#password-group").after("<div class='error col-lg-offset-2'>Your password can't be longer than 20 characters.</div>");            	
            	return false;
            }            
            
            if (pass1 != pass2) {
            	document.getElementById("password").style.border = "1px solid #B22746";
                document.getElementById("password").style.boxShadow = "0 0 10px #B22746";
            	document.getElementById("password2").style.border = "1px solid #B22746";
                document.getElementById("password2").style.boxShadow = "0 0 10px #B22746";
                document.getElementById("password").value = "";
                document.getElementById("password2").value = "";
                $("#password2-group").after("<div class='error col-lg-offset-2'>These passwords don't match!</div>");            	
            	return false;
            }
            
            return confirmation();
        }
    </script>
	
</body>
</html>