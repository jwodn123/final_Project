<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<!--=============== basic  ===============-->
<meta charset="UTF-8">
<title>Citybook -Directory Listing Template</title>
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
								<h2>Messages</h2>
								<div class="breadcrumbs">
									<a href="main.do">Home</a><a href="eventPage.do">고객센터</a><span>이벤트</span>
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
											<h3></h3>
										</div>
										<!-- dashboard-list end-->

										<div class="dashboard-list">

											<div class="dashboard-message">

												<div class="dashboard-listing-table-text">
													<c:if test="${!empty loginMember }">
														<a
															style="position: absolute; right: 30px; top: 37px; padding: 6px 15px; border-radius: 4px; color: #fff; background: #5ECFB1; z-index: 10;"
															href="insertMyCoupon.do?user_id=${loginMember.user_id }&coupon_no=${event.coupon_no }">쿠폰
															다운받기</a>
													</c:if>
													<c:if test="${empty loginMember }">
														<a
															style="position: absolute; right: 30px; top: 37px; padding: 6px 15px; border-radius: 4px; color: #fff; background: #5ECFB1; z-index: 10;">로그인
															후 쿠폰다운 가능</a>
													</c:if>

													<h4>
														<a>${event.event_name }</a>
													</h4>
													<br> <a>기한 : ${event.coupon_begin } ~
														${event.coupon_end }</a><br>
													<br>
													<div class="dashboard-listing-table-image">
														<img style="width: 850px; height: 900px";
															 src="${pageContext.servletContext.contextPath }/resources/eventimg/${event.event_rimg}">
													</div>
													<ul class="dashboard-listing-table-opt  fl-wrap">
														<br>
														<li>쿠폰 안내사항<br>
														<br> <a>${event.event_content }</a></li>

													</ul>
												</div>
											</div>

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
		<!--footer end  -->
		<a class="to-top"><i class="fa fa-angle-up"></i></a>
	</div>
	<!-- Main end -->
	<!--=============== scripts  ===============-->
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/plugins.js"></script>
	<script type="text/javascript" src="js/scripts.js"></script>
</body>
</html>