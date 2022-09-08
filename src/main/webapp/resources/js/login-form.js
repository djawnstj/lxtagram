	$(function() {
		$('#loginBtn').on('click', loginCheck);
	});
 	
	function loginCheck() {
		let memId = $('#id-input').val();
		let memPw = $('#pw-input').val();
		
		$.ajax({
			url: 'loginCheck.do',
			data: {
				'memId': memId,
				'memPw': memPw
			},
			dataType: 'json',
			method: 'post',
			success: confirmLoginLocation
		})
	}
	
	function confirmLoginLocation(data) {
		if(data.result==1) {
			location.replace('index.do') 
		} else {
			alert('ID 혹은 비밀번호를 잘못 입력하셨습니다.')
		}
	}