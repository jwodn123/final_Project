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
<link type="text/css" rel="stylesheet" href="resources/css/reset.css">
<link type="text/css" rel="stylesheet" href="resources/css/plugins.css">
<link type="text/css" rel="stylesheet" href="resources/css/style.css">
<link type="text/css" rel="stylesheet" href="resources/css/color.css">
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
									<a href="main.do">Home</a><a href="questionAdminListView.do">고객센터</a><span>이벤트</span>
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
                                    <form action="updateAdmin.do" method="post">
                                        <!-- profile-edit-container--> 
                                        <div class="profile-edit-container add-list-container">                                        
                                            <div class="profile-edit-header fl-wrap">
                                                <h4>관리자 1:1문의 답변 </h4>
                                            </div>
                                            	<input type="hidden" name="question_no" value="${question.question_no }">
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
		                                                <label>문의 내용</label>
		                                                <textarea cols="40" rows="3" readonly>${question.question_content }</textarea>     		                                                                                                                                                                             												
													</div>
											<div class="booking-details fl-wrap">
                                                            <span class="booking-title">문의 파일 </span><br>
                                                            <span class="booking-text">
                                                            <div class="dashboard-listing-table-image">
                                                            <c:if test="${!empty question.question_rimg }">
														 <img src="${pageContext.servletContext.contextPath}/resources/questionimg/${question.question_rimg}"
														 style="width: 500px;height: 600px;">
														 </c:if>
														 <c:if test="${empty question.question_rimg }">
														 <a>첨부파일 없음</a>
														 </c:if>
													</div>                                                                                                                                                                                   
                                                        </div>											
                                            <div class="custom-form">
                                                <label>답변</label>
                                                <c:if test="${empty question.question_rcontent }">
                                                <textarea cols="40" rows="3" placeholder="답변" name="question_rcontent"></textarea>     
                                                </c:if>
                                                <c:if test="${!empty question.question_rcontent }">
                                                <textarea cols="40" rows="3" name="question_rcontent">${question.question_rcontent }</textarea>     
                                                </c:if>                                                                                                                                     												
											</div> 
											 
												
                                        </div>
                                        <!-- profile-edit-container end-->                                                                                                                                                                                                                                                           
                                        <input type="submit"class="btn  big-btn  color-bg flat-btn" value="작성완료"> 
                                        </form>                                        
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