var globalAppUrl = window.location.href.toString();
var cutPoint = globalAppUrl.toLowerCase().indexOf("/knowhub/");
globalAppUrl = globalAppUrl.substr(0, cutPoint + "/knowhub/".length);

var globalCategoryUrl = globalAppUrl + "categories";

var globalQuestionUrl, globalQuestionMetadataUrl, globalQuestionPageMetadataUrl;

var globalSortColumnIndex, globalSortDirection = -1;

var selectedCategoryId;

var globalData;

var globalUserName;

function pageSetup() {
	
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

    var questionUrl = globalAppUrl + "questions";
    globalQuestionUrl = questionUrl;

    var questionMetadataUrl = questionUrl + "/metadata";
    globalQuestionMetadataUrl = questionMetadataUrl;

    var questionPageMetadataUrl = questionUrl + "/pagemetadata";
    globalQuestionPageMetadataUrl = questionPageMetadataUrl;
	
}

function wasAskedButton(questionId, isAsked) {
    return '<img id="was_asked_button' + questionId + '" src="' + globalAppUrl + 'resources/img/rate.png" width="30" height="20" onclick="incrementQuestionRating(' + questionId + ', ' + isAsked + ')"  onmouseover="mouseOverWasAskedButton( ' + questionId + ', ' + isAsked + ')">';
}

function wasBookmarkedButton(questionId, isBookmarked){
	var currentImg;
	var swapImg; 
 	if (isBookmarked == false) {
		currentImg = globalAppUrl + "resources/img/nonactivestar.png";
		swapImg = globalAppUrl + "resources/img/star.png";
	} else if (isBookmarked == true) {
		currentImg = globalAppUrl + "resources/img/star.png";
		swapImg = globalAppUrl + "resources/img/nonactivestar.png";
	}
	return '<img id="was_bookmarked' + questionId + '" onclick ="toggleBookmark(' + questionId + ', ' + isBookmarked + ')" src='+ currentImg +'  data-swap=' + swapImg + ' width="20" height="20" onmouseover="mouseOverWasBookmarkedButton(' + questionId + ', ' + isBookmarked + ')"/>';
}

function mouseOverWasAskedButton(questionId, isAsked) {
    if (isAsked == false) {
        $("#was_asked_button" + questionId).tooltip({
            title: "Please click on this icon if you also have been asked the question.",
            placement: "right",            
            trigger: "hover",
            delay: {show: 1},
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
    } else if (isBookmarked == true) {
    	$("#was_bookmarked" + questionId).tooltip({
            title: "Please click on this icon to remove the bookmark.",
            placement: "right",
            trigger: "hover",
            delay: {show: 1},
        });
    }
}

function incrementQuestionRating(questionId, isAsked) {
    if (isAsked == true) {
        alert("Thank you for scoring the question! Please note that you can score the question only once.");
    }
    
    var questionsUrl = globalAppUrl + "questions";

    if (isAsked == false) {
        $.post(questionsUrl + "/rate", {questionId: questionId}).done(function (isSuccess) {
            $("#was_asked_button" + questionId).on('mouseover', rf);
            if (window.location.href.toString().indexOf("question") < 0) {
				displayPage(currentPage);
			} else {
				showQuestion();
			}
        });
    }
}

function rf() {
    return false
}

function toggleBookmark(questionId, isBookmarked) {	
	var _this = $("#was_bookmarked" + questionId);
	var current = _this.attr("src");
	var swap = _this.attr("data-swap");     
	_this.attr('src', swap).attr("data-swap",current);
	
	var questionsUrl = globalAppUrl + "questions";
	     
	if (isBookmarked == false) {
		$.post(questionsUrl + "/bookmark", {questionId: questionId}).done(function(isSuccess) {
			if (window.location.href.toString().indexOf("question") < 0) {
				displayPage(currentPage);
			} else {
				showQuestion();
			}		
		}); 
	} else if (isBookmarked == true) {
	   	 $.post(questionsUrl + "/unbookmark", {questionId: questionId}).done(function(isSuccess) {
	   		if (window.location.href.toString().indexOf("question") < 0) {
				displayPage(currentPage);
			} else {
				showQuestion();
			}
		});
	}
}