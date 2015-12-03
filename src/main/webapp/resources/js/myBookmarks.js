/*
 * !!!Uses functions wasAskedButton() and wasBookmarkedButton() from pagetools.js!!!
 */
var currentPage;

function displayPage(currentPageNumber) {
	var pageSizeChooser = document.getElementById("pageSizeChooser");
	var pageSizeChosen;

	if (pageSizeChooser != null) {
		pageSizeChosen = pageSizeChooser.options[pageSizeChooser.selectedIndex].text;
	}

	$.post(globalQuestionMetadataUrl, {
		rowsOnPageNumber : pageSizeChosen
	})
			.done(
					function(data) {
						outputQuestions(data.pageCount, currentPageNumber,
								pageSizeChosen);
						alert(pageSizeChosen);
						alert(currentPageNumber);
						var recordsStart = pageSizeChosen
								* (currentPageNumber - 1) + 1;
						var recordsEnd;
						if (currentPageNumber < data.pageCount) {
							recordsEnd = pageSizeChosen * currentPageNumber;
						} else {
							recordsEnd = data.recordsCount;
						}
						$("#pagingInfo").text(
								"Records " + recordsStart + "-" + recordsEnd
										+ " out of " + data.recordsCount);
					});
}

function outputQuestions(pC, cPN, rOPN) {
	$
			.post(globalQuestionUrl, {
				currentPageNumber : cPN,
				rowsOnPageNumber : rOPN,
				sortColumnIndex : globalSortColumnIndex * globalSortDirection
			})
			.done(
					function(data) {
						globalData = data;
						$(".divRow").empty();
						$("#pagingRow").show();
						if (data.length == 0) {
							$(
									"<div class='divRow row'><div class='divCell_2 col-lg-12' align=center>No questions have been bookmarked</div></div>")
									.insertAfter("#headRow");
							$("#pagingRow").hide();
						} else {
							$
									.each(
											$(data).get().reverse(),
											function(index, value) {
												if (value.isBookmarked) {
													var unformatted_date = new Date(
															value.loadDate);
													var dd = unformatted_date
															.getDate();
													var mm = unformatted_date
															.getMonth() + 1;
													var yyyy = unformatted_date
															.getFullYear();
													if (dd < 10) {
														dd = '0' + dd;
													}
													if (mm < 10) {
														mm = '0' + mm;
													}
													var date = dd + '/' + mm
															+ '/' + yyyy;

													if (value.value.length > 70) {
														value.value = value.value
																.substring(0,
																		65);
														value.value += "...";
													}

													var userName = $(
															"#userName").html();
													$(
															"<div class='divRow row'><div class='non-active col-lg-6 col-md-6 col-sm-6 divCell_2'><a href='question/"
																	+ value.id
																	+ "'  class='divQuestionColor'>"
																	+ value.value
																	+ "</a></div><div class='col-lg-1 col-md-2 col-sm-2 divCell_Center'>"
																	+ value.category.shortValue
																	+ "</div><div class='col-lg-1 col-md-2 col-sm-2 divCell_Center'>"
																	+ date
																	+ "</div><div class='col-lg-2 col-md-2 col-sm-2 divCell_Center'>"
																	+ " "
																	+ value.rating
																	+ "</div><div class='col-lg-2 col-md-2 col-sm-2 divCell_Center'><a id='remove"
																	+ value.id
																	+ "' onmouseover='mouseOverRemove("
																	+ value.id
																	+ ")' onclick='removeBookmark("
																	+ value.id
																	+ ")'>Remove"
																	+ "</a></div></div>")
															.insertAfter(
																	"#headRow");
												}
											});

						}
					});

	pagination(pC, cPN, rOPN);
}

function removeBookmark(questionId) {
	var questionsUrl = globalAppUrl + "questions";
	$.post(questionsUrl + "/unbookmark", {
		questionId : questionId
	}).done(function(isSuccess) {
		if (window.location.href.toString().indexOf("question") < 0) {
			displayPage(currentPage);
		} else {
			showQuestion();
		}
	});
}

function mouseOverRemove(questionId) {
	$("#id" + questionId).tooltip({
		title : "Please click on the icon to remove the bookmark",
		placement : "right",
		trigger : "hover",
		delay : {
			show : 1
		},
	});
}

function pagination(pagesCount, pageNumber, pagesSize) {
	$("#pagingTag").empty();
	if (Number(pagesCount) > 1) {
		$("#pagingTag").append("<table><tr><td align=left><ul class=paging>");
		$(".paging")
				.append(
						'<li><button class="normal" onmouseover="this.className=\'over\'" onmouseout="this.className=\'normal\'" onclick="displayPage(\'1\')">&lt;&lt;</button></li>');
		if (Number(pageNumber) > 1) {
			$(".paging")
					.append(
							'<li><button class="normal" onmouseover="this.className=\'over\'" onmouseout="this.className=\'normal\'" onclick="displayPage('
									+ (Number(pageNumber) - 1)
									+ ')">&lt;</button></li>');
		}
		if (Number(pageNumber) == 1) {
			$(".paging")
					.append(
							'<li><button class="normal" onmouseover="this.className=\'over\'" onmouseout="this.className=\'normal\'" onclick="displayPage(\'1\')">&lt;</button></li>');
		}
		if (Number(pagesCount) > 5) {
			for (var i = 1; i <= 5; i++) {
				if ((Number(pageNumber) > 3)
						&& ((Number(pagesCount) - Number(pageNumber)) > 1)) {
					$(".paging")
							.append(
									'<li><button class="normal" onmouseover="this.className=\'over\'" onmouseout="this.className=\'normal\'" id="pagebutton'
											+ (i + Number(pageNumber) - 3)
											+ '" onclick="displayPage('
											+ (i + Number(pageNumber) - 3)
											+ ')">'
											+ (i + Number(pageNumber) - 3)
											+ '</button></li>');
				}
				if (Number(pageNumber) <= 3) {
					$(".paging")
							.append(
									'<li><button class="normal" onmouseover="this.className=\'over\'" onmouseout="this.className=\'normal\'" id="pagebutton'
											+ i
											+ '" onclick="displayPage('
											+ i
											+ ')">' + i + '</button></li>');
				}
				if ((Number(pagesCount) - Number(pageNumber)) <= 1) {
					$(".paging")
							.append(
									'<li><button class="normal" onmouseover="this.className=\'over\'" onmouseout="this.className=\'normal\'" id="pagebutton'
											+ (i + Number(pagesCount) - 5)
											+ '" onclick="displayPage('
											+ (i + Number(pagesCount) - 5)
											+ ')">'
											+ (i + Number(pagesCount) - 5)
											+ '</button></li>');
				}
			}
		}
		if (Number(pagesCount) <= 5) {
			for (var i = 1; i <= Number(pagesCount); i++) {
				$(".paging")
						.append(
								'<li><button class="normal" onmouseover="this.className=\'over\'" onmouseout="this.className=\'normal\'" id="pagebutton'
										+ i
										+ '" onclick="displayPage('
										+ i
										+ ')">' + i + '</button></li>');
			}
		}
		if (Number(pageNumber) < Number(pagesCount)) {
			$(".paging")
					.append(
							'<li><button class="normal" onmouseover="this.className=\'over\'" onmouseout="this.className=\'normal\'" onclick="displayPage('
									+ (Number(pageNumber) + 1)
									+ ')">&gt;</button></li>');
		}
		if (Number(pageNumber) == Number(pagesCount)) {
			$(".paging")
					.append(
							'<li><button class="normal" onmouseover="this.className=\'over\'" onmouseout="this.className=\'normal\'" onclick="displayPage('
									+ Number(pagesCount)
									+ ')">&gt;</button></li>');
		}

		$(".paging")
				.append(
						'<li><button class="normal" onmouseover="this.className=\'over\'" onmouseout="this.className=\'normal\'" onclick="displayPage('
								+ Number(pagesCount)
								+ ')">&gt;&gt;</button></li>');
		$("#pagingTag").append("</ul></td></tr></table>");

		var eleToGetColor = $(
				'<div class="checkedPage" style="display: none;">').appendTo(
				'body');
		var color = eleToGetColor.css('color');
		var fontWeight = eleToGetColor.css('font-weight');
		eleToGetColor.remove();
		document.getElementById("pagebutton" + Number(pageNumber)).style.color = color;
		document.getElementById("pagebutton" + Number(pageNumber)).style.fontWeight = fontWeight;

		currentPage = pageNumber;
	}
}

function pageSizeChanged() {
	displayPage("1");
}

function rf() {
	return false
}

function orderedBy(sortColumnIndex) {
	if (globalSortColumnIndex == sortColumnIndex) {
		globalSortDirection *= -1;
		if (globalSortDirection < 0) {
			$("#buttonOrderBy" + globalSortColumnIndex).prop('value',
					$("<div>").html('&#x25BC;').text());
		} else {
			$("#buttonOrderBy" + globalSortColumnIndex).prop('value',
					$("<div>").html('&#x25B2;').text());
		}
	} else {
		globalSortDirection = -1;
		globalSortColumnIndex = sortColumnIndex;
		$('.change_order_sign').prop('value',
				$("<div>").html('&#x25AD;').text());
		$("#buttonOrderBy" + globalSortColumnIndex).prop('value',
				$("<div>").html('&#x25BC;').text());
	}
	displayPage("1");
}