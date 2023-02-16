<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
<!--=============== basic  ===============-->
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="robots" content="index, follow" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<!--=============== css  ===============-->
<link type="text/css" rel="stylesheet" href="resources/css/reset.css">
<link type="text/css" rel="stylesheet" href="resources/css/plugins.css">
<link type="text/css" rel="stylesheet" href="resources/css/style.css">
<link type="text/css" rel="stylesheet" href="resources/css/color.css">
<!--=============== favicons ===============-->
<link rel="shortcut icon" href="resources/images/favicon.png">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"></script>



<script>
	$(function() {
		 var rating = $('.review .rating');

		rating.each(function() {
			var targetScore = $(this).attr('data-rate');
			$(this).find('svg:nth-child(-n+' + targerScore + ')').css({
				color : '#F05522'
			});
		});
 		
 		
		var userScore = $('#makeStar');
		userScore.change(function() {
			var userScoreNum = $(this).val(); 
			console.log(userScoreNum);
			$('.make_star svg').css({
				color : '#000'
			});
			$('.make_star svg:nth-child(-n+' + userScoreNum + ')').css({
				color : '#F05522'
			});
		});

		$('.make_star svg').click(function() {
			var targetNum = $(this).index() + 1;
			$('.make_star svg').css({
				color : '#000'
			});
			$('.make_star svg:nth-child(-n+' + targerNum + ')').css({
				color : '#F05522'
			});
		});

		var userScore = $('#makeStar1');
		userScore.change(function() {
			var userScoreNum = $(this).val();
			console.log(userScoreNum);
			$('.make_star1 svg').css({
				color : '#000'
			});
			$('.make_star1 svg:nth-child(-n+' + userScoreNum + ')').css({
				color : '#F05522'
			});
		});

		$('.make_star1 svg').click(function() {
			var targetNum = $(this).index() + 1;
			$('.make_star1 svg').css({
				color : '#000'
			});
			$('.make_star1 svg:nth-child(-n+' + targerNum + ')').css({
				color : '#F05522'
			});
		});

		var userScore = $('#makeStar2');
		userScore.change(function() {
			var userScoreNum = $(this).val();
			console.log(userScoreNum);
			$('.make_star2 svg').css({
				color : '#000'
			});
			$('.make_star2 svg:nth-child(-n+' + userScoreNum + ')').css({
				color : '#F05522'
			});
		});

		$('.make_star2 svg').click(function() {
			var targetNum = $(this).index() + 1;
			$('.make_star2 svg').css({
				color : '#000'
			});
			$('.make_star2 svg:nth-child(-n+' + targerNum + ')').css({
				color : '#F05522'
			});
		});

	});
</script>
<script>
	window.onload=function(){
		var popbtn = document.getElementById('popbtn');
		popbtn.onclick=function(){
			document.replyForm.target = opener.name;
			document.replyForm.submit();
			self.close();
		}
	};
</script>
<style type="text/css">
._cvx08b {
	margin-bottom: 12px !important;
}

._cvx08b1 {
	margin-bottom: 12px !important;
	margin-left: 270px;
}

._a3qxec {
	-webkit-box-pack: justify !important;
	-webkit-box-align: center !important;
	display: flex !important;
	align-items: center !important;
	justify-content: space-between !important;
	width: 100% !important;
}

._y1ba89 {
	width: 100% !important;
	overflow: hidden !important;
	text-overflow: ellipsis !important;
	white-space: nowrap !important;
}
</style>
</head>
<body>
	<div class="list-single-main-item fl-wrap" id="sec5">
		<div class="list-single-main-item-title fl-wrap">
			<h3>별점을 다시 체크해주세요.</h3>
		</div>
		<!-- Add Review Box -->
		<form action="reup.do" name="replyForm" method="post" class="add-comment custom-form">
		<input type="hidden" name="room_no" value="${ room_no }"> 
		<input type="hidden" name="user_id" value="${ loginMember.user_id }">
		<input type="hidden" name="reply_no" value="${ review.reply_no }">
		<div class="make_star">
			<div class="_cvx08b">
				<div class="_a3qxec">
					<h4>청결도</h4>
					<div class="_cvx08b1">
						<select name="clean_score" id="makeStar">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>
						<div class="rating" data-rate="3">
							<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
								class="fas fa-star"></i> <i class="fas fa-star"></i> <i
								class="fas fa-star"></i>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="make_star1">
			<div class="_cvx08b">
				<div class="_a3qxec">
					<h4>가격대비 만족도</h4>
					<div class="_cvx08b1">
						<select name="value_score" id="makeStar1">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>
						<div class="rating" data-rate="3">
							<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
								class="fas fa-star"></i> <i class="fas fa-star"></i> <i
								class="fas fa-star"></i>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="make_star2">
			<div class="_cvx08b">
				<div class="_a3qxec">
					<h4>서비스</h4>
					<div class="_cvx08b">
						<div class="_1byskwn">
							<select name="service_score" id="makeStar2">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
							</select>
							<div class="rating" data-rate="3">
								<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
									class="fas fa-star"></i> <i class="fas fa-star"></i> <i
									class="fas fa-star"></i>
							</div>
						</div>
					</div>

				</div>
			</div>
			<!-- Review Comment -->		
				<fieldset>
					<textarea cols="40" rows="3" placeholder="Review:" name="review_content">${review.review_content}</textarea>
				</fieldset>
				<button class="btn  big-btn  color-bg flat-btn" id="popbtn">리뷰 수정</button>			
		</div>
		</form>
		<!-- Add Review Box / End -->
	</div>
	<!-- list-single-main-item end -->
</body>
</html>
