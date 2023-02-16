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
	width: 400px;
	margin: 10px auto 0 auto;
	color: white;
	box-shadow: 0 5px 15px 1px rgba(0, 0, 0, 0.6), 0 0 200px 1px
		rgba(255, 255, 255, 0.5);
} /* 메뉴 스타일 */
#accordian h3 {
	font-size: 12px;
	line-height: 34px;
	padding: 0 10px;
	cursor: pointer;
	background: #064461;
	background: linear-gradient(#003040, #002535);
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
#accordian ul ul li a {
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

#accordian ul ul li a:hover {
	background: #003545;
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
		$("#accordian h3").click(function() {
			$("#accordian ul ul").slideUp();
			if (!$(this).next().is(":visible")) {
				$(this).next().slideDown();
			}
		})
	})
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
									<a href="main.do">Home</a><a href="questionListView.do">고객센터</a><span>1:1문의</span>
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
												<a href=questionListView.do>나의 문의 내역</a>
											</h3>
										</div>
										<!-- dashboard-list end-->
										<div class="dashboard-list">
											<div class="dashboard-message">
												<div class="dashboard-message-text">
												<div class="custom-form" >
                                                <label>문의제목<i class="fa fa-briefcase"></i></label> 
                                                <a style="float: left; border: 1px solid #eee; background: #f9f9f9; width: 100%; padding: 15px 20px 15px 55px; border-radius: 6px; color: #666; font-size: 13px;">${question.question_title }</a>                                                
											</div>													
													<div class="custom-form" >
                                                <label>문의유형<i class="fa fa-briefcase"></i></label> 
                                                <c:if test="${question.questiontype_no eq '1' }">
															<a style="float: left; border: 1px solid #eee; background: #f9f9f9; width: 100%; padding: 15px 20px 15px 55px; border-radius: 6px; color: #666; font-size: 13px;">이용</a>
														</c:if>
														<c:if test="${question.questiontype_no eq '2' }">
															<a style="float: left; border: 1px solid #eee; background: #f9f9f9; width: 100%; padding: 15px 20px 15px 55px; border-radius: 6px; color: #666; font-size: 13px;">예약</a>
														</c:if>
														<c:if test="${question.questiontype_no eq '3' }">
															<a style="float: left; border: 1px solid #eee; background: #f9f9f9; width: 100%; padding: 15px 20px 15px 55px; border-radius: 6px; color: #666; font-size: 13px;">결제</a>
														</c:if>
														<c:if test="${question.questiontype_no eq '4' }">
															<a style="float: left; border: 1px solid #eee; background: #f9f9f9; width: 100%; padding: 15px 20px 15px 55px; border-radius: 6px; color: #666; font-size: 13px;">쿠폰</a>
														</c:if>
														<c:if test="${question.questiontype_no eq '5' }">
															<a style="float: left; border: 1px solid #eee; background: #f9f9f9; width: 100%; padding: 15px 20px 15px 55px; border-radius: 6px; color: #666; font-size: 13px;">회원</a>
														</c:if>                                                                                               
											</div>			
											<div class="custom-form">
														<label>나의 문의 내용</label>
														<textarea cols="40" rows="3" name="question_content" readonly>${question.question_content }</textarea>
													</div>				
													<div class="booking-details fl-wrap">
														<span class="booking-title">나의 이미지 </span><br> <span
															class="booking-text">
															<div class="dashboard-listing-table-image">
															<c:if test="${!empty question.question_rimg }">
																<img style="width: 500px;height: 600px;"
																	src="${pageContext.servletContext.contextPath}/resources/questionimg/${question.question_rimg}">
																 </c:if>
																 <c:if test="${empty question.question_rimg }">
														 <a>첨부파일 없음</a>
														 </c:if>
															</div>
													</div>													
													<div class="custom-form">
														<label>답변</label>
														<c:if test="${!empty question.question_rcontent }">
															<textarea cols="40" rows="3" name="question_rcontent" readonly>${question.question_rcontent }</textarea>
														</c:if>
														<c:if test="${empty question.question_rcontent }">
															<textarea cols="40" rows="3" name="question_rcontent" readonly>답변대기</textarea>
														</c:if>
													</div>
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