var globalCategoryUrl = window.location.href.toString() + "categories";
var globalQuestionUrl, globalQuestionMetadataUrl, globalQuestionPageMetadataUrl; 

var globalSortColumnIndex, globalSortDirection = -1;
	
var selectedCategoryId;

function orderedBy(sortColumnIndex) {
	if (globalSortColumnIndex == sortColumnIndex) {
		globalSortDirection *= -1;
	} else {
		globalSortDirection = -1;
		globalSortColumnIndex = sortColumnIndex;
	}	
	displayPage("1");
}

function pageSizeChanged() {
	displayPage("1");		
}
	
function displayPage(currentPageNumber) {
	var pageSizeChooser = document.getElementById("pageSizeChooser");
	var pageSizeChosen = pageSizeChooser.options[pageSizeChooser.selectedIndex].text;
		
	$.post(globalQuestionMetadataUrl, {rowsOnPageNumber: pageSizeChosen})
		.done(function(data) {
			outputQuestions(data.pageCount, currentPageNumber, pageSizeChosen);
			var recordsStart = pageSizeChosen * (currentPageNumber - 1) + 1;
			var recordsEnd;
			if (currentPageNumber < data.pageCount) {
				recordsEnd = pageSizeChosen * currentPageNumber;
			} else {
				recordsEnd = data.recordsCount;
			}
			$("#pagingInfo").text("Records " + recordsStart + "-" + recordsEnd + " out of " + data.recordsCount);
	});		
}

function outputQuestions(pC, cPN, rOPN) {	
	$.post(globalQuestionUrl, {currentPageNumber: cPN, rowsOnPageNumber: rOPN, sortColumnIndex: globalSortColumnIndex*globalSortDirection })
		.done(function(data) {			
			$(".divRow").empty();
			$("#pagingRow").show();
			if (data.length == 0) {
				$("<div class=divRow><div class=divCell_2 style=width:860px align=center>No questions found for this category</div></div>").insertAfter("#headRow");
				$("#pagingRow").hide();
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
		           	if(value.value.length > 70){
		           		value.value = value.value.substring(0,65);
		           		value.value += "...";
		           	}
		           	$("<div class='divRow row'><div class='col-lg-6 col-md-6 col-sm-6 divQuestionColor divCell_2'>" + value.value + "</div><div class='col-lg-2 col-md-2 col-sm-2 divCell_Center'>" + value.category.shortValue + "</div><div class='col-lg-2 col-md-2 col-sm-2 divCell_Center'>" + date +"</div><div class='col-lg-2 col-md-2 col-sm-2 divCell_Center'>" + value.rating + "</div></div>").insertAfter("#headRow");
			});
		}						
	});
		
	pagination(pC, cPN, rOPN);
};
	
$(document).ready(function() {
		
	window.selectedCategoryId = -1;
	globalSortColumnIndex = 1;
	globalSortDirectionAsc = -1;
				
	var questionUrl = window.location.href.toString() + "questions";
	globalQuestionUrl = questionUrl;
	
	var questionMetadataUrl = questionUrl + "/metadata";
	globalQuestionMetadataUrl = questionMetadataUrl;
	
	var questionPageMetadataUrl = questionUrl + "/pagemetadata";
	globalQuestionPageMetadataUrl = questionPageMetadataUrl;
				
	$("#categoriesMenu").append("<div class=categoriesMenuItem><input id=category-1 class=categoriesMenuButtonActive type=button value=All&nbsp;Categories onclick=selectCategory(-1)><br /></div>");
		
	$.getJSON(globalCategoryUrl, function(data) {		
		$.each(data, function(index, value) {				
			$("#categoriesMenu").append("<div class=categoriesMenuItem><input id=category" + value.id + " class=categoriesMenuButton type=button value='" + value.value + "' onclick=selectCategory(" + value.id + ")><br /></div>");
		});			
	});
	
	displayPage("1");					
});
	
function selectCategory(categoryId) {
		
	window.selectedCategoryId = categoryId;
	globalSortColumnIndex = 1;
	globalSortDirectionAsc = -1;
				
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
		
	displayPage("1");	
}
	
function pagination(pagesCount, pageNumber, pagesSize) {
	$("#pagingTag").empty();
	if (Number(pagesCount) > 1) {
		$("#pagingTag").append("<table><tr><td align=left><ul class=paging>");
		$(".paging").append('<li><button class="normal" onmouseover="this.className=\'over\'" onmouseout="this.className=\'normal\'" onclick="displayPage(\'1\')">&lt;&lt;</button></li>');
		if (Number(pageNumber) > 1) {
			$(".paging").append('<li><button class="normal" onmouseover="this.className=\'over\'" onmouseout="this.className=\'normal\'" onclick="displayPage(' + (Number(pageNumber) - 1) + ')">&lt;</button></li>');
		}
		if (Number(pageNumber) == 1) {
			$(".paging").append('<li><button class="normal" onmouseover="this.className=\'over\'" onmouseout="this.className=\'normal\'" onclick="displayPage(\'1\')">&lt;</button></li>');
		}
		if (Number(pagesCount) > 5) {
			for (var i = 1; i <= 5; i++) {
				if ((Number(pageNumber) > 3) && ((Number(pagesCount) - Number(pageNumber)) > 1)) {
					$(".paging").append('<li><button class="normal" onmouseover="this.className=\'over\'" onmouseout="this.className=\'normal\'" id="pagebutton' + (i + Number(pageNumber) - 3) + '" onclick="displayPage(' + (i + Number(pageNumber) - 3) + ')">' + (i + Number(pageNumber) - 3) + '</button></li>');
				}
				if (Number(pageNumber) <= 3) {
					$(".paging").append('<li><button class="normal" onmouseover="this.className=\'over\'" onmouseout="this.className=\'normal\'" id="pagebutton' + i + '" onclick="displayPage(' + i + ')">' + i + '</button></li>');
				}
				if ((Number(pagesCount) - Number(pageNumber)) <= 1) {
					$(".paging").append('<li><button class="normal" onmouseover="this.className=\'over\'" onmouseout="this.className=\'normal\'" id="pagebutton' + (i + Number(pagesCount) - 5) + '" onclick="displayPage(' + (i + Number(pagesCount) - 5) + ')">' + (i + Number(pagesCount) - 5) + '</button></li>');
				}
			}			
		}
		if (Number(pagesCount) <= 5) {
			for (var i = 1; i <= Number(pagesCount); i++) {
				$(".paging").append('<li><button class="normal" onmouseover="this.className=\'over\'" onmouseout="this.className=\'normal\'" id="pagebutton' + i + '" onclick="displayPage(' + i + ')">' + i + '</button></li>');
			}
		}
		if (Number(pageNumber) < Number(pagesCount)) {
			$(".paging").append('<li><button class="normal" onmouseover="this.className=\'over\'" onmouseout="this.className=\'normal\'" onclick="displayPage(' + (Number(pageNumber) + 1) + ')">&gt;</button></li>');
		}
		if (Number(pageNumber) == Number(pagesCount)) {
			$(".paging").append('<li><button class="normal" onmouseover="this.className=\'over\'" onmouseout="this.className=\'normal\'" onclick="displayPage(' + Number(pagesCount) + ')">&gt;</button></li>');
		}

		$(".paging").append('<li><button class="normal" onmouseover="this.className=\'over\'" onmouseout="this.className=\'normal\'" onclick="displayPage(' + Number(pagesCount) + ')">&gt;&gt;</button></li>');
		$("#pagingTag").append("</ul></td></tr></table>");
			
		var eleToGetColor = $('<div class="checkedPage" style="display: none;">').appendTo('body');
		var color = eleToGetColor.css('color');
		eleToGetColor.remove();
		document.getElementById("pagebutton"+Number(pageNumber)).style.color = color;
	}
}
