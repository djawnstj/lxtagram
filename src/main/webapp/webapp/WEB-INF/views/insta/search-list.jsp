<%@page import="lx.edu.team2.vo.MemVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<title>Title</title>

<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/common.css">
<link rel="stylesheet" href="resources/css/style.css">
<!--  Font Awesome  -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
<!-- Bootstrap core CSS -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="resources/css/mdb.min.css" rel="stylesheet">


</head>
<body>
	<%
	MemVO vo = (MemVO) session.getAttribute("memVo");
	%>

	<section id="container">


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
						<a class="rightitmes2" href="explorePost.do?memId=<%=vo.memId%>">
							<img class="icons" src="resources/img/explore1.png" alt="explore" style="height: 30px;">
						</a>
					</div>
				</section>
			</nav>
		</header>

		<section id="main_container">

			<div class="inner">

				<div class="contents_box">
					<article class="contents">


						<div class="comment_container"></div>

						<div class="comment_container">
							<div class="comment" id="comment-list-ajax-post37">
								<div class="comment-detail">
									<div class="thumb_user">
										<div class="detail">
											<div class="id">
												<a class="id" href="search-area.do?area=${searchKeyword}">${searchKeyword}</a>
											</div>
											<div class="time">키워드의 지역 검색하기</div>
										</div>
									</div>
								</div>
							</div>
							<div class="small_heart">
								<div class="sprite_small_heart_icon_outline"></div>
							</div>
						</div>

						<div class="comment_container">
							<div class="comment" id="comment-list-ajax-post37">
								<div class="comment-detail">
									<div class="thumb_user">
										<div class="detail">
											<div class="id">
												<a class="id" href="search-tag.do?url=${searchKeyword}">#${searchKeyword}</a>
											</div>
											<div class="time">#해시태그 검색하기</div>
										</div>
									</div>
								</div>
							</div>
							<div class="small_heart">
								<div class="sprite_small_heart_icon_outline"></div>
							</div>
						</div>

					<c:forEach items="${searchMemList}" var="searchMemVo">
						<div class="comment_container">
							<div class="comment" id="comment-list-ajax-post37">
								<div class="comment-detail">
								
									<div class="thumb_user">
										<div class="profile_thumb" style="margin-right: 10px;">
											<img src="${searchMemVo.memImg}" alt="프로필사진"  style="width: 34px; height:34px; object-fit: cover; border-radius: 50%;">
										</div>
										<div class="detail">
											<div class="id">
												<a class="id" href="profile.do?memId=${searchMemVo.memId}">${searchMemVo.memId }</a>
											</div>
											<div class="time">${searchMemVo.memName }</div>
										</div>
									</div>
									
								</div>
							</div>
							<div class="small_heart">
								<div class="sprite_small_heart_icon_outline"></div>
							</div>
						</div>
					</c:forEach>

						<div class="timer"></div>


					</article>
				</div>


				<input type="hidden" id="page" value="1">

				<div class="side_box">
					<div class="user_profile">
						<div class="profile_thumb">
							<img src="<%=vo.memImg%>" alt="프로필사진">
						</div>
						<div class="detail">
							<div class="id m_text">
								<a class="id" href="profile.do?memId=<%=vo.memId%>"><%=vo.memId%></a>
							</div>
							<div class="ko_name"><%=vo.memName%></div>
						</div>
					</div>
				</div>

			</div>
		</section>

	</section>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="resources/js/main.js"></script>
	<script>
	
	
	</script>
</body>
</html>