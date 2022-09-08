<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

<!-- Facebook Meta Tags / 페이스북 오픈 그래프 -->
<meta property="og:url" content="http://kindtiger.dothome.co.kr/insta">
<meta property="og:type" content="website">
<meta property="og:title" content="instagram">
<meta property="og:description" content="instagram clone">
<meta property="og:image"
	content="http://kindtiger.dothome.co.kr/insta/imgs/instagram.jpeg">
.
<!-- Twitter Meta Tags / 트위터 -->
<meta name="twitter:card" content="instagram clone">
<meta name="twitter:title" content="instagram">
<meta name="twitter:description" content="instagram clone">
<meta name="twitter:image"
	content="http://kindtiger.dothome.co.kr/insta/imgs/instagram.jpeg">

<!-- Google / Search Engine Tags / 구글 검색 엔진 -->
<meta itemprop="name" content="instagram">
<meta itemprop="description" content="instagram clone">
<meta itemprop="image"
	content="http://kindtiger.dothome.co.kr/insta/imgs/instagram.jpeg">


<title>lxtagram</title>
<link rel="stylesheet" href="resources/css/map.css">
<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/common.css">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/new_post.css">
<link rel="shortcut icon" href="resources/img/instagram.png">
<link rel="stylesheet" href="resources/css/styleRegister.css">

<style>
</style>

</head>
<body>
	<%
	String memId = (String) session.getAttribute("memId");
	%>

	<section id="container" style="color:black;">


		<div id="main_container_without_nav">

			<div class="post_form_container">
					<input type="hidden" id="postId" value=${postId}>
				<form action="post-upload-action.do?receivedPostId=${postId}" class="post_form"
					enctype="multipart/form-data" method="post">
					<div class="title" style="color:black;">POST UPLOAD</div>

					<div class="map_wrap">
						<div id="map"
							style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
						<div class="hAddr">
							 <span class="title_addr"></span> <span
								id="centerAddr"></span>
						</div>
					</div>
					<div class="center">
						<input class="input-field" id="addrArea"  name="addrArea" placeholder="지역 이름">
						<div id="addrAreaCheck"></div>
					</div>
					<input type="hidden" id="addrLat" name="addrLat">
					<input type="hidden" id="addrLng" name="addrLng">
					<input type="hidden" id="addrInfo" name="addrInfo">

					<p>
						<c:if test="${postId eq 0 }">
							<input type="file" name="postImg" id="postImg" accept="image/jpeg, image/png, image/jpg">
						</c:if>
					</p>
						<c:if test="${postId eq 0 }">
							<div id="fileCheck"></div>
						</c:if>
					<p>
						<textarea name="post" id="text_field" cols="50" rows="5"
							placeholder="#태그를 등록해주세요.
예시 : I # love # insta!"></textarea>
					</p>
					<div id="postCheck"></div>
					<input class="submit_btn" type="submit" value="저장">
				</form>

			</div>

		</div>


	</section>

	<script
		src="resources/js/map.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=68a5e13f996f1bec0d4e7fd74ada9d32&libraries=services"></script>
	<script src="resources/js/map.js">
	</script>
</body>
</html>