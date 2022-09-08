<%@page import="lx.edu.team2.vo.MemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<link rel="apple-touch-icon" type="image/png"
	href="https://cpwebassets.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png" />
<meta name="apple-mobile-web-app-title" content="CodePen">

<link rel="shortcut icon" type="image/x-icon"
	href="https://cpwebassets.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico" />

<link rel="mask-icon" type=""
	href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg"
	color="#111" />

<!--  Font Awesome  -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
<!-- Bootstrap core CSS -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="resources/css/mdb.min.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/styleRegister.css">



<title>프로필</title>
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


</head>

<body translate="no">

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
	<header>

		<div class="container" style="margin-top: 76px">

			<div class="profile">

				<div class="profile-user-settings">

				</div>
				<div class="profile-stats">


			</div>

			<div class="profile-bio">


			</div>

		</div>
		<!-- End of profile section -->

		</div>
		<!-- End of container -->

	</header>
	
	<hr class="my-5">

	<main>

		<div class="container">

			<div class="gallery">

				<c:forEach items="${postList}" var="vo">

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


			</div>
			<!-- End of gallery -->
		</div>
		<!-- End of container -->

	</main>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<script>
	let count = 21;
	 let isEnd = false;
	    
	    $(function(){
	        $(window).scroll(function(){
	            let $window = $(this);
	            let scrollTop = $window.scrollTop();
	            let windowHeight = $window.height();
	            let documentHeight = $(document).height();
	            
	           /*  console.log("documentHeight:" + documentHeight + " | scrollTop:" + scrollTop + " | windowHeight: " + windowHeight ); */
	            
	            if( scrollTop + windowHeight + 30 > documentHeight ){
	            	count += 21;
	    	        loadingExplorer(count);
	            }
	        })
	        loadingExplorer(count);
	    })
	    
		
		function loadingExplorer(count) {
			let pageNation = count;
			$.ajax({
				url: 'loadingExplorer.do',
				data: {
					'pageNation': pageNation
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
				let comList = Object.keys(data[i].comList).length;
				
				let postBox = `<div class="gallery-item" tabindex="0">

					<img src="\${data[i].postImg}" class="gallery-image" alt=""> <a
						href="post-page.do?postId=\${data[i].postId}">
						<div class="gallery-item-info" style="color: white;">

							<ul>
								<li class="gallery-item-likes" style="color:white;"><span
									class="visually-hidden">Likes:</span><i class="fas fa-heart"
									aria-hidden="true" style="color:white;"></i> \${data[i].sumLike }</li>
								<li class="gallery-item-comments" style="color:white;"><span
									class="visually-hidden">Comments:</span><i
									class="fas fa-comment" aria-hidden="true"></i>
									\${comList }</li>
							</ul>

						</div>
					</a>
				</div>\n`;
				$('.gallery').append(postBox);
			}
			
		}
	
	</script>

</body>

</html>

