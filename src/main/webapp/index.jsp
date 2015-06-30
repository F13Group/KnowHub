<!DOCTYPE html>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<%@ taglib prefix="mycustomtags" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="resources/style/css/style.css"
	type="text/css" />

<title>Test page</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
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
			
		<div class="pagingRow">
			<div class="divCell_2" style="width:150px" align=right>SHOW&nbsp;<select id="pageSizeChooser" onchange="pageSizeChanged()"><option>5</option><option selected>10</option><option>15</option></select></div>
			<div class="divCell_2" id="pagingTag" style="width:520px" align=center></div>
			<div class="divCell_2" id="pagingInfo" style="width:150px" align=center>Records 1-10 of 10</div>
		</div>			
	</div>
	
</body>
</html>


<script>
	
	var globalCategoryUrl = window.location.href.toString() + "categories";
	var globalQuestionUrl, globalQuestionMetadataUrl;
	
	var selectedCategoryId;
	
	function pageSizeChanged() {
		displayPage(globalQuestionUrl, globalQuestionMetadataUrl, "1");		
	}
	
	function displayPage(questionUrl, questionMetadataUrl, currentPageNumber) {
		var pageSizeChooser = document.getElementById("pageSizeChooser");
		var pageSizeChosen = pageSizeChooser.options[pageSizeChooser.selectedIndex].text;
				
		$.post(questionMetadataUrl, {rowsOnPageNumber: pageSizeChosen})
		.done(function(data) {
			outputQuestions(questionUrl, data.pageCount, currentPageNumber, pageSizeChosen);
			$("#pagingInfo").text("Records " + (pageSizeChosen * (currentPageNumber - 1) + 1) + "-" + (pageSizeChosen * currentPageNumber) + " of " + (pageSizeChosen * data.pageCount));
		});		
	}

	function outputQuestions(questionUrl, pC, cPN, rOPN) {		
		$.post(questionUrl, {currentPageNumber: cPN, rowsOnPageNumber: rOPN })
			.done(function(data) {
				var items = [];
				$(".divRow").empty();
				if (data.length == 0) {
					$("<div class=divRow><div class=divCell_2 style=width:860px align=center>No questions found for this category</div></div>").insertAfter("#headRow");
				} else {
					$.each($(data).get().reverse(), function(index, value) {
						var unformatted_date = new Date(value.loadDate);
						var dd = unformatted_date.getDate();
		            	var mm = unformatted_date.getMonth() + 1;
		            	var yyyy = unformatted_date.getFullYear();
		            	if(dd < 10)
		            	{
			            	dd = '0'+ dd;
		            	}
		            	if(mm < 10)
		            	{
			            	mm = '0' + mm;
		            	}
		            	var date = dd+'/'+mm+'/'+yyyy;
		            	$("<div class=divRow><div class=divCell_2><div class=divQuestionColor>" + value.value + "</div></div><div class=divCell_2>" + value.categories[0].value + "</div><div class=divCell_2>" + date +"</div><div class=divCell_2>" + value.rating + "</div></div>").insertAfter("#headRow");
				});
			}						
		});
		
		pagination(pC, cPN, rOPN);
	};
	
	$(document).ready(function() {
		
		window.selectedCategoryId = -1;
				
		var questionUrl = window.location.href.toString() + "questions";
		globalQuestionUrl = questionUrl;
		
		var questionMetadataUrl = questionUrl + "/metadata";
		globalQuestionMetadataUrl = questionMetadataUrl;
				
		$("#categoriesMenu").append("<div class=categoriesMenuItem><input id=category-1 class=categoriesMenuButtonActive type=button value=All&nbsp;Categories onclick=selectCategory(-1)><br /></div>");
		
		$.getJSON(globalCategoryUrl, function(data) {
			var items = [];
			$.each(data, function(index, value) {				
				$("#categoriesMenu").append("<div class=categoriesMenuItem><input id=category" + value.id + " class=categoriesMenuButton type=button value='" + value.value + "' onclick=selectCategory(" + value.id + ")><br /></div>");
			});			
		});
		
		displayPage(questionUrl, questionMetadataUrl, "1");				
	});
	
	function selectCategory(categoryId) {
		
		window.selectedCategoryId = categoryId;
				
		$('.categoriesMenuButtonActive').toggleClass('categoriesMenuButtonActive').toggleClass('categoriesMenuButton');
		
		$("#category"+categoryId).toggleClass('categoriesMenuButton');
		$("#category"+categoryId).toggleClass('categoriesMenuButtonActive');
		
		var questionUrl = window.location.href.toString() + "questions";
		
		if (categoryId != -1) {
			questionUrl += "/categories/" + categoryId;
		}		
		globalQuestionUrl = questionUrl;		
		
		var questionMetadataUrl = questionUrl + "/metadata";
		globalQuestionMetadataUrl = questionMetadataUrl;		
		
		displayPage(questionUrl, questionMetadataUrl, "1");
	}
	
	function pagination(pagesCount, pageNumber, pagesSize) {
		$("#pagingTag").empty();
		if (pagesCount > 1) {
			$("#pagingTag").append("<table><tr><td align=left><ul class=paging>");
			$(".paging").append('<li><button class="normal" onmouseover="this.className=\'over\'" onmouseout="this.className=\'normal\'" onclick="displayPage(\'' + globalQuestionUrl + '\', \'' + globalQuestionMetadataUrl + '\',\'1\')">&lt;&lt;</button></li>');
			if (pageNumber > 1) {
				$(".paging").append('<li><button class="normal" onmouseover="this.className=\'over\'" onmouseout="this.className=\'normal\'" onclick="displayPage(\'' + globalQuestionUrl + '\', \'' + globalQuestionMetadataUrl + '\', ' + (Number(pageNumber) - 1) + ')">&lt;</button></li>');
			}
			if (pageNumber == 1) {
				$(".paging").append('<li><button class="normal" onmouseover="this.className=\'over\'" onmouseout="this.className=\'normal\'" onclick="displayPage(\'' + globalQuestionUrl + '\', \'' + globalQuestionMetadataUrl + '\',\'1\')">&lt;</button></li>');
			}
			if (pagesCount > 5) {
				for (var i = 1; i <= 5; i++) {
					if ((pageNumber > 3) && ((pagesCount - pageNumber - 1) > 1)) {
						$(".paging").append('<li><button class="normal" onmouseover="this.className=\'over\'" onmouseout="this.className=\'normal\'" id="pagebutton' + (i + pageNumber - 1) + '" onclick="displayPage(\'' + globalQuestionUrl + '\', \'' + globalQuestionMetadataUrl + '\', \'' + (i + pageNumber - 1) + '\')">' + (i + pageNumber - 1) + '</button></li>');
					}
					if (pageNumber <= 3) {
						$(".paging").append('<li><button class="normal" onmouseover="this.className=\'over\'" onmouseout="this.className=\'normal\'" id="pagebutton' + i + '" onclick="displayPage(\'' + globalQuestionUrl + '\', \'' + globalQuestionMetadataUrl + '\', \'' + i + '\')">' + i + '</button></li>');
					}
					if ((pagesCount - pageNumber) <= 1) {
						$(".paging").append('<li><button class="normal" onmouseover="this.className=\'over\'" onmouseout="this.className=\'normal\'" id="pagebutton' + (i + pagesCount - 4) + '" onclick="displayPage(' + globalQuestionUrl + ', ' + globalQuestionMetadataUrl + ', \'' + (i + pagesCount - 4) + '\')">' + (i + pagesCount - 4) + '</button></li>');
					}
				}			
			}
			if (pagesCount <= 5) {
				for (var i = 1; i <= pagesCount; i++) {
					$(".paging").append('<li><button class="normal" onmouseover="this.className=\'over\'" onmouseout="this.className=\'normal\'" id="pagebutton' + i + '" onclick="displayPage(\'' + globalQuestionUrl + '\', \'' + globalQuestionMetadataUrl + '\', \'' + i + '\')">' + i + '</button></li>');
				}
			}
			if (pageNumber < pagesCount) {
				$(".paging").append('<li><button class="normal" onmouseover="this.className=\'over\'" onmouseout="this.className=\'normal\'" onclick="displayPage(\'' + globalQuestionUrl + '\', \'' + globalQuestionMetadataUrl + '\', \'' + (Number(pageNumber) + 1) + '\')">&gt;</button></li>');
			}
			if (pageNumber == pagesCount) {
				$(".paging").append('<li><button class="normal" onmouseover="this.className=\'over\'" onmouseout="this.className=\'normal\'" onclick="displayPage(\'' + globalQuestionUrl + '\', \'' + globalQuestionMetadataUrl + '\', \'' + (pagesCount) + '\')">&gt;</button></li>');
			}

			$(".paging").append('<li><button class="normal" onmouseover="this.className=\'over\'" onmouseout="this.className=\'normal\'" onclick="displayPage(\'' + globalQuestionUrl + '\', \'' + globalQuestionMetadataUrl + '\', \'' + (pagesCount) + '\')">&gt;&gt;</button></li>');
			$("#pagingTag").append("</ul></td></tr></table>");
			
			var eleToGetColor = $('<div class="checkedPage" style="display: none;">').appendTo('body');
			var color = eleToGetColor.css('color');
			eleToGetColor.remove();
			document.getElementById("pagebutton"+pageNumber).style.color = color;
		}
	}
</script>