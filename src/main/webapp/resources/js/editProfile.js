$(function() {
		$('#memDeleteBtn').on('click', confrimDelete);
	});
	
	function confrimDelete() {
		let confirmResult = confirm("회원 탈퇴를 하시면 기존의 게시글, 댓글 등 모든 정보가 삭제됩니다. \n정말 탈퇴하시겠습니까?");
		console.log(confirmResult);
		if(confirmResult==true) {
			 location.replace('delete.do');
		} else if(confirmResult==false) {
			alert('취소하셨습니다.');
		}
	}
