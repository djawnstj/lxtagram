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
<title>lxtagram</title>

<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/common.css">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="icon" href="resources/img/favicon.png">
<link rel="stylesheet" href="resources/css/styleRegister.css">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Cookie&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="instagram-icon" href="./resources/img/favicon.png">


<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<!--  Font Awesome  -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
<!-- Bootstrap core CSS -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="resources/css/mdb.min.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

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
							<input type="text" placeholder="??????" id="search-field" name="searchMem">
							<div class="fake_field">
								<span class="sprite_small_search_icon"></span> <span>??????</span>
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
			<c:if test="${tag ne null }"> 
				<input type="hidden" id="tag" value=${tag}>
			</c:if>
			<c:if test="${area ne null }"> 
				<input type="hidden" id="area" value=${area}>
			</c:if>
			<c:if test="${location ne null }"> 
				<input type="hidden" id="area" value=${location}>
			</c:if>
				<div class="contents_box">
					<c:forEach items="${postList}" var="vo">

						<article class="contents">
							<header class="top">
								<div class="user_container">
									<div class="profile_img">
										<img src="${vo.memImg}" alt="??????????????????">
									</div>
									<div class="user_name">
										<div class="nick_name m_text">
											<a class="id" href="profile.do?memId=${vo.memId}">${vo.memId }</a>
										</div>
									</div>

								</div>


								<div class="post_controll">
									<a href="post-page.do?postId=${vo.postId}">??????</a>
								</div>


							</header>

							<div class="img_section">
								<div class="trans_inner">
									<div>
										<img src="${vo.postImg }" alt="visual01">
									</div>
								</div>
							</div>

							<div class="likes m_text" style="color: black;">
								????????? <span id="like" style="color: black;">${vo.sumLike}</span> <span
									id="bookmark-count-39"></span> ???
							</div>
							<div></div>

							<div class="comment_container">
								<div class="comment" id="comment-list-ajax-post37">
									<div class="comment-detail">
										<div class="nick_name">
											<div class="user_name">
												<div class="nick_name m_text">
													<a class="id" href="profile.do?memId=${vo.memId}">${vo.memId }</a>
													<input type="hidden" value="${vo.postId}" id="postId">
												</div>
											</div>
											<div style="color: black;">${vo.post }</div>
										</div>

									</div>
								</div>
								<div class="small_heart">
									<div class="sprite_small_heart_icon_outline"></div>
								</div>
							</div>
							<c:forEach items="${vo.comList}" var="comVo">
								<div class="comment_container">
									<div class="comment" id="comment-list-ajax-post37">
										<div class="comment-detail">
											<div class="nick_name m_text">
												<a class="id" href="profile.do?memId=${comVo.comMem}"
													id="comId">${comVo.comMem}</a>
											</div>
											<div class="comBox" style="color: black;">${comVo.comment }</div>
										</div>
									</div>
								</div>
							</c:forEach>
							<div class="timer">${vo.postTime }</div>

						</article>
					</c:forEach>
				</div>


				<input type="hidden" id="page" value="1">

				<div class="side_box">
					<div class="user_profile">
						<div class="profile_thumb" style="width: 40px; height: 40px;">
								<img src="<%=vo.memImg%>" alt="???????????????">

						</div>
						<div class="detail">
							<div class="id m_text">
								<a class="id" href="profile.do?memId=<%=vo.memId%>"><%=vo.memId%></a>
								<a href="logout.do" style="color:red;">????????????</a>
							</div>
							<div class="ko_name"><%=vo.memName%></div>
						</div>
					</div>

					<article class="story">
						<header class="story_header">
							<div class="id"><%=vo.memId%>?????? ?????? ??????
							</div>
							<div class="post_controll">
								<a href="mypage.do"></a>
							</div>
						</header>

						<div>
							<c:forEach items="${memRecomendList}" var="memVo" end="2">
								<div class="thumb_user">
									<div class="profile_thumb">
										<img src="${memVo.memImg}" alt="???????????????">
									</div>
									<div class="detail">
										<div class="id">
											<a class="id" href="profile.do?memId=${memVo.memId}">${memVo.memId }</a>
										</div>
										<div class="time">${memVo.memName }</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</article>
					<br>

				</div>

			</div>
		</section>

	</section>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="resources/js/main.js"></script>
	<script>
	let count = 5;
	 let isEnd = false;
	    
	    $(function(){
	        $(window).scroll(function(){
	            let $window = $(this);
	            let scrollTop = $window.scrollTop();
	            let windowHeight = $window.height();
	            let documentHeight = $(document).height();
	            
	           /*  console.log("documentHeight:" + documentHeight + " | scrollTop:" + scrollTop + " | windowHeight: " + windowHeight ); */
	            
	            if( scrollTop + windowHeight + 30 > documentHeight ){
	            	count += 5;
	    	        loadingPost(count);
	            }
	        })
	        loadingPost(count);
	    })
	    
		
		function loadingPost(count) {
			let pageNation = count;
			let tag = $('#tag').val();
			let area = $('#area').val();
			let location = $('#location').val();
			$.ajax({
				url: 'loadingPost.do',
				data: {
					'pageNation': pageNation,
					'location': location,
					'area': area,
					'tag': tag
					
				},
				dataType: 'json',
				method: 'post',
				success: setPost
			})
		}
		
		function setPost(data) {
			let size = Object.keys(data).length;
			console.log(Object.keys(data).length);
			for(let i=0;i<=size-1; i++) {
				let postBox = `<article class="contents">
					<header class="top">
					<div class="user_container">
						<div class="profile_img">
							<img src="\${data[i].memImg}" alt="??????????????????">
						</div>
						<div class="user_name">
							<div class="nick_name m_text">
								<a class="id" href="profile.do?memId=\${data[i].memId}">\${data[i].memId}</a>
							</div>
						</div>

					</div>


					<div class="post_controll">
						<a href="post-page.do?postId=\${data[i].postId}">??????</a>
					</div>


				</header>

				<div class="img_section">
					<div class="trans_inner">
						<div>
							<img src="\${data[i].postImg}" alt="visual01">
						</div>
					</div>
				</div>

				<div class="likes m_text" style="color: black;">
					????????? <span id="like" style="color: black;">\${data[i].sumLike}</span> <span
						id="bookmark-count-39"></span> ???
				</div>
				<div></div>

				<div class="comment_container">
					<div class="comment" id="comment-list-ajax-post37">
						<div class="comment-detail">
							<div class="nick_name">
								<div class="user_name">
									<div class="nick_name m_text">
										<a class="id" href="profile.do?memId=\${data[i].memId}">\${data[i].memId}</a>
										<input type="hidden" value="\${data[i].postId}" id="postId">
									</div>
								</div>
								<div style="color: black;">\${data[i].post}</div>
							</div>

						</div>
					</div>
					<div class="small_heart">
						<div class="sprite_small_heart_icon_outline"></div>
					</div>
				</div>\n`
				let comSize = Object.keys(data[i].comList).length;
				for(let k = 0; k<=comSize-1; k++) {
					postBox = postBox + `<div class="comment_container">
					<div class="comment" id="comment-list-ajax-post37">
					<div class="comment-detail">
						<div class="nick_name m_text">
							<a class="id" href="profile.do?memId=\${data[i].comList[k].comMem}"
								id="comId">\${data[i].comList[k].comMem}</a>
						</div>
						<div class="comBox" style="color: black;">\${data[i].comList[k].comment}</div>
					</div>
				</div>
			</div>\n`
				}
				
				postBox = postBox + `<div class="timer">\${data[i].postTime}</div>
			</article>`;
				$('.contents_box').append(postBox);
			}
			
		}
	</script>
</body>
</html>