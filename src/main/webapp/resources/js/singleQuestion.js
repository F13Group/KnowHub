/**
 * 
 */
var globalPageUrl = window.location.href.toString();

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
    
    infoUrl = globalPageUrl+"/info";
    
    $.getJSON(infoUrl, function (data) {
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
    		
    		//Output formatted date		
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
    		
    		$("#addedDate").append("Added "+date);		
    		
    })
})

function showTags(listOfTags){
	var res = "";
	for(var i = 0; i < listOfTags.length; i++){
		res+="<a href='#'>"+ listOfTags[i].value + "</a> ";
	}
	return res;
}