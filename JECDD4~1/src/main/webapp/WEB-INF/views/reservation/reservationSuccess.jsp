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

<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>

</head>
<body>
<script>
	window.onload=function(){
		var mupay = document.getElementById('mupay');
		mupay.onclick=function(){
			document.muForm.target = opener.name;
			document.muForm.submit();
			self.close();
		}
	};
</script>
<div id="wrapper">
                <!--  content -->	
                <div class="content">
                    <!--  section   --> 
                    <section  id="sec2">
                        <div class="container">
                            <div class="section-title">
                                <h2>결제완료</h2>
                                <div class="section-subtitle">Success</div>
                                <span class="section-separator"></span>
                            </div>
                            <div class="pricing-wrap fl-wrap">
                                <!-- price-item-->
                                <div class="price-item">
                                    <div class="price-head op1">
                                        <h3>Success</h3>
                                    </div>
                                    <div class="price-content fl-wrap">
                                        <div class="price-num fl-wrap">
                                            <span class="price-num-item">
									</span> 
                                            <!-- <div class="price-num-desc">Per month</div> -->
                                        </div>
                                        <div class="price-desc fl-wrap">
                                            <ul>
                                                <li>예약날짜 : ${ reserv.checkin_date }~${ reserv.checkout_date }</li>
                                                <li>체크인 시간은 AM ${ room.checkin_time }, 체크아웃 시간 PM ${ room.checkout_time }입니다.</li>
                                                <li>결제금액 : 
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
												</li>
                                            </ul>
									<form action="mm.do" name="muForm" method="post">
										<input type="hidden" name="room_no" value="${room_no}">
										<input type="hidden" name="date" value="${date}"> 
										<input type="button" id="mupay" class="price-link" value="메인으로">
									</form>
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
          
</body>
</html>