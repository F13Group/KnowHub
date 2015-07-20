<%-- 
    Document   : registration
    Created on : 18.07.2015, 17:06:33
    Author     : amd
--%>
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

<!-- <link rel="stylesheet" href="resources/style/css/style.css"
	type="text/css" />-->
	
<!-- Bootstrap core CSS -->
<link href="resources/styleBootstrap/css/bootstrap.min.css"	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/styleBootstrap/css/custom.css" rel="stylesheet">
<!-- <link rel="stylesheet"	href="resources/styleBootstrap/css/bootstrap.vertical-tabs.css"> -->
<!-- <script src="resources/styleBootstrap/js/ie-emulation-modes-warning.js"></script> -->



<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="resources/js/pagination.js"></script>
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
                    <div class="form-group">
                        <label for="username" class=" col-sm-2 control-label">Name</label>
                        <div class="col-sm-2">
                          <form:input class="form-control" path="login" placeholder="user_name@epam.com"/>
                        </div>
                        <span class="error"><form:errors path="login" /></span>
                    </div>
                    
                    <div class="form-group">
                        <label for="password" class=" col-sm-2 control-label">Password</label>
                        <div class="col-sm-2">
                            <form:password class="form-control" path="password"/>
                        </div>
                        <span class="error"><form:errors path="password" /></span>
                    </div>
                    <div class="form-group">
                        <label for="password2" class="col-sm-2 control-label">Confirm password</label>
                        <div class="col-sm-2">
                            <form:password class="form-control" path="password2"/>
                        </div>
                        <span class="error"><form:errors path="password2" /></span>
                    </div>
                    <div class="row">
                        <input type="submit" class="col-lg-offset-2 btn btn-success" onclick="return validateForm();"/>
<!--                        <button type="button" class="col-lg-offset-2 btn btn-success" onclick="confirmation()">Success</button>-->
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
        function confirmation(){
            return confirm("test message");
        }
        
        function validateForm() {
            var x = document.forms["newUser"]["login"].value;            
            if (x == null || x == "") {
                alert("Name must be filled out!");
                return false;
            }
            if (x.indexOf("@epam.com") <= 0) {
            	alert("Name must be a valid @epam.com email!");
            	return false;
            }
            
            var regexp1 = /((?=.*\d)(?=.*[a-z]).{8,})/;
            var regexp2 = /((?=.*\d)(?=.*[A-Z]).{8,})/;
            var regexp3 = /((?=.*\d)(?=.*[~@#$%^\+\-\=\[\]\*\(\)\/\{\}\\\?\!\|\:\;\_\<\>]).{8,})/;
            var regexp4 = /((?=.*[a-z])(?=.*[A-Z]).{8,})/;
            var regexp5 = /((?=.*[a-z])(?=.*[~@#$%^\+\-\=\[\]\*\(\)\/\{\}\\\?\!\|\:\;\_\<\>]).{8,})/;
            var regexp6 = /((?=.*[A-Z])(?=.*[~@#$%^\+\-\=\[\]\*\(\)\/\{\}\\\?\!\|\:\;\_\<\>]).{8,})/;
            var pass1 = document.forms["newUser"]["password"].value;
            if (!regexp1.test(pass1) & !regexp2.test(pass1) & !regexp3.test(pass1) & !regexp4.test(pass1) & !regexp5.test(pass1) & !regexp6.test(pass1)) {            	
            	alert(pass1 + "\nPassword must follow rules!");
            	return false;
            }
            
            var pass2 = document.forms["newUser"]["password2"].value;
            if (pass1 != pass2) {
            	alert(pass1 + "\nEntered passwords don't match!");
            	return false;
            }
            
            return confirmation();
        }
    </script>
	
</body>
</html>