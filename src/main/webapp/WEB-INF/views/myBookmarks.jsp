<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- favicon -->
<link rel="icon"
	href="${pageContext.servletContext.contextPath}/resources/styleBootstrap/img/question_shield.png"
	type="image/png">
<title>KNOW HUB - My Bookmarks</title>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<!-- Bootstrap core CSS -->
<link
	href="${pageContext.servletContext.contextPath}/resources/styleBootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link
	href="${pageContext.servletContext.contextPath}/resources/styleBootstrap/css/custom.css"
	rel="stylesheet">

<!-- JQuery style -->
<link
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css"
	rel="stylesheet">

<!-- JavaScripts -->
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script
	src="${pageContext.servletContext.contextPath}/resources/js/pagetools.js"></script>
<script
	src="${pageContext.servletContext.contextPath}/resources/js/pagination.js"></script>
</head>

<body>

	<%@ include file="navbar.jsp"%>

	<div class="container">

		<div class="row">

			<div id="questionsList"
				class="divTable col-lg-12 col-md-12 col-sm-12 justified">
				<div class="row">
					<div id="headRow" class="headRow">
						<div class="divCell_header col-lg-6 col-md-6 col-sm-6">Question</div>
						<div
							class="divCell_header <sec:authorize access="isAuthenticated()">col-lg-2</sec:authorize><sec:authorize access="isAnonymous()">col-lg-2</sec:authorize> col-md-2 col-sm-2">
							Category <input type="button" id="buttonOrderBy2"
								class="change_order_sign" value="&#x25AD;"
								onclick="orderedBy(2)">
						</div>
						<div
							class="divCell_header <sec:authorize access="isAuthenticated()">col-lg-1</sec:authorize><sec:authorize access="isAnonymous()">col-lg-1</sec:authorize> col-md-1 col-sm-1">
							Date <input type="button" id="buttonOrderBy1"
								class="change_order_sign" value="&#x25BC;"
								onclick="orderedBy(1)">
						</div>
						<div class="divCell_header col-lg-2 col-md-2 col-sm-2">
<<<<<<< HEAD
							Times Asked <input type="button" id="buttonOrderBy3"
=======
							Asked <input type="button" id="buttonOrderBy3"
>>>>>>> 8258807b556c00a411a58cc966a3b63f98669f95
								class="change_order_sign" value="&#x25AD;"
								onclick="orderedBy(3)">
						</div>
						<sec:authorize access="isAuthenticated()">
							<div class="divCell_header col-lg-1 col-md-1 col-sm-1">
								Action
							</div>
						</sec:authorize>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div id="pagingRow"
				class="pagingRow col-lg-offset-2 col-lg-10 col-md-offset-2 col-md-10 col-sm-offset-2 col-sm-10">
				<div class=row>
					<div class="divCell_2 col-lg-2 col-md-2 col-sm-2"
						style="height: 50px" align=left>
						SHOW&nbsp;<select id="pageSizeChooser"
							onchange="pageSizeChanged()"><option selected>15</option>
							<option>30</option>
							<option>45</option>
							<option>60</option></select>
					</div>
					<div class="divCell_2 col-lg-8 col-md-8 col-sm-8" id="pagingTag"
						style="height: 50px" align=center></div>
					<div class="divCell_2 col-lg-2 col-md-2 col-sm-2" id="pagingInfo"
						style="height: 50px" align=right>Records 1-10 of 10</div>
				</div>
			</div>
		</div>

	</div>
	<!-- /.container -->

	<footer class="footer">
		<div class="container">
			<p class="text-muted"></p>
		</div>
	</footer>
	<script type="text/javascript">
		$(document).ready(function() {
			pageSetup();
			globalQuestionMetadataUrl += "/mybookmarks"
<<<<<<< HEAD
			displayPageBookmarks("1");
=======
			globalQuestionUrl += "/mybookmarks";
			displayPage("1");
>>>>>>> 8258807b556c00a411a58cc966a3b63f98669f95
		});
	</script>
</body>
</html>
