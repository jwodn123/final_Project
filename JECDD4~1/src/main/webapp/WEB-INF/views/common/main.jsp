<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        <script src="https://kit.fontawesome.com/262e649fa4.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script type="text/javascript" src="resources/js/jquery-3.5.1.min.js"></script>
        <script type="text/javascript" src="resources/js/plugins.js"></script>
        <script type="text/javascript" src="resources/js/scripts.js"></script>
    </head>
    <script type="text/javascript">
    $(function(){
    	$.ajax({
    		url : "roomTop.do",
    		type : "post",
    		dataType : "json",
    		success : function(job){
    			
    			var jsonStr = JSON.stringify(job);
    			
    			var json = JSON.parse(jsonStr);
    			var value = "";
    			for(var i in json.list){
    				var cs = json.list[i].clean_score;
    				var vs = json.list[i].value_score;
    				var ss = json.list[i].service_score;
    				var total = (cs + vs + ss)/3;
    				
                	value += '<div class="slick-slide-item slick-slide slick-cloned" data-slick-index="-6" id="" aria-hidden="true" tabindex="-1" style="width: 369px;">';
                	value += ' <div class="listing-item">';
    				value += '	<article class="geodir-category-listing fl-wrap">';
    				value += '		<div class="geodir-category-img">';    			
    				value += '			<img class="roomImg" src="resources/roomFiles/'+ json.list[i].rename +'" style="width:100%;height:300px;">';
    				value += '			<div class="overlay"></div>';
    				value += '		</div>';
    				value += '		<div class="geodir-category-content fl-wrap">';
    				value += '			<h3><a href="moveDetailView.do?room_no='+json.list[i].room_no+'">'+decodeURIComponent(json.list[i].room_name.replace(/\+/gi, " "))+'</a></h3>';
    				value += '			<p>기준 인원 : '+json.list[i].st_num_people+' &nbsp; &nbsp; <br> ';
    				/* value += ' 				체크인 - ${fn:substring('+json.list[i].checkin_time+',0,2)}:';
    				value += '				${fn:substring('+json.list[i].checkin_time+',2,4)} ~ 체크아웃 -';
    				value += '				${fn:substring('+json.list[i].checkout_time+',0,2)}:';
    				value += '				${fn:substring('+json.list[i].checkout_time+',2,4)} <br>'; */
    				value += '				'+json.list[i].room_weekday+'/1박';
    				value += '			</p>';
    				value += '				<div class="geodir-category-options fl-wrap">';
    				value += '					<span class="d-flex justify-content-center align-items-center">';										
    				value += '						<span style="color: #4DB7FE;"><i class="fas fa-star"></i></span>';
    				value += '							<fmt:formatNumber value="'+total+'" pattern=".0" /> ('+json.list[i].reply_no+' Review)';
    				value += '					</span>';
    				value += '				<div class="geodir-category-location">';
    				value += '					<a href="#0" class="map-item"><i class="fa fa-map-marker" aria-hidden="true"></i>'+decodeURIComponent(json.list[i].room_address.replace(/\+/gi, " "))+'</a>';
    				value += '				</div>';
    				value += '		</div>';    				
    				value += '	</article>';
    				value += '</div>';
    				value += '</div>';
    				
    				$(".slick-track").html(value);	
    			}
    			
    		},error : function(request, status, errorData){
				console.log("error code : " + request.satus + "\nMessage : " + request.responseText + "\nError" + errorData);
			} 
    	});
    })
    
    </script>
    <style>
    input[type="date""] {
    	border : none;
    	
    }
    
    input[type="date"]::-webkit-outer-spin-button,
	input[type="date"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
.roomImg{
	width : 300px;
	height : 300px;
	border-radius : 5%;
}

    
    </style>
    <body>
         <!-- loader -->
      <div class="loader-wrap">
            <div class="pin"></div>
            <div class="pulse"></div>
        </div> 
        <!--loader end-->
        <!-- Main  -->
        <div id="main">
<c:import url="/WEB-INF/views/common/header.jsp" />
            <!--  header end -->	
            <!-- wrapper -->	
            <div id="wrapper">
                <!-- Content-->   
                <div class="content">
                    <!--section -->
                    <section class="scroll-con-sec hero-section" data-scrollax-parent="true" id="sec1">
                        <div class="media-container video-parallax" data-scrollax="properties: { translateY: '200px' }">
                            <div class="bg mob-bg" style="background-image: url(images/bg/1.jpg)"></div>
                            <div class="video-container" style="width: 941px; height: 776px;">
                                <video autoplay  loop muted  class="bgvid">
                                    <source src="resources/video/night.mp4" type="video/mp4">
                                </video>
                            </div>
                                    <!--  
                                        Vimeo code
                                        
                                         <div  class="background-vimeo" data-vim="97871257"> </div> --> 
                                    <!--  
                                        Youtube code 
                                        
                                         <div  class="background-youtube-wrapper" data-vid="Hg5iNVSp2z8" data-mv="1"> </div> -->
                            
                        </div>
                        <div class="overlay"></div>
                        <div class="hero-section-wrap fl-wrap">
                            <div class="container">
                                <div class="intro-item fl-wrap">
                                    <h2>여행</h2>
                                    <h3>이제는 안전한 곳에서</h3>
                                </div>
                                <form action="roomlist.do">
                                <div class="main-search-input-wrap">
                                    <div class="main-search-input fl-wrap">
                                        <div class="main-search-input-item" style="text-align:center;">
                                            <input type="text" placeholder="인원" name="people" required/>
                                        </div>
                                        <div class="main-search-input-item location" id="autocomplete-container">
                                            <input type="date"  name="checkin" />
                                        </div>
                                        <div class="main-search-input-item location" id="autocomplete-container">
                                            <input type="date"  name="checkout" />
                                        </div>                                         
                                        <button class="main-search-button" type="submit">Search</button>
                                    </div>
                                </div>
                                </form>
                            </div>
                        </div>
                        
                    </section>
            
                    <!--section -->
                    <section class="gray-section" style="height:960px;;">
                        <div class="container">
                            <div class="section-title">
                                <h2>인기 숙소</h2>
                                <div class="section-subtitle">인기만점</div>
                                <span class="section-separator"></span>
                                <p>인기있는 숙소를 소개합니다.</p>
                            </div>
                        </div>
                        <!-- carousel --> 
                       <div class="list-carousel fl-wrap card-listing ">
                            <!--listing-carousel-->
                            <div class="listing-carousel  fl-wrap ">
                                <!--slick-slide-item-->
                                <div class="slick-slide-item">
                                    <!-- listing-item -->
                                    <div class="listing-item" id="listing-item1">
                                        <article class="geodir-category-listing fl-wrap">
                                            <div class="geodir-category-img">
                                                <img src="images/all/1.jpg" alt="">
                                                <div class="overlay"></div>
                                                <div class="list-post-counter"><span>4</span><i class="fa fa-heart"></i></div>
                                            </div>
                                            <div class="geodir-category-content fl-wrap">
                                                <a class="listing-geodir-category" href="listing.html">Retail</a>
                                                <div class="listing-avatar"><a href="author-single.html"><img class="roomImg" src="images/avatar/1.jpg" alt=""></a>
                                                    <span class="avatar-tooltip">Added By  <strong>Lisa Smith</strong></span>
                                                </div>
                                                <h3><a href="listing-single.html">Event in City Mol</a></h3>
                                                <p>Sed interdum metus at nisi tempor laoreet.  </p>
                                                <div class="geodir-category-options fl-wrap">
                                                    <div class="listing-rating card-popup-rainingvis" data-starrating2="5">
                                                        <span>(7 reviews)</span>
                                                    </div>
                                                    <div class="geodir-category-location"><a href="#"><i class="fa fa-map-marker" aria-hidden="true"></i> 27th Brooklyn New York, NY 10065</a></div>
                                                </div>
                                            </div>
                                        </article>
                                    </div>
                                    <!-- listing-item end-->                         
                                </div>
                                <!--slick-slide-item end-->
                                <!--slick-slide-item-->
                                <div class="slick-slide-item">
                                    <!-- listing-item -->
                                    <div class="listing-item" id="listing-item2">
                                        <article class="geodir-category-listing fl-wrap">
                                            <div class="geodir-category-img">
                                                <img src="images/all/1.jpg" alt="">
                                                <div class="overlay"></div>
                                                <div class="list-post-counter"><span>15</span><i class="fa fa-heart"></i></div>
                                            </div>
                                            <div class="geodir-category-content fl-wrap">
                                                <a class="listing-geodir-category" href="listing.html">Event</a>
                                                <div class="listing-avatar"><a href="author-single.html"><img class="roomImg" src="images/avatar/1.jpg" alt=""></a>
                                                    <span class="avatar-tooltip">Added By  <strong>Mark Rose</strong></span>
                                                </div>
                                                <h3><a href="listing-single.html">Cafe "Lollipop"</a></h3>
                                                <p>Morbi suscipit erat in diam bibendum rutrum in nisl.</p>
                                                <div class="geodir-category-options fl-wrap">
                                                    <div class="listing-rating card-popup-rainingvis" data-starrating2="4">
                                                        <span>(17 reviews)</span>
                                                    </div>
                                                    <div class="geodir-category-location"><a href="#"><i class="fa fa-map-marker" aria-hidden="true"></i> 27th Brooklyn New York, NY 10065</a></div>
                                                </div>
                                            </div>
                                        </article>
                                    </div>
                                    <!-- listing-item end-->  
                                </div>
                                <!--slick-slide-item end-->  
                                <!--slick-slide-item-->
                                <div class="slick-slide-item">
                                    <!-- listing-item -->
                                    <div class="listing-item" id="listing-item3">
                                        <article class="geodir-category-listing fl-wrap">
                                            <div class="geodir-category-img">
                                                <img src="images/all/1.jpg" alt="">
                                                <div class="overlay"></div>
                                                <div class="list-post-counter"><span>13</span><i class="fa fa-heart"></i></div>
                                            </div>
                                            <div class="geodir-category-content fl-wrap">
                                                <a class="listing-geodir-category" href="listing.html">Gym </a>
                                                <div class="listing-avatar"><a href="author-single.html"><img class="roomImg" src="images/avatar/1.jpg" alt=""></a>
                                                    <span class="avatar-tooltip">Added By  <strong>Nasty Wood</strong></span>
                                                </div>
                                                <h3><a href="listing-single.html">Gym In Brooklyn</a></h3>
                                                <p>Morbiaccumsan ipsum velit tincidunt . </p>
                                                <div class="geodir-category-options fl-wrap">
                                                    <div class="listing-rating card-popup-rainingvis" data-starrating2="3">
                                                        <span>(16 reviews)</span>
                                                    </div>
                                                    <div class="geodir-category-location"><a href="#"><i class="fa fa-map-marker" aria-hidden="true"></i> 27th Brooklyn New York, NY 10065</a></div>
                                                </div>
                                            </div>
                                        </article>
                                    </div>
                                    <!-- listing-item end--> 
                                </div>
                                <!--slick-slide-item end-->                                
                                <!--slick-slide-item-->
                                <div class="slick-slide-item">
                                    <!-- listing-item -->
                                    <div class="listing-item" id="listing-item4">
                                        <article class="geodir-category-listing fl-wrap">
                                            <div class="geodir-category-img">
                                                <img src="images/all/1.jpg" alt="">
                                                <div class="overlay"></div>
                                                <div class="list-post-counter"><span>3</span><i class="fa fa-heart"></i></div>
                                            </div>
                                            <div class="geodir-category-content fl-wrap">
                                                <a class="listing-geodir-category" href="listing.html">Shops</a>
                                                <div class="listing-avatar"><a href="author-single.html"><img class="roomImg" src="images/avatar/1.jpg" alt=""></a>
                                                    <span class="avatar-tooltip">Added By  <strong>Nasty Wood</strong></span>
                                                </div>
                                                <h3><a href="listing-single.html">Shop in Boutique Zone</a></h3>
                                                <p>Morbiaccumsan ipsum velit tincidunt . </p>
                                                <div class="geodir-category-options fl-wrap">
                                                    <div class="listing-rating card-popup-rainingvis" data-starrating2="4">
                                                        <span>(6 reviews)</span>
                                                    </div>
                                                    <div class="geodir-category-location"><a href="#"><i class="fa fa-map-marker" aria-hidden="true"></i> 27th Brooklyn New York, NY 10065</a></div>
                                                </div>
                                            </div>
                                        </article>
                                    </div>
                                    <!-- listing-item end--> 
                                </div>
                                <!--slick-slide-item end-->                                
                                <!--slick-slide-item-->
                                <div class="slick-slide-item">
                                    <!-- listing-item -->
                                    <div class="listing-item" id="listing-item5">
                                        <article class="geodir-category-listing fl-wrap">
                                            <div class="geodir-category-img">
                                                <img src="images/all/1.jpg" alt="">
                                                <div class="overlay"></div>
                                                <div class="list-post-counter"><span>35</span><i class="fa fa-heart"></i></div>
                                            </div>
                                            <div class="geodir-category-content fl-wrap">
                                                <a class="listing-geodir-category" href="listing.html">Cars</a>
                                                <div class="listing-avatar"><a href="author-single.html"><img class="roomImg" src="images/avatar/1.jpg" alt=""></a>
                                                    <span class="avatar-tooltip">Added By  <strong>Kliff Antony</strong></span>
                                                </div>
                                                <h3><a href="listing-single.html">Best deal For the Cars</a></h3>
                                                <p>Lorem ipsum gravida nibh vel velit.</p>
                                                <div class="geodir-category-options fl-wrap">
                                                    <div class="listing-rating card-popup-rainingvis" data-starrating2="5">
                                                        <span>(11 reviews)</span>
                                                    </div>
                                                    <div class="geodir-category-location"><a href="#"><i class="fa fa-map-marker" aria-hidden="true"></i> 27th Brooklyn New York, NY 10065</a></div>
                                                </div>
                                            </div>
                                        </article>
                                    </div>
                                    <!-- listing-item end-->  
                                </div>
                                <!--slick-slide-item end-->                                                             
                              
                               
                               
                                <!--slick-slide-item-->
                                <div class="slick-slide-item">
                                    <!-- listing-item -->
                                    <div class="listing-item" id="listing-item0">
                                        <article class="geodir-category-listing fl-wrap">
                                            <div class="geodir-category-img">
                                                <img src="images/all/1.jpg" alt="">
                                                <div class="overlay"></div>
                                                <div class="list-post-counter"><span>553</span><i class="fa fa-heart"></i></div>
                                            </div>
                                            <div class="geodir-category-content fl-wrap">
                                                <a class="listing-geodir-category" href="listing.html">Restourants</a>
                                                <div class="listing-avatar"><a href="author-single.html"><img class="roomImg" src="images/avatar/1.jpg" alt=""></a>
                                                    <span class="avatar-tooltip">Added By  <strong>Adam Koncy</strong></span>
                                                </div>
                                                <h3><a href="listing-single.html">Luxury Restourant</a></h3>
                                                <p>Sed non neque elit. Sed ut imperdie.</p>
                                                <div class="geodir-category-options fl-wrap">
                                                    <div class="listing-rating card-popup-rainingvis" data-starrating2="5">
                                                        <span>(7 reviews)</span>
                                                    </div>
                                                    <div class="geodir-category-location"><a href="#"><i class="fa fa-map-marker" aria-hidden="true"></i> 27th Brooklyn New York, NY 10065</a></div>
                                                </div>
                                            </div>
                                        </article>
                                    </div>
                                    <!-- listing-item end-->   
                                </div>
                                <!--slick-slide-item end-->                                  
                            </div>
                            <!--listing-carousel end-->
                           
                        
                            <div class="swiper-button-prev sw-btn"><i class="fa fa-long-arrow-left"></i></div>
                            <div class="swiper-button-next sw-btn"><i class="fa fa-long-arrow-right"></i></div>
                        </div>
                        <!--  carousel end--> 
                    </section>
                    <!-- section end -->
                  
                </div>
                <!-- Content end -->      
            </div>
            <!-- wrapper end -->
           <c:import url="/WEB-INF/views/common/footer.jsp" />

            <!--register form end -->
            <a class="to-top"><i class="fa fa-angle-up"></i></a>
        </div>
        <!-- Main end -->
      </body>
</html>