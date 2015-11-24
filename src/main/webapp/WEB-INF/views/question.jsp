<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- favicon -->
<link rel="icon" href="${pageContext.servletContext.contextPath}/resources/styleBootstrap/img/question_shield.png" type="image/png">
<title>KNOW HUB</title>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<!-- Bootstrap core CSS -->
<link href="${pageContext.servletContext.contextPath}/resources/styleBootstrap/css/bootstrap.min.css"	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${pageContext.servletContext.contextPath}/resources/styleBootstrap/css/custom.css" rel="stylesheet">

<!-- JQuery style -->
<link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css" rel="stylesheet">

<!-- JavaScripts -->
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>

<body>

<div class="navbar">
		<div class="navbar-inner">
			<a class="brand" href="${pageContext.servletContext.contextPath}">KnowHub</a>
			<ul class="nav">
				<li <sec:authorize access="isAnonymous()">class="inactive"</sec:authorize>><a href="">My Question list</a></li>
				<li><a href="">Tags</a></li>
				<li <sec:authorize access="isAnonymous()">class="inactive"</sec:authorize>><a href="">My Bookmarks</a></li>
				<li <sec:authorize access="isAnonymous()">class="inactive"</sec:authorize>><a href="">Add Question</a></li>
				<div id="navLinks">
					<div id="links">
					<div class="nav-left">
						<sec:authorize access="isAuthenticated()">
							<a id="userName" href="" class="inactive"><sec:authentication property="principal.username" /></a>
						</sec:authorize>
						<sec:authorize access="isAnonymous()">
							<a href="${pageContext.servletContext.contextPath}/signup">Sign up</a>
							<a href="${pageContext.servletContext.contextPath}/login">Log in</a>
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
							<a href="${pageContext.servletContext.contextPath}/logout">Log off</a>
						</sec:authorize>
							<a href="">Help</a>
						</div>
					</div>
				</div>
			</ul>
		</div>
</div>

	<div class="container">
	
	<div class="tabbable">
			<div class="row">
			
			<div id="questionsList" class="divTable col-lg-10 col-md-10 col-sm-10 justified">
				<div class="row">
				<div  id="headRow" class="headRow" >
					<div class="divCell_header col-lg-8 divCell_Left">Question</div>
					<div class="divCell_header col-lg-4 col-md-4 col-sm-4" ><sec:authorize access="isAuthenticated()">Bookmark this question  <img id="was_bookmarked" onclick ="" src='${pageContext.servletContext.contextPath}/resources/img/nonactivestar.png'  data-swap='' width="20" height="20" onmouseover="mouseOverWasBookmarkedButton()"/></sec:authorize></div> 
				</div>
				
				<div class="col-lg-2 col-md-2 col-sm-2 divCell_Left">
					<img src='${pageContext.servletContext.contextPath}/resources/img/account.png' width="20" height="20" /> <a href="" class="divQuestionColor">Author</a><br>
					Added 10.11.2015 at 18.05 
				</div>
				<div class="col-lg-10 col-md-10 col-sm-10 justified"> To be, or not to be: that is the question:Whether 'tis nobler in the mind to suffer
                 The slings and arrows of outrageous fortune, Or to take arms against a sea of troubles, And by opposing end them? To die: to sleep;
                 No more; and by a sleep to say we end the heart-ache and the thousand natural shocks
                 That flesh is heir to, 'tis a consummation devoutly to be wish'd. To die, to sleep;
                 </div>
				</div>
			</div>
			</div>

	
			<div id="taggingRow" class="col-lg-10 col-md-10 col-sm-10 justified">
				<div class=row>
					<div class="divCell_2 col-lg-2 col-md-2 col-sm-2" id="qCategory" style="height:50px" align=left ><b>Category: </b><a href="" id="category">AT</a></div>
					<div class="divCell_2 col-lg-6 col-md-6 col-sm-6" id="pagingTag" style="height:50px" align=center><a href="">TEG1</a> <a href="" class="divQuestionColor">TEG2</a></div>
					<div class="divCell_2 col-lg-4 col-md-4 col-sm-4" id="userComments" style="height:50px" align=center><a href="">Show other questions posted by this user</a></div>
				</div>
			</div>
			
			<div id="taggingRow" class="col-lg-10 col-md-10 col-sm-10 justified">
				<div class=row>
					<div class="divCell_2 col-lg-2 col-md-2 col-sm-2" id="wasAsked" style="height:60px" align=left><img src='${pageContext.servletContext.contextPath}/resources/img/cursor-pointer.png' width="20" height="20" />This question was asked 5 times</div>
					<div class="divCell_2 col-lg-6 col-md-6 col-sm-6" id="viewed" style="height:60px" align=left><img src='${pageContext.servletContext.contextPath}/resources/img/eye.png' width="20" height="20" /> Viewed: 15</div>
					<div class="divCell_2 col-lg-4 col-md-4 col-sm-4" id="showComments" style="height:60px" align=center><a href="">Show all comments</a></div>
				</div>
			</div>		
		
		<div id="userComments" class="col-lg-10 col-md-10 col-sm-10 justified">
			<div class="row" >
				<b>Comments:</b>
			</div>
			
			<div id="comment1" class=" col-lg-10 col-md-10 col-sm-10">
				<div class="row">
				<div class="col-lg-2 col-md-2 col-sm-2 divCell_Left">
					<img src='${pageContext.servletContext.contextPath}/resources/img/account.png' width="20" height="20" /> <a href="">Author</a><br>
					Added 10.11.2015 at 18.05 
				</div>
				
				<div class="col-lg-10 col-md-10 col-sm-10 justified"> To be, or not to be: that is the question:Whether 'tis nobler in the mind to suffer
                 The slings and arrows of outrageous fortune, Or to take arms against a sea of troubles, And by opposing end them? To die: to sleep;
                 </div>
				</div>
			</div>
			
				<div class="divider">
								
				</div>
			
			<div id="comment2" class=" col-lg-10 col-md-10 col-sm-10">
				<div class="row">
				<div class="col-lg-2 col-md-2 col-sm-2 divCell_Left">
					<img src='${pageContext.servletContext.contextPath}/resources/img/account.png' width="20" height="20" /> <a href="">Author</a><br>
					Added 10.11.2015 at 18.05 
				</div>
				<div class="col-lg-10 col-md-10 col-sm-10 justified"> To be, or not to be: that is the question:Whether 'tis nobler in the mind to suffer
                 </div>
				</div>
			</div>
		</div>
					
 		</div>  <!--	/.tabbable -->
	</div>	<!-- /.container -->
	
	<footer class="footer">
		<div class="container">
			<p class="text-muted"></p>
		</div>
	</footer>	
	
</body>
</html>
