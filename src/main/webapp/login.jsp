<%-- 
    Document   : login
    Created on : 18.07.2015, 12:45:04
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
							<!-- <a href="${pageContext.servletContext.contextPath}">Home</a>-->
							<a href="/KnowHub/signup">Sign up</a> <a class ="inactive" href="">Log in</a> <a href="">Help</a>
						</div>
					</div>
				</div>
			</ul>
		</div>
	</div>

	<div class="container">
 		<form class="login-form" action="login" method="post">
                <div class="form-horizontal" >
                    <div class="form-group" id="login-group">
                        <label for="username" class="col-sm-2 control-label">Email:</label>
                        <div class="col-sm-2">
							<input id="j_username" name="username" size="20" maxlength="30" type="text"  placeholder="username@epam.com"/>                     
						</div>
         	        </div>
                    <div class="form-group" id="password-group">
                        <label for="password" class="col-sm-2 control-label">Password:</label>
                        <div class="col-sm-2">
							<input id="j_password" name="password" size="20" maxlength="20" type="password" placeholder="password" />                    
					    </div>
            	     </div>
                
 					<div class="row">
						<div class="checkbox">
 	 						<label class="col-sm-2 control-label row-label"><input type="checkbox" class="col-lg-offset-2 btn">Remember me</label>
						</div>
					</div>
					<div class="row">
						<input type="submit" value="Login" class="col-lg-offset-2 btn login-btn" style=" color:white; border-color: #1A9CB0; background: #1A9CB0" onmouseover="this.style.backgroundColor='#A3C644'; this.style.borderColor='#A3C644'" onmouseout="this.style.backgroundColor='#1A9CB0'; this.style.borderColor='#1A9CB0'"/>
                	</div>
                </div>
            </form>
            
            <div class="row separate">
            	<label class="col-sm-2 control-label row-label"><a href="">Forgot your password?</a></label>
            </div>
            
            <div class="row separate">
            	<label class="col-sm-2 control-label row-label">Don't have an account?</label>
            </div>
            <div class="row">
				<a href="/KnowHub/signup" class="col-lg-offset-2 btn login-btn" style=" color:white; border-color: #1A9CB0; background: #1A9CB0" onmouseover="this.style.backgroundColor='#A3C644'; this.style.borderColor='#A3C644'" onmouseout="this.style.backgroundColor='#1A9CB0'; this.style.borderColor='#1A9CB0'">Sign up</a>
           	</div>
	</div>	<!-- /.container -->
	
	<footer class="footer">
		<div class="container">
			<p class="text-muted"></p>
		</div>
	</footer>	
	
</body>
</html>
