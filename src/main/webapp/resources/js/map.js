
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
