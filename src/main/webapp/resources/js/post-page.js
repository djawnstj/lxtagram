
		$(document).ready(() => {
		//alert('reday() 호출')
		getLikeInfo();
	      });
	
	function setLikeImg(data) {
		var result = JSON.stringify(data);
		$('.likeSum').text(data.likeSum);
		console.log(result);
		if(data.result==1) {	
			likeImg = 'resources/img/like.png';
		} else if(data.result==0) {
			likeImg = 'resources/img/unlike.png';
		}
		$('#likeImg').attr("src", likeImg);
	}
	
	function getLikeInfo() {
		let likeMem = $('#memId').text();
		let likePost = $('#postId').val();
		$.ajax({
			url : 'getLikeInfo.do',
			data: {
				'likeMem': likeMem,
				'likePost': likePost
			},
			dataType : 'json',
			method : 'post',
			success : setLikeImg
		});
	}
	
	function testAjax(data) {
		alert(data.result);
	}
	
	$(function() {
		$('#likeImg').on('click', setLikeInfo);
	});
	
	function setLikeInfo() {
		let likeMem = $('#memId').text();
		let likePost = $('#postId').val();
		$.ajax({
			url: 'setLikeInfo.do',
			data: {
				'likeMem': likeMem,
				'likePost': likePost
			},
			dataType: 'json',
			method: 'post',
			success: setLikeImg
		})
	}

	
	$(function() {
		$('.pushCom').on('click', setCom);
	});

		function setCom() {
			// alert($(this).html())
			let comInput = $('#comment-input').val();
			if(!comInput) {
				alert('값을 입력해주세요.');
				return;
			}
			let comMem = $('#comMem').val();
			let postId = $('#postId').val();
			$.ajax({
				url : 'comment.do',
				data : {
					'comment' : comInput,
					'comMem' : comMem,
					'postId' : postId
				}, // 서버로 전송되는 데이터
				dataType : 'json', /*html, text, json, xml, script*/
				method : 'post',
				success : setComData
			});
		}

		function setComData(data) {
			// alert(JSON.stringify(data));
			var comInfo = JSON.stringify(data);
			console.log(comInfo);
			var content = `<div class="comment_container">
									<div class="comment" id="comment-list-ajax-post37">
										<div class="comment-detail">
											<div class="nick_name m_text">
												<a class="id" href="profile.do?memId=${comVo.comMem}"
													id="comId">\${data.comMem}</a>
											</div>
											<div class="comBox">\${data.comment}</div>
										</div>
									</div>
								</div>`;
			$('#commentBox').append(content);
		}
		
		$(function() {
			$('#deleteBtn').on('click', confrimDelete);
		});
		
		function confrimDelete() {
			let confirmResult = confirm("정말 삭제하시겠습니까?");
			console.log(confirmResult);
			if(confirmResult==true) {
				deletePost();
			} else if(confirmResult==false) {
				alert('취소하셨습니다.');
			}
		}
		
		function deletePost() {
			let postId = $('#postId').val();
			$.ajax({
				url : 'delete-action.do',
				data : {
					'postId' : postId
				},
				dataType : 'json',
				method : 'post',
				success : deleteData
			})
		}
		
		function deleteData(data) {
			var result = JSON.stringify(data);
			console.log(result);
			if (data.result==1) {
				alert("삭제되었습니다.");  
				window.location.href="index.do" ; 
			} else {
				alert("오류가 발생했습니다.");  
			}
		}
		
	