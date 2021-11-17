<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="HTML Study">
<meta name="keywords" content="HTML,CSS,XML,JavaScript">
<meta name="author" content="Bruce">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="modify.css">
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
				<li><a href="member/login.jsp">Login</a></li>
				<li><a href="member/join.jsp">Join</a></li>
			</ul>
		</div>
		</c:if>
		<c:if test="${userInfo ne null}">
		<div class="topbar">
			<ul>
				<li><a href="modify.jsp">Modify</a></li>
				<li><a href="logout.do">Logout</a></li>
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
	<section class="joinSection">
		<h1>MODIFY</h1>
		<form action="modifyOK.do" method="post" class="join">
			<table>
				<tr>
					<td>ID</td>
					<td><input type="text" id="id" name="id" value="${userInfo.id }" readonly></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" id="pw" name="pw" value="${userInfo.pw }" required></td>
				</tr>
				<tr>
					<td>Password Check</td>
					<td><input type="password" id="pwC" name="pwC" value="${userInfo.pw }" onKeyUp="compare_pw()" required>
					</td>
				</tr>
				<tr>
					<td colspan="2"><span id="pw_result"></span></td>
				</tr>
				<tr>
					<td>email</td>
					<td><input type="email" name="email" id="email" value="${userInfo.email }" ></td>
				</tr>
				<tr>
					<td>birth</td>
					<td><input type="date" name="birth" id="birth" value="${userInfo.birth }" readonly></td>
				</tr>
			</table>
			<input type="submit" value="MODIFY">
		</form>
	</section>
	<script>
		function compare_pw(){
			var pw1 = document.getElementById('pw').value;
			var pw2 = document.getElementById('pwC').value;
			
			if(pw1==pw2){
				document.getElementById('pw_result').innerHTML='비밀번호가 일치합니다.'
			} else {
				document.getElementById('pw_result').innerHTML='비밀번호가 일치하지 않습니다.'
				document.getElementById('pw_result').style.color='red';
			}
		}
	</script>
</body>
</html>