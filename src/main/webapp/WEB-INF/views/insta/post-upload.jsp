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


<title>게시물 등록 - lxtagram</title>
<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/common.css">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/new_post.css">
<link rel="shortcut icon" href="resources/img/instagram.png">
<link rel="stylesheet" href="resources/css/styleRegister.css">
<link rel="stylesheet" href="resources/css/post-upload.css">

<link rel="icon" href="resources/img/favicon.png">


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
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=68a5e13f996f1bec0d4e7fd74ada9d32&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = {
			center : new kakao.maps.LatLng(37.51582211314952, 127.03497469139265), // 지도의 중심좌표
			level : 1
		// 지도의 확대 레벨
		};
		// 지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
		infowindow = new kakao.maps.InfoWindow({
		}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

		// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);

		// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
			searchDetailAddrFromCoords(mouseEvent.latLng, function(result,
					status) {
				if (status === kakao.maps.services.Status.OK) {
					var detailAddr = !!result[0].road_address ? '<div>도로명주소 : '
							+ result[0].road_address.address_name + '</div>'
							: '';
					detailAddr += '<div>지번 주소 : '
							+ result[0].address.address_name + '</div>';
					
					var content = '<div class="bAddr">'
							+ detailAddr + '</div>';
							

							$('#addrInfo').val(result[0].road_address.address_name)

					// 마커를 클릭한 위치에 표시합니다
					marker.setPosition(mouseEvent.latLng);
					marker.setMap(map);

					infowindow.setContent(content);
					infowindow.open(map, marker);
					
				}

				var latlng = mouseEvent.latLng;

				var messageLat = latlng.getLat() 
				var messageLng = latlng.getLng() 
				
				$('#addrLat').val(messageLat)
				$('#addrLng').val(messageLng)

			});


		});

		kakao.maps.event.addListener(map, 'idle', function() {
			searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		});

		function searchAddrFromCoords(coords, callback) {
			// 좌표로 행정동 주소 정보를 요청합니다
			geocoder.coord2RegionCode(coords.getLng(), coords.getLat(),
					callback);
		}

		function searchDetailAddrFromCoords(coords, callback) {
			// 좌표로 법정동 상세 주소 정보를 요청합니다
			geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}

		// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
		function displayCenterInfo(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				var infoDiv = document.getElementById('centerAddr');

				for (var i = 0; i < result.length; i++) {
					// 행정동의 region_type 값은 'H' 이므로
					if (result[i].region_type === 'H') {
						infoDiv.innerHTML = result[i].address_name;
						break;
					}
				}
			}
		}
		
		///////////////////////////////////////////////////////////////////////////////
		
		
		var strByteLength = function(s,b,i,c){
			for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
			return b
		} 
		
		$(function(){
			$("#addrArea").on('keyup', checkAddrArea);
		}) 
		
		function checkAddrArea() {
			let addrArea = $('#addrArea').val();
			addrAreaByte = strByteLength(addrArea);
			if(addrAreaByte>45) {
				$("#addrAreaCheck").text("지역 이름이 너무 깁니다.");
				$("#addrAreaCheck").css("color", "red");
				$("#addrArea").css("color", "red");
				$("#addrArea").css("border","solid");
				$(".submit_btn").prop('disabled', true)
			} else {
				$("#addrAreaCheck").text("");
				$("#addrArea").removeAttr("style")
				$(".submit_btn").prop('disabled', false)
			}
		}

		
		$(function(){
			$("#text_field").on('keyup', checkPost);
		}) 
		
		function checkPost() {
			let post = $('#text_field').val();
			postByte = strByteLength(post);
				if(postByte>13777215) {
					$("#postCheck").text("게시글이 너무 깁니다.");
					$("#postCheck").css("color", "red");
					$("#text_field").css("color", "red");
					$("#text_field").css("border","solid");
				} else {
					$("#postCheck").text("");
					$("#text_field").removeAttr("style")
				}
		}
		
		function fileCheck() {
			var fileCheck = $('#postImg').val();
			let postId = $('#postId').val();
			if(postId==0) {
			    if(!fileCheck){
			        $("#fileCheck").text("사진을 첨부해주세요.");
					$("#fileCheck").css("color", "red");
					$(".submit_btn").prop('disabled', true)
				} else {
					$("#fileCheck").text("");
					$(".submit_btn").prop('disabled', false)
				}
			}
		}
		
		fileCheck();
		
		$(function() {
			$('#postImg').change(function(e) {
				$("#fileCheck").text("");
				$(".submit_btn").prop('disabled', false)
			})
		})
		
	</script>
</body>
</html>