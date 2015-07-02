<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>KNOW HUB</title>

<!-- Bootstrap core CSS -->
<link href="resources/styleBootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/styleBootstrap/css/custom.css" rel="stylesheet">

<link rel="stylesheet"
	href="resources/styleBootstrap/css/bootstrap.vertical-tabs.css">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="resources/styleBootstrap/js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
      <![endif]-->
      
	<!-- favicon -->
	 <link rel="shortcut icon" href="resources/styleBootstrap/img/question_shield.png" type="image/png">
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

	<!-- new table begin  -->
	

	<!-- new table end -->

		<div class="tabbable">
			<div id="categoriesMenu" class="categoriesMenu"></div>


			<!--   	<form id="form1"> -->
			<div id="questionsList" class="divTable">
				<div class="headRow">
					<div class="divCell_header" style="width: 400px">Question</div>
					<div class="divCell_header">Category</div>
					<div class="divCell_header">Date</div>
					<div class="divCell_header">Frequently asked</div>
				</div>

			</div>
			<!-- 	</form> -->


			<!--   
      <div id="show-more-and-pagination">
          <div id="show">
            SHOW
          </div>  
          <div id="show-more-button">
            <button type="button" class="btn btn-default">10</button>
          </div> 
          <div id="pagination">
            <a href="#"><<</a>
            <a href="#"><</a>
            <a href="#">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#">4</a>
            <a href="#">5</a>
            <a href="#">6</a>
            <a href="#">></a>
            <a href="#">>></a>
          </div>   
      </div>
 -->

		</div>
	</div>
	<!-- /.container -->

	<footer class="footer">
		<div class="container">
			<p class="text-muted"></p>
		</div>
	</footer>


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="js/ie10-viewport-bug-workaround.js"></script>



</body>
</html>


<script>
	$(document)
			.ready(
					function() {
						var categoryUrl = window.location.href.toString()
								+ "categories";
						var questionUrl = window.location.href.toString()
								+ "questions";

						$("#categoriesMenu")
								.append(
										"<div class=categoriesMenuItem><input id=category-1 class=categoriesMenuButtonActive type=button value=ALL onclick=selectCategory(-1)><br /></div>");

						$
								.getJSON(
										categoryUrl,
										function(data) {
											var items = [];
											$
													.each(
															data,
															function(index,
																	value) {
																$(
																		"#categoriesMenu")
																		.append(
																				"<div class=categoriesMenuItem><input id=category"
																						+ value.id
																						+ " class=categoriesMenuButton type=button value="
																						+ value.value
																						+ " onclick=selectCategory("
																						+ value.id
																						+ ")><br /></div>");
															});
										});

						$
								.getJSON(
										questionUrl,
										function(data) {
											var counter = 1;
											var items = [];
											$
													.each(
															data,
															function(index,
																	value) {
																var date = new Date(
																		value.loadDate);
																counter++;
																if (counter % 2 == 0) {
																	$(
																			"#questionsList")
																			.append(
																					"<div class=divRow ><div class=divCell_2 style=width:400px;background:#FFF><div class=divQuestionColor >"
																							+ value.value
																							+ "</div></div><div class=divCell_2 style=background:#FFF>"
																							+ value.categories[0].value
																							+ "</div><div class=divCell_2 style=background:#FFF>"
																							+ date
																									.getDate()
																							+ "/"
																							+ (date
																									.getMonth() + 1)
																							+ "/"
																							+ date
																									.getFullYear()
																							+ "</div><div class=divCell_2 style=background:#FFF>"
																							+ value.rating
																							+ "</div></div>");
																} else {
																	$(
																			"#questionsList")
																			.append(
																					"<div class=divRow ><div class=divCell_2 style=width:400px;background:#EEE><div class=divQuestionColor >"
																							+ value.value
																							+ "</div></div><div class=divCell_2  style=background:#EEE>"
																							+ value.categories[0].value
																							+ "</div><div class=divCell_2 style=background:#EEE>"
																							+ date
																									.getDate()
																							+ "/"
																							+ (date
																									.getMonth() + 1)
																							+ "/"
																							+ date
																									.getFullYear()
																							+ "</div><div class=divCell_2 style=background:#EEE>"
																							+ value.rating
																							+ "</div></div>");
																}
															});

											$("#questionsList")
													.append(
															"<div class=divRow><div class=divCell_2 align=right style=width:400px>SHOW<select><option>6</option><option>10</option><option>14</option></select></div><div class=divCell_2></div><div class=divCell_2>&lt;&lt; &lt;   <span class=checkedPage>1</span> 2 3 4 5 6 7  &gt; &gt;&gt;</div><div class=divCell_2></div></div>");
										});
					});

	function selectCategory(categoryId) {
		$('.categoriesMenuButtonActive').toggleClass(
				'categoriesMenuButtonActive').toggleClass(
				'categoriesMenuButton');

		$("#category" + categoryId).toggleClass('categoriesMenuButton');
		$("#category" + categoryId).toggleClass('categoriesMenuButtonActive');

		var questionUrl = window.location.href.toString() + "questions";

		if (categoryId != -1) {
			questionUrl += "/categories/" + categoryId;
		}

		$
				.getJSON(
						questionUrl,
						function(data) {
							var counter = 1;
							var items = [];
							$("#questionsList")
									.empty()
									.append(
											"<div class=headRow><div class=divCell_header style=width:400px>Question</div><div class=divCell_header>Category</div><div class=divCell_header>Date</div><div class=divCell_header>Frequently asked</div></div>");
							if (data.length == 0) {
								$("#questionsList")
										.append(
												"<div class=divRow><div class=divCell_2 style=width:100% align=center>No questions found for this category</div></div>");
							} else {
								$
										.each(
												data,
												function(index, value) {
													var date = new Date(
															value.loadDate);
													counter++;
													if (counter % 2 == 0) {
														$("#questionsList")
																.append(
																		"<div class=divRow><div class=divCell_2 style=width:400px;background:#FFF><div class=divQuestionColor >"
																				+ value.value
																				+ "</div></div><div class=divCell_2 style=background:#FFF>"
																				+ value.categories[0].value
																				+ "</div><div class=divCell_2 style=background:#FFF>"
																				+ date
																						.getDate()
																				+ "/"
																				+ (date
																						.getMonth() + 1)
																				+ "/"
																				+ date
																						.getFullYear()
																				+ "</div><div class=divCell_2 style=background:#FFF>"
																				+ value.rating
																				+ "</div></div>");
													} else {
														$("#questionsList")
																.append(
																		"<div class=divRow><div class=divCell_2 style=width:400px;background:#EEE><div class=divQuestionColor >"
																				+ value.value
																				+ "</div></div><div class=divCell_2  style=background:#EEE>"
																				+ value.categories[0].value
																				+ "</div><div class=divCell_2 style=background:#EEE>"
																				+ date
																						.getDate()
																				+ "/"
																				+ (date
																						.getMonth() + 1)
																				+ "/"
																				+ date
																						.getFullYear()
																				+ "</div><div class=divCell_2 style=background:#EEE>"
																				+ value.rating
																				+ "</div></div>");
													}
												});
							}
							if (data.length > 3) {
								$("#questionsList")
										.append(
												"<div class=divRow><div class=divCell_2 align=right style=width:400px>SHOW<select><option>6</option><option>10</option><option>14</option></select></div><div class=divCell_2></div><div class=divCell_2>&lt;&lt; &lt;   <span class=checkedPage>1</span> 2 3 4 5 6 7  &gt; &gt;&gt;</div><div class=divCell_2></div></div>");
							}
						});
	}
</script>
