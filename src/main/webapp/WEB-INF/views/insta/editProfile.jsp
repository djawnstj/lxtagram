<%@page import="lx.edu.team2.vo.MemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/styleRegister.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Cookie&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!--  Font Awesome  -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
<!-- Bootstrap core CSS -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="resources/css/mdb.min.css" rel="stylesheet">

<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/common.css">
<link rel="stylesheet" href="resources/css/style.css">
<title>정보수정</title>
</head>

<body>
	<%
	MemVO vo = (MemVO) session.getAttribute("memVo");
	%>
		<header id="header">
			<nav
				class="navbar navbar-expand-lg navbar-dark white fixed-top scrolling-navbar">
				<section class="inner">


					<div id="title">
						<h1>
							<a href="index.do" style="font-size: 35px; color: black;">lxtagram</a>
						</h1>
					</div>

					<form action="search-member.do">
						<div class="search_box">
							<input type="text" placeholder="검색" id="search-field" name="searchMem">
							<div class="fake_field">
								<span class="sprite_small_search_icon"></span> <span>검색</span>
							</div>
						</div>
					</form>

					<div id="icons" class="d-flex align-items-center">
						<a class="rightitmes1" href="post-upload.do">
							<img class="icons" src="resources/img/post.png" alt="post" style="height: 30px;">
						</a>
						<a class="rightitmes2" href="explorePost.do?memId=<%=vo.memId%>">
							<img class="icons" src="resources/img/explore1.png" alt="explore" style="height: 30px;">
						</a>
					</div>
				</section>
			</nav>
		</header>
	<section id="main_container">
		<div class="center" id="container">
			<div class="center" id="main">
				<div id="top" style="width: 340px">
					<form action="edit-action.do" id="signup-form" enctype="multipart/form-data" method="post">
						<div style="height:80px">

							<div class="profile-image" style="width: 80px; height:80px;">

								<img class="proimg" src="${vo.memImg}" alt="프로필사진" style="width: 50px; height: 50px; object-fit: cover; border-radius: 50%;">
								<p>
									<input type="file" name="profilefImg" id="profilefImg" accept="image/jpeg, image/png, image/jpg">
								</p>

							</div>
							<h1>${vo.memId}</h1></br>
						</div>

						<div></div>
						<input type=hidden name="memId" value="${vo.memId}">
						이름<input class="input-field" type="text" name="memName" placeholder="이름" value="${vo.memName}"> 
						소개<input class="input-field" type="text" name="memIntroduce" placeholder="소개" value="${vo.memIntroduce}"> 
						비밀번호<input class="input-field" type="password" name="memPw" placeholder="비밀번호" value="${vo.memPw}"> 
						휴대폰 번호<input class="input-field" type="text" name="memPhone" placeholder="휴대폰 번호" value="${vo.memPhone}"> 
						이메일 주소<input class="input-field" type="text" name="memEmail" placeholder="이메일 주소" value="${vo.memEmail}">

						<button class="btn btn-light" type="submit" value="수정" data-mdb-ripple-color="dark">제출</button>
						
					</form>

					<button class="btn btn-dark" value="수정"  id="memDeleteBtn">회원탈퇴</button>

				</div>

			</div>
			<div id="links">
				<ul>
					<li>소개</li>
					<li>블로그</li>
					<li>채용 정보</li>
					<li>도움말</li>
					<li>API</li>
					<li>개인정보처리방침</li>
					<li>Terms</li>
					<li>인기 계정</li>
					<li>해시태그</li>
					<li>위치</li>
				</ul>
				<div id="copyright">
					<select name="" id="lang">
						<option value="ko">한국어</option>
					</select> &copy; 2021 Spting Team2 Instagram
				</div>
			</div>
		</div>
	</section>
	
		<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="resources/js/editProfile.js">
	</script>
</body>

</html>