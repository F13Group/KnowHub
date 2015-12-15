/**
 * 
 */
var globalPageUrl = window.location.href.toString();
var globalAppUrl = window.location.href.toString();
var cutPoint = globalAppUrl.toLowerCase().indexOf("/knowhub/");
globalAppUrl = globalAppUrl.substr(0, cutPoint + "/knowhub/".length);
var infoUrl = globalPageUrl+"/info";
var commentUrl = infoUrl + "/allcomments";//implementation to be changed
var startPoint = 0;//implementation to be changed
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

	 showQuestion();
	 
	//infinite scroll
	$(window).scroll(
			function() {
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
    		$("#viewed").empty().append("<img src='" + globalAppUrl + "resources/img/eye.png' width='20' height='20' /> Viewed: " +  data.views);
    		
    		if (data.user) {
    			$("#qAuthor").empty().append("<img src='" + globalAppUrl + "resources/img/account.png' width='20' height='20'/><a href='#' class='divQuestionColor'>" + getCorrectUserLoginName(data.user.login) + "</a>");
    		}
    		
    		if (data.description) {
    			$("#qDescription").empty().append(data.description);
    		}
    		
    		//Output formatted date		
    		var unformatted_date = new Date(data.loadDate);
            var dd = unformatted_date.getDate();
            var mm = unformatted_date.getMonth() + 1;
            var yyyy = unformatted_date.getFullYear();
            
            var time = unformatted_date.toTimeString().substr(0,5);
            if (dd < 10) {
                dd = '0' + dd;
            }
            if (mm < 10) {
                mm = '0' + mm;
            }
            var date = dd + '/' + mm + '/' + yyyy;    		
    		
    		$("#addedDate").empty().append("Added " + date + "<br> at " + time);		
    		
    })
}

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
	                  </div>\
					</div>\
				</div>';
				var divider ='<div class="col-lg-10 col-md-10 col-sm-10"><div class="row">\
					<br>\
					</div></div>';   
	    		$("#userComments").append(html + divider);
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