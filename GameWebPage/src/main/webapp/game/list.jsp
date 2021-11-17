<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="www.gwp.ex.dto.BoardDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="HTML Study">
<meta name="keywords" content="HTML,CSS,XML,JavaScript">
<meta name="author" content="Bruce">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="list.css">
<link href="https://fonts.googleapis.com/css2?family=Anton&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Oswald&display=swap"
	rel="stylesheet">
<title>GAMEGAME!</title>
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
					<li><a href="../member/login.jsp">Login</a></li>
					<li><a href="../member/join.jsp">Join</a></li>
				</ul>
			</div>
		</c:if>
		<c:if test="${userInfo ne null}">
			<div class="topbar">
				<ul>
					<li><a href="../member/modify.jsp">Modify</a></li>
					<li><a href="logout.do">Logout</a></li>
					<c:if test="${userInfo.manage eq 1 }">
						<li><a href="post.jsp">POST</a></li>
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
		<form action="search.do" class="search" method="post">
			<input type="search" name="search" placeholder="search">
		</form>
	</nav>
	<section class="title">
		<h1>${tag}</h1>
	</section>
	<section class="new">
		<h1>Action New Releases</h1>
		<div class="newReleases">
			<c:forEach var="top" items="${toplist }" begin="0" end="2">
			<a href="view.do?b_num=${top.b_num}"> <img alt="${top.title }" src="${top.imgSrc }"> </a>
			</c:forEach>
			<!-- <a href="TribesOfMidgard.html"> <img
				src="img/battlefield1.jpg">
			</a> <a href="PaintTheTownRed.html"> <img
				src="photo/action/Paint the Town Red.jpg">
			</a> <a href="OrcsMustDie3.html"> <img
				src="photo/action/OrcsMustDie3.jpg">
			</a> -->
		</div>
	</section>
	<section class="Top">
		<h1>${tag} Top Seller</h1>
		<table class="topTable">
			<c:forEach var="top" items="${toplist }">
				<tr onclick="location.href='view.do?b_num=${top.b_num}'">
					<td><img src="${top.imgSrc }" alt="${top.title }"></td>
					<td>${top.title }</td>
					<td>${top.price }</td>
				</tr>
			</c:forEach>
		</table>
		<c:set var="curPage" value="${param.curPage }" />
		<c:if test="${curPage eq null }">
			<c:set var="curPage" value="0" />
		</c:if>
		<c:forEach var="i" begin="0" end="${totalPage}" step="1">
			<c:if test="${i eq curPage}">
			${i+1}
		</c:if>
			<c:if test="${i ne curPage}">
				<a href="list.do?curPage=${i}&tag=${request.getParameter('tag')}">${i+1}</a>
			</c:if>
		</c:forEach>
		<!-- 
      <table class="topTable">
        <tr onclick="location.href='GTA.html'" >
          <td> <img src="photo/action/GTA.jpg"> </td>
          <td>Grand Theft Auto V</td>
          <td> <del>₩33,000</del><br>₩16,280</td>
        </tr>
        <tr onclick="location.href='TribesOfMidgard.html'">
          <td> <img src="photo/action/tribesOfMidgard.jpg"> </td>
          <td>Tribes Of Midgard</td>
          <td>₩21,000</td>
        </tr>
        <tr onclick="location.href='Battlefield1.html'">
          <td> <img src="photo/action/battlefield1.jpg"> </td>
          <td>Battlefield1</td>
          <td><del>₩44,000</del><br>₩5,280</td>
        </tr>
        <tr onclick="location.href='DaysGone.html'">
          <td> <img src="photo/action/daysGone.jpg"> </td>
          <td>Days Gone</td>
          <td> <del>₩58,800</del><br>₩47,040</td>
        </tr>
        <tr onclick="location.href='OrcsMustDie3.html'">
          <td> <img src="photo/action/OrcsMustDie3.jpg"> </td>
          <td>Orcs Must Die! 3</td>
          <td>₩31,000</td>
        </tr>
        <tr onclick="location.href='Battlefiled2042.html'">
          <td> <img src="photo/action/Battlefiled2042.jpg"> </td>
          <td>Battlefield™ 2042</td>
          <td>₩66,000</td>
        </tr>
        <tr onclick="location.href='PaintTheTownRed.html'">
          <td> <img src="photo/action/Paint the Town Red.jpg"> </td>
          <td>Paint the Town Red</td>
          <td> <del>₩20,500</del><br>₩15,370 </td>
        </tr>
        <tr onclick="location.href='Chernobylite.html.html'">
          <td> <img src="photo/action/Chernobylite.jpg"> </td>
          <td>Chernobylite</td>
          <td><del>₩35,000</del><br>₩31,500</td>
        </tr>
        <tr onclick="location.href='HellLetLoose.html'">
          <td> <img src="photo/action/Hell Let Loose.jpg"> </td>
          <td>Hell Let Loose</td>
          <td>₩41,000</td>
        </tr>
        <tr onclick="location.href='FallGuys.html'">
          <td> <img src="photo/action/fallGuys.jpg"> </td>
          <td>Fall Guys: Ultimate Knockout</td>
          <td>₩20,500</td>
        </tr>
      </table>
       -->
	</section>
	<footer>GAME</footer>
</body>
</html>