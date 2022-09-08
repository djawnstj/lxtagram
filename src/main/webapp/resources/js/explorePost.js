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
	
	