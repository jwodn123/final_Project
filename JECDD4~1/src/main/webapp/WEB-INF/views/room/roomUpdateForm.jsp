<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        
<script>
	function deleteRoomFile(fileNo){
    	var roomNo = ${room.room_no};
        	
        	if(confirm("삭제하시겠습니까?")){
        		$.ajax({
            		url : "deleteFile.do",
            		data : {room_no : roomNo, room_file_no:fileNo},
            		type : "post",
            		success : function(result){
            			if(result == "ok"){
            				alert("삭제 완료!");
            				location.reload();        				
            			}else {
            				alert("삭제 할 수 없습니다.")
            			}
            		},
            		error : function(request, status, errorData){
    					console.log("error code : " + request.satus + "\nMessage : " + request.responseText + "\nError" + errorData);
    				}	        			
            	});
        	}
	}
	
        </script>
<style>
input[type=checkbox] {
	width: 20px;
	height: 20px;
	float: left;
	margin: 0;
	margin-right: 5px;
}

.checkBox {
	width: 210px;
	height: 20px;
	margin: 5px;
	padding: 0;
	text-align: left;
}

.container1 {
	width: 100%;
	display: grid;
	grid-template-columns: 1fr 1fr 1fr 1fr;
	gap: 10px 5px;
	padding: 0;
}
#container5{
		display : grid;
		width : 90%;
		grid-template-columns : 1fr 1fr 1fr;
		gap : 10px 10px;
		padding : 0;
		margin : 10px;
		margin-left : 0;
	}

#imgContainer {
	display: grid;
	width: 100%;
	grid-template-columns: 1fr 1fr 1fr;
	gap: 10px 10px;
	padding: 0;
	margin: 10px;
	margin-left: 0;
}

.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}

.filebox input[type="file"] {
	/* 파일 필드 숨기기 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.dropBox {
	border: 2px dotted #3292A2;
	width: 100%;
	height: 200px;
	color: #92AAB0;
	text-align: center;
	font-size: 24px;
	padding-top: 80px;
	margin-top: 10px;
}

.checkTime {
	width: 200px;
	height: 30px;
	border-radius: 3%;
}

.right img {
	width: 200px;
	height: 200px;
	margin: 0;
	border-radius: 5%;
}
</style>
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
                                    <h2>숙소 등록 하기</h2>
                                    <div class="breadcrumbs"><a href="main.do">Home</a><a href="roomlist.do">숙소</a><span>숙소 등록하기</span></div>
                                </div>
                                <form action="roomUpdate.do" method="post" enctype="multipart/form-data">
                             	<input type="hidden" value="${room.user_id }" name="user_id">
                             	<input type="hidden" value="${room.room_no }" name="room_no">
                                <div id="roadAdd"></div>
                                <div class="row">                                   
                                    <div class="col-md-9" style="margin-left:13%;">
                                        <!-- profile-edit-container--> 
                                        <div class="profile-edit-container add-list-container">
                                            <div class="profile-edit-header fl-wrap">
                                                <h4>숙소 기본 정보</h4>
                                            </div>
                                             <div class="custom-form">
                                                <label>숙소 이름 <i class="fa fa-home"></i></label>
                                                <input type="text" placeholder="숙소 이름을 입력해 주세요." name="room_name" value="${room.room_name }" style="padding-left : 40px;"/>                                               
                                            </div>
                                            <div class="custom-form">
                                                <label>숙소 소개</label>
                                                <textarea cols="40" rows="3" placeholder="숙소 소개" name="room_content">${room.room_content }</textarea>
                                            	<div class="row">
                                                	<div class="col-md-6">
                                                        <label>기준 인원 :<i class="fas fa-user"></i></label>
                                                        <input type="text" id="lat" placeholder="기준 인원" required name="st_num_people" value="${room.st_num_people }" style="padding-left : 40px;"/>                                                    
                                                    </div>
                                                	<div class="col-md-6">
                                                        <label>최대 인원 :<i class="fas fa-user"></i></label>
                                                        <input type="text" id="long" name="max_people" placeholder="최대 인원" required value="${room.max_people }" style="padding-left : 40px;" />                                                    
                                                    </div>
                                                </div>
                                                <div class="row">
                                                	<div class="col-md-6">
                                                        <label>평일 금액 :<i class="fas fa-won-sign"></i></label>
                                                        <input type="text" id="lat" name="room_weekday" placeholder="평일 가격" required value="${room.room_weekday }" style="padding-left : 40px;"/>                                                    
                                                    </div>
                                                	<div class="col-md-6">
                                                        <label>주말 금액 :<i class="fas fa-won-sign"></i></label>
                                                        <input type="text" id="long" name="room_weekend" placeholder="주말 가격" value="${room.room_weekend }" style="padding-left : 40px;" />                                                    
                                                    </div>
                                                </div>
                                                <label>인원 추가 금액 :<i class="fas fa-users"></i></label>
                                                <input type="text" placeholder="인원 추가 금액" name="plus_charge" value="${room.plus_charge }" required style="padding-left : 40px;"/>
                                              
                                            </div>
                                        </div>
                                        <!-- profile-edit-container end--> 
                                        <!-- profile-edit-container--> 
                                        <div class="profile-edit-container add-list-container">
                                            <div class="profile-edit-header fl-wrap">
                                                <h4>숙소 주소</h4>
                                            </div>
											<div class="custom-form" id="ShowAddress">
											
												<label>숙소 주소<i class="fa fa-map-marker"></i></label>
													<input type="text" id="room_roadaddress" name="Address" value="${room.room_address }" required readonly style="padding-left: 40px;" />												
														<button class="btn  big-btn  color-bg flat-btn" onclick="show()" type="button" style="margin-bottom: 5px;">
															주소 검색<i class="fa fa-angle-right"></i>
														</button>												
											</div>
												<div class="row">                                            
                                            	<div id="map" style="width:100%;height:300px; padding:5px;"></div>
                                            </div> 
										</div>
                                        <!-- profile-edit-container end-->       
                                        
                                        <div class="profile-edit-container add-list-container">
                                            <div class="profile-edit-header fl-wrap">
                                                <h4>숙소 정보</h4>
                                            </div>
                                            <div class="custom-form">                                            
	                                            <div class="row">
		                                        	<div class="col-md-6">
		                                            	<label>체크인 시간</label>
		                                                <select name="inhour"  class="checkTime">
		                                                <c:set var="inhour" value="${fn:substring(room.checkin_time,0,2) }" />
		                                                	<c:forEach var="InHour" begin="12" end="17" step="1">
		                                                		<c:if test="${inhour eq InHour }" >
		                                                			<option value="${InHour }" selected="selected">${InHour }</option>
		                                              			</c:if>
		                                              			<c:if test="${inhour ne InHour }" >
		                                                			<option value="${InHour }" >${InHour }</option>
		                                              			</c:if>
		                                                	</c:forEach>
		                                                </select>
		                                            </div>
		                                            <div class="col-md-6">
		                                            	<label>체크인 시간</label>
		                                                <select name="inminute" class="checkTime">		                                                
		                                                <c:set var="inminute" value="${fn:substring(room.checkin_time,2,4) }" />
		                                                	<c:forEach var="InMinute" begin="0" end="50" step="10">
		                                                		<c:if test="${inminute eq InMinute }" >
		                                                			<c:if test="${InMinute eq 00 }">
		                                                				<option value="0${InMinute }" selected="selected">0${InMinute }</option>
		                                                			</c:if>
		                                                			<c:if test="${InMinute ne 00 }">
		                                                				<option value="${InMinute }" selected="selected">${InMinute }</option>
		                                                			</c:if>
		                                              			</c:if>
		                                              			<c:if test="${inminute ne InMinute }" >
		                                                			<c:if test="${InMinute eq 00 }">
		                                                				<option value="0${InMinute }">0${InMinute }</option>
		                                                			</c:if>
		                                                			<c:if test="${InMinute ne 00 }">
		                                                				<option value="${InMinute }">${InMinute }</option>
		                                                			</c:if>
		                                              			</c:if>
		                                                	</c:forEach>														   
		                                                </select>
		                                            </div>
		                                            <div class="col-md-6">
		                                            	<label>체크아웃 시간</label>
		                                                <select name="outhour" class="checkTime">		                                                
		                                                 <c:set var="outhour" value="${fn:substring(room.checkout_time,0,2) }" />
		                                                <c:set var="checked" value="" />
		                                                	<c:forEach var="OutHour" begin="9" end="12" step="1">
		                                                		<c:if test="${outhour eq OutHour }" >
		                                                			<c:if test="${OutHour eq 9 }">
		                                                				<option value="0${OutHour }" selected="selected">0${OutHour }</option>
		                                                			</c:if>
		                                                			<c:if test="${OutHour > 9 }">
		                                                				<option value="${OutHour }" selected="selected">${OutHour }</option>
		                                                			</c:if>		                                                				
		                                              			</c:if>
		                                              			<c:if test="${outhour ne OutHour }" >
		                                                			<c:if test="${OutHour eq 9 }">
		                                                				<option value="0${OutHour }">0${OutHour }</option>
		                                                			</c:if>
		                                                			<c:if test="${OutHour > 9 }">
		                                                				<option value="${OutHour }">${OutHour }</option>
		                                                			</c:if>
		                                              			</c:if>
		                                                	</c:forEach>
														</select>
		                                            </div>
		                                            <div class="col-md-6">
		                                            	<label>체크아웃 시간</label>
		                                                <select name="outminute" class="checkTime">		                                                
		                                                <c:set var="outminute" value="${fn:substring(room.checkout_time,2,4) }" />
		                                                <c:set var="checked" value="" />
		                                                	<c:forEach var="OutMinute" begin="0" end="50" step="10">
		                                                		<c:if test="${outminute eq OutMinute }" >
		                                                			<c:if test="${OutMinute eq 00 }">
		                                                				<option value="0${OutMinute }" selected="selected">0${OutMinute }</option>
		                                                			</c:if>
		                                                			<c:if test="${OutMinute ne 00 }">
		                                                				<option value="${OutMinute }" selected="selected">${OutMinute }</option>
		                                                			</c:if>
		                                              			</c:if>
		                                              			<c:if test="${outminute ne OutMinute }" >
		                                                			<c:if test="${OutMinute eq 00 }">
		                                                				<option value="0${OutMinute }">0${OutMinute }</option>
		                                                			</c:if>
		                                                			<c:if test="${OutMinute ne 00 }">
		                                                				<option value="${OutMinute }">${OutMinute }</option>
		                                                			</c:if>
		                                              			</c:if>
		                                                	</c:forEach>
														</select>
		                                            </div>
	                                            </div>
                                                <label>침대 수 :<i class="fas fa-bed"></i></label>
                                                <input type="text" name="bed" placeholder="침대 수" required value="${room.bed }" style="padding-left : 40px;"/>
                                             	<label>침실 수 :<i class="fas fa-bed"></i></label>
                                                <input type="text" name="bedroom" placeholder="침실 수" required value="${room.bedroom }" style="padding-left : 40px;"/>
                                                <label>욕실 수 :<i class="fas fa-bath"></i></label>
                                                <input type="text" name="bathroom" placeholder="욕실 수" required value="${room.bathroom }" style="padding-left : 40px;"/> 
                                          	 </div>
                                           </div>
                                           
                                   		   <div class="profile-edit-container add-list-container">    
											   <div class="profile-edit-header fl-wrap">
	                                              	<h4>시설 등록</h4>
	                                           </div>
	                                         	    <div class="custom-form">	             
	                                         	    	<div class="row" style="margin-bottom:10px;">                            	    
															<label>편의 시설 : </label>
															<div class="container1">
																<c:forEach var="count1" begin="0" end="${fn:length(Alist)}" step="4">
																	<c:forEach items="${Alist }" var="alist" begin="${count1 }" end="${count1 + 3}">							
																	<c:set var="loop_flag" value="true" />
																	<c:set var="checked" value="" />							
																	<c:forTokens items="${room.amenity }" delims="," var="amenity_name">																	
																		<c:if test="${loop_flag }" >								
																			<c:if test="${fn:trim(alist) eq fn:trim(amenity_name)}">
																				<c:set var="checked" value="checked" />
																				<c:set var="loop_flag" value="false" />										
																			</c:if>
																		</c:if>
																	</c:forTokens>
																		<div class="checkBox"><input type="checkbox" name="amenity" value="${alist }" ${checked } >${ alist }</div>
																	</c:forEach>
																</c:forEach>
															</div>
														</div>
														<div class="row">
															<label>시설 :</label>
															<div class="container1">
																<c:forEach var="count2" begin="0" end="${fn:length(Flist)}" step="4">
																	<c:forEach items="${Flist }" var="flist" begin="${count2 }" end="${count2 + 2}">
		
																		<c:set var="loop_flag" value="true" />
																		<c:set var="checked" value="" />
		
																		<c:forTokens items="${room.facility }" delims="," var="facility_name">		
																			<c:if test="${loop_flag }">		
																				<c:if test="${fn:trim(flist) eq fn:trim(facility_name)}">
																					<c:set var="checked" value="checked" />
																					<c:set var="loop_flag" value="false" />		
																				</c:if>
																			</c:if>
																		</c:forTokens>		
																		<div class="checkBox">
																			<input type="checkbox" name="facility" value="${flist }" ${checked } >${ flist }
																		</div>
																	</c:forEach>
																</c:forEach>
															</div>
														</div>
														<div class="row">
															<label>건물 유형 :</label>
															<div class="container1">
																<c:forEach var="count3" begin="0" end="${fn:length(Blist)}" step="4">
																	<c:forEach items="${Blist }" var="blist" begin="${count3 }" end="${count3 + 3}">
		
																		<c:set var="loop_flag" value="true" />
																		<c:set var="checked" value="" />
		
																		<c:forTokens items="${room.build_type }" delims="," var="build_name">
		
																			<c:if test="${loop_flag }">
		
																				<c:if test="${fn:trim(blist) eq fn:trim(build_name)}">
																					<c:set var="checked" value="checked" />
																					<c:set var="loop_flag" value="false" />
		
																				</c:if>
																			</c:if>
																		</c:forTokens>		
																		<div class="checkBox">
																			<input type="checkbox" name="build_type" value="${blist }" ${checked }>${ blist }
																		</div>
																	</c:forEach>
																</c:forEach>
															</div>
														</div>
														<div class="row">
															<label>이용 규칙 :</label>
															<div class="container1">
																<c:forEach var="count4" begin="0" end="${fn:length(Rlist)}" step="4">
																	<c:forEach items="${Rlist }" var="rlist" begin="${count4 }" end="${count4 + 3 }">		
		
																		<c:set var="loop_flag" value="true" />
																		<c:set var="checked" value="" />
		
																		<c:forTokens items="${room.rule }" delims="," var="rule_name">
																			<c:if test="${loop_flag }">		
																				<c:if test="${rlist eq rule_name}">
																					<c:set var="checked" value="checked" />
																					<c:set var="loop_flag" value="false" />		
																				</c:if>
																			</c:if>
																		</c:forTokens>		
																		<div class="checkBox">
																			<input type="checkbox" name="rule" value="${rlist }" ${checked }>${rlist }
																		</div>
																	</c:forEach>
																</c:forEach>
															</div>
														</div>
													</div>
												</div>
                                                                   
                                        <!-- profile-edit-container-->
										<div class="profile-edit-container add-list-container">
											<div class="profile-edit-header fl-wrap">
												<h4>숙소 사진</h4>
											</div>
											<div id="third">
												<h4>숙소 사진</h4>
												<div id="container5">
													<c:forEach items="${rflist }" var="rf">
														<div id="roomContent">
															<div class="right">
																<img src="${pageContext.servletContext.contextPath }/resources/roomFiles/${rf.rename_file}">
															</div>

															<div class="left">
																${ rf.original_file}
																<button id="deleteBto" type="button"
																	onclick="deleteRoomFile(${rf.room_file_no });" style="border:none;background:none;">
																	<i class='fa fa-times'></i>
																</button>
															</div>
														</div>
													</c:forEach>
												</div>
												<div class="write">
													<div class="filebox"><label for="files">숙소 사진 추가</label><input multiple="multiple" type="file" id="files" name="files" style="display:none;"/></div>
													<div class="dropBox" id="dropBox"><i class="fas fa-images"></i> 사진 업로드</div>
													<div id="imgContainer">
														
													</div>
		                                        </div>
												<!-- profile-edit-container end-->
											</div>
											<button class="btn  big-btn  color-bg flat-btn" type="submit">
												등록하기<i class="fa fa-angle-right"></i>
											</button>

										</div>
									</div>
									</div>
                                </form>
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
          
<c:import url="/WEB-INF/views/common/footer2.jsp" />
            <a class="to-top"><i class="fa fa-angle-up"></i></a>
        </div>
        <!-- Main end -->
        <!--=============== scripts  ===============-->
        <script type="text/javascript" src="resources/js/jquery.min.js"></script>
        <script type="text/javascript" src="resources/js/plugins.js"></script>
        <script type="text/javascript" src="resources/js/scripts.js"></script>		
		<script type="text/javascript" src="resources/js/room_update.js"></script>		
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=44262f7a543c0f64c3a92e6841cb0ddb&libraries=services"></script>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=44262f7a543c0f64c3a92e6841cb0ddb&libraries=LIBRARY"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=44262f7a543c0f64c3a92e6841cb0ddb&libraries=services"></script>
<script>

var roadaddress = '${room.room_roadaddress}';
var geocoder = new kakao.maps.services.Geocoder();

	geocoder.addressSearch(roadaddress, function(result, status) {
		if (status === kakao.maps.services.Status.OK) {
				coords = new kakao.maps.LatLng(result[0].y, result[0].x);	
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					mapOption = {
					    center: coords, // 지도의 중심좌표
					    level: 4 // 지도의 확대 레벨
					};  
			
				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 
			
					var marker = new kakao.maps.Marker({
						map: map,
					    position: coords,
					})
		}
});
	
	function insertMarker(road){
		geocoder.addressSearch(road, function(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				coords = new kakao.maps.LatLng(result[0].y, result[0].x);	
				var marker = new kakao.maps.Marker({
					map: map,
				    position: coords,
				});
				
				map.setCenter(coords);
			}
		});
	}
</script>
    </body>
</html>