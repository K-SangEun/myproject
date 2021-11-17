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
<link rel="stylesheet" href="login.css">
<link href="https://fonts.googleapis.com/css2?family=Anton&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Oswald&display=swap"
	rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<header class="head">
		<div class="headMain">
			<h1>
				<a href="../index.do">GAME</a>
			</h1>
		</div>
		<div class="topbar">
			<ul>
				<li><a href="login.jsp">Login</a></li>
				<li><a href="join.jsp">Join</a></li>
			</ul>
		</div>
		<div class="menubar">
			<ul>
				<li class="category"><a href="category.jsp">Category</a>
					<div class="categoryContent">
						<a href="topSeller.jsp">Top Seller</a> <a href="newReleases.jsp">New
							Releases</a>
					</div></li>
				<li class="genre"><a href="genre.jsp">Genre</a>
					<div class="genreContent">
						<a href="action.jsp">Action</a> <a href="adventureCasual.jsp">Adventure&Casual</a>
						<a href="rolePlaying.jsp">Role-Playing</a> <a
							href="sportsRacing.jsp">Sports&Racing</a> <a
							href="simulation.jsp">Simulation</a> <a href="strategy.jsp">Strategy</a>
					</div></li>
				<li><a href="specials.jsp">current specials</a></li>
				<li><a href="news.jsp">news</a></li>
			</ul>
		</div>
	</header>
	<section class="loginall">
		<div class="loginSpace">
			<h1>Login</h1>
			<form action="loginOK.do" method="post">
				<div class="id">
					<p>ID</p>
					<input type="text" id="id" placeholder="id" name="id">
				</div>
				<div class="id">
					<p>PW</p>
					<input type="password" id="pw" placeholder="password" name="pw">
				</div>
				<input type="submit" value="LOGIN">
			</form>
		</div>
		<div class="joinSpace">
			<p>
				It's free and easy to use. > <a href="join.jsp">join</a>
			</p>
		</div>
	</section>
</body>
</body>
</html>