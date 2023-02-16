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
        <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=44262f7a543c0f64c3a92e6841cb0ddb&libraries=services"></script>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=44262f7a543c0f64c3a92e6841cb0ddb&libraries=LIBRARY"></script>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=44262f7a543c0f64c3a92e6841cb0ddb&libraries=services"></script>
        <script type="text/javascript">
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

			window.name = "ListView";
	    	window.open("moveFilterPage.do?checkin=${checkin }&checkout=${checkout}&people=${people}&week=${week}","알림","width=800,height=800, left="+ popupX + ", top="+ popupY);
	    	
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

	 
.markerInfo{
 	width : 100px;
 	height : 30px;
 	font-family: 'Roboto', sans-serif;
	border:1px  #FFF999 solid;
	font-size: 15px;
	margin-left : 15px;
	border-radius : 2em;
	outline : none;
	background-color: #4DB7FE;
	text-align:center; 
	cursor: pointer; 
	color:#ffffff; 
	transition:all 0.9s, color 0.3;
	font-family: "Font Awesome 5 Free";
 }
 
	    .markerInfo:hover{color:#2F3B59;}
	    .hover1:hover{ box-shadow:200px 0 0 0 rgba(0,0,0,0.5) inset; }

        </style>
        
    </head>
    <body>
        <!--loader-->
        <div class="loader-wrap">
            <div class="pin"></div>
            <div class="pulse"></div>
        </div>
        <!--loader end-->
        <!-- Main  -->
        <div id="main">
        <c:import url="/WEB-INF/views/common/header.jsp"/>
            <!-- wrapper -->	
            <div id="wrapper">
                <div class="content">
                    <!-- Map -->
                    <div class="map-container column-map right-pos-map">
                        <div id="map"></div>         					
                    </div>
                    <!-- Map end -->          
                    <!--col-list-wrap -->   
                    <div class="col-list-wrap left-list">
                        <div class="listsearch-options fl-wrap" id="lisfw" style="padding-bottom:5px;" >
                            <div class="container">
                                <div class="listsearch-header fl-wrap">                                	
                                    <h3>${listCount }개 숙소 검색  : <span>${inMonth }월${inday }일 - ${outMonth }월${outday }일 . 게스트 ${people }명</span></h3>
                                    <div class="listing-view-layout">
                                        <ul>
                                            <li><a class="grid active" href="#"><i class="fa fa-th-large"></i></a></li>
                                            <li><a class="list" href="#"><i class="fa fa-list-ul"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                        <!-- list-main-wrap-->
                        <div class="list-main-wrap fl-wrap card-listing">           
                     	   <button class="btn  big-btn  color-bg flat-btn" style="border:none;margin : 5px;margin-left:675px;margin-bottom:10px;" onclick="moveFilterPage()">필터 추가하기<i class="fas fa-filter"></i></button>
                          <a class="custom-scroll-link back-to-filters btf-l" href="moveRoomBList.do?checkin=${checkin }&checkout=${checkout}&people=${people}&week=${week}"><i class="fas fa-times"></i><span>지도 없애기</span></a> 
                            <div class="container">
                                <!-- listing-item -->
                                <c:set var="clearCount" value="0" />
							<c:forEach items="${list }" var="room">								
								<c:if test="${clearCount%2 eq 0}">
									<div class="clearfix"></div>									
								</c:if>
								<c:set var="clearCount" value="${clearCount + 1}" />
								<div class="listing-item" onmouseover="inMarker(${room.room_no})" onmouseout="outMarker(${room.room_no})">
									<article class="geodir-category-listing fl-wrap">
										<div class="geodir-category-img">
											<c:forEach items="${rflist }" var="rf">
												<c:if test="${room.room_no eq rf.room_no }">
													<div class="mySlides${rf.room_no}">
														<img class="roomImg"
															src="${ pageContext.servletContext.contextPath}/resources/roomFiles/${ rf.rename_file }">
													</div>
												</c:if>
											</c:forEach>
											<div class="swiper-button-prev sw-btn" onclick="plusSlides(1,${room.room_no})" style="top:250px;left:0;"> <i class="fa fa-long-arrow-left"></i>
											</div>
											<div class="swiper-button-next sw-btn" onclick="plusSlides(-1,${room.room_no})" style="right:0;top:250px;"> <i class="fa fa-long-arrow-right"></i>
											</div>
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

											<h3>
												<a href="moveDetailView.do?room_no=${room.room_no }">${room.room_name }</a>
											</h3>
											<p>
												기준 인원 : ${room.st_num_people } &nbsp; &nbsp; <br>
												최대 인원 : ${room.max_people } <br>
												 체크인 -
												${fn:substring(room.checkin_time,0,2)}:
												${fn:substring(room.checkin_time,2,4)} ~ 체크아웃 -
												${fn:substring(room.checkout_time,0,2)}:
												${fn:substring(room.checkout_time,2,4)} <br>
												<c:if test="${week eq 6 || week eq 7}">
													<fmt:formatNumber value="${room.room_weekend }" type="currency" /> /1박
												</c:if>
												<c:if test="${week ne 6 && week ne 7}">
													<fmt:formatNumber value="${room.room_weekday }" type="currency" /> /1박
												</c:if>
											</p>
											<div class="geodir-category-options fl-wrap">
												<span class="d-flex justify-content-center align-items-center">
													<c:set var="rvCheck" value="true" />
													<c:forEach items="${rvlist }" var="rv">
														<c:if test="${rvCheck }">
															<c:if test="${rv.room_no eq room.room_no }">
																<span style="color: #4DB7FE;"><i class="fas fa-star"></i></span>
																<fmt:formatNumber value="${(rv.clean_score +  rv.value_score + rv.service_score)/3 }" pattern=".0" /> (${rv.reply_no } Review)
																<c:set var="rvCheck" value="false" />
															</c:if>
														</c:if>
													</c:forEach> <c:if test="${rvCheck }">
														<span style="color: #4DB7FE;"><i class="fas fa-star"></i></span> 
														0.0 (0 Review)
													</c:if>
												</span>
												<div class="geodir-category-location">
													<a href="#0" class="map-item"><i class="fa fa-map-marker" aria-hidden="true"></i>${room.room_address }</a>
												</div>
											</div>
										</div>
									</article>
								</div>
							</c:forEach>
							<div class="pagination">
								<c:if test="${currentPage eq startPage}">
									<a class="prevposts-link" onclick="javascript:alert('첫 페이지 입니다.')"><i class="fa fa-caret-left"></i></a>
								</c:if>
								<c:if test="${currentPage ne 1 }">
									<a href="roomlist.do?page=${currentPage -1 }&checkin=${checkin }&checkout=${checkout}&people=${people}&week=${week}" class="prevposts-link"><i class="fa fa-caret-left"></i></a>
								</c:if>
								<c:forEach var="count" begin="1" end="5" step="1">
									<c:if test="${currentPage eq count }">
										<a href="#" class="blog-page current-page transition">${count }</a>
									</c:if>
									<c:if test="${currentPage ne count }">
										<c:if test="${count eq endPage }">
											<a href="roomlist.do?page=${count}&checkin=${checkin }&checkout=${checkout}&people=${people}&week=${week}"
											class="blog-page transition">${count }</a>
											<c:set var="count" value="5" />
										</c:if>
										<c:if test="${currentPage ne endPage }" >
										<a href="roomlist.do?page=${count}&checkin=${checkin }&checkout=${checkout}&people=${people}&week=${week}"
											class="blog-page transition">${count }</a>
										</c:if>										
									</c:if>
								</c:forEach>
								<c:if test="${currentPage eq endPage }">
									<a class="nextposts-link"
										onclick="javascript:alert('마지막 페이지 입니다.')"><i
										class="fa fa-caret-right"></i></a>
								</c:if>
								<c:if test="${currentPage ne endPage }">
									<a href="roomlist.do?page=${currentPage +1 }&checkin=${checkin }&checkout=${checkout}&people=${people}&week=${week}"
										class="nextposts-link"><i class="fa fa-caret-right"></i></a>
								</c:if>
							</div>
						</div>
                           
                        </div>
                        <!-- list-main-wrap end-->
                    </div>
                    <!--col-list-wrap -->  
                    <div class="limit-box fl-wrap"></div>
                    
                </div>
                <!--content end -->   
            </div>
        </div>
        <!-- Main end -->
        <!--=============== scripts  ===============-->
        <script type="text/javascript" src="resources/js/plugins.js"></script>
        <script type="text/javascript" src="resources/js/scripts.js"></script>
        <script type="text/javascript" src="resources/js/roomList.js"></script>
        <script type="text/javascript">    	
    	$(function() {
    		var checkin = null;
    		var checkout = null;
    		var people = 1;

    		if(${!empty checkin}){
    		    checkin = '${checkin}';
    			checkout = '${checkout}';
    			people = ${people};
    		}
    		
    		
    		// 맵 센터 편경시 실행하는 함수
    		kakao.maps.event.addListener(map, 'idle', function() {
    			// 현재 맵 정보
    			var bounds = map.getBounds();
    			// 중심 좌표
    			var center = map.getCenter(); 
    			// 레벨
    			var level = map.getLevel();
    				
    			// 남서쪽 좌표
    			var swLatLng = bounds.getSouthWest(); 
    		   	var swLat = swLatLng.getLat();
    		   	var swLng = swLatLng.getLng();
    		   	
    		   // 영역의 북동쪽 좌표를 얻어옵니다 
    			var neLatLng = bounds.getNorthEast(); 
    		    var neLat = neLatLng.getLat();
    		    var neLng = neLatLng.getLng();
    		   // 영역정보를 문자열로 얻어옵니다. ((남,서), (북,동)) 형식입니다
    			var boundsStr = bounds.toString();
    		   
    		   moveCenter(swLat, swLng, neLat, neLng, checkin, checkout, people, center, level);    			
    		})
    	}); 
    	
    	// 지도를 움직였을때 실행되는 함수
    	function moveCenter(swLat, swLng, neLat, neLng, checkin, checkout, people, center, level){	  
    		var userid = null;
    		if(${!empty loginMember}){
    			userid = '${loginMember.user_id}';	
    			}
    		location.href="roomlist.do?swLat="+swLat+"&swLng="+swLng+"&neLat="+neLat+"&neLng="+neLng+"&checkin="+checkin+"&checkout="+checkout+"&people="+people+"&userid="+userid +"&center="+center + "&level="+level;	
    	}
		////////////////////////////////
		
    	
    	// 지도 생성
    	var centerLat = 33.450701;
    	var centerLng = 126.570667;
    	var levelNum = 9;
    	if(${!empty centerLat and !empty centerLng}){
    		 centerLat = '${centerLat}';
    		 centerLng = '${centerLng}';
    		 levelNum = '${level}';
    	}
    	
    	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    	mapOption = {
    	    center: new kakao.maps.LatLng(centerLat, centerLng), // 지도의 중심좌표
    	    level: levelNum // 지도의 확대 레벨
    	};  

    	// 지도를 생성합니다    
    	var map = new kakao.maps.Map(mapContainer, mapOption); 
    	mapContainer.style.width = '1000px';
    	mapContainer.style.height = '850px';
    	map.relayout();
    	map.setCenter(new daum.maps.LatLng(centerLat, centerLng));
		////////////////////////////////////////////////
		
		
		// 각 room객체에서 지도에 찍힐 좌표 값 설정 후 마커 생성
    	var list = [];
    	var roomName = [];
    	<c:forEach items="${list }" var="room">
    		if(${week eq 6 || week eq 7}){
    			insertMarker('${room.room_roadaddress}', ${room.room_weekend},'${room.room_no}');
    		}else {
    			insertMarker('${room.room_roadaddress}', ${room.room_weekday},'${room.room_no}');
    		}
    	</c:forEach>
    	
		// 마커 생성 함수
		function insertMarker(roadaddress, roomWeek, roomNo){
    		var money = roomWeek;
    		var payMoney = money.toLocaleString();
    		var geocoder = new kakao.maps.services.Geocoder();
    			geocoder.addressSearch(roadaddress, function(result, status) {
    			if (status === kakao.maps.services.Status.OK) {
    				coords = new kakao.maps.LatLng(result[0].y, result[0].x);			     
    			    var content = '<button id="markerInfo'+roomNo+'" class="markerInfo hover1" onclick="javascript:location.href="moveDetailView.do?room_no='+ roomNo +'">&#8361;'+payMoney+'</button>';
    				// 커스텀 오버레이가 표시될 위치입니다 
    				// 커스텀 오버레이를 생성합니다
    				var customOverlay = new kakao.maps.CustomOverlay({
    				    map: map,
    				    position: coords,
    				    content: content,
    				    yAnchor: 1 
    				});				    
    			}   
    		});
    	}
		
		function inMarker(room_no){
			$("#markerInfo"+room_no).css('background-color','#2F3B59');
		}
		
		function outMarker(room_no){
			$("#markerInfo"+room_no).css('background-color','#4DB7FE');
		}
		
        </script>
    </body>
</html>