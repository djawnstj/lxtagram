let pageMemId = $('#pageMemId').text();
	let loginMemId = $('#loginMemId').val();
	
	$(document).ready(() => {
		checkProfile();
	});
	
	function checkProfile() {
		if(pageMemId==loginMemId){
			$('#profileBtn').text('프로필 편집');
			$('.buttongram').css('background-color', '#f8f9fa');
			$('.buttongram').css('color', 'black');
		} else {
			checkFollowInfo();
		}
	}
	
	function checkFollowInfo() {
		$.ajax({
			url: 'checkFollowInfo.do',
			data: {
				'pageMemId': pageMemId,
				'loginMemId': loginMemId
			},
			dataType: 'json',
			methos: 'post',
			success: setFollowInfo
		});
	}
	
	function setFollowInfo(data) {
		if(data.result==0) {
			// 팔로우 중. 팔로워 버튼
			$('#profileBtn').text('팔로워');
			$('.buttongram').css('background-color', '#f8f9fa');
			$('.buttongram').css('color', 'black');
			
		} else if(data.result==1) {
			// 둘 다 안함. 팔로우 하기 버튼
			$('#profileBtn').text('팔로우');
			$('.buttongram').css('background-color', '#0095f6');
			$('.buttongram').css('color', 'white');
			
		} else if(data.result==2) {
			// 이용자를 팔로우 중. 맞팔 버튼
			$('#profileBtn').text('맞팔로우 하기');
			$('.buttongram').css('background-color', '#0095f6');
			$('.buttongram').css('color', 'white');
		}
		$('#profile-follower').text(data.count);
	};
	
	$(function() {
		$('#profileBtn').on('click', separate);
	});
	
	function separate() {
		if(pageMemId==loginMemId) {
			location.replace('editProfile.do');
		} else {
			insertFollowInfo()
		}
	}
	
	function insertFollowInfo() {
		$.ajax({
			url: 'insertFollowInfo.do',
			data: {
				'pageMemId': pageMemId,
				'loginMemId': loginMemId
			},
			dataType: 'json',
			method: 'post',
			success: checkFollowInfo
		})
	};
	