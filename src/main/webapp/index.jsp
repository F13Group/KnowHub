<!DOCTYPE html>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="resources/style/css/style.css"
	type="text/css" />

<title>Home page</title>

<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="resources/js/pagination.js"></script>
</head>
<body>

<div class="loginLinks" align="right">
		<a href="">Sign up</a> <a href="">Log in</a> <a href="">Help</a>
	</div>

	<div class="loginLinks" align="right">
		<span class="loginLinksItem"> <input type="button"
			value="My Question list" disabled>
		</span> <span class="loginLinksItem"> <input type="button"
			value="Tags">
		</span> <span class="loginLinksItem"> <input type="button"
			value="My Bookmarks" disabled>
		</span> <span class="loginLinksItem"> <input type="button"
			value="Add Question" disabled>
		</span>
	</div>


	<div id="categoriesMenu" class="categoriesMenu">
				
	</div>

	<div id="questionsList" class="divTable">
		<div id="headRow" class="headRow">
			<div class="divCell_header">Question</div>
			<div class="divCell_header">Category  <input type="button" class="change_order_sign" value="&#x21D5;"></div>
			<div class="divCell_header">Date <input type="button" class="change_order_sign" value="&#x21D5;"></div>
			<div class="divCell_header">Frequently Asked <input type="button" class="change_order_sign" value="&#x21D5;"></div>
		</div>						
			
		<div id="pagingRow" class="pagingRow">
			<div class="divCell_2" style="width:150px" align=right>SHOW&nbsp;<select id="pageSizeChooser" onchange="pageSizeChanged()"><option selected>10</option><option>20</option><option>30</option><option>40</option><option>50</option></select></div>
			<div class="divCell_2" id="pagingTag" style="width:520px" align=center></div>
			<div class="divCell_2" id="pagingInfo" style="width:150px" align=center>Records 1-10 of 10</div>
		</div>			
	</div>
	
</body>
</html>


