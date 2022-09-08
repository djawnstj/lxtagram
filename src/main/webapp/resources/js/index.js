let count = 5;
let isEnd = false;

$(function () {
	$(window).scroll(function () {
		let $window = $(this);
		let scrollTop = $window.scrollTop();
		let windowHeight = $window.height();
		let documentHeight = $(document).height();

		/*  console.log("documentHeight:" + documentHeight + " | scrollTop:" + scrollTop + " | windowHeight: " + windowHeight ); */

		if (scrollTop + windowHeight + 30 > documentHeight) {
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
	for (let i = 0; i <= size - 1; i++) {
		let postBox = `<article class="contents">
					<header class="top">
					<div class="user_container">
						<div class="profile_img">
							<img src="\${data[i].memImg}" alt="프로필이미지">
						</div>
						<div class="user_name">
							<div class="nick_name m_text">
								<a class="id" href="profile.do?memId=\${data[i].memId}">\${data[i].memId}</a>
							</div>
						</div>

					</div>


					<div class="post_controll">
						<a href="post-page.do?postId=\${data[i].postId}">보기</a>
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
					좋아요 <span id="like" style="color: black;">\${data[i].sumLike}</span> <span
						id="bookmark-count-39"></span> 개
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
		for (let k = 0; k <= comSize - 1; k++) {
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