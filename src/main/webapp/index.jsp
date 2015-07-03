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
<link rel="stylesheet"	href="resources/styleBootstrap/css/bootstrap.vertical-tabs.css">
<script src="resources/styleBootstrap/js/ie-emulation-modes-warning.js"></script>



<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="resources/js/pagination.js"></script>
</head>

<body>

<div class="navbar">
		<div class="navbar-inner">
			<a class="brand" href="#">KnowHub</a>
			<ul class="nav">
				<li class="active"><a href="#">Questions</a></li>
				<li><a href="#">Tags</a></li>
				<li><a href="#">Add Question</a></li>
				<div id="navLinks">
					<div id="links">
						<div class="nav-left">
							<a href="#">Sign up</a> <a href="#">Log in</a> <a href="#">Help</a>
						</div>
					</div>
				</div>
			</ul>
		</div>
	</div>

	<div class="container">

		<div class="tabbable">
			<div id="categoriesMenu" class="categoriesMenu"></div>

			<div id="questionsList" class="divTable">
				<div  id="headRow" class="headRow">
					<div class="divCell_header" style="width: 400px">Question</div>
					<div class="divCell_header">Category  <input type="button" class="change_order_sign" value="&#x21D5;"></div>
					<div class="divCell_header">Date  <input type="button" class="change_order_sign" value="&#x21D5;"></div>
					<div class="divCell_header">Frequently asked  <input type="button" class="change_order_sign" value="&#x21D5;"></div>
				</div>
			</div>
	
			<div id="pagingRow" class="pagingRow">
			<div class="divCell_2" style="width:250px;height:50px" align=right>SHOW&nbsp;<select id="pageSizeChooser" onchange="pageSizeChanged()"><option selected>10</option><option>20</option><option>30</option><option>40</option><option>50</option></select></div>
			<div class="divCell_2" id="pagingTag" style="width:520px;height:50px" align=center></div>
			<div class="divCell_2" id="pagingInfo" style="width:150px;height:50px" align=center>Records 1-10 of 10</div>
		</div>		
			
			
		</div>  	<!-- /.tabbable -->
	</div>	<!-- /.container -->
	
	<footer class="footer">
		<div class="container">
			<p class="text-muted"></p>
		</div>
	</footer>
	
	
</body>
</html>


