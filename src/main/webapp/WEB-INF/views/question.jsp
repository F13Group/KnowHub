<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- favicon -->
<link rel="icon" href="${pageContext.servletContext.contextPath}/resources/styleBootstrap/img/question_shield.png" type="image/png">
<title>KNOW HUB</title>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<!-- Bootstrap core CSS -->
<link href="${pageContext.servletContext.contextPath}/resources/styleBootstrap/css/bootstrap.min.css"	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${pageContext.servletContext.contextPath}/resources/styleBootstrap/css/custom.css" rel="stylesheet">

<!-- JQuery style -->
<link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css" rel="stylesheet">

<!-- JavaScripts -->
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/singleQuestion.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/pagetools.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/pagination.js"></script>
</head>

<body>

	<%@ include file="navbar.jsp"%>

	<div class="container">
	
	<div class="tabbable">
			<div class="row">
			
			<div id="questionsList" class="divTable col-lg-10 col-md-10 col-sm-10 justified">
				<div class="row">
				<div  id="headRow" class="headRow" >
					<div id="qTitle" class="divCell_header col-lg-8 divCell_Left"></div>
					<div id="wasBookmarked" class="divCell_header col-lg-4 col-md-4 col-sm-4" ></div> 
				</div>
				
				<div class="col-lg-2 col-md-2 col-sm-2 divCell_Left">
					<div id="qAuthor"></div>
					<div id="addedDate"></div> 
				</div>
				<div id="qDescription" class="col-lg-10 col-md-10 col-sm-10 justified"></div>
				</div>
			</div>
			</div>

	
			<div id="taggingRow" class="col-lg-10 col-md-10 col-sm-10 justified">
				<div class=row>
					<div class="divCell_2 col-lg-2 col-md-2 col-sm-2" id="qCategory" style="height:50px" align=left ></div>
					<div class="divCell_2 col-lg-6 col-md-6 col-sm-6" id="qTag" style="height:50px" align=center></div>
					<div class="divCell_2 col-lg-4 col-md-4 col-sm-4" id="otherQuastions" style="height:50px" align=center><a href="#">Show other questions posted by this user</a></div>
				</div>
			</div>
			
			<div id="taggingRow" class="col-lg-10 col-md-10 col-sm-10 justified">
				<div class=row>
					<div class="divCell_2 col-lg-2 col-md-2 col-sm-2" id="wasAsked" style="height:60px" align=left></div>
					<div class="divCell_2 col-lg-6 col-md-6 col-sm-6" id="viewed" style="height:60px" align=left></div>
					<div class="divCell_2 col-lg-4 col-md-4 col-sm-4" id="showComments" style="height:60px" align=center><a href="#">Show all comments</a></div>
				</div>
			</div>		
		
		<div id="userComments" class="col-lg-10 col-md-10 col-sm-10 justified">
			<div class="row" >
				<b>Comments:</b>
			</div>
		</div>
					
 		</div>  <!--	/.tabbable -->
	</div>	<!-- /.container -->
	
	<footer class="col-lg-10 col-md-10 col-sm-10" style="position: fixed; background-color:#57ffab; bottom:0; text-align: center;margin-left: 40px;">
		<div class="container">
			<p class="text-muted"> Add comment here stub</p>
		</div>
	</footer>
	
</body>
</html>