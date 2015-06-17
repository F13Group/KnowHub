<html>
<head>
<link rel="stylesheet" href="resources/style/css/style.css"
	type="text/css" />
	<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" /> 
	
<title>Test page</title>
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


	<div class="categoriesMenu">
		<div class="categoriesMenuItem">
			<input class="categoriesMenuButtonActive" type="button" value="ALL"><br />
		</div>
		<div class="categoriesMenuItem">
			<input class="categoriesMenuButton" type="button" value="Java"><br />
		</div>
		<div class="categoriesMenuItem">
			<input class="categoriesMenuButton" type="button" value="Net"><br />
		</div>
		<div class="categoriesMenuItem">
			<input class="categoriesMenuButton" type="button"
				value="Busness Intelligents(BI)"><br />
		</div>
		<div class="categoriesMenuItem">
			<input class="categoriesMenuButton" type="button"
				value="Functional Testing(FT)"><br />
		</div>
		<div class="categoriesMenuItem">
			<input class="categoriesMenuButton" type="button"
				value="Automatic Testing(AT)"><br />
		</div>
		<div class="categoriesMenuItem">
			<input class="categoriesMenuButton" type="button" value="Others"><br />
		</div>
	</div>


	<form id="form1">
		<div class="divTable">
			<div class="headRow">
				<div class="divCell_header">Question</div>
				<div class="divCell_header">Category</div>
				<div class="divCell_header">Date</div>
				<div class="divCell_header">Rate</div>
			</div>
			<div class="divRow">
				<div class="divCell_bright">
					<div class="divQuestionColor">Question1</div>
				</div>
				<div class="divCell_bright">Java</div>
				<div class="divCell_bright">10/06/15</div>
				<div class="divCell_bright">0</div>
			</div>
			<div class="divRow">
				<div class="divCell_dark">
					<div class="divQuestionColor">Question2</div>
				</div>
				<div class="divCell_dark">QA</div>
				<div class="divCell_dark">09/06/15</div>
				<div class="divCell_dark">0</div>
			</div>
			<div class="divRow">
				<div class="divCell_bright">
					<div class="divQuestionColor">Question3</div>
				</div>
				<div class="divCell_bright">NET</div>
				<div class="divCell_bright">08/06/15</div>
				<div class="divCell_bright">1</div>
			</div>
			<div class="divRow">
				<div class="divCell_dark">
					<div class="divQuestionColor">Question4</div>
				</div>
				<div class="divCell_dark">QA</div>
				<div class="divCell_dark">07/06/15</div>
				<div class="divCell_dark">0</div>
			</div>
			<div class="divRow">
				<div class="divCell_bright">
					<div class="divQuestionColor">Question5</div>
				</div>
				<div class="divCell_bright">NET</div>
				<div class="divCell_bright">06/06/15</div>
				<div class="divCell_bright">3</div>
			</div>
			<div class="divRow">
				<div class="divCell_dark">
					<div class="divQuestionColor">Question6</div>
				</div>
				<div class="divCell_dark">NET</div>
				<div class="divCell_dark">05/06/15</div>
				<div class="divCell_dark">2</div>
			</div>
			<div class="divRow">
				<div class="divCell_bright" align="right">
					SHOW 
					<select>
						<option>6</option>
						<option>10</option>
						<option>14</option>
					</select>
				</div>
				<div class="divCell_bright"></div>
				<div class="divCell_bright">&lt;&lt; &lt;   <span class="checkedPage">1</span> 2 3 4 5 6 7  &gt; &gt;&gt;</div>
				<div class="divCell_bright"></div>
			</div>
		</div>
	</form>
</body>
</html>
