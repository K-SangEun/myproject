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
<link rel="stylesheet" href="index.css">
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
				<a href="index.do">GAME</a>
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
						<a href="game/topSeller.jsp">Top Seller</a> <a href="newReleases.jsp">New
							Releases</a>
					</div></li>
				<li class="genre"><a href="genre.jsp">Genre</a>
					<div class="genreContent">
						<a href="game/list.do?tag=action">Action</a>
						<a href="game/list.do?tag=adventureCasual">Adventure&Casual</a>
						<a href="game/list.do?tag=rolePlaying">Role-Playing</a>
						<a href="game/list.do?tag=sportsRacing">Sports&Racing</a>
						<a href="game/list.do?tag=simulation">Simulation</a>
						<a href="game/list.do?tag=strategy">Strategy</a>
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
		<div class="recommended">
			<div class="recommendedTop">
				<p>CATEGORY RECOMMENDED</p>
				<button type="button" onclick="location.href='category.jsp'">MORE</button>
			</div>
			<div class="recommendedContent">
				<!-- <button type="button" onclick="changePic(0)"><</button> -->
				<a href="game/view.do?b_num=${topdto.b_num }" id="gameLink"><img
					src="game/${topdto.imgSrc }" id="gamePhoto"></a>
				<!-- <button type="button" onclick="changePic(1)">></button> -->
			</div>
		</div>
	</section>
	<section>
		<div class="genreRecommended">
			<p>Genre</p>
			<button type="button" onclick="location.href='genre.jsp'">MORE</button>
			<div class="actionContent">
				<p>Action</p>
				<a href="game/view.do?b_num=${action.b_num }"> <img src="game/${action.imgSrc }"></a>
				<button type="button" onclick="location.href='game/list.do?tag=action'">MORE</button>
			</div>
			<div class="adventureCasualContent">
				<p>Adventure&Casual</p>
				<a href="game/view.do?b_num=${adventureCasual.b_num }"> <img
					src="game/${adventureCasual.imgSrc }">
				</a>
				<button type="button" onclick="location.href='game/list.do?tag=adventureCasual'">
					MORE</a>
				</button>
			</div>
			<div class="roleContent">
				<p>Role-Playing</p>
				<a href="game/view.do?b_num=${rolePlaying.b_num }"> <img
					src="game/${rolePlaying.imgSrc }">
				</a>
				<button type="button" onclick="location.href='game/list.do?tag=rolePlaying'">
					MORE</a>
				</button>
			</div>
			<div class="sportsRacingContent">
				<p>Sports&Racing</p>
				<a href="game/view.do?b_num=${sportsRacing.b_num }"> <img
					src="game/${sportsRacing.imgSrc }">
				</a>
				<button type="button" onclick="location.href='game/list.do?tag=sportsRacing'">
					MORE</a>
				</button>
			</div>
			<div class="simulationContent">
				<p>Simulation</p>
				<a href="game/view.do?b_num=${simulation.b_num }"> <img src="game/${simulation.imgSrc }">
				</a>
				<button type="button" onclick="location.href='game/list.do?tag=simulation'">
					MORE</a>
				</button>
			</div>
			<div class="strategyContent">
				<p>Strategy</p>
				<a href="game/view.do?b_num=${strategy.b_num }"> <img src="game/${strategy.imgSrc }">
				</a>
				<button type="button" onclick="location.href='game/list.do?tag=strategy'">
					MORE</a>
				</button>
			</div>
		</div>
	</section>
	<footer>GAME</footer>
	
	<script type="text/javascript">
	/*var num = 0;
		function changePic(idx) {
			if (idx == 1) {
				if (num == 4) {
					num = 0;
				} else {
					num++;
				}
			} else {
				if (num == 0) {
					num = 4
				} else {
					num--;
				}
			}
			var imgTag = document.getElementById("gamePhoto");
			var linkTag = document.getElementById("gameLink");
			imgTag.setAttribute("src", 0);
			linkTag.setAttribute("href", 0);
		}

		$(document).ready(function(){
		  var navHeight = $(".head").height();
		  $(".scrollMenubar").hide();
		  $(window).scroll(function(){
		    var rollIt = $(this).scrollTop() >= navHeight;
		    if(rollIt){
		      $(".scrollMenubar").show().css({"position":"fixed"});
		    }
		    else{
		      $(".scrollMenubar").hide();
		    }
		  });
		});*/
	</script>
</body>
</html>