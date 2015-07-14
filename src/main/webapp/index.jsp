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
<script src="resources/js/pagination.js"></script>
</head>

<body>

<div class="navbar">
		<div class="navbar-inner">
			<a class="brand" href="">KnowHub</a>
			<ul class="nav">
				<li class="inactive"><a href="">My Question list</a></li>
				<li><a href="">Tags</a></li>
				<li class="inactive"><a href="">My Bookmarks</a></li>
				<li class="inactive"><a href="">Add Question</a></li>
				<div id="navLinks">
					<div id="links">
						<div class="nav-left">
							<a href="">Sign up</a> <a href="">Log in</a> <a href="">Help</a>
						</div>
					</div>
				</div>
			</ul>
		</div>
	</div>

	<div class="container">

<!-- 		<div class="tabbable"> -->
			<div class="row">
			<div id="categoriesMenu" class="categoriesMenu col-lg-2 col-md-2 col-sm-2 justified"></div>

			<div id="questionsList" class="divTable col-lg-10 col-md-10 col-sm-10 justified">
				<div class="row">
				<div  id="headRow" class="headRow" >
					<div class="divCell_header col-lg-6 col-md-6 col-sm-6">Question</div>
					<div class="divCell_header col-lg-2 col-md-2 col-sm-2">Category  <input type="button" class="change_order_sign" value="&#x21D5;" onclick="orderedBy(2)"></div>
					<div class="divCell_header col-lg-2 col-md-2 col-sm-2">Date  <input type="button" class="change_order_sign" value="&#x21D5;" onclick="orderedBy(1)"></div>
					<div class="divCell_header col-lg-2 col-md-2 col-sm-2">Frequently asked  <input type="button" class="change_order_sign" value="&#x21D5;" onclick="orderedBy(3)"></div>
				</div>
				</div>
			</div>
			</div>
		<div class="row">
			<div id="pagingRow" class="pagingRow col-lg-offset-2 col-lg-10 col-md-offset-2 col-md-10 col-sm-offset-2 col-sm-10">
				<div class=row>
					<div class="divCell_2 col-lg-2 col-md-2 col-sm-2" align=left>SHOW&nbsp;<select id="pageSizeChooser" onchange="pageSizeChanged()"><option selected>15</option><option>30</option><option>45</option><option>60</option></select></div>
					<div class="divCell_2 col-lg-8 col-md-8 col-sm-8" id="pagingTag" style="height:50px" align=center></div>
					<div class="divCell_2 col-lg-2 col-md-2 col-sm-2" id="pagingInfo" style="height:50px" align=right>Records 1-10 of 10</div>
				</div>
		</div>		
		</div>	
			
<!-- 		</div>  	/.tabbable -->
	</div>	<!-- /.container -->
	
	<footer class="footer">
		<div class="container">
			<p class="text-muted"></p>
		</div>
	</footer>	
	
</body>
</html>
