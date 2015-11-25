/**
 * 
 */
var globalPageUrl = window.location.href.toString();

$(document).ready(function () {

	//Output UserName for signed student
    var userName = $("#userName").html();
    if (userName) {
        userName = userName.split("@");
        userName = userName[0].replace("_", " ");

        $("#userName").empty();
        $("#userName").append(userName);

        globalUserName = userName;
    }
    
    infoUrl = globalPageUrl+"/info";
    
    $.getJSON(infoUrl, function (data) {
    		$("#qTitle").append(data.value);
    		
    })
})