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
        <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=44262f7a543c0f64c3a92e6841cb0ddb&libraries=services"></script>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=44262f7a543c0f64c3a92e6841cb0ddb&libraries=LIBRARY"></script>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=44262f7a543c0f64c3a92e6841cb0ddb"></script>  
		 
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
	 	width : 200px;
	 	height : 200px;
	 	margin : 0;
	 	border-radius : 5%;
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
                                <form action="roominsert.do" method="post" enctype="multipart/form-data">
                             	   <input type="hidden" value="${loginMember.user_id }" name="user_id">
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
                                                <input type="text" placeholder="숙소 이름을 입력해 주세요." name="room_name" style="padding-left : 40px;" required/>                                               
                                            </div>
                                            <div class="custom-form">
                                                <label>숙소 소개</label>
                                                <textarea cols="40" rows="3" placeholder="숙소 소개" name="room_content"required></textarea>
                                                <div class="row">
                                                	<div class="col-md-6">
                                                        <label>기준 인원 :<i class="fas fa-user"></i></label>
                                                        <input type="text" id="lat" placeholder="기준 인원" required name="st_num_people" style="padding-left : 40px;" required/>                                                    
                                                    </div>
                                                	<div class="col-md-6">
                                                        <label>최대 인원 :<i class="fas fa-user"></i></label>
                                                        <input type="text" id="long" name="max_people" placeholder="최대 인원" required style="padding-left : 40px;" required/>                                                    
                                                    </div>
                                                </div>
                                                <div class="row">
                                                	<div class="col-md-6">
                                                        <label>평일 금액 :<i class="fas fa-won-sign"></i></label>
                                                        <input type="text" id="lat" name="room_weekday" placeholder="평일 가격"   style="padding-left : 40px;" required/>                                                    
                                                    </div>
                                                	<div class="col-md-6">
                                                        <label>주말 금액 :<i class="fas fa-won-sign"></i></label>
                                                        <input type="text" id="long" name="room_weekend" placeholder="주말 가격" style="padding-left : 40px;" required/>                                                    
                                                    </div>
                                                </div>
                                                <label>인원 추가 금액 :<i class="fas fa-users"></i></label>
                                                <input type="text" placeholder="인원 추가 금액" name="plus_charge"  style="padding-left : 40px;" required/>
                                              <div class="row">
                                                	<div class="col-md-6">
                                                        <label>계좌</label>
                                               			 <input type="text" placeholder="계좌" name="account_num"  style="padding-left : 40px;" required/>  
                                                    </div>
                                                	<div class="col-md-6">
                                                        <label>은행</label>
                                                        <input type="text" id="long" name="bank_name" placeholder="은행" style="padding-left : 40px;" required/>                                                    
                                                    </div>
                                                </div>
                                              
                                            </div>
                                        </div>
                                        <!-- profile-edit-container end--> 
                                        <!-- profile-edit-container--> 
                                        <div class="profile-edit-container add-list-container">
                                            <div class="profile-edit-header fl-wrap">
                                                <h4>숙소 주소</h4>
                                            </div>
                                            <div class="custom-form">
                                                <label>숙소 주소<i class="fa fa-map-marker"></i></label>
                                                <input type="text" placeholder="주소" id="room_roadaddress" name="room_roadaddress" required readonly style="padding-left : 40px;" />
                                                <div class="row">
                                                	<div class="col-md-6">
                                                        <label>우편 번호:<i class="fa fa-map-marker"></i></label>
                                                        <input type="text" id="PostNumber" placeholder="우편 번호" required readonly style="padding-left : 40px;"/>                                                    
                                                    </div>
                                                	<div class="col-md-6">
                                                        <label>상세 주소<i class="fa fa-map-marker"></i></label>
                                                        <input type="text" id="long" placeholder="상세 주소" name="address" style="padding-left : 40px;" />                                                    
                                                    </div>
                                                </div>                                                
                                                <button class="btn  big-btn  color-bg flat-btn" onclick="PostCall()" type="button" style="margin-bottom:5px;">주소 검색<i class="fa fa-angle-right"></i></button>                                                
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
			                                                <option value="12">12</option>
															<option value="13">13</option>
															<option value="14">14</option>
															<option value="15">15</option>
															<option value="16">16</option>
															<option value="17">17</option>
		                                                </select>
		                                            </div>
		                                            <div class="col-md-6">
		                                            	<label>체크인 시간</label>
		                                                <select name="inminute" class="checkTime">
														    <option value="00">00</option>
															<option value="10">10</option>
															<option value="20">20</option>
															<option value="30">30</option>
															<option value="40">40</option>
															<option value="50">50</option>
		                                                </select>
		                                            </div>
		                                            <div class="col-md-6">
		                                            	<label>체크아웃 시간</label>
		                                                <select name="outhour" class="checkTime">
															<option value="09">09</option>
															<option value="10">10</option>
															<option value="11">11</option>
															<option value="12">12</option>
														</select>
		                                            </div>
		                                            <div class="col-md-6">
		                                            	<label>체크아웃 시간</label>
		                                                <select name="outminute" class="checkTime">
															<option value="00">00</option>
															<option value="10">10</option>
															<option value="20">20</option>
															<option value="30">30</option>
															<option value="40">40</option>
															<option value="50">50</option>
														</select>
		                                            </div>
	                                            </div>
                                                <label>침대 수 :<i class="fas fa-bed"></i></label>
                                                <input type="text" name="bed" placeholder="침대 수" required style="padding-left : 40px;"/>
                                             	<label>침실 수 :<i class="fas fa-bed"></i></label>
                                                <input type="text" name="bedroom" placeholder="침실 수" required style="padding-left : 40px;"/>
                                                <label>욕실 수 :<i class="fas fa-bath"></i></label>
                                                <input type="text" name="bathroom" placeholder="욕실 수" required style="padding-left : 40px;"/> 
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
																			<div class="checkBox"><input type="checkbox" name="amenity" value="${alist }"> ${ alist }</div>
																	</c:forEach>
																</c:forEach>	
															</div>
														</div>
														<div class="row">
														<label>시설 :</label>
															<div class="container1">
																<c:forEach var="count2" begin="0" end="${fn:length(Flist)}" step="4">
																	<c:forEach items="${Flist }" var="flist" begin="${count2 }" end="${count2 + 2}">
																		<div class="checkBox"><input type="checkbox" name="facility" value="${flist }"> ${ flist }</div>
																	</c:forEach> 
																</c:forEach>
															</div>
														</div>
														<div class="row">
														<label>건물 유형 :</label>
															<div class="container1">
																<c:forEach var="count3" begin="0" end="${fn:length(Blist)}" step="4">
																	<c:forEach items="${Blist }" var="blist" begin="${count3 }" end="${count3 + 3}">
																		<div class="checkBox"><input type="checkbox" name="build_type" value="${blist }"> ${ blist }</div>
																	</c:forEach> 
																</c:forEach>
															</div>
														</div>
														<div class="row">
															<label>이용 규칙 :</label>
															<div class="container1">
																<c:forEach var="count4" begin="0" end="${fn:length(Rlist)}" step="4">
																	<c:forEach items="${Rlist }" var="rlist" begin="${count4 }" end="${count4 + 3 }">
																		<div class="checkBox"><input type="checkbox" name="rule" value="${rlist }">${rlist }</div>
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
                                            <div id="third" class="write">
												<div class="filebox"><label for="files">숙소 사진 추가</label><input multiple="multiple" type="file" id="files" name="file" style="display:none;" required/></div>
												<div class="dropBox" id="dropBox"><i class="fas fa-images"></i> 사진 업로드</div>
												<div id="imgContainer"> </div>
                                      	   </div>
                                        <!-- profile-edit-container end-->     
                                         </div>
                                    <button class="btn  big-btn  color-bg flat-btn" type="submit">등록하기<i class="fa fa-angle-right"></i></button>
                                         
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
        <script type="text/javascript" src="resources/js/room_write.js"></script>	
    </body>
</html>