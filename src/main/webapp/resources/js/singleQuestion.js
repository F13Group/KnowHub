/**
 *
 */
var globalPageUrl = window.location.href.toString();
var globalAppUrl = window.location.href.toString();
var cutPoint = globalAppUrl.toLowerCase().indexOf("/knowhub/");
globalAppUrl = globalAppUrl.substr(0, cutPoint + "/knowhub/".length);
var infoUrl = globalPageUrl + "/info";
var commentUrl = globalPageUrl + "/comments";//implementation to be changed
var lastCommentId = 0;//implementation to be changed
var commentsQuantityToLoad = 5;
var noMoreItemsAvailable = false;

var getCorrectUserLoginName = function (userName) {
    if (userName) {
        userName = userName.split("@");
        userName = userName[0].replace("_", " ");

        return userName;
    }
}

$(document).ready(function () {

    showQuestion();

    //infinite scroll
    $(window).scroll(
        function () {
            if ($(window).scrollTop() >= ($(document).height() - $(window).height()) && !noMoreItemsAvailable) {
                //load new portion
                loadComments();
            }
        });
})

function showQuestion() {

    //Output UserName for signed student
    var userName = $("#userName").html();
    $("#userName").empty();
    $("#userName").append(getCorrectUserLoginName(userName));

    $.getJSON(infoUrl, function (data) {

        //Add 5 comments when page has been loaded
        loadComments();

        $("#qTitle").empty().append(data.value);
        if (userName) {
            $("#wasAsked").empty().append(wasAskedButton(data.id, data.isAsked) + " ");
            if (data.isBookmarked) {
                $("#wasBookmarked").empty().append("Remove bookmark: ");
            } else {
                $("#wasBookmarked").empty().append("Bookmark this question: ");
            }
            $("#wasBookmarked").append(wasBookmarkedButton(data.id, data.isBookmarked));
        } else {
            $("#wasBookmarked").empty().append("Bookmark this question: " + wasBookmarkedButton(data.id, data.isBookmarked));
        }
        $("#wasAsked").append("This question was asked " + data.rating + " times");
        $("#qCategory").empty().append("<b>Category: </b><a href='#' id='category'>" + data.category.shortValue + "</a>");
        $("#qTag").empty().append(showTags(data.tags));
        $("#viewed").empty().append("<img src='" + globalAppUrl + "resources/img/eye.png' width='20' height='20' /> Viewed: " + data.views);

        if (data.user) {
            $("#qAuthor").empty().append("<img src='" + globalAppUrl + "resources/img/account.png' width='20' height='20'/><a href='#' class='divQuestionColor'>" + getCorrectUserLoginName(data.user.login) + "</a>");
        }

        if (data.description) {
            $("#qDescription").empty().append(data.description);
        }

        //Output formatted date

        $("#addedDate").empty().append("Added " + parseDate(data.loadDate) + "<br> at " + parseTime(data.loadDate));

        // footer textArea form
        var userName = $("#userName").html();
        if(userName) {
        	//$("#textArea").prop("action", globalPageUrl+"/comments");
        }

    })
}

function addComment() {
	console.log(tinymce.get('mytextarea').getContent());
	//todo add post function with textArea text for creation of new comment
	$.post(globalPageUrl+"/comments", {text: tinymce.get('mytextarea').getContent()}).done(function (data) {
		
		//TODO
		tinymce.get('mytextarea').setContent("");
//		
		$("#userComments").append(
				$.getJSON(globalPageUrl + "/comments/" + data, function (data) {
					
		            var html =
		                '<div id="comment ' + data.id + '" class=" col-lg-10 col-md-10 col-sm-10">\
							<div class="row">\
							  <div class="col-lg-2 col-md-2 col-sm-2 divCell_Left">\
							    <img src="' + globalAppUrl + '/resources/img/account.png" width="20" height="20" /> <a href="#">' + getCorrectUserLoginName(data.authorLogin) + '</a><br>\
							    Added ' + parseDate(data.date) + '<br>\
							    at ' + parseTime(data.date) + '\
						      </div>\
							    \
							  <div class="col-lg-10 col-md-10 col-sm-10 justified">' + data.value + 
							  '\
							 <div id="tools' + lastCommentId + 1 + '" style="overflow: auto; border-bottom:dotted 1px" >\
						</div></div>\
			                  </div>\
							</div>\
						</div>';
		            var divider = '<div class="col-lg-10 col-md-10 col-sm-10"><div class="row">\
							<br>\
							</div></div>';
		            $("#footer").before(html + divider);
		            var rating = data.positiveRate-data.negativeRate;
		            $(('#tools' + lastCommentId +1)).append('<div id="right"><a href="#">Reply<img src="' + globalAppUrl + '/resources/img/reply.png" width="20" height="20"></a></div>');
		            $(('#tools' + lastCommentId +1)).append(dislikeButton(data.id, data.currentUserPositivelyRatedComment, data.currentUserNegativelyRatedComment,data.thisCommentsLikeIdIfUserLikedIt));
		            $(('#tools' + lastCommentId +1)).append(likeButton(data.id, data.currentUserPositivelyRatedComment, data.currentUserNegativelyRatedComment,data.thisCommentsLikeIdIfUserLikedIt));
		            $(('#tools' + lastCommentId +1)).append('<div id="right">' + rating + '</div>');
		            lastCommentId = data.id;
				})
		);
		
		
		//		console.log("addComment function finished");
//		showQuestion();
	});
}

function showTags(listOfTags) {
    var res = "";
    for (var i = 0; i < listOfTags.length; i++) {
        res += "<a href='#'>" + listOfTags[i].value + "</a> ";
    }
    return res;
}

function loadComments() {
    //Sends index from where to start load comments and quantity.
    $.getJSON(commentUrl + '?lastCommentId=' + lastCommentId + '&numberOfComments=' + commentsQuantityToLoad, function (data) {
        /*
         * JSON lengths we get, is shorter than quantity we requested for - it means
         * that we've loaded last set of comments and we must not send any more request.
         * */
        if (data.length < commentsQuantityToLoad) {
            noMoreItemsAvailable = true;
        }
        for (var i = 0; i < data.length; i++) {
            var html =
                '<div id="comment ' + data[i].id + '" class=" col-lg-10 col-md-10 col-sm-10">\
					<div class="row">\
					  <div class="col-lg-2 col-md-2 col-sm-2 divCell_Left">\
					    <img src="' + globalAppUrl + '/resources/img/account.png" width="20" height="20" /> <a href="#">' + getCorrectUserLoginName(data[i].authorLogin) + '</a><br>\
					    Added ' + parseDate(data[i].date) + '<br>\
					    at ' + parseTime(data[i].date) + '\
				      </div>\
					    \
					  <div class="col-lg-10 col-md-10 col-sm-10 justified">' + data[i].value + '\
					 <div id="tools' + lastCommentId + 1 + '" style="overflow: auto; border-bottom:dotted 1px" >\
				</div></div>\
	                  </div>\
					</div>\
				</div>';
            var divider = '<div class="col-lg-10 col-md-10 col-sm-10"><div class="row">\
					<br>\
					</div></div>';
            $("#userComments").append(html + divider);
            var rating = data[i].positiveRate-data[i].negativeRate;
            $(('#tools' + lastCommentId +1)).append('<div id="right"><a href="#">Reply<img src="' + globalAppUrl + '/resources/img/reply.png" width="20" height="20"></a></div>');
            $(('#tools' + lastCommentId +1)).append(dislikeButton(data[i].id, data[i].currentUserPositivelyRatedComment, data[i].currentUserNegativelyRatedComment,data[i].thisCommentsLikeIdIfUserLikedIt));
            $(('#tools' + lastCommentId +1)).append(likeButton(data[i].id, data[i].currentUserPositivelyRatedComment, data[i].currentUserNegativelyRatedComment,data[i].thisCommentsLikeIdIfUserLikedIt));
            $(('#tools' + lastCommentId +1)).append('<div id="right">' + rating + '</div>');
            lastCommentId = data[i].id;
        }

        /*
         * Adds some extra space to place the footer, when we reach the bottom
         * (in order not to shadow last comment)
         */
        if (noMoreItemsAvailable) {
            var footerHeight = $("footer").height();
            console.log(footerHeight);
            $("#userComments").append('<div id="footer" class="col-lg-10 col-md-10 col-sm-10"><div class="row" style="height: ' + footerHeight + 'px;"></div></div>');
        }

    });
}

function parseDate(loadDate) {
    var unformatted_date = new Date(loadDate);
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

function parseTime(loadDate) {
    var unformatted_date = new Date(loadDate);
    return unformatted_date.toTimeString().substr(0, 5);
}