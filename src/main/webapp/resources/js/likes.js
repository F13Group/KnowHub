var globalAppUrl = window.location.href.toString();
var cutPoint = globalAppUrl.toLowerCase().indexOf("/knowhub/");
globalAppUrl = globalAppUrl.substr(0, cutPoint + "/knowhub/".length);
var questionId = window.location.href.toString().slice(-1);


function likeButton(commentId, isLiked, isDisliked, likeId) {
    var userName = $("#userName").html();
    if (userName) {
        var one;
        var another;
        one = globalAppUrl + "resources/img/likes/hand_like_active.png";
        another = globalAppUrl + "resources/img/likes/hand_like_inactive3.png";


        if (isLiked == true) {

            return '<div id="right"><a href="#"><img id="was_liked_button' +
                commentId + '" src=' +
                one + ' data-swap=' + another + '  width="23" height="23" onclick="toggleLike(' +
                questionId +
                ', ' +
                commentId +
                ', ' +
                isLiked +
                ', ' +
                isDisliked +
                ', ' +
                likeId +
                ')"></a></div>';
        } else {
            return '<div id="right"><a href="#"><img id="was_liked_button' +
                commentId + '" src=' +
                another + ' data-swap=' + one + ' width="23" height="23" onclick="toggleLike(' +
                questionId +
                ', ' +
                commentId +
                ', ' +
                isLiked +
                ', ' +
                isDisliked +
                ', ' +
                likeId +
                ')"></a></div>';
        }
    } else return '<div id="right"><a href="#"><img id="like_button" src="' + globalAppUrl + 'resources/img/likes/hand_like.png" width="23" height="23"></a></div>';
}

function dislikeButton(commentId, isLiked, isDisliked, likeId) {
    var userName = $("#userName").html();
    if (userName) {
        var one;
        var another;
        one = globalAppUrl + "resources/img/likes/hand_dislike_active.png";
        another = globalAppUrl + "resources/img/likes/hand_dislike_inactive3.png";

        if (isDisliked == true) {
            return '<div id="right"><a href="#"><img id="was_disliked_button' +
                commentId +
                '" src=' + one + ' data-swap=' + another + ' width="23" height="23" onclick="toggleDislike(' +
                questionId +
                ', ' +
                commentId +
                ', ' +
                isLiked +
                ', ' +
                isDisliked +
                ', ' +
                likeId +
                ')"></a></div>';
        } else {
            return '<div id="right"><a href="#"><img id="was_disliked_button' +
                commentId +
                '" src=' + another + ' data-swap=' + one + ' width="23" height="23" onclick="toggleDislike(' +
                questionId +
                ', ' +
                commentId +
                ', ' +
                isLiked +
                ', ' +
                isDisliked +
                ', ' +
                likeId +
                ')"></a></div>';
        }
    } else return '<div id="right"><a href="#"><img id="like_button" src="' + globalAppUrl + 'resources/img/likes/hand_dislike.png" width="23" height="23"></a></div>';
}

var dislike_inactive = globalAppUrl + "resources/img/likes/hand_dislike_inactive3.png";
var like_inactive = globalAppUrl + "resources/img/likes/hand_like_inactive3.png";

function toggleLike(questionId, commentId, isLiked, isDisliked, likeId) {
    var _this_like = $("#was_liked_button" + commentId);
    var _this_dislike = $("#was_disliked_button" + commentId);
    var current = _this_like.attr("src");
    var swap = _this_like.attr("data-swap");

    _this_dislike.attr('src', dislike_inactive);
    _this_like.attr('src', swap).attr("data-swap", current);


    var questionUrl = globalAppUrl + "question";

    if (isLiked == false & isDisliked == false) {
        $.post(questionUrl + "/" + questionId + "/like", {commentId: commentId, isPositiveLike: true}).done(function (isSuccess) {
            if (window.location.href.toString().indexOf("question") < 0) {
                displayPage(currentPage);
            } else {
                likeButton(commentId, true, false, likeId);
            }
        });
    } else if (isLiked == true & isDisliked == false) {
        $.post(questionUrl + "/" + questionId + "/unlike", {likeId: likeId}).done(function (isSuccess) {
            if (window.location.href.toString().indexOf("question") < 0) {
                displayPage(currentPage);
            } else {

            }
        });
    } else if (isLiked == false & isDisliked == true) {
        //$.post(questionUrl + "/" + questionId + "/unlike", {likeId: likeId}).done(function (isSuccess) {})
        $.post(questionUrl + "/" + questionId + "/like", {commentId: commentId, isPositiveLike: true}).done(function (isSuccess) {})
    }
}

function toggleDislike(questionId, commentId, isLiked, isDisliked, likeId) {
    var _this_like = $("#was_liked_button" + commentId);
    var _this_dislike = $("#was_disliked_button" + commentId);
    var current = _this_dislike.attr("src");
    var swap = _this_dislike.attr("data-swap");

    _this_like.attr('src', like_inactive);
    _this_dislike.attr('src', swap).attr("data-swap", current);



    var questionUrl = globalAppUrl + "question";

    if (isLiked == false & isDisliked == false) {
        $.post(questionUrl + "/" + questionId + "/like", {
            commentId: commentId,
            isPositiveLike: false
        }).done(function (isSuccess) {
            if (window.location.href.toString().indexOf("question") < 0) {
                displayPage(currentPage);
            } else {
            }
        });
    } else if (isLiked == false & isDisliked == true) {
        $.post(questionUrl + "/" + questionId + "/unlike", {likeId: likeId}).done(function (isSuccess) {
            if (window.location.href.toString().indexOf("question") < 0) {
                displayPage(currentPage);
            } else {
            }
        });
    } else if (isLiked == true & isDisliked == false) {
        //$.post(questionUrl + "/" + questionId + "/unlike", {likeId: likeId}).done(function (isSuccess) {})
        $.post(questionUrl + "/" + questionId + "/like", {commentId: commentId, isPositiveLike: false}).done(function (isSuccess) {})

    }
}
