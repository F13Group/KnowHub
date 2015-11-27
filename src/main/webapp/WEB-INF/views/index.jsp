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
<script src="${pageContext.servletContext.contextPath}/resources/js/pagination.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/pagetools.js"></script>
</head>

<body>

<div class="navbar">
		<div class="navbar-inner">
			<a class="brand" href="${pageContext.servletContext.contextPath}">KnowHub</a>
			<ul class="nav">
				<li <sec:authorize access="isAnonymous()">class="inactive"</sec:authorize>><a href="">My Question list</a></li>
				<li><a href="">Tags</a></li>
				<li <sec:authorize access="isAnonymous()">class="inactive"</sec:authorize>><a href="">My Bookmarks</a></li>
				<li <sec:authorize access="isAnonymous()">class="inactive"</sec:authorize>><a href="">Add Question</a></li>
				<div id="navLinks">
					<div id="links">
					<div class="nav-left">
						<sec:authorize access="isAuthenticated()">
							<a id="userName" href="" class="inactive"><sec:authentication property="principal.username" /></a>
						</sec:authorize>
						<sec:authorize access="isAnonymous()">
							<a href="signup">Sign up</a>
							<a href="login">Log in</a>
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
							<a href="logout">Log off</a>
						</sec:authorize>
							<a href="">Help</a>
						</div>
					</div>
				</div>
			</ul>
		</div>
	</div>

	<div class="container">

			<div class="row">
			<div id="categoriesMenu" class="categoriesMenu col-lg-2 col-md-2 col-sm-2 justified"></div>

			<div id="questionsList" class="divTable col-lg-10 col-md-10 col-sm-10 justified">
				<div class="row">
				<div  id="headRow" class="headRow" >
					<div class="divCell_header col-lg-6 col-md-6 col-sm-6">Question</div>
					<div class="divCell_header <sec:authorize access="isAuthenticated()">col-lg-1</sec:authorize><sec:authorize access="isAnonymous()">col-lg-2</sec:authorize> col-md-2 col-sm-2">Category  <input type="button" id="buttonOrderBy2" class="change_order_sign" value="&#x25AD;" onclick="orderedBy(2)"></div>
					<div class="divCell_header <sec:authorize access="isAuthenticated()">col-lg-1</sec:authorize><sec:authorize access="isAnonymous()">col-lg-2</sec:authorize> col-md-2 col-sm-2">Date  <input type="button" id="buttonOrderBy1" class="change_order_sign" value="&#x25BC;" onclick="orderedBy(1)"></div>
					<div class="divCell_header col-lg-2 col-md-2 col-sm-2">Frequently Asked  <input type="button" id="buttonOrderBy3" class="change_order_sign" value="&#x25AD;" onclick="orderedBy(3)"></div>
					<sec:authorize access="isAuthenticated()">
					<div class="divCell_header col-lg-2 col-md-2 col-sm-2">My Bookmarks  <input type="button" id="buttonOrderBy4" class="change_order_sign" value="&#x25AD;" onclick="orderedBy(4)"></div>
					</sec:authorize>
				</div>
				</div>
			</div>
			</div>
		<div class="row">
			<div id="pagingRow" class="pagingRow col-lg-offset-2 col-lg-10 col-md-offset-2 col-md-10 col-sm-offset-2 col-sm-10">
				<div class=row>
					<div class="divCell_2 col-lg-2 col-md-2 col-sm-2" style="height:50px" align=left>SHOW&nbsp;<select id="pageSizeChooser" onchange="pageSizeChanged()"><option selected>15</option><option>30</option><option>45</option><option>60</option></select></div>
					<div class="divCell_2 col-lg-8 col-md-8 col-sm-8" id="pagingTag" style="height:50px" align=center></div>
					<div class="divCell_2 col-lg-2 col-md-2 col-sm-2" id="pagingInfo" style="height:50px" align=right>Records 1-10 of 10</div>
				</div>
		</div>		
		</div>	
			
	</div>	<!-- /.container -->
	
	<footer class="footer">
		<div class="container">
			<p class="text-muted"></p>
		</div>
	</footer>	
	
	<script>
		$(document).ready(function () {

			pageSetup();

	    	$("#categoriesMenu").append("<div class=categoriesMenuItem><input id=category-1 class=categoriesMenuButtonActive type=button value=All&nbsp;Categories onclick=selectCategory(-1) onmouseover=switchCategoryButtonOver('-1','true') onmouseout=switchCategoryButtonOver('-1','false')><br /></div>");

	    	$.getJSON(globalCategoryUrl, function (data) {
	        	$.each(data, function (index, value) {
	            	$("#categoriesMenu").append("<div class=categoriesMenuItem><input id=category" + value.id + " class=categoriesMenuButton type=button value='" + value.value + "' onclick=selectCategory(" + value.id + ") onmouseover=switchCategoryButtonOver('" + value.id + "','true') onmouseout=switchCategoryButtonOver('" + value.id + "','false')><br /></div>");
	        	});
	    	});    

	    	displayPage("1");
		});
	</script>
	
</body>
</html>
