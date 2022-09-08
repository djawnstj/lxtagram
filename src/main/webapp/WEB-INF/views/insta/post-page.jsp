<%@page import="lx.edu.team2.vo.PostVO"%>
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
	<%
	MemVO vo = (MemVO) session.getAttribute("memVo");
	PostVO postVo = (PostVO) request.getAttribute("postVo");
	%>
<title>lxtagram의 <%=postVo.memId %>님: <%=postVo.post %></title>

<link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300&display=swap" rel="stylesheet">
   <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
<link rel="icon" href="resources/img/favicon.png">
<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/common.css">
<link rel="stylesheet" href="resources/css/style.css">
<!--  Font Awesome  -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
<link rel="stylesheet" href="resources/css/styleRegister.css">
<!-- Bootstrap core CSS -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="resources/css/mdb.min.css" rel="stylesheet">

</head>
<body>
	


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
						<header class="top">
							<div class="user_container">
								<div class="profile_img">
									<img src="<%=postVo.memImg %>" alt="프로필이미지">
									<input type="hidden" value="${postVo.postId }" id="postId">
								</div>
								<div class="user_name">
									<div class="nick_name m_text">
										<a class="id"
											href="profile.do?memId=<c:out value="${postVo.memId}"/>"><c:out
												value="${postVo.memId}" /></a>
									</div>
								</div>
							</div>
							<c:if  test="${memVo.memId eq postVo.memId }">
							<div class="post_controll">
								<a href="post-upload.do?postId=${postVo.postId}">수정</a>
								<a style="color: red" id="deleteBtn">삭제</a>
							</div>
							</c:if>
							
						</header>

						<div class="img_section">
							<div class="trans_inner">
								<div>
									<img src="<c:out value="${postVo.postImg}"/>" alt="visual01">
								</div>
							</div>
						</div>

						<div class="bottom_icons">
							<div class="left_icons">
								<div class="heart_btn">
									<img src="#" alt="likeBtn" id="likeImg">
								</div>
								<c:if  test="${!empty postVo.addrInfo}">
									<div class="sprite_bubble_icon">
										<a href="search-location.do?location=${postVo.addrInfo}">
											<img src="resources/img/location1.png" alt="locationBtn" id="locationBtn" style="width:25px; height: 25px;" >
										</a>
										<input type="hidden" value="${postVo.addrInfo }">
									</div>
								</c:if>
							</div>

						</div>

						<div class="likes m_text">
							좋아요 <span id="like" class="likeSum"></span> <span
								id="bookmark-count-39"></span> 개
						</div>
						<div></div>

						<div class="comment_container">
							<div class="comment" id="comment-list-ajax-post37">
								<div class="comment-detail">
									<div class="nick_name">
										<div class="user_name">
											<div class="nick_name m_text">
												<a class="id"
													href="profile.do?memId=<c:out value="${postVo.memId}"/>">
													<c:out value="${postVo.memId}" />
												</a>
											</div>
										</div>
										<div><%=postVo.post%></div>
									</div>

								</div>
							</div>
							<div class="small_heart">
								<div class="sprite_small_heart_icon_outline"></div>
							</div>
						</div>

						<div id="commentBox">
							<c:forEach items="${postVo.comList}" var="comVo">
								<div class="comment_container">
									<div class="comment" id="comment-list-ajax-post37">
										<div class="comment-detail">
											<div class="nick_name m_text">
												<a class="id" href="profile.do?memId=${comVo.comMem}"
													id="comId">${comVo.comMem}</a>
											</div>
											<div class="comBox">${comVo.comment }</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>

						<div class="timer">
							<c:out value="${postVo.postTime}" />
						</div>

						<div class="comment_field" id="add-comment-post37">
							<input type="text" placeholder="댓글달기..." id="comment-input"
								required="required">
							<input type="hidden" id="comMem" value="<%=vo.memId %>">
							<div class="upload_btn m_text" data-name="comment">
								<span class="pushCom" id="pushCom">게시</span>
							</div>
						</div>
					</article>
				</div>


				<input type="hidden" id="page" value="1">

				<div class="side_box">
					<div class="user_profile">
						<div class="profile_thumb">
							<img src="${memVo.memImg }" alt="프로필사진">
						</div>
						<div class="detail">
							<div class="id m_text">
								<a class="id" href="profile.do?memId=${memVo.memId}" id="memId">${memVo.memId }</a>
							</div>
							<div class="ko_name">${memVo.memName }</div>
						</div>
					</div>


					<br>

				</div>

			</div>
		</section>

	</section>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="resources/js/post-page.js"></script>
</body>
</html>