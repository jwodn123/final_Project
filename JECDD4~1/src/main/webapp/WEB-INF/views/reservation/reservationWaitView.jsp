<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"></script>

<script type="text/javascript">
	function moveMain(){
		location.href="main.do";
	}	
</script>

</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />

<div id="wrapper">
                <!--  content -->	
                <div class="content">
                    <!--  section  --> 
                    <!-- <section class="parallax-section" data-scrollax-parent="true" id="sec1">
                        <div class="bg par-elem "  data-bg="images/bg/1.jpg" data-scrollax="properties: { translateY: '30%' }"></div>
                        <div class="overlay"></div>
                        <div class="container">
                            <div class="section-title center-align">
                                <h2><span>Our Tariff Plans</span></h2>
                                <div class="breadcrumbs fl-wrap"><a href="#">Home</a><span>Pricing Tables</span></div>
                                <span class="section-separator"></span>
                            </div>
                        </div>
                        <div class="header-sec-link">
                            <div class="container"><a href="#sec2" class="custom-scroll-link">Let's Start</a></div>
                        </div>
                    </section> -->
                    <!--  section end --> 
                    <!--  section   --> 
                    <section  id="sec2">
                        <div class="container">
                            <div class="section-title">
                                <h2>결제 대기 중입니다.</h2>
                                <div class="section-subtitle">Reservation</div>
                                <span class="section-separator"></span>
                            </div>
                            <div class="pricing-wrap fl-wrap">
                                <!-- price-item-->
                                <div class="price-item" style="position:relative;left:33%;">
                                    <div class="price-head op1">
                                        <h3>stand by payment</h3>
                                    </div>
                                    <div class="price-content fl-wrap">
                                        <div class="price-num fl-wrap">
                                            <span class="price-num-item">
                                            	 <c:if test="${pay == 0 && pay1 == 0}">  
										<c:if test="${date != 0 && cald == 0}">
											<c:if test="${checkin == 1 || checkin == 7}">
												<fmt:formatNumber value="${room.room_weekend*date}" type="currency" />
											</c:if>
											<c:if test="${checkin != 1 && checkin != 7}">
												<fmt:formatNumber value="${room.room_weekday*date}" type="currency" />
											</c:if>
										</c:if>
										 <c:if test="${cald != 0 && date == 0}">
											<c:if test="${checkin == 1 || checkin == 7}">
												<fmt:formatNumber value="${room.room_weekend*cald}" type="currency" />
											</c:if>
											
											<c:if test="${checkin != 1 && checkin != 7}">
												<fmt:formatNumber value="${room.room_weekday*cald}" type="currency" />
											</c:if>
										</c:if>
										</c:if>
										<c:if test="${pay > 0}">
											<fmt:formatNumber value="${pay}" type="currency" />
										</c:if>
										<c:if test="${pay1 > 0}">
											<fmt:formatNumber value="${pay1}" type="currency" />
										</c:if>
										</span> 
                                            </span> 
                                            <!-- <div class="price-num-desc">Per month</div> -->
                                        </div>
                                        <div class="price-desc fl-wrap">
                                            <ul>
                                                <li>예금주 : ${ room.user_id }</li>
                                                <li>은행 : ${ account.bank_name }</li>
                                                <li>계좌번호 :${ account.account_num }</li>
                                                <li>24시간 내에 입금해주셔야 예약이 완료됩니다.</li>
                                            </ul>
										<button class="price-link" onClick="moveMain()">메인으로</button>
                                        </div>
                                    </div>
                                </div>
                                <!-- price-item end-->
                                </section>
                    <!--  section end --> 
                    <div class="limit-box"></div>
                </div>
                <!--  content end -->  
            </div>
            <!-- wrapper end -->


<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>