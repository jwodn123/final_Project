<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html >
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
											<h3>이벤트</h3>
										</div>
										<!-- dashboard-list end-->
										<form action="deleteEvent.do" method="post">
										<div class="dashboard-list">
											<c:forEach items="${event }" var="ev">
												<div class="dashboard-listing-table-image">

														

													</div>
												<div class="dashboard-message">
													<a href="eventDetailView.do?event_no=${ev.event_no}"><img
															style="    width: 300px;height: 200px;"
															src="${pageContext.servletContext.contextPath}/resources/eventsum/${ev.sum_rimg}"
															alt=""></a>
													
													
													<div class="dashboard-listing-table-text" style="text-align: center; width: 800px;">
														<h4>
															<a href="eventDetailView.do?event_no=${ev.event_no}">${ev.event_name }</a>
														</h4>
														<br> <a>기한 : ${ev.coupon_begin } ~
															${ev.coupon_end }</a><br>
														<ul class="dashboard-listing-table-opt  fl-wrap">
															<li>
															<c:if test="${loginMember.admin_check eq 'Y' }">
															<a href="moveUpdateEvent.do?event_no=${ev.event_no}">수정
																		<i class="fa fa-pencil-square-o"></i>
																</a>
																</c:if>
																</li>
															<li>
															<c:if test="${loginMember.admin_check eq 'Y' }">
															<i class="fa fa-trash-o"></i>															
															<input
																type="checkbox" name="event_no" value="${ev.event_no }">
																</c:if>
																</li>
														</ul>

													
													</div>
												</div>
											</c:forEach>
												<c:if test="${loginMember.admin_check eq 'Y' }">
												<input type="submit" value="삭제" class="new-dashboard-item"
															style="position: absolute; right: -10%; top: 96px; padding: 6px 15px; border-radius: 4px; color: #fff; background: #5ECFB1; z-index: 10;">
														</c:if>
														</form>
														<c:if test="${loginMember.admin_check eq 'Y' }">
														<a href="insertEventPage.do"
														style="position: absolute; right: -10%; top: 37px; padding: 6px 15px; border-radius: 4px; color: #fff; background: #5ECFB1; z-index: 10;">등록</a>
														</c:if>
										</div>

										<!-- dashboard-list end-->
									</div>
									<!-- pagination-->
									<div class="pagination">



										<c:if test="${currentPage == 1 }">
											<button id="moveNext" onclick="moveNext(${currentPage})"
												style="display: inline-block; width: 44px; height: 44px; line-height: 44px; border-radius: 6px; border: 1px solid #eee; box-sizing: border-box; position: relative; font-size: 13px; color: #888DA0; background: #fff; letter-spacing: 1px;">
												<i class="fa fa-caret-left"></i>
											</button>
										</c:if>
										<c:forEach var="pg" begin="${startPage }" end="${endPage }"
											step="1">
											<c:if test="${pg eq currentPage }">
												<font weigth="bold"><a>${pg }</a></font>
											</c:if>
											<c:if test="${pg ne currentPage }">
												<button id="moveNext" onclick="moveNext(${currentPage})"
												style="display: inline-block; width: 44px; height: 44px; line-height: 44px; border-radius: 6px; border: 1px solid #eee; box-sizing: border-box; position: relative; font-size: 13px; color: #888DA0; background: #fff; letter-spacing: 1px;"><i class="fa fa-caret-right"></i></button>
											</c:if>
										</c:forEach>
										<c:if test="${currentPage == maxPage }">
											<button id="moveNext" onclick="moveNext(${currentPage})"
											style="display: inline-block; width: 44px; height: 44px; line-height: 44px; border-radius: 6px; border: 1px solid #eee; box-sizing: border-box; position: relative; font-size: 13px; color: #888DA0; background: #fff; letter-spacing: 1px;"><i class="fa fa-caret-right"></i></button>
										</c:if>
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