<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html lang="en">
    <head>
        <!--=============== basic  ===============-->
        <meta charset="UTF-8">
        <title>JejuBnB</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <meta name="robots" content="index, follow"/>
        <meta name="keywords" content=""/>
        <meta name="description" content=""/>
        <!--=============== css  ===============-->	
        <link type="text/css" rel="stylesheet" href="resources/css/reset.css">
        <link type="text/css" rel="stylesheet" href="resources/css/plugins.css">
        <link type="text/css" rel="stylesheet" href="resources/css/style.css">
        <link type="text/css" rel="stylesheet" href="resources/css/color.css">
        <!--=============== favicons ===============-->
        <link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">
        <script src="https://kit.fontawesome.com/262e649fa4.js" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css2?family=Alex+Brush&display=swap" rel="stylesheet">
        <script type="text/javascript" src="/JejuBnB/resources/js/jquery-3.5.1.min.js"></script>
        <script type="text/javascript" src="resources/js/roomBList.js"></script>
        
    </head>
    <script>
    
    $(function(){
		var slideIndex = 1;
		<c:forEach items="${list}" var="room">
			showSlides(slideIndex,${room.room_no});
		</c:forEach>
	});
   
    function moveFilterPage()
	{	
	var popupX = (document.body.offsetWidth / 2) - (800 / 2);
	//&nbsp;만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

	var popupY= (window.screen.height / 2) - (800 / 2);
	//&nbsp;만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음

		window.name = "BListView";
    	window.open("moveBFilterPage.do?checkin=${checkin }&checkout=${checkout}&people=${people}&week=${week}","알림","width=800,height=800, left="+ popupX + ", top="+ popupY);
    	
	}
    </script>
    <style>
    .roomImg{
	width : 300px;
	height : 300px;
	border-radius : 5%;
}
/* Slideshow container */
.slideshow-container {
  position: relative;
  margin: 300px;
  padding : 0;
  margin : 0;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 130px;
  width: 30px;
  height : 30px;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 50%;
  padding : 7px;
  text-decoration : none;
}

.prev:hover, .next:hover {
  background-color: #ffffff;
}

/* Position the "next button" to the right */
.next {
  right: 20px;
  border-radius: 50%;
}


/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}
    
    </style>
    <body>
        <!--loader-->
        <div class="loader-wrap">
            <div class="pin"></div>
            <div class="pulse"></div>
        </div>
        <!--loader end-->
        <!-- Main  -->
        <div id="main">
        <c:import url="/WEB-INF/views/common/header.jsp" />
            <!-- wrapper -->	
            <div id="wrapper">
                <!--  content  --> 
                <div class="content">
                    <!--  section  --> 
                    <section class="parallax-section" data-scrollax-parent="true">
                        <div class="bg par-elem "  data-bg="resources/images/크로아티아2.jpg" data-scrollax="properties: { translateY: '30%' }"></div>    
                    </section>
                    <!--  section  end--> 
                    <!--  section  --> 
                    <section class="gray-bg no-pading no-top-padding" id="sec1">
                        <div class="col-list-wrap  center-col-list-wrap left-list">
                            <div class="container">
                                <div class="listsearch-maiwrap box-inside fl-wrap">
                                    <div class="listsearch-header fl-wrap">                                	
                                    <h3>${listCount }개 숙소 검색  : <span>${inMonth }월${inday }일 - ${outMonth }월${outday }일 . 게스트 ${people }명</span></h3>
	                                    <div class="listing-view-layout">
	                                        <ul>
	                                            <li><a class="grid active" href="#"><i class="fa fa-th-large"></i></a></li>
	                                            <li><a class="list" href="#"><i class="fa fa-list-ul"></i></a></li>
	                                        </ul>
	                                    </div>
	                                </div>
                                        <button class="button fs-map-btn" onclick="javascript:location.href='roomlist.do?checkin=${checkin }&checkout=${checkout}&people=${people}&week=${week}'" style="margin : 5px;">지도로 보기 &nbsp;<i class="fas fa-map"></i></button>
                                   		<button class="btn  big-btn  color-bg flat-btn" style="border:none;margin : 5px;margin-left:800px;margin-bottom:10px;" onclick="moveFilterPage()">필터 추가하기<i class="fas fa-filter"></i></button>
                                   		
                                    <!-- listsearch-input-wrap end -->   
                                </div>
                                <!-- list-main-wrap-->
                                <div class="list-main-wrap fl-wrap card-listing">
                                	<c:set var="clearCount" value="0" />                           
                                    <!-- listing-item -->
                                    <c:forEach items="${list }" var="room"> 
                                    <c:if test="${clearCount%3 eq 0 }">
                                    	<div class="clearfix"></div>
                                    </c:if>
                                    <c:set var="clearCount" value="${clearCount + 1 }"/>                                    
	                                   <div class="listing-item">
                                    <article class="geodir-category-listing fl-wrap">
                                        <div class="geodir-category-img">
                                        	<c:forEach items="${rflist }" var="rf">
													<c:if test="${room.room_no eq rf.room_no }">
														<div class="mySlides${rf.room_no}">
															<img class="roomImg" src="${ pageContext.servletContext.contextPath}/resources/roomFiles/${ rf.rename_file }">
														</div>
													</c:if>
												</c:forEach>
												 <div class="swiper-button-prev sw-btn" onclick="plusSlides(1,${room.room_no})" style="top:250px;left:0;"><i class="fa fa-long-arrow-left"></i></div>
                      							 <div class="swiper-button-next sw-btn" onclick="plusSlides(-1,${room.room_no})" style="right:0;top:250px;"><i class="fa fa-long-arrow-right"></i></div>
                                        	<div class="overlay"></div>
	                                            <c:if test="${!empty loginMember}">
													<c:if test="${!empty mlist }">
														<c:set var="check" value="true" />
														<c:forEach items="${mlist }" var="roomNo">
															<c:if test="${check }">
																<c:if test="${room.room_no eq roomNo.room_no }">
																	<div class="list-post-counter" onclick="deleteH(${room.room_no})">
																		<i class='fas fa-heart'></i>
																	</div>
																	<c:set var="check" value="false" />
																</c:if>
															</c:if>
														</c:forEach>
														<c:if test="${check}">
															<div class="list-post-counter" onclick="insertH(${room.room_no})">
																<i class="far fa-heart"></i>
															</div>
														</c:if>
													</c:if>
													<c:if test="${empty mlist }">
														<div class="list-post-counter" onclick="insertH(${room.room_no})">
															<i class="far fa-heart"></i>
														</div>
													</c:if>
												</c:if>
												<c:if test="${empty loginMember }">
													<div class="list-post-counter" onclick="javascript:alert('로그인 후 이용해 주세요')">
														<i class="far fa-heart"></i>
													</div>
												</c:if>
                                        </div>
                                        <div class="geodir-category-content fl-wrap">
                                            
                                            <h3><a href="listing-single.html">${room.room_name }</a></h3>
                                            <p>기준 인원 : ${room.st_num_people } &nbsp; &nbsp; <br>
                                            	체크인 - ${fn:substring(room.checkin_time,0,2)}: ${fn:substring(room.checkin_time,2,4)} ~ 체크아웃 - ${fn:substring(room.checkout_time,0,2)}: ${fn:substring(room.checkout_time,2,4)}
                                            	<br> 
                                            	<c:if test="${week eq 6 || week eq 7}">
													<fmt:formatNumber value="${room.room_weekend }" type="currency" /> /1박
												</c:if> 
												<c:if test="${week ne 6 && week ne 7}">
													<fmt:formatNumber value="${room.room_weekday }"
														type="currency" /> /1박
												</c:if></p>
                                            <div class="geodir-category-options fl-wrap">
                                                <span class="d-flex justify-content-center align-items-center"> 
												<c:set var="rvCheck" value="true" />
													<c:forEach items="${rvlist }" var="rv">
														<c:if test="${rvCheck }">												
															<c:if test="${rv.room_no eq room.room_no }">
																<span style="color:#4DB7FE;"><i class="fas fa-star"></i></span> 
																<fmt:formatNumber value="${(rv.clean_score +  rv.value_score + rv.service_score)/3 }" pattern=".0"/> (${rv.reply_no } Review)
																<c:set var="rvCheck" value="false" />
															</c:if>
														</c:if>
													</c:forEach>
													<c:if test="${rvCheck }">
														<span style="color:#4DB7FE;"><i class="fas fa-star"></i></span> 
														0.0 (0 Review)
													</c:if>
												</span>
                                                <div class="geodir-category-location"><a  href="#0" class="map-item"><i class="fa fa-map-marker" aria-hidden="true"></i>${room.room_address }</a></div>
                                            </div>
                                        </div>
                                    </article>
                                </div>
                                    </c:forEach>
                                    <!-- listing-item end-->                           
                                    
                                    <!-- pagination-->
                                    <div class="pagination">
                                      		<c:if test="${currentPage eq startPage}">
	                                      	  <a class="prevposts-link" onclick="javascript:alert('첫 페이지 입니다.')"><i class="fa fa-caret-left"></i></a>
	                                        </c:if>
	                                        <c:if test="${currentPage ne 1 }">
	                                        	<a href="moveRoomBList.do?page=${currentPage -1 }&checkin=${checkin }&checkout=${checkout}&people=${people}&week=${week}" class="prevposts-link"><i class="fa fa-caret-left"></i></a>                                        
	                                        </c:if>
	                                   		<c:forEach var="count" begin="1" end="5" step="1">
		                                    	<c:if test="${currentPage eq count }">
		                                    		<a href="#" class="blog-page current-page transition">${count }</a>
		                                    	</c:if>
		                                    	<c:if test="${currentPage ne count }">
		                                    		 <a href="moveRoomBList.do?page=${count}&checkin=${checkin }&checkout=${checkout}&people=${people}&week=${week}" class="blog-page transition">${count }</a>
		                                    	</c:if>
	                                  		</c:forEach>
	                                  		<c:if test="${currentPage eq endPage }">
	                                  			<a class="nextposts-link" onclick="javascript:alert('마지막 페이지 입니다.')"><i class="fa fa-caret-right"></i></a>
	                                  		</c:if>
	                                  		<c:if test="${currentPage ne endPage }">
                                      			<a href="moveRoomBList.do?page=${currentPage +1 }&checkin=${checkin }&checkout=${checkout}&people=${people}&week=${week}" class="nextposts-link"><i class="fa fa-caret-right"></i></a>	                                 	 		
	                                  		</c:if>
                                    </div>
                                </div>
                                <!-- list-main-wrap end-->                           
                            </div>
                        </div>
                    </section>
                    
                </div>
                <!--  content  end--> 
            </div>
            <!-- wrapper end -->
            <c:import url="/WEB-INF/views/common/footer2.jsp" />            
            <a class="to-top"><i class="fa fa-angle-up"></i></a>
        </div>
        <!-- Main end -->
        <!--=============== scripts  ===============-->
        <script type="text/javascript" src="resources/js/jquery.min.js"></script>
        <script type="text/javascript" src="resources/js/plugins.js"></script>
        <script type="text/javascript" src="resources/js/scripts.js"></script>
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDwJSRi0zFjDemECmFl9JtRj1FY7TiTRRo&libraries=places&callback=initAutocomplete"></script>    </body>
</html>