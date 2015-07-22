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


<!-- Bootstrap core CSS -->
<link href="resources/styleBootstrap/css/bootstrap.min.css"	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/styleBootstrap/css/custom.css" rel="stylesheet">

<!-- JavaScripts -->
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
</head>

<body>

<div class="navbar">
		<div class="navbar-inner">
			<a class="brand" href="${pageContext.servletContext.contextPath}">KnowHub</a>
			<ul class="nav">
				<li class="inactive"><a href="">My Question list</a></li>
				<li><a href="">Tags</a></li>
				<li class="inactive"><a href="">My Bookmarks</a></li>
				<li class="inactive"><a href="">Add Question</a></li>
				<div id="navLinks">
					<div id="links">
						<div class="nav-left">
							<a href="signup">Sign up</a>
							<a href="">Log in</a>
							<a href="">Help</a>
						</div>
					</div>
				</div>
			</ul>
		</div>
	</div>

	<div class="notification">
		<c:out value="Registration email was sent to ${newUser.login}. Check your email for the link to complete the registration process. If you don't see this email in your inbox within 24 hours, please make sure that the email address you have entered is correct and is a corporate one." />		
	</div>
		
	<footer class="footer">
		<div class="container">
			<p class="text-muted"></p>
		</div>
	</footer>	
	
</body>
</html>
