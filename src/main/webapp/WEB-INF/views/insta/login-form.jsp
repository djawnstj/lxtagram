<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">

<link rel="icon" href="resources/img/favicon.png">
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

<title>로그인 - lxtagram</title>
</head>

<body>
	<div class="center" id="container">
		<div class="center" id="main">
			<div id="top" style="width: 340px">
				<div id="title">
					<h1>lxtagram</h1>
				</div>

				<input class="input-field" id="id-input" type="text" name="memId"
					placeholder="사용자이름(ID)"> <input class="input-field"
					id="pw-input" type="password" name="memPw" placeholder="비밀번호">
				<button class="btn-signup" type="submit" value="로그인" id="loginBtn">로그인</button>


				<div id="or">또는</div>

				<div id="fb-login">
					<i class="fa fa-facebook fb-icon" aria-hidden="true"></i>
					Facebook으로 로그인
				</div>


			</div>
			<div class="center" id="bottom">
				<div id="existing-user">
					계정이 없으신가요? <a class="blue-text" href="signup-form.do">회원가입</a>
				</div>
				<div>앱을 다운로드하세요.</div>
				<div class="dl-links">
					<a class="app-dl-links" href="#"><img
						src="https://developer.apple.com/assets/elements/badges/download-on-the-app-store.svg"
						alt=""></a> <a class="app-dl-links" href="#"><img
						src="https://lh3.googleusercontent.com/cjsqrWQKJQp9RFO7-hJ9AfpKzbUb_Y84vXfjlP0iRHBvladwAfXih984olktDhPnFqyZ0nu9A5jvFwOEQPXzv7hr3ce3QVsLN8kQ2Ao=s0"
						alt=""></a>
				</div>

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
				</select> &copy; 2021 Spting Team2 Lxtagram
			</div>
		</div>
	</div>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="resources/js/login-form.js"></script>

</body>

</html>