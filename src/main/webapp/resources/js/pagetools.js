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

    var questionUrl = window.location.href.toString();
    var cutPoint = questionUrl.toLowerCase().indexOf("/knowhub/");
    questionUrl = questionUrl.substr(0, cutPoint + "/knowhub/".length);
    
    questionUrl += "questions";
    globalQuestionUrl = questionUrl;

    var questionMetadataUrl = questionUrl + "/metadata";
    globalQuestionMetadataUrl = questionMetadataUrl;

    var questionPageMetadataUrl = questionUrl + "/pagemetadata";
    globalQuestionPageMetadataUrl = questionPageMetadataUrl;
	
}

function wasAskedButton(questionId, isAsked) {
    return '<img id="was_asked_button' + questionId + '" src="resources/img/rate.png" width="30" height="20" onclick="incrementQuestionRating(' + questionId + ', ' + isAsked + ')"  onmouseover="mouseOverWasAskedButton( ' + questionId + ', ' + isAsked + ')">';
}

function wasBookmarkedButton(questionId, isBookmarked){
	var currentImg;
	var swapImg; 
 	if (isBookmarked == false) {
		currentImg = "resources/img/nonactivestar.png";
		swapImg = "resources/img/star.png";
	} else if (isBookmarked == true) {
		currentImg = "resources/img/star.png";
		swapImg = "resources/img/nonactivestar.png";
	}
	return '<img id="was_bookmarked' + questionId + '" onclick ="toggleBookmark(' + questionId + ', ' + isBookmarked + ')" src='+ currentImg +'  data-swap=' + swapImg + ' width="20" height="20" onmouseover="mouseOverWasBookmarkedButton(' + questionId + ', ' + isBookmarked + ')"/>';
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

function toggleBookmark(questionId, isBookmarked) {	
	var _this = $("#was_bookmarked" + questionId);
	var current = _this.attr("src");
	var swap = _this.attr("data-swap");     
	_this.attr('src', swap).attr("data-swap",current);  
	     
	if (isBookmarked == false) {
		$.post(globalQuestionUrl + "/bookmark", {questionId: questionId}).done(function(isSuccess) {
			displayPage(currentPage);
		}); 
	} else if (isBookmarked == true) {
	   	 $.post(globalQuestionUrl + "/unbookmark", {questionId: questionId}).done(function(isSucces) {
			displayPage(currentPage);
		});
	}
}