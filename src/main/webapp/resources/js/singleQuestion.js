/**
 *
 */
var globalPageUrl = window.location.href.toString();
var globalAppUrl = window.location.href.toString();
var cutPoint = globalAppUrl.toLowerCase().indexOf("/knowhub/");
globalAppUrl = globalAppUrl.substr(0, cutPoint + "/knowhub/".length);
var infoUrl = globalPageUrl+"/info";
var commentUrl = globalPageUrl + "/comments";
var startPoint = 0;
var commentsQuantityToLoad = 5;
var noMoreItemsAvailable = false;

var getCorrectUserLoginName = function(userName){
	if (userName) {
		userName = userName.split("@");
		userName = userName[0].replace("_", " ");

		return userName;
	}
}

$(document).ready(function () {
	//Output UserName for signed student
	var userName = $("#userName").html();
	$("#userName").empty();
	$("#userName").append(getCorrectUserLoginName(userName));



	$.getJSON(infoUrl, function (data) {
		//Add 5 comments when page has been loaded
		loadComments();
		$("#qTitle").append(data.value);
		if (userName) {
			$("#wasAsked").append(wasAskedButton(data.id, data.isAsked) + " ");
			$("#wasBookmarked").append(wasBookmarkedButton(data.id, data.isBookmarked));
		}
		$("#wasAsked").append("This question was asked " + data.rating + " times");
		$("#qCategory").append("<b>Category: </b><a href='#' id='category'>" + data.category.shortValue + "</a>");
		$("#qTag").append(showTags(data.tags));
		$("#viewed").append("Viewed: " +  data.views);

		if (data.user) {
			$("#qAuthor").append("<a href='#' class='divQuestionColor'>" + getCorrectUserLoginName(data.user.login) + "</a>");
		}

		if (data.description) {
			$("#qDescription").append(data.description);
		}

		$("#addedDate").append("Added "+formatDate(data));

	})

	//infinite scroll
	$(window).scroll(
		function() {
			if ($(window).scrollTop() >= ($(document)
					.height() - $(window).height()) && !noMoreItemsAvailable) {
				//load new portion
				loadComments();
			}
		});

})

function showTags(listOfTags){
	var res = "";
	for(var i = 0; i < listOfTags.length; i++){
		res+="<a href='#'>"+ listOfTags[i].value + "</a> ";
	}
	return res;
}

function loadComments() {
	//Sends index from where to start load comments and quantity.
	$.getJSON(commentUrl + '?startPoint=' + startPoint + '&commentsQuantity=' + commentsQuantityToLoad, function (data){
		/*
		 * JSON lengths we get, is shorter than quantity we requested for - it means
		 * that we've loaded last set of comments and we must not send any more request.
		 * */
		if(data.length < commentsQuantityToLoad){
			noMoreItemsAvailable = true;
		}
		for(var i = 0; i < data.length; i++){
			var html =
				'<div id="comment'+ ++startPoint +'" class=" col-lg-10 col-md-10 col-sm-10">\
					<div class="row">\
					  <div class="col-lg-2 col-md-2 col-sm-2 divCell_Left">\
					    <img src="'+globalAppUrl+'/resources/img/account.png" width="20" height="20" /> <a href="#">'+data[i].author +'</a><br>\
					    Added start index '+data[i].startPoint+' quantity '+ data.length+'\\'+data[i].commentsQuantity+'\
				      </div>\
					    \
					  <div class="col-lg-10 col-md-10 col-sm-10 justified">'+ data[i].value+'\
	                  <div id="tools'+startPoint+'" >\
			<div id="right">+1</div>\
				</div></div>\
					</div>\
				</div>';
			var divider ='<div class="col-lg-10 col-md-10 col-sm-10"><div class="row">\
					<br>\
					</div></div>';
			$("#userComments").append(html + divider);
			$(('#tools'+startPoint)).append(likeButton(data[i].id,data[i].isLiked,data[i].isDisliked));
			$(('#tools'+startPoint)).append(dislikeButton(data[i].id,data[i].isLiked,data[i].isDisliked));
		}

		/*
		 * Adds some extra space to place the footer, when we reach the bottom
		 * (in order not to shadow last comment)
		 */
		if(noMoreItemsAvailable){
			var footerHeight = $("footer").height();
			console.log(footerHeight);
			$("#userComments").append('<div class="col-lg-10 col-md-10 col-sm-10"><div class="row" style="height: '+footerHeight+'px;"></div></div>');
		}

	});
}

function formatDate(data){
	var unformatted_date = new Date(data.loadDate);
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
	return date;
}