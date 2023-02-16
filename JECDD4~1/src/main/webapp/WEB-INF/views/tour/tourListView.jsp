<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Alex+Brush&display=swap" rel="stylesheet">
        
    </head>
    <style>
        .logo {
      font-family: 'Alex Brush', cursive;
      font-size: 35px;
      color: #ffffff;
    }
    .cat {
      background-color : #4DB7FE;
      float: left;
      border: 1px solid #eee;
      background: #4DB7FE;
      width: 100%;
      padding: 15px 20px 15px 20px;
      border-radius: 6px;
      -webkit-appearance: none;
      width : 247px;
      height : 48px;
      color : #fff;
    }
    </style>
    <body>
    <c:import url="/WEB-INF/views/common/header.jsp" />
        <!--loader-->
        <div class="loader-wrap">
            <div class="pin"></div>
            <div class="pulse"></div>
        </div>
        <!--loader end-->
        <!-- Main  -->
        <div id="main">  
            <!-- wrapper -->   
            <div id="wrapper">
                <div class="content">
                    <!-- Map -->
                    <div class="map-container column-map right-pos-map">
                        <div id="map-main"></div>
                        <ul class="mapnavigation">
                            <li><a href="#" class="prevmap-nav">Prev</a></li>
                            <li><a href="#" class="nextmap-nav">Next</a></li>
                        </ul>
                  <div class="scrollContorl mapnavbtn" title="Enable Scrolling"><span><i class="fa fa-lock"></i></span></div>                     
                    </div>
                    <!-- Map end -->          
                    <!--col-list-wrap -->   
                    <div class="col-list-wrap left-list">
                        <div class="listsearch-options fl-wrap" id="lisfw" >
                            <div class="container">
                                <div class="listsearch-header fl-wrap">
                                    <h3>관광지 </h3>
                                    <div class="listing-view-layout">
                                        <ul>
                                            <li><a class="grid active" href="#"><i class="fa fa-th-large"></i></a></li>
                                            <li><a class="list" href="#"><i class="fa fa-list-ul"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- listsearch-input-wrap  -->  
                                <div class="listsearch-input-wrap fl-wrap">
                                    <div class="listsearch-input-item">
                                        <button class="cat">자 연</button>
                                    </div>
                                    <div class="listsearch-input-item">
                                       <button class="cat">음 식</button>
                                    </div>
                                    <div class="listsearch-input-item">
                                       <button class="cat">체 험</button>
                                    </div>
                                </div>
                                <!-- listsearch-input-wrap end -->
                            </div>
                        </div>
                        <!-- list-main-wrap-->
                        <div class="list-main-wrap fl-wrap card-listing">
                            <a class="custom-scroll-link back-to-filters btf-l" href="#lisfw"><i class="fa fa-angle-double-up"></i><span>Back to Filters</span></a> 
                            <div class="container">
                                <!-- listing-item -->
                                <c:forEach items="${ requestScope.list }" var="t">
                                <div class="listing-item">
                                    <article class="geodir-category-listing fl-wrap">
                                        <div class="geodir-category-img">
                                            <img src="resources/images/21.jpg" alt="">
                                            <div class="overlay"></div>
                                            <div class="list-post-counter"><span>4</span><i class="fa fa-heart"></i></div>
                                        </div>
                                        <div class="geodir-category-content fl-wrap">
                                         <c:forEach items="${ requestScope.tclist }" var="tc">
                                            <a class="listing-geodir-category" href="listing.html">${ tc.tour_category_name }</a>
                                         </c:forEach>
                                            <div class="listing-avatar"><a href="author-single.html"><img src="resources/images/avatar/1.jpg" alt=""></a>
                                                <span class="avatar-tooltip">Added By  <strong>Lisa Smith</strong></span>
                                            </div>
                                            <h3><a href="tdetail.do?tour_no=${ t.tour_no }">${ t.tour_name }</a></h3>
                                            <p>Sed interdum metus at nisi tempor laoreet. Integer gravida orci a justo sodales, sed lobortis est placerat.</p>
                                            <div class="geodir-category-options fl-wrap">
                                                <div class="listing-rating card-popup-rainingvis" data-starrating2="5">
                                                    <span>(7 reviews)</span>
                                                </div>
                                                <div class="geodir-category-location"><a  href="#0" class="map-item"><i class="fa fa-map-marker" aria-hidden="true"></i>${ t.tour_roadaddress }</a></div>
                                            </div>
                                        </div>
                                    </article>
                                </div>
                                </c:forEach>
                                <!-- listing-item end-->                            
                                <div class="clearfix"></div>                            
                 
                            </div>
                            <a class="load-more-button" href="#">Load more <i class="fa fa-circle-o-notch"></i> </a>  
                        </div>
                        <!-- list-main-wrap end-->
                    </div>
                    <!--col-list-wrap -->  
                    <div class="limit-box fl-wrap"></div>
                    <!--section -->  

                    <!--section end -->  
                </div>
                <!--content end -->   
            </div>
            <!-- wrapper end -->
        </div>
        <!-- Main end -->
        <!--=============== scripts  ===============-->
        <script type="text/javascript" src="resources/js/jquery.min.js"></script>
        <script type="text/javascript" src="resources/js/plugins.js"></script>
        <script type="text/javascript" src="resources/js/scripts.js"></script>
      <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC95dqGGKveZsk11F5F7irIrx0ExnBNfDk&libraries=places&callback=initAutocomplete"></script>
        <script type="text/javascript" src="resources/js/map_infobox.js"></script>
        <script type="text/javascript" src="resources/js/markerclusterer.js"></script>  
        <script type="text/javascript" src="resources/js/maps.js"></script>
    </body>
</html>