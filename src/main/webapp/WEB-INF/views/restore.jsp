<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- favicon -->
<link rel="icon" href="resources/styleBootstrap/img/question_shield.png"
	type="image/png">
<title>KNOW HUB</title>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


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

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"></script>
</head>

<body>

	<%@ include file="navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<form name='restorePasswordForm' method='POST'
					class="restorePasswordForm" action='restore'>
					<c:if test="${not empty notificationMessage}">
						<div class="alert alert-danger alert-dismissible" role="alert">
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<strong>${notificationMessage}</strong>
						</div>
					</c:if>					

					<div class="row">
						<div class="col-xs-12 col-sm-6 col-med-5 col-lg-3 ">
							<h4>FORGOT PASSWORD</h4>

							Let us know what email you set to login and <br> we will
							send you an email with instructions

						</div>
					</div>


					<div class="row">
						<div class="col-xs-3 col-sm-3 col-med-3 col-lg-3 form-group"  id="login-group">
							<p>
								<br/>
								<label for="login" class="control-label">Email</label> 
							</p>
							<input
								name="login" type="text" class="form-control"
								placeholder="name_surname@epam.com" />
								
						</div>
					</div>

					<div class="row">
						<div class="col-xs-12 col-sm-6 col-med-5 col-lg-3">
							<input name="submit" type="submit" value="Send"
								class=" btn"
								style="color: white; border-color: #1A9CB0; background: #1A9CB0"
								onmouseover="this.style.backgroundColor='#A3C644'; this.style.borderColor='#A3C644'"
								onmouseout="this.style.backgroundColor='#1A9CB0'; this.style.borderColor='#1A9CB0'"/>
						</div>
						
					</div>
					<div class="row">
						<div class="col-xs-12 col-sm-6 col-med-5 col-lg-3 ">
							<br /> <a href="/knowhub/login">Back to Log in page</a>
						</div>
					</div>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />

				</form>
			</div>
		</div>
	</div>
	<!-- /.container -->

	<footer class="footer">
		<div class="container">
			<p class="text-muted"></p>
		</div>
	</footer>

	<script>
		
		var pattern =  /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
		$(document).ready(
				function() {

					$.validator.addMethod("customemail", function(value,
							element) {						
						return	pattern.test(value);
					}, "Please input valid email");

					$(".restorePasswordForm").validate(
							{
								rules : {
									login : {
										required : {
											depends : function() {
												$(this).val(
														$.trim($(this).val()));
												return true;
											}
										},
										customemail : true
									},
									
								}
							});
				});
	</script>
</body>
</html>
