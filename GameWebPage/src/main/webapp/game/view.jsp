<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="HTML Study">
<meta name="keywords" content="HTML,CSS,XML,JavaScript">
<meta name="author" content="Bruce">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="">
<link href="https://fonts.googleapis.com/css2?family=Anton&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Oswald&display=swap"
	rel="stylesheet">
	<link rel="stylesheet" href="view.css">
<title>Insert title here</title>
</head>
<body>
	<header class="head">
		<div class="headMain">
			<h1>
				<a href="../index.do">GAME</a>
			</h1>
		</div>
		<c:if test="${userInfo eq null}">
			<div class="topbar">
				<ul>
					<li><a href="member/login.jsp">Login</a></li>
					<li><a href="member/join.jsp">Join</a></li>
				</ul>
			</div>
		</c:if>
		<c:if test="${userInfo ne null}">
			<div class="topbar">
				<ul>
					<li><a href="member/modify.jsp">Modify</a></li>
					<li><a href="logout.do">Logout</a></li>
					<c:if test="${userInfo.manage eq 1 }">
						<li><a href="game/post.jsp">POST</a></li>
					</c:if>
				</ul>
			</div>
		</c:if>
		<div class="menubar">
			<ul>
				<li class="category"><a href="category.jsp">Category</a>
					<div class="categoryContent">
						<a href="topSeller.jsp">Top Seller</a> <a href="newReleases.jsp">New
							Releases</a>
					</div></li>
				<li class="genre"><a href="genre.jsp">Genre</a>
					<div class="genreContent">
						<a href="list.do?tag=action">Action</a>
						<a href="list.do?tag=adventureCasual">Adventure&Casual</a>
						<a href="list.do?tag=rolePlaying">Role-Playing</a>
						<a href="list.do?tag=sportsRacing">Sports&Racing</a>
						<a href="list.do?tag=simulation">Simulation</a>
						<a href="list.do?tag=strategy">Strategy</a>
					</div></li>
				<li><a href="specials.jsp">current specials</a></li>
				<li><a href="news.jsp">news</a></li>
			</ul>
		</div>
	</header>
	<nav>
		<form class="search" method="post">
			<input type="search" name="q" placeholder="search">
		</form>
	</nav>
	<section>
		<form action="modifyPage.jsp" method="post">
			<table class="topTable">
				<tr>
					<td>${dto.title }</td>
				</tr>
				<tr>
					<td rowspan="3"><img alt="${dto.title }"
						src="${dto.imgSrc }"></td>
					<td>${dto.sIntro }</td>
				</tr>
				<tr>
					<td>${dto.price }</td>
				</tr>
				<tr>
					<td><a href="list.do?tag=${dto.tag }">${dto.tag }</a></td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="BUY"></td>
				</tr>
				<tr>
					<td colspan="2"><textarea rows="10" cols="70" readonly>${dto.lIntro }</textarea></td>
				</tr>
				<c:if test="${userInfo.manage eq 1 }">
					<tr>
						<td><input type="submit" value="MODIFY"></td>
						<input type="hidden" value="${dto.b_num }" name="b_num">
						<td><a href="delete.do?b_num=${dto.b_num }">DELETE</a>
					</tr>
				</c:if>
			</table>
		</form>
	</section>

	<footer>GAME</footer>
</body>
</html>