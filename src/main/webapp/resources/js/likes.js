var globalAppUrl = window.location.href.toString();
var cutPoint = globalAppUrl.toLowerCase().indexOf("/knowhub/");
globalAppUrl = globalAppUrl.substr(0, cutPoint + "/knowhub/".length);

function likeButton(commentId, isLiked, isDisliked) {
    if( isLiked==true) {
        return '<div id="right"><a href="#"><img id="was_liked_button' +
            commentId +
            '" src="' +
            globalAppUrl +
            'resources/img/likes/hand_like_active.png" width="26" height="26" onclick="dicrementCommentLikes(' +
            commentId +
            ', ' +
            isLiked +
            ')"  onmouseover="mouseOverLikeButton( ' +
            commentId +
            ', ' +
            isLiked +
            ')"></a></div>';
    } else {
        return '<div id="right"><a href="#"><img id="like_button' +
            commentId +
            '" src="' +
            globalAppUrl +
            'resources/img/likes/hand_like_innactive3.png" width="26" height="26" onclick="incrementCommentLikes(' +
            commentId +
            ', ' +
            isLiked +
            ')"  onmouseover="mouseOverLikeButton( ' +
            commentId +
            ', ' +
            isLiked +
            ')"></a></div>';
    }

}

function dislikeButton(commentId, isLiked, isDisliked) {
    if( isDisliked==true) {
        return '<div id="right"><a href="#"><img id="was_liked_button' +
            commentId +
            '" src="' +
            globalAppUrl +
            'resources/img/likes/hand_dislike_active.png" width="26" height="26" onclick="incrementCommentLikes(' +
            commentId +
            ', ' +
            isDisliked +
            ')"  onmouseover="mouseOverLikeButton( ' +
            commentId +
            ', ' +
            isLiked +
            ')"></a></div>';
    } else {
        return '<div id="right"><a href="#"><img id="dislike_button' +
            commentId +
            '" src="' +
            globalAppUrl +
            'resources/img/likes/hand_dislike_innactive3.png" width="26" height="26" onclick="incrementCommentLikes(' +
            commentId +
            ', ' +
            isDisliked +
            ')"  onmouseover="mouseOverLikeButton( ' +
            commentId +
            ', ' +
            isLiked +
            ')"></a></div>';
    }

}
