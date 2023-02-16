		function insertH(room_no){
			var roomNo = room_no;
			var user_id = '${loginMember.user_id}';
			var id = 'insertHeart' + roomNo;
			$.ajax({
				url : "insertMyRoom.do",
				data : {user_id:user_id, room_no:roomNo},
				type : "post",
				success : function(result){
					if(result == "ok") {
						$("#"+id).empty();
						$("#"+id).append('<li style="float:right;"id="deleteHeart'+roomNo+'"><button class="heart" onclick="deleteH('+roomNo+')"><img id="like" src="${ pageContext.servletContext.contextPath}/resources/images/하트.png" style="width:20px;height:20px;"></button></li>');
						$("#"+id).show();
					}else {
						alert('잘못된 접근 입니다.');
					}
				},
				error : function(request, status, errorData){
					console.log("error code : " + request.satus + "\nMessage : " + request.responseText + "\nError" + errorData);
				}								
			});
			
		};
		
		function deleteH(room_no){
			var roomNo = room_no;
			var id = 'deleteHeart' + roomNo;
			$.ajax({
				url : "deleteMyRoom.do",
				data : {room_no:roomNo},
				type : "post",
				success : function(result){
					if(result == "ok"){
						$("#"+id).empty();
						$("#"+id).append('<li style="float:right;" id="insertHeart'+roomNo+'"><button class="heart" onclick="insertH('+roomNo+');"><img id="nolike" src="${ pageContext.servletContext.contextPath}/resources/images/빈하트.png" style="width:20px;height:20px;"></button></li>');
						$("#"+id).show();
					}else {
						alert('잘못된 접근 입니다.');
					}
				},
				error : function(request, status, errorData){
					console.log("error code : " + request.satus + "\nMessage : " + request.responseText + "\nError" + errorData);
				}			
			});
			
		}
		
	// 사진 슬라이드
	
	
	var slideIndex = 1;
	function plusSlides(n, roomNo) {
		showSlides(slideIndex += n, roomNo);
	}
	
	function currentSlide(n, roomNo) {
		 showSlides(slideIndex = n, roomNo);
	}
	
	function showSlides(n, roomNo) {
	  var i;
	  var slides = document.getElementsByClassName("mySlides"+roomNo);
	  if (n > slides.length) {slideIndex = 1}    
	  if (n < 1) {slideIndex = slides.length}
	  
	  for (i = 0; i < slides.length; i++) {
	      slides[i].style.display = 'none';  
	  }
	  slides[slideIndex-1].style.display = "block";  
	}