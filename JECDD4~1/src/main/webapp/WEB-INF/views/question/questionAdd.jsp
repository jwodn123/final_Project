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
									<a href="main.do">Home</a><a href="questionListView.do">고객센터</a><span>이벤트</span>
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
                                    <form action="myQuestionAdd.do" method="post" enctype="multipart/form-data">
                                        <!-- profile-edit-container--> 
                                        <div class="profile-edit-container add-list-container">
                                            <div class="profile-edit-header fl-wrap">
                                                <h4>1:1 문의 등록</h4>
                                            </div>
                                            <div class="custom-form" >
                                                <label>문의 제목<i class="fa fa-briefcase"></i></label> <input type="text"
												placeholder="제목" name="question_title" required
												style="float: left; border: 1px solid #eee; background: #f9f9f9; width: 100%; padding: 15px 20px 15px 55px; border-radius: 6px; color: #666; font-size: 13px;" />
											</div>
											<div class="custom-form" >
                                                <label>1:1 문의  유형<i class="fa fa-briefcase"></i></label> <select  id="questiontype_no" name="questiontype_no"
                                                style="float: left; border: 1px solid #eee; background: #f9f9f9; width: 100%; padding: 15px 20px 15px 55px; border-radius: 6px; color: #666; font-size: 13px;"> 
												<option value="1">이용</option>
												<option value="2">예약</option>
												<option value="3">결제</option>
												<option value="4">쿠폰/이벤트</option>
												<option value="5">회원</option> 												
												</select>																	
										</div>
										
                                            <div class="custom-form">
                                                <label>문의사항</label>
                                                <textarea cols="40" rows="3" placeholder="문의사항을 입력해주세요." name="question_content"></textarea>     
                                                <input type="hidden" name="user_id" value="${loginMember.user_id }">
												<input type="hidden" name="question_sendemail"  value="N">                                                                                                                                         												
											</div>
											 
												
                                        </div>
                                        <!-- profile-edit-container end-->
                                        <div class="profile-edit-container add-list-container">
                                            <div class="profile-edit-header fl-wrap">
                                                <h4>첨부파일 등록</h4>
                                            </div>
                                            <div class="custom-form">
                                                <div class="row">
                                                    <!--col --> 
                                                    <div class="col-md-4">
                                                        <div class="add-list-media-header">                                                           
                                                            <span>문의 이미지</span>                                                             
                                                        </div>                                                                                                                  
                                                                <input type="file" name="qfile">                                                                                 
                                                    </div>
                                                    <!--col end-->                                                                                                                                                    
                                                </div>
                                            </div>
                                        </div>                                                                                                                                                                                                                                 
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