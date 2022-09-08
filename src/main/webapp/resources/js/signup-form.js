$(function(){
		$("#memName").on('keyup', checkMemName);
	}) 
   
	$(function(){
		$("#memId").on('keyup', checkMemId);
	})
    
	$(function(){
		$("#memPw").on('keyup', checkMemPw);
	})
   
	$(function(){
		$("#memPhone").on('keyup', checkMemPhone);
	})
   
	$(function(){
		$("#memEmail").on('keyup', checkMemEmail);
	})
	 
	function checkMemName() {
		let memName = $('#memName').val();
		memNameByte = strByteLength(memName);
		if(memNameByte>15) {
			$("#name_check").text("이름은 한글 5자 또는 영문 15자 이내로 설정해주세요.");
			$("#name_check").css("color", "red");
			$("#memName").css("color", "red");
			$("#memName").css("border","solid");
			$("#signup_submit").prop('disabled', true)
		} else {
			$("#name_check").text("");
			$("#memName").removeAttr("style")
			$("#signup_submit").prop('disabled', false)
		}
	}
	
	function checkMemPw() {
		let memPw = $('#memPw').val();
		memPwByte = strByteLength(memPw);
		if(memPwByte>45) {
			$("#pw_check").text("비밀번호는 영문, 숫자, 특수문자 45자 이내로 설정해주세요.");
			$("#pw_check").css("color", "red");
			$("#memPw").css("color", "red");
			$("#memPw").css("border","solid");
			$("#signup_submit").prop('disabled', true)
		} else {
			$("#pw_check").text("");
			$("#memPw").removeAttr("style")
			$("#signup_submit").prop('disabled', false)
		}
	}
	
	function checkMemPhone() {
		let memPhone = $('#memPhone').val();
		memPhoneByte = strByteLength(memPhone);
		if(memPhoneByte>45) {
			$("#phone_check").text("전화번호가 너무 깁니다. 다시 확인해주세요.");
			$("#phone_check").css("color", "red");
			$("#memPhone").css("color", "red");
			$("#memPhone").css("border","solid");
			$("#signup_submit").prop('disabled', true)
		} else {
			$("#phone_check").text("");
			$("#memPhone").removeAttr("style")
			$("#signup_submit").prop('disabled', false)
		}
	}
	
	function checkMemEmail() {
		let memEmail = $('#memEmail').val();
		memEmailByte = strByteLength(memEmail);
		if(memEmailByte>100) {
			$("#email_check").text("이메일이 너무 깁니다. 다시 확인해주세요.");
			$("#email_check").css("color", "red");
			$("#memEmail").css("color", "red");
			$("#memEmail").css("border","solid");
			$("#signup_submit").prop('disabled', true)
		} else {
			$("#email_check").text("");
			$("#memEmail").removeAttr("style")
			$("#signup_submit").prop('disabled', false)
		}
	}
	
		function checkMemId() {

			let memId = $('#memId').val();
			$.ajax({
				url: 'checkMemId.do',
				data: {
					'memId': memId
				},
				dataType: 'json',
				method: 'post',
				success: checkMemInfo
			})
		}

		function checkMemInfo(data) {		
				if (data.result == 1) {
						$("#id_check").text("사용중인 아이디입니다.");
						$("#id_check").css("color", "red");
						$("#memId").css("color", "red");
						$("#memId").css("border","solid");
						$("#signup_submit").prop('disabled', true)
					}  else {
						let memId = $('#memId').val();
						memIdByte = strByteLength(memId);
						if(memIdByte>20) {
							$("#id_check").text("아이디를 20자 이내로 설정해주세요.");
							$("#id_check").css("color", "red");
							$("#memId").css("color", "red");
							$("#memId").css("border","solid");
							$("#signup_submit").prop('disabled', true)
						} else {
							$("#id_check").text("");
							$("#memId").removeAttr("style")
							$("#signup_submit").prop('disabled', false)
						}
					} 
				}
		
 		var strByteLength = function(s,b,i,c){
			  for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
			  return b
		} 