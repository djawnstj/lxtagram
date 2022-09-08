<%@page import="lx.edu.team2.vo.MemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">


<link rel="icon" href="resources/img/favicon.png">

<!--  Font Awesome  -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
<!-- Bootstrap core CSS -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="resources/css/mdb.min.css" rel="stylesheet">

<% MemVO owner = (MemVO) request.getAttribute("owner"); // 페이지 주인%>

<title><%=owner.memName%>(@<%=owner.memId %>) - lxtagram</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

<link rel="stylesheet" href="resources/css/styleRegister.css">
<link rel="stylesheet" href="resources/css/styleProfile.css">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/styleFollowButton.css">


<script>
	window.console = window.console || function(t) {
	};
</script>



<script>
	if (document.location.search.match(/type=embed/gi)) {
		window.parent.postMessage("resize", "*");
	}
</script>
<style type="text/css">
.profile-image img {
	width: 150px;
	height: 150px;
	object-fit: cover;
	border-radius: 50%;
}
</style>

</head>

<body translate="no">

	<%
	MemVO login = (MemVO) session.getAttribute("memVo"); // 현재 로그인한 사람
	int followCheck = (int) request.getAttribute("followCheck");
	int counterFollowCheck = (int) request.getAttribute("counterFollowCheck");
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
						<a class="rightitmes1" href="post-upload.do?postId=0">
							<img class="icons" src="resources/img/post.png" alt="post" style="height: 30px;">
						</a>
						<a class="rightitmes2" href="explorePost.do?memId=<%=login.memId%>">
							<img class="icons" src="resources/img/explore1.png" alt="explore" style="height: 30px;">
						</a>
					</div>
				</section>
			</nav>
		</header>
	<header>

		<div class="container" style="margin-top: 76px">

			<div class="profile">

				<div class="profile-image">

					<img src="${owner.memImg}" alt="profile-img">

				</div>

				<div class="profile-user-settings">

					<h1 class="profile-user-name" id="pageMemId"  style="color:black;">${owner.memId}</h1>
					<input type="hidden" value="<%=login.memId%>" id="loginMemId">
					<a ><button class="buttongram" id="profileBtn"></button></a>
					

				</div>
				<div class="profile-stats" >

					<ul>
						<li>게시물 <span class="profile-stat-count"  style="color:black;">${postCount}</span></li>
						<li>팔로워 <span class="profile-stat-count" id="profile-follower"  style="color:black;">${follower}</span></li>
						<li>팔로우 <span class="profile-stat-count" id="profile-following"  style="color:black;">${following}</span></li>
					</ul>

			</div>

			<div class="profile-bio">

				<p  style="color:black;">
					<span class="profile-real-name"  style="color:black;">${owner.memName}</span><br>
					${owner.memIntroduce}
				</p>

			</div>

		</div>
		<!-- End of profile section -->

		</div>
		<!-- End of container -->

	</header>


	<hr class="my-5">

	<main>

		<div class="container" >

			<div class="gallery">
				<%
				int postCount = (int) request.getAttribute("postCount");
				if (postCount == 0) {
				%>
				<div class="noPost">
					<!-- 가운데로 옮기고 싶어요 -->
					<img class="noPost" src="resources/img/noPost.png" alt="">

				</div>
				<%
				} else {
				%>
				<c:forEach items="${list}" var="vo">

					<div class="gallery-item" tabindex="0">

						<img src="${vo.postImg}" class="gallery-image" alt=""> <a
							href="post-page.do?postId=${vo.postId}">
							<div class="gallery-item-info" style="color: white;">

								<ul>
									<li class="gallery-item-likes" style="color:white;"><span
										class="visually-hidden">Likes:</span><i class="fas fa-heart"
										aria-hidden="true" style="color:white;"></i> ${vo.sumLike }</li>
									<li class="gallery-item-comments" style="color:white;"><span
										class="visually-hidden">Comments:</span><i
										class="fas fa-comment" aria-hidden="true" style="color:white;"></i>
										${vo.comList.size() }</li>
								</ul>

							</div>
						</a>
					</div>
				</c:forEach>
				<%
				}
				%>


			</div>
			<!-- End of gallery -->
		</div>
		<!-- End of container -->

	</main>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<script>
	let pageMemId = $('#pageMemId').text();
	let loginMemId = $('#loginMemId').val();
	
	$(document).ready(() => {
		checkProfile();
	});
	
	function checkProfile() {
		if(pageMemId==loginMemId){
			$('#profileBtn').text('프로필 편집');
			$('.buttongram').css('background-color', '#f8f9fa');
			$('.buttongram').css('color', 'black');
		} else {
			checkFollowInfo();
		}
	}
	
	function checkFollowInfo() {
		$.ajax({
			url: 'checkFollowInfo.do',
			data: {
				'pageMemId': pageMemId,
				'loginMemId': loginMemId
			},
			dataType: 'json',
			methos: 'post',
			success: setFollowInfo
		});
	}
	
	function setFollowInfo(data) {
		if(data.result==0) {
			// 팔로우 중. 팔로워 버튼
			$('#profileBtn').text('팔로워');
			$('.buttongram').css('background-color', '#f8f9fa');
			$('.buttongram').css('color', 'black');
			
		} else if(data.result==1) {
			// 둘 다 안함. 팔로우 하기 버튼
			$('#profileBtn').text('팔로우');
			$('.buttongram').css('background-color', '#0095f6');
			$('.buttongram').css('color', 'white');
			
		} else if(data.result==2) {
			// 이용자를 팔로우 중. 맞팔 버튼
			$('#profileBtn').text('맞팔로우 하기');
			$('.buttongram').css('background-color', '#0095f6');
			$('.buttongram').css('color', 'white');
		}
		$('#profile-follower').text(data.count);
	};
	
	$(function() {
		$('#profileBtn').on('click', separate);
	});
	
	function separate() {
		if(pageMemId==loginMemId) {
			location.replace('editProfile.do');
		} else {
			insertFollowInfo()
		}
	}
	
	function insertFollowInfo() {
		$.ajax({
			url: 'insertFollowInfo.do',
			data: {
				'pageMemId': pageMemId,
				'loginMemId': loginMemId
			},
			dataType: 'json',
			method: 'post',
			success: checkFollowInfo
		})
	};
	
	</script>

</body>

</html>

