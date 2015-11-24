var globalCategoryUrl = window.location.href.toString()
if (globalCategoryUrl.indexOf("index") != -1) {
    globalCategoryUrl = globalCategoryUrl.substr(0, globalCategoryUrl.indexOf("index"));
}
globalCategoryUrl += "categories";

var globalQuestionUrl, globalQuestionMetadataUrl, globalQuestionPageMetadataUrl;

var globalSortColumnIndex, globalSortDirection = -1;

var selectedCategoryId;

var globalData;
var currentPage;

var globalUserName;


function orderedBy(sortColumnIndex) {
    if (globalSortColumnIndex == sortColumnIndex) {
        globalSortDirection *= -1;
        if (globalSortDirection < 0) {
            $("#buttonOrderBy" + globalSortColumnIndex).prop('value', $("<div>").html('&#x25BC;').text());
        } else {
            $("#buttonOrderBy" + globalSortColumnIndex).prop('value', $("<div>").html('&#x25B2;').text());
        }
    } else {
        globalSortDirection = -1;
        globalSortColumnIndex = sortColumnIndex;
        $('.change_order_sign').prop('value', $("<div>").html('&#x25AD;').text());
        $("#buttonOrderBy" + globalSortColumnIndex).prop('value', $("<div>").html('&#x25BC;').text());
    }
    displayPage("1");
}


function pageSizeChanged() {
    displayPage("1");
}

function displayPage(currentPageNumber) {
    var pageSizeChooser = document.getElementById("pageSizeChooser");
    var pageSizeChosen;

    if (pageSizeChooser != null) {
        pageSizeChosen = pageSizeChooser.options[pageSizeChooser.selectedIndex].text;
    }

    $.post(globalQuestionMetadataUrl, {rowsOnPageNumber: pageSizeChosen})
        .done(function (data) {
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
    $.post(globalQuestionUrl, {
        currentPageNumber: cPN,
        rowsOnPageNumber: rOPN,
        sortColumnIndex: globalSortColumnIndex * globalSortDirection
    })
        .done(function (data) {
            globalData = data;
            $(".divRow").empty();
            $("#pagingRow").show();
            if (data.length == 0) {
                $("<div class='divRow row'><div class='divCell_2 col-lg-12' align=center>No questions found for this category</div></div>").insertAfter("#headRow");
                $("#pagingRow").hide();
            } else {
                $.each($(data).get().reverse(), function (index, value) {
                    var unformatted_date = new Date(value.loadDate);
                    var dd = unformatted_date.getDate();
                    var mm = unformatted_date.getMonth() + 1;
                    var yyyy = unformatted_date.getFullYear();
                    if (dd < 10) {
                        dd = '0' + dd;
                    }
                    if (mm < 10) {
                        mm = '0' + mm;
                    }
                    var date = dd + '/' + mm + '/' + yyyy;


                    if (value.value.length > 70) {
                        value.value = value.value.substring(0, 65);
                        value.value += "...";
                    }


                    function was_asked_button(questionId, isAsked) {
                        return '<img id="was_asked_button' + questionId + '" src="resources/img/rate.png" width="30" height="20" onclick="incrementQuestionRating(' + questionId + ', ' + isAsked + ')"  onmouseover="mouseOverWasAskedButton( ' + questionId + ', ' + isAsked + ')">';
                    }

                    function was_bookmarked_button(questionId, isBookmarked){
                    	var currentImg;
                    	var swapImg; 
                     	if (isBookmarked == false){
                    		currentImg = "resources/img/nonactivestar.png";
                    		swapImg = "resources/img/star.png";
                    	} else if (isBookmarked == true){
                    		currentImg = "resources/img/star.png";
                    		swapImg = "resources/img/nonactivestar.png";
                    	}
                    	return '<img id="was_bookmarked' + questionId + '" onclick ="toggleBookmark(' + questionId + ', ' + isBookmarked + ')" src='+ currentImg +'  data-swap=' + swapImg + ' width="20" height="20" onmouseover="mouseOverWasBookmarkedButton(' + questionId + ', ' + isBookmarked + ')"/>';
                    }
                    
                    var userName = $("#userName").html();
                    if (userName) {
                        $("<div class='divRow row'><div class='non-active col-lg-6 col-md-6 col-sm-6 divCell_2'><a href='question/"+ value.id +"'  class='divQuestionColor'>" + value.value + "</a></div><div class='col-lg-1 col-md-2 col-sm-2 divCell_Center'>" + value.category.shortValue + "</div><div class='col-lg-1 col-md-2 col-sm-2 divCell_Center'>" + date + "</div><div class='col-lg-2 col-md-2 col-sm-2 divCell_Left'>" + was_asked_button(value.id, value.isAsked) + " " + value.rating + "</div><div class='col-lg-2 col-md-2 col-sm-2 divCell_Left'>" + was_bookmarked_button(value.id, value.isBookmarked) + "</div></div>").insertAfter("#headRow");

                    } else {
                        $("<div class='divRow row'><div class='col-lg-6 col-md-6 col-sm-6 divCell_2'><a href='question/"+ value.id +"' class ='divQuestionColor'>" + value.value + "</a></div><div class='col-lg-2 col-md-2 col-sm-2 divCell_Center'>" + value.category.shortValue + "</div><div class='col-lg-2 col-md-2 col-sm-2 divCell_Center'>" + date + "</div><div class='col-lg-2 col-md-2 col-sm-2 divCell_Center'>" + value.rating + "</div></div>").insertAfter("#headRow");
                    }

                });
            }
        });

    pagination(pC, cPN, rOPN);
};


$(document).ready(function () {

    var userName = $("#userName").html();
    if (userName) {
        userName = userName.split("@");
        userName = userName[0].replace("_", " ");

        $("#userName").empty();
        $("#userName").append(userName);

        globalUserName = userName;
    }

    window.selectedCategoryId = -1;
    globalSortColumnIndex = 1;
    globalSortDirectionAsc = -1;

    var questionUrl = window.location.href.toString()
    if (questionUrl.indexOf("index") != -1) {
        questionUrl = questionUrl.substr(0, questionUrl.indexOf("index"));
    }
    questionUrl += "questions";
    globalQuestionUrl = questionUrl;

    var questionMetadataUrl = questionUrl + "/metadata";
    globalQuestionMetadataUrl = questionMetadataUrl;

    var questionPageMetadataUrl = questionUrl + "/pagemetadata";
    globalQuestionPageMetadataUrl = questionPageMetadataUrl;

    $("#categoriesMenu").append("<div class=categoriesMenuItem><input id=category-1 class=categoriesMenuButtonActive type=button value=All&nbsp;Categories onclick=selectCategory(-1) onmouseover=switchCategoryButtonOver('-1','true') onmouseout=switchCategoryButtonOver('-1','false')><br /></div>");

    $.getJSON(globalCategoryUrl, function (data) {
        $.each(data, function (index, value) {
            $("#categoriesMenu").append("<div class=categoriesMenuItem><input id=category" + value.id + " class=categoriesMenuButton type=button value='" + value.value + "' onclick=selectCategory(" + value.id + ") onmouseover=switchCategoryButtonOver('" + value.id + "','true') onmouseout=switchCategoryButtonOver('" + value.id + "','false')><br /></div>");
        });
    });    

    displayPage("1");
});


function mouseOverWasAskedButton(questionId, isAsked) {
    console.log(isAsked);
    if (isAsked == false) {
        $("#was_asked_button" + questionId).tooltip({
            title: "Please click on this icon if you also have been asked the question.",
            placement: "right",
            trigger: "hover",
            delay: {show: 1},

        });
    }
}

function rf() {
    return false
};

function incrementQuestionRating(questionId, isAsked) {

    if (isAsked == true) {
        alert("Thank you for scoring the question! Please note that you can score the question only once.");

    }

    if (isAsked == false) {
        $.post(globalQuestionUrl + "/rate", {questionId: questionId}).done(function (isSuccess) {
            console.log("rate = " + isSuccess);
            $("#was_asked_button" + questionId).on('mouseover', rf);
            displayPage(currentPage);
        });
    }
}

function mouseOverWasBookmarkedButton(questionId, isBookmarked) {
    if (isBookmarked == false) {
        $("#was_bookmarked" + questionId).tooltip({
            title: "Please click on this icon to bookmark the question.",
            placement: "right",
            trigger: "hover",
            delay: {show: 1},

        });
    }else if (isBookmarked == true){
    	$("#was_bookmarked" + questionId).tooltip({
            title: "Please click on this icon to remove the bookmark.",
            placement: "right",
            trigger: "hover",
            delay: {show: 1},

        });
    }
}

function toggleBookmark(questionId, isBookmarked) {
	
	var _this = $("#was_bookmarked" + questionId);
	var current = _this.attr("src");
	var swap = _this.attr("data-swap");     
	_this.attr('src', swap).attr("data-swap",current);  
	     
	if(isBookmarked == false){
		$.post(globalQuestionUrl + "/bookmark", {questionId: questionId}).done(function(isSuccess) {
			displayPage(currentPage);
		}); 
	} else if(isBookmarked == true){
	   	 $.post(globalQuestionUrl + "/unbookmark", {questionId: questionId}).done(function(isSucces) {
			displayPage(currentPage);
		});
	}
}

function switchCategoryButtonOver(categoryId, isMouseOver) {
    if (Number(categoryId) == window.selectedCategoryId) {
        if (isMouseOver == "true") {
            var sample = $('<div class="categoriesMenuButtonOver" style="display: none;">').appendTo('body');
            var backgroundColor = sample.css('background-color');
            sample.remove();
            document.getElementById("category" + categoryId).style.backgroundColor = backgroundColor;
        } else {
            var sample = $('<div class="categoriesMenuButtonActive" style="display: none;">').appendTo('body');
            var backgroundColor = sample.css('background-color');
            sample.remove();
            document.getElementById("category" + categoryId).style.backgroundColor = backgroundColor;
        }
    } else {
        if (isMouseOver == "true") {
            var sample = $('<div class="categoriesMenuButtonOver" style="display: none;">').appendTo('body');
            var backgroundColor = sample.css('background-color');
            sample.remove();
            document.getElementById("category" + categoryId).style.backgroundColor = backgroundColor;
        } else {
            var sample = $('<div class="categoriesMenuButton" style="display: none;">').appendTo('body');
            var backgroundColor = sample.css('background-color');
            sample.remove();
            document.getElementById("category" + categoryId).style.backgroundColor = backgroundColor;
        }
    }
}

function selectCategory(categoryId) {
	
	globalSortDirection = 1;
	orderedBy(1);
    
    $('.categoriesMenuButtonActive').removeAttr('style');
    $('.categoriesMenuButtonActive').toggleClass('categoriesMenuButtonActive').toggleClass('categoriesMenuButton');

    $("#category" + categoryId).toggleClass('categoriesMenuButton');
    $("#category" + categoryId).toggleClass('categoriesMenuButtonActive');

    if (window.selectedCategoryId == categoryId) {
        switchCategoryButtonOver(categoryId, 'true');
    } else {
        window.selectedCategoryId = categoryId;
    }

    var questionUrl = window.location.href.toString()
    if (questionUrl.indexOf("index") != -1) {
        questionUrl = questionUrl.substr(0, questionUrl.indexOf("index"));
    }
    questionUrl += "questions";

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
        var fontWeight = eleToGetColor.css('font-weight');
        eleToGetColor.remove();
        document.getElementById("pagebutton" + Number(pageNumber)).style.color = color;
        document.getElementById("pagebutton" + Number(pageNumber)).style.fontWeight = fontWeight;

        currentPage = pageNumber;
    }
}