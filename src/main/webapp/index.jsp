<html>
<head>
<link rel="stylesheet" href="resources/style/css/style.css"
	type="text/css" />

<title>Test page</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
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
			value="Add Question">
		</span>
	</div>


	<div id="categoriesMenu" class="categoriesMenu">
		<div class="categoriesMenuItem">
			<input class="categoriesMenuButtonActive" type="button" value="ALL"><br />
		</div>		
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
		var categoryUrl = window.location.href.toString() + "category";
		var questionUrl = window.location.href.toString() + "question";
		
		$.getJSON(categoryUrl, function(data) {
			var items = [];
			$.each(data, function(index, value) {				
				$("#categoriesMenu").append("<div class=categoriesMenuItem><input class=categoriesMenuButton type=button value=" + value.value + "><br /></div>");
			});			
		});
		
		$.getJSON(questionUrl, function(data) {
			var items = [];
			$.each(data, function(index, value) {
				var date = new Date(value.loadDate);
				$("#questionsList").append("<div class=divRow><div class=divCell_2><div class=divQuestionColor>" + value.value + "</div></div><div class=divCell_2>N/A</div><div class=divCell_2>" + date.getDate() + "/" + (date.getMonth()+1) + "/" + date.getFullYear() +"</div><div class=divCell_2>" + value.rating + "</div></div>");
			});
			$("#questionsList").append("<div class=divRow><div class=divCell_2 align=right>SHOW<select><option>6</option><option>10</option><option>14</option></select></div><div class=divCell_2></div><div class=divCell_2>&lt;&lt; &lt;   <span class=checkedPage>1</span> 2 3 4 5 6 7  &gt; &gt;&gt;</div><div class=divCell_2></div></div>");
		});

	});
</script>