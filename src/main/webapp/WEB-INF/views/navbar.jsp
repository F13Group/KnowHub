<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="navbar">
		<div class="navbar-inner">
			<a class="brand" href="${pageContext.servletContext.contextPath}">KnowHub</a>
			<ul class="nav">
				<li <sec:authorize access="isAnonymous()">class="inactive"</sec:authorize>><a href="">My Question list</a></li>
				<li><a href="">Tags</a></li>
				<li <sec:authorize access="isAnonymous()">class="inactive"</sec:authorize>><a href="${pageContext.servletContext.contextPath}/myBookmarks">My Bookmarks</a></li>
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