<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<!--=============== basic  ===============-->
<meta charset="UTF-8">
<title>JejuBnB</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="robots" content="index, follow" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<!--=============== css  ===============-->
<link type="text/css" rel="stylesheet" href="css/reset.css">
<link type="text/css" rel="stylesheet" href="css/plugins.css">
<link type="text/css" rel="stylesheet" href="css/style.css">
<link type="text/css" rel="stylesheet" href="css/color.css">
<!--=============== favicons ===============-->
<link rel="shortcut icon" href="images/favicon.ico">
 <link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">
<style type="text/css">
#accordian {
	background: #333333;
	width: 600px;
	margin: 10px auto 0 auto;
	color: white;
	box-shadow: 0 5px 15px 1px rgba(0, 0, 0, 0.6), 0 0 200px 1px
		rgba(255, 255, 255, 0.5);
	/* text-align: center; */
	margin-left: 20%;
} /* 메뉴 스타일 */
#accordian h3 {
	font-size: 12px;
	line-height: 34px;
	padding: 0 10px;
	cursor: pointer;
	background: #4DB7FE;
	border: 1px solid #eee;
	padding: 18px 30px;
	float: left;
	width: 100%;
	position: relative;
	border-radius: 4px;
	box-sizing: border-box;
	text-align: left;
	font-weight: 500;
	font-size: 13px;
	transition: all 300ms linear;
	margin-bottom: 15px;
}

#accordian h3:hover {
	text-shadow: 0 0 1px rgba(255, 255, 255, 0.7);
}
/* 아이콘폰트 스타일 */
#accordian h3 span {
	font-size: 16px;
	margin-right: 5px;
}

#accordian li {
	list-style-type: none;
} /* 서브메뉴 스타일 */
#accordian ul li h3 li a {
	color: white;
	text-decoration: none;
	font-size: 11px;
	line-height: 27px;
	display: block;
	padding: 0 0px;
	-webkit-transition: all 0.15s;
	-moz-transition: all 0.15s;
	-o-transition: all 0.15s;
	-ms-transition: all 0.15s;
	transition: all 0.15s;
}

#accordian ul li h3 li a:hover {
	background: #4DB7FE;
	border-left: 5px solid #09c;
} /* active 클래스 외에 것은 보이지 않게 하기 */
#accordian ul ul {
	display: none;
}

#accordian li.active ul {
	display: block;
}
</style>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery-3.5.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(function() {
})

 function updateCountGo(number){
		
			$("#accordian ul ul").slideUp();
			if (!$(this).next().is(":visible")) {
				$("#accordian h3").next().slideDown();
				updatecount(number);				
			}
		} 

	   // 조회수 많은 인기 게시원글 상위 3개 조회 출력 처리
	  function updatecount(number){
			var count = $("input[id=faq_no"+number+"]").val() 
			$.ajax({
				url:"updateCount.do",
				type:"post",
				data:{faq_no: count},
				success: function(data){
					if(data == "ok"){
					console.log("성공");
					} else{
						console.log("실패");
					}
				},
				error: function(jqXHR, textstatus, errorthrown){
					console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
				},
			});
			
		}
</script>
</head>
<body>
	<!-- loader -->
	<div class="loader-wrap">
		<div class="pin"></div>
		<div class="pulse"></div>
	</div>
	<!--  loader end -->
	<!-- Main   -->
	<div id="main">
		<c:import url="/WEB-INF/views/common/header.jsp" />
		<!-- wrapper -->
		<div id="wrapper">
			<!--content -->
			<div class="content">
				<!--section -->
				<section id="sec1">
					<!-- container -->
					<div class="container">
						<!-- profile-edit-wrap -->
						<div class="profile-edit-wrap">
							<div class="profile-edit-page-header">
								<h2>고객센터</h2>
								<div class="breadcrumbs">
									<a href="main.do">Home</a><a href="faqCoupon.do">고객센터</a><span>자주묻는질문(FAQ)</span>
								</div>
							</div>
							<div class="row">
								<div class="col-md-3">
									<div class="fixed-bar fl-wrap">
										<div class="user-profile-menu-wrap fl-wrap">
											<!-- user-profile-menu-->
											<div class="user-profile-menu">
												<h3>고객센터</h3>
												<ul>
													<li><a href="eventPage.do" class="user-profile-act"><i
															class="fa fa-th-list"></i> 이벤트 </a></li>
													<li><a href="policyPage.do" class="user-profile-act"><i
															class="fa fa-th-list"></i> 약관 및 개인정보 </a></li>

													<li><a href="questionListView.do"
														class="user-profile-act"><i class="fa fa-th-list"></i>
															1:1문의 </a></li>
													<li><a href="faqTop7.do" class="user-profile-act"><i
															class="fa fa-th-list"></i> 자주묻는질문(FAQ) </a></li>
													<c:if
														test="${!empty loginMember and  loginMember.admin_check eq 'Y' }">
														<li><a href="couponPage.do" class="user-profile-act"><i
																class="fa fa-th-list"></i> 쿠폰 </a></li>
													</c:if>
													<c:if
														test="${!empty loginMember and  loginMember.admin_check eq 'Y' }">
														<li><a href="questionAdminListView.do"
															class="user-profile-act"><i class="fa fa-th-list"></i>
																관리자 1:1문의 </a></li>
													</c:if>
												</ul>
											</div>

										</div>
									</div>
								</div>
								<div class="col-md-9">
									<div class="dashboard-list-box fl-wrap">
										<div class="dashboard-header fl-wrap">
											<h3 style="text-align: center;">
												<a href="faqTop7.do">top7</a>&nbsp;<a href="faqUsing.do">이용문의</a>&nbsp;<a
													href="faqReservation.do">예약문의</a>&nbsp;<a
													href="faqSettlement.do">결제문의</a>&nbsp;<a
													href="faqCoupon.do">쿠폰/이벤트</a>&nbsp;<a href="faqMember.do">회원정보</a>
											</h3>
										</div>
										<!-- dashboard-list end-->
										<form action="deleteFaq.do" method="post">
											<div class="dashboard-list">
												<c:forEach items="${faq }" var="faq">
													<c:if test="${faq.faqcategory_name eq '쿠폰' }">
														<div class="dashboard-message">
															
																
															
															<div class="dashboard-listing-table-image"></div>

															<div class="dashboard-listing-table-text">
																<div id="accordian">
																	<ul>
																		<li>
																			<h3 onclick="updateCountGo(${faq.faq_no});">
																				<span class="icon-dashboard"></span>${faq.faq_title }
																				<li><a>${faq.faq_rcontent }</a></li> <input
																					type="hidden" value="${faq.faq_no }"
																					id="faq_no${faq.faq_no }">
																				<c:if
																					test="${ !empty loginMember and  loginMember.admin_check eq 'Y' }">
																					<input type="checkbox" name="faq_no"
																						value="${faq.faq_no }">
																				</c:if>
																			</h3>
																		</li>
																	</ul>
																</div>
															</div>
														</div>
													</c:if>
												</c:forEach>

												<c:if test="${ loginMember.admin_check eq 'Y' }">
													<input type="submit" value="삭제" class="new-dashboard-item"
														style="position: absolute; right: -10%; top: 96px; padding: 6px 15px; border-radius: 4px; color: #fff; background: #5ECFB1; z-index: 10;">
														<a href="moveInsertFaq.do"
																	style="position: absolute; right: -10%; top: 37px; padding: 6px 15px; border-radius: 4px; color: #fff; background: #5ECFB1; z-index: 10;">추가</a>
												</c:if>
										</form>
									</div>

									<!-- dashboard-list end-->
								</div>

							</div>
						</div>
					</div>
					<!--profile-edit-wrap end -->
			</div>
			<!--container end -->
			</section>
			<!-- section end -->
			<div class="limit-box fl-wrap"></div>
		</div>
	</div>
	<!-- wrapper end -->
	<!--footer -->
	<c:import url="/WEB-INF/views/common/footer2.jsp" />
	<a class="to-top"><i class="fa fa-angle-up"></i></a>
	</div>
	<!-- Main end -->
	<!--=============== scripts  ===============-->
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/plugins.js"></script>
	<script type="text/javascript" src="js/scripts.js"></script>
</body>
</html>