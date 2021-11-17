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
<link rel="stylesheet" href="post.css">
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
	<section>
		<form action="postOK.do" method="post" enctype="multipart/form-data">
			<table class="topTable">
				<caption>WRITE</caption>
				<tr>
					<td>TITLE</td>
					<td><input type="text" name="title"></td>
				</tr>
				<tr>
					<td>IMAGE</td>
					<td>
						<input type="file" value="File Upload" name="imgSrc">
					</td>
				</tr>
				<tr>
					<td>SHORT INTRODUCION</td>
					<td><input type="text" name="sIntro"></td>
				</tr>
				<tr>
					<td>PRICE</td>
					<td><input type="number" name="price"></td>
				</tr>
				<tr>
					<td>TAG</td>
					<td>
						<select name="tag">
							<option value="action">Action</option>
							<option value="adventureCasual">Adventure&Casual</option>
							<option value="rolePlaying">Role-Playing</option>
							<option value="sportsRacing">Sports&Racing</option>
							<option value="simulation">Simulation</option>
							<option value="strategy">Strategy</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>INTRODUCTION</td>
					<td>
						<textarea rows="10" cols="70" name="lIntro"></textarea>
					</td>
				</tr>
					<tr>
						<td><input type="submit" value="POST"></td>
						<td><input type="reset" value="RESET"></td>
					</tr>
			</table>
		</form>
	</section>

	<footer>GAME</footer>
	<!-- 
	<script>
		function fileUpload(){
			window.name = "post.do";
			window.open("<%=request.getContextPath() %>/game/fileUpload.jsp","File UpLoad", "width=400, height=200")
		}
	</script> -->
</body>
</html>