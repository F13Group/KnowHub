<!DOCTYPE html>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="mycustomtags" tagdir="/WEB-INF/tags"%>
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


	<form id="form1">
		<div id="questionsList" class="divTable">
			<div id="headRow" class="headRow">
				<div class="divCell_header">Question</div>
				<div class="divCell_header">Category  <input type="button" class="change_order_sign" value="&#x21D5;"></div>
				<div class="divCell_header">Date <input type="button" class="change_order_sign" value="&#x21D5;"></div>
				<div class="divCell_header">Frequently Asked <input type="button" class="change_order_sign" value="&#x21D5;"></div>
			</div>						
			
			<div class="pagingRow">
				<div class="divCell_2" id="pageSizeChooser" style="width:150px" align=right>SHOW&nbsp;<select><option>5</option><option selected>10</option><option>15</option></select></div>
				<div class="divCell_2" id="pagingTag" style="width:520px" align=center></div>
				<div class="divCell_2" id="pagingInfo" style="width:150px" align=center>Records 1-10 of 10</div>
			</div>
			
			<div class="pagingRow">
				<div class="divCell_2" id="pagingTagDemo" style="width:860px" align=center><mycustomtags:tablepaging action="-" buttonName="-" pages_count="5" page_number="3" pages_size="10" /></div>
			</div>
		</div>
	</form>	
	
</body>
</html>


<script>

	function outputQuestions(questionUrl, cPN, rOPN) {
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
	};
	
	$(document).ready(function() {
		var categoryUrl = window.location.href.toString() + "categories";
		var questionUrl = window.location.href.toString() + "questions";
				
		$("#categoriesMenu").append("<div class=categoriesMenuItem><input id=category-1 class=categoriesMenuButtonActive type=button value=All&nbsp;Categories onclick=selectCategory(-1)><br /></div>");
		
		$.getJSON(categoryUrl, function(data) {
			var items = [];
			$.each(data, function(index, value) {				
				$("#categoriesMenu").append("<div class=categoriesMenuItem><input id=category" + value.id + " class=categoriesMenuButton type=button value='" + value.value + "' onclick=selectCategory(" + value.id + ")><br /></div>");
			});			
		});				
		
		outputQuestions(questionUrl, "1", "10");
		
		pagination("pagingAction", "buttonName", 6, 4, 10);
				
	});
	
	function selectCategory(categoryId) {
		$('.categoriesMenuButtonActive').toggleClass('categoriesMenuButtonActive').toggleClass('categoriesMenuButton');
		
		$("#category"+categoryId).toggleClass('categoriesMenuButton');
		$("#category"+categoryId).toggleClass('categoriesMenuButtonActive');
		
		var questionUrl = window.location.href.toString() + "questions";
		
		if (categoryId != -1) {
			questionUrl += "/categories/" + categoryId;
		}
		
		outputQuestions(questionUrl, "1", "10");
	}
	
	function pagination(actionName, buttonName, pagesCount, pageNumber, pagesSize) {
		
		$("#pagingTag").append("<form method=post action=" + actionName + " accept-charset=UTF-8><table><tr><td align=left><ul class=paging>");
		$(".paging").append('<li><button class="normal" onmouseover="this.className=\'over\'" onmouseout="this.className=\'normal\'" name="' + buttonName + '" value="0">&lt;&lt;</button></li>');
		if (pageNumber > 0) {
			$(".paging").append('<li><button class="normal" onmouseover="this.className=\'over\'" onmouseout="this.className=\'normal\'" name="' + buttonName + '" value="' + (pageNumber - 1) + '">&lt;</button></li>');
		}
		if (pageNumber == 0) {
			$(".paging").append('<li><button class="normal" onmouseover="this.className=\'over\'" onmouseout="this.className=\'normal\'" name="' + buttonName + '" value="0">&lt;</button></li>');
		}
		if (pagesCount > 5) {
			for (var i = 0; i < 5; i++) {
				if ((pageNumber > 2) && ((pagesCount - pageNumber - 1) > 1)) {
					$(".paging").append('<li><button class="normal" onmouseover="this.className=\'over\'" onmouseout="this.className=\'normal\'" name="' + buttonName + '" value="' + (i + pageNumber - 2) + '">' + (i + pageNumber - 1) + '</button></li>');
				}
				if (pageNumber <= 2) {
					$(".paging").append('<li><button class="normal" onmouseover="this.className=\'over\'" onmouseout="this.className=\'normal\'" name="' + buttonName + '" value="' + i + '">' + (i + 1) + '</button></li>');
				}
				if ((pagesCount - pageNumber - 1) <= 1) {
					$(".paging").append('<li><button class="normal" onmouseover="this.className=\'over\'" onmouseout="this.className=\'normal\'" name="' + buttonName + '" value="' + (i + pagesCount - 5) + '">' + (i + pages_count - 4) + '</button></li>');
				}
			}			
		}
		if (pagesCount <= 5) {
			for (var i = 0; i < pagesCount; i++) {
				$(".paging").append('<li><button class="normal" onmouseover="this.className=\'over\'" onmouseout="this.className=\'normal\'" name="' + buttonName + '" value="' + i + '">' + (i + 1) + '</button></li>');
			}
		}
		if (pageNumber < pagesCount - 1) {
			$(".paging").append('<li><button class="normal" onmouseover="this.className=\'over\'" onmouseout="this.className=\'normal\'" name="' + buttonName + '" value="' + (pageNumber + 1) + '">&gt;</button></li>');
		}
		if (pageNumber == pagesCount - 1) {
			$(".paging").append('<li><button class="normal" onmouseover="this.className=\'over\'" onmouseout="this.className=\'normal\'" name="' + buttonName + '" value="' + (pagesCount - 1) + '">&gt;</button></li>');
		}
		$(".paging").append('<li><button class="normal" onmouseover="this.className=\'over\'" onmouseout="this.className=\'normal\'" name="' + buttonName + '" value="' + (pagesCount - 1) + '">&gt;&gt;</button></li>');
		$("#pagingTag").append("</ul></td></tr></table></form>");
	}
</script>