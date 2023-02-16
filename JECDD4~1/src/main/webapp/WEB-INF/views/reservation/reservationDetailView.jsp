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
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
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
<link rel="icon" type="image/png" href="resources/images/favicon.png">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/header.css">
<link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<script type="text/javascript">
	window.name = "popupPayment";
	$(document).ready(function(){	
		$('#reservPM').click(function(){
			var pay = $("#payForm").text();
			var pay1 = $("#payForm1").text();
			//parameter로 데이트값이랑 주말,평일가격 값을 넘기기
			if(pay != null || pay1 != null) {
				window.open("payment.do?room_no=${room.room_no}&date=${date}&room_weekday=${room.room_weekday}&room_weekend=${room.room_weekend}&re_num=${reserv.re_num}&cald=${cald}&pay="+pay+"&pay1="+pay1, "_blank","toolvar=yes,menubar=yes,width=530,height=400,left=430,top=70").focus();
			}
			else if(pay == 0 && pay1 == 0){
				window.open("payment.do?room_no=${room.room_no}&date=${date}&room_weekday=${room.room_weekday}&room_weekend=${room.room_weekend}&re_num=${reserv.re_num}&cald=${cald}", "_blank","toolvar=yes,menubar=yes,width=530,height=400,left=430,top=70").focus();
			}
		});
	});
</script>
<script type="text/javascript">

	$(document).ready(function(){
		$('#btn').click(function(){
			var act = $("#sel_act").val();
			
			var wd = $("#weekday").val(); //평일가격
			var we = $("#weekend").val(); //주말가겨
			var cwd = $("#Cweekday").val(); //평일가격(달 넘어갈때)
			var cwe = $("#Cweekend").val(); //주말가격(달 넘어갈때)
			var dt = $("#dt").val(); //일수 
			var cd = $("#cd").val(); //일수(달 넘어갈떄)
			var chin = $("#chin").val(); //체크인
			
			if(act != null) {					
				if(cd == 0) { //같은 달			
					if(chin == 1 || chin == 7) { //주말				
						var a = we - act; 
						$("#payForm").html(a);
						return false;			
					}
					else { //평일
						var b = wd - act;
						$("#payForm").html(b);
						return false;
					}
				}
				if(cd != 0) { //다른 달
					if(chin == 1 || chin == 7) { //주말
						var c = cwe - act;
						$("#payForm1").html(c);	
						return false;
					}
					else{
						var d = cwd - act; //평일
						$("#payForm1").html(d);	
						return false;
					}
				}			
			}
			else if(act == null){
				alert('사용 가능한 쿠폰이 없습니다.');
				return false;
			}
			
		});
	});
</script>

</head>
<body>

	<c:import url="/WEB-INF/views/common/header.jsp"/>
	
            <!-- wrapper -->	
            <div id="wrapper">
                <!--Content -->
                <div class="content">
                    <!--section -->
                   <!--  <section class="parallax-section" data-scrollax-parent="true" id="sec1">
                        <div class="bg par-elem "  data-bg="images/bg/1.jpg" data-scrollax="properties: { translateY: '30%' }"></div>
                        <div class="overlay"></div>
                        <div class="container">
                            <div class="section-title center-align">
                                <h2><span>About Our Company</span></h2>
                                <div class="breadcrumbs fl-wrap"><a href="#">Home</a><span>About</span></div>
                                <span class="section-separator"></span>
                            </div>
                        </div>
                        <div class="header-sec-link">
                            <div class="container"><a href="#sec2" class="custom-scroll-link">Let's Start</a></div>
                        </div>
                    </section>
                    section end
                    section
                    <div class="scroll-nav-wrapper fl-wrap">
                        <div class="container">
                            <nav class="scroll-nav scroll-init inline-scroll-container">
                                <ul>
                                    <li><a class="act-scrlink" href="#sec1">Top</a></li>
                                    <li><a href="#sec2">About</a></li>
                                    <li><a href="#sec3">Facts</a></li>
                                    <li><a href="#sec4">Team</a></li>
                                    <li><a href="#sec5">Testimonials</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div> -->
                    <section  id="sec2">
                        <div class="container">
                            <div class="section-title">
                                <h2>예약 진행하기</h2>
                                <div class="section-subtitle">Reservation</div>
                                <span class="section-separator"></span>
                            </div>
                            <!--about-wrap --> 
                            <div class="about-wrap">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="video-box fl-wrap">
									<div class="slick-slide-item">
										<div class="list-single-carousel-wrap fl-wrap" id="sec1">
										<div class="fw-carousel fl-wrap full-height lightgallery">
											<c:forEach items="${rflist}" var="pr">
												<div class="box-item">
													<img src="${ pageContext.servletContext.contextPath}/resources/roomFiles/${ pr.rename_file }" style="height: 500px; width: 596.99px;">
                                   					 <a href="${ pageContext.servletContext.contextPath}/resources/roomFiles/${ pr.rename_file }" class="gal-link popup-image"><i class="fa fa-search"></i></a>
												 </div>
												 </c:forEach>
											</div>
										</div>
										<div class="swiper-button-prev sw-btn"><i class="fa fa-long-arrow-left"></i></div>
										<div class="swiper-button-next sw-btn"><i class="fa fa-long-arrow-right"></i></div>
								</div>
									
								
									<!-- <img src="resources/images/all/1.jpg" alt=""> -->
									<!-- <a class="video-box-btn image-popup" href="https://vimeo.com/110234211"><i class="fa fa-play" aria-hidden="true"></i></a> -->
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="list-single-main-item-title fl-wrap">
                                            <h3>${loginMember.user_id} 님의 <span>- 예약 정보</span></h3>
                                            <span class="section-separator fl-sec-sep"></span>
                                        </div>
                                       <p>예약날짜 : ${ reservation.checkin_date }~${ reservation.checkout_date }</p>
                                       <p>예약인원 : ${ reservation.guest }</p>
                                       <p>체크인 시간은 AM ${ room.checkin_time }, 체크아웃 시간 PM ${ room.checkout_time }</p>
                                       
                                 <h4><b>적용가능한 쿠폰</b></h4>
								<form id="couForm" method="POST">
									<input type="hidden" name="room_no" value="${room.room_no}">
									<input type="hidden" name="date" value="${date}"> 
									<input type="hidden" name="user_id" value="${loginMember.user_id}"> 
									<input type="hidden" name="checkin_date" value="${reservation.checkin_date}">
									<input type="hidden" name="checkout_date" value="${reservation.checkout_date}">
									<input type="hidden" name="guest" value="${reservation.guest}">
									<h4><select id="sel_act" name="act">
										<!-- <option value="">쿠폰선택</option> -->
										<c:forEach items="${mycoupon}" var="v">
											<c:if test="${ loginMember.user_id eq v.user_id}">
												<option value="${v.coupon_money}">${v.coupon_money}</option>
											</c:if>
										</c:forEach>
									</select>
									<button type="button" id="btn" >쿠폰적용</button></h4>
								</form>

								<h4>가격</h4><h4>
								<input type="hidden" id="weekday" value="${room.room_weekday*date}">
								<input type="hidden" id="weekend" value="${room.room_weekend*date}">
								<input type="hidden" id="Cweekday" value="${room.room_weekday*cald}">
								<input type="hidden" id="Cweekend" value="${room.room_weekend*cald}">
								<input type="hidden" id="dt" value="${date}">
								<input type="hidden" id="cd" value="${cald}">
								<input type="hidden" id="chin" value="${checkin}">
								<div id="payForm">
								<c:if test="${cald eq null}"> <!-- 같은 달 --> 
									<c:if test="${checkin eq 1 || checkin eq 7}">
										${room.room_weekend*date}
										<%-- <fmt:formatNumber value="${room.room_weekend*date}"  /> --%>
										<%-- <input type="text" value="${room.room_weekend*date}"> --%>
									</c:if>
									<c:if test="${checkin ne 1 && checkin ne 7}">
										${room.room_weekday*date}
										<%-- <fmt:formatNumber value="${room.room_weekday*date}"  /> --%>
										<%-- <input type="text" value="${room.room_weekday*date}"> --%>
									</c:if>
								</c:if>
								</div>
	
								<div id="payForm1">
								<c:if test="${cald ne null}"> <!-- 다른 달 -->
									<c:if test="${checkin eq 1 || checkin eq 7}">
										${room.room_weekend*cald}
										<%-- <fmt:formatNumber value="${room.room_weekend*cald}" /> --%>
										<%-- <input type="text" value="${room.room_weekend*cald}"> --%>
									</c:if>
									<c:if test="${checkin ne 1 && checkin ne 7}">
										${room.room_weekday*cald}
										<%-- <fmt:formatNumber value="${room.room_weekday*cald}"  /> --%>
										<%-- <input type="text" value="${room.room_weekday*cald}"> --%>
									</c:if>
								</c:if>
								</div>
								
								</h4>
								<h4><button type="button" class="btn  big-btn  color-bg flat-btn" onclick="javascript:history.go(-1); return false;" 
                        style="width: 23%; padding-left: 1%; padding-right: 0;">이전페이지</button></h4>
								<h4><button type="button" id="reservPM" class="btn  big-btn  color-bg flat-btn">결제진행</button></h4>
								 </div>
                                </div>
                            </div>
                              </section>
                    <!-- section end -->
                    <div class="limit-box"></div>
                </div>
                <!--content end -->
            </div>
            <!-- wrapper end -->

	<c:import url="/WEB-INF/views/common/footer.jsp"/> 
	
	 <script type="text/javascript" src="resources/js/plugins.js"></script>
        <script type="text/javascript" src="resources/js/scripts.js"></script>   

</body>
</html>