<!DOCTYPE html>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="resources/style/css/style.css"
	type="text/css" />

<title>Test page</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
</head>
<body>

<div class="loginLinks" align="right">
		<a href="">Sign Up</a> <a href="">Log In</a> <a href="">Help</a>
	</div>

	<div class="loginLinks" align="right">
		<span class="loginLinksItem"> <input type="button"
			value="Questions">
		</span> <span class="loginLinksItem"> <input type="button"
			value="Tags">
		</span> <span class="loginLinksItem"> <input type="button"
			value="My Bookmarks">
		</span> <span class="loginLinksItem"> <input type="button"
			value="Add Question">
		</span>
	</div>


	<div id="categoriesMenu" class="categoriesMenu">
				
	</div>


	<form id="form1">
		<div id="questionsList" class="divTable">
			<div class="headRow">
				<div class="divCell_header">Question</div>
				<div class="divCell_header">Category</div>
				<div class="divCell_header">Date</div>
				<div class="divCell_header">Rate</div>
			</div>					
			
		</div>
	</form>

</body>
</html>


<script>
	$(document).ready(function() {
		var categoryUrl = window.location.href.toString() + "categories";
		var questionUrl = window.location.href.toString() + "questions";
		
		$("#categoriesMenu").append("<div class=categoriesMenuItem><input id=category-1 class=categoriesMenuButtonActive type=button value=ALL onclick=selectCategory(-1)><br /></div>");
		
		$.getJSON(categoryUrl, function(data) {
			var items = [];
			$.each(data, function(index, value) {				
				$("#categoriesMenu").append("<div class=categoriesMenuItem><input id=category" + value.id + " class=categoriesMenuButton type=button value='" + value.value + "' onclick=selectCategory(" + value.id + ")><br /></div>");
			});			
		});
		
		$.getJSON(questionUrl, function(data) {
			var items = [];
			$.each(data, function(index, value) {
				var date = new Date(value.loadDate);
				$("#questionsList").append("<div class=divRow><div class=divCell_2><div class=divQuestionColor>" + value.value + "</div></div><div class=divCell_2>" + value.categories[0].value + "</div><div class=divCell_2>" + date.getDate() + "/" + (date.getMonth()+1) + "/" + date.getFullYear() +"</div><div class=divCell_2>" + value.rating + "</div></div>");
			});
			$("#questionsList").append("<div class=divRow><div class=divCell_2 style=width:20% align=right>SHOW<select><option>6</option><option>10</option><option>14</option></select></div><div class=divCell_2 style=width:75% align=center><input type=button value=&lt;&lt;> <input type=button value=&lt;> <span><input type=button class=checkedPage value=1></span> <input type=button value=2> <input type=button value=3> <input type=button value=4> <input type=button value=5> <input type=button value=6> <input type=button value=7> <input type=button value=&gt;> <input type=button value=&gt;&gt;></div></div>");
		});
	});
	
	function selectCategory(categoryId) {
		$('.categoriesMenuButtonActive').toggleClass('categoriesMenuButtonActive').toggleClass('categoriesMenuButton');
		
		$("#category"+categoryId).toggleClass('categoriesMenuButton');
		$("#category"+categoryId).toggleClass('categoriesMenuButtonActive');
		
		var questionUrl = window.location.href.toString() + "questions";
		
		if (categoryId != -1) {
			questionUrl += "/categories/" + categoryId;
		}
		
		$.getJSON(questionUrl, function(data) {
			var items = [];
			$("#questionsList").empty().append("<div class=headRow><div class=divCell_header>Question</div><div class=divCell_header>Category</div><div class=divCell_header>Date</div><div class=divCell_header>Rate</div></div>");
			if (data.length == 0) {
				$("#questionsList").append("<div class=divRow><div class=divCell_2 style=width:98% align=center>No questions found for this category</div></div>");
			} else {
				$.each(data, function(index, value) {
					var date = new Date(value.loadDate);
					$("#questionsList").append("<div class=divRow><div class=divCell_2><div class=divQuestionColor>" + value.value + "</div></div><div class=divCell_2>" + value.categories[0].value + "</div><div class=divCell_2>" + date.getDate() + "/" + (date.getMonth()+1) + "/" + date.getFullYear() +"</div><div class=divCell_2>" + value.rating + "</div></div>");
				});
			}
			$("#questionsList").append("<div class=divRow><div class=divCell_2 style=width:20% align=right>SHOW<select><option>6</option><option>10</option><option>14</option></select></div><div class=divCell_2 style=width:75% align=center><input type=button value=&lt;&lt;> <input type=button value=&lt;> <span><input type=button class=checkedPage value=1></span> <input type=button value=2> <input type=button value=3> <input type=button value=4> <input type=button value=5> <input type=button value=6> <input type=button value=7> <input type=button value=&gt;> <input type=button value=&gt;&gt;></div></div>");			
		});
	}
</script>