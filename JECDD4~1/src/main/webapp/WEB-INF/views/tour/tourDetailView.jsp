<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <meta name="robots" content="index, follow"/>
        <meta name="keywords" content=""/>
        <meta name="description" content=""/>
    <title>JejuBnB</title>
        <!--=============== css  ===============-->
        <link type="text/css" rel="stylesheet" href="resources/css/reset.css">
        <link type="text/css" rel="stylesheet" href="resources/css/plugins.css">
        <link type="text/css" rel="stylesheet" href="resources/css/style.css">
        <link type="text/css" rel="stylesheet" href="resources/css/color.css">
        <!--=============== favicons ===============-->
        <link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
      <style type="text/css">
         .col-md-8 h2 {
             font-size: 30px;
         }
         .list-single-main-item img {
            width : 100%;
         }
         .updatemove {
            width : 200px;
            height : 40px;
            background: #4DB7FE;
            border: none;
            border-radius: 5px;
            color : #fff;
            font-weight: 600;
            position: relative;
            left: 66%;
         }
         .updatemove:hover {
            background: #2F3B59;
         }
      </style>
      <script type="text/javascript">
     function updatePage(){
      location.href="movetupdate.do?tour_no=" + ${ tour.tour_no};
   }
      </script>
  </head>
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
                <!--  content-->
                <div class="content">
                    <div class="scroll-nav-wrapper fl-wrap">
                        <div class="container">
                            <nav class="scroll-nav scroll-init">
                                <ul>
                                    <li><a class="act-scrlink" href="#sec1">Details</a></li>
                                    <li><a href="#sec2">Gallery</a></li>
                                    <li><a href="#sec3">More Info</a></li>
                                    <li><a href="#sec4">Reviews</a></li>
                                </ul>
                            </nav>
                            <a href="#" class="save-btn"> <i class="fa fa-heart"></i> Save </a>
                        </div>
                    </div>
                    <!--  section   -->
                    <section class="gray-section no-top-padding">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-8">
                                    <!-- list-single-main-wrapper -->
                                    <div class="list-single-main-wrapper fl-wrap" id="sec2">
                                        <div class="breadcrumbs gradient-bg  fl-wrap" style="width:1035px;"><a href="#">Home</a><a href="#">관광지</a><span>${ tour.tour_name }</span></div>
                                        <!-- list-single-header -->
                                        <div class="list-single-header list-single-header-inside fl-wrap" style="width:1035px;">
                                            <div class="container">
                                                <div class="list-single-header-item">
                                                    <div class="row">
                                                        <div class="col-md-8">
                                                            <div class="list-single-header-item-opt fl-wrap" style="width : 1035px;">
                                                            </div>
                                                            <h2>${ tour.tour_name }<br><span> - Hosted By </span><a href="author-single.html">${ tour.user_id }</a> </h2>
                                                            <span class="section-separator"></span>
                                                            <div class="listing-rating card-popup-rainingvis" data-starrating2="5">
                                                                <span>(11 reviews)</span>
                                                            </div>
                                                            <div class="list-post-counter single-list-post-counter"><span>4</span><i class="fa fa-heart"></i></div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="fl-wrap list-single-header-column">
                                                                <span class="viewed-counter"><i class="fa fa-eye"></i> Viewed -  156 </span>
                                                                <a class="custom-scroll-link" href="#sec5"><i class="fa fa-hand-o-right"></i>Add Review </a>
                                                                <div class="share-holder hid-share">
                                                                    <div class="showshare"><span>Share </span><i class="fa fa-share"></i></div>
                                                                    <div class="share-container  isShare"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- list-single-header end -->
                                        <div class="list-single-main-item fl-wrap" style="width : 1035px;margin-top:2%;">
                                            <div class="list-single-main-item-title fl-wrap">
                                                <h3>프로그램</h3>
                                            </div>
                                             ${ tour.tour_content }
                                        </div>
                                        <div class="list-single-main-item fl-wrap" id="sec3" style="width : 1035px;margin-top:2%;">
                                            <div class="list-single-main-item-title fl-wrap">
                                                <h3>알아 두어야 할 사항</h3>
                                            </div>
                                             <p>${ tour.tour_moreinfo }</p>
                                        </div>
                                        <!-- list-single-main-item -->
                                        <div class="list-single-main-item fl-wrap" id="sec4" style="width:1035px";>
                                            <div class="list-single-main-item-title fl-wrap">
                                                <h3>Item Revies -  <span> 3 </span></h3>
                                            </div>
                                            <div class="reviews-comments-wrap">
                                                <!-- reviews-comments-item -->
                                                <div class="reviews-comments-item">
                                                    <div class="review-comments-avatar">
                                                        <img src="resources/images/avatar/1.jpg" alt="">
                                                    </div>
                                                    <div class="reviews-comments-item-text">
                                                        <h4><a href="#">Jessie Manrty</a></h4>
                                                        <div class="listing-rating card-popup-rainingvis" data-starrating2="5"> </div>
                                                        <div class="clearfix"></div>
                                                        <p>" Commodo est luctus eget. Proin in nunc laoreet justo volutpat blandit enim. Sem felis, ullamcorper vel aliquam non, varius eget justo. Duis quis nunc tellus sollicitudin mauris. "</p>
                                                        <span class="reviews-comments-item-date"><i class="fa fa-calendar-check-o"></i>27 May 2018</span>
                                                    </div>
                                                </div>
                                                <!--reviews-comments-item end-->
                                                <!-- reviews-comments-item -->
                                                <div class="reviews-comments-item">
                                                    <div class="review-comments-avatar">
                                                        <img src="resources/images/avatar/1.jpg" alt="">
                                                    </div>
                                                    <div class="reviews-comments-item-text">
                                                        <h4><a href="#">Mark Rose</a></h4>
                                                        <div class="listing-rating card-popup-rainingvis" data-starrating2="4"> </div>
                                                        <div class="clearfix"></div>
                                                        <p>" Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. "</p>
                                                        <span class="reviews-comments-item-date"><i class="fa fa-calendar-check-o"></i>12 April 2018</span>
                                                    </div>
                                                </div>
                                                <!--reviews-comments-item end-->
                                                <!-- reviews-comments-item -->
                                                <div class="reviews-comments-item">
                                                    <div class="review-comments-avatar">
                                                        <img src="resources/images/avatar/1.jpg" alt="">
                                                    </div>
                                                    <div class="reviews-comments-item-text">
                                                        <h4><a href="#">Adam Koncy</a></h4>
                                                        <div class="listing-rating card-popup-rainingvis" data-starrating2="5"> </div>
                                                        <div class="clearfix"></div>
                                                        <p>" Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc posuere convallis purus non cursus. Cras metus neque, gravida sodales massa ut. "</p>
                                                        <span class="reviews-comments-item-date"><i class="fa fa-calendar-check-o"></i>03 December 2017</span>
                                                    </div>
                                                </div>
                                                <!--reviews-comments-item end-->
                                            </div>
                                        </div>
                                        <!-- list-single-main-item end -->
                                        <!-- list-single-main-item -->
                                        <div class="list-single-main-item fl-wrap" id="sec5" style="width:1035px;">
                                            <div class="list-single-main-item-title fl-wrap">
                                                <h3>리뷰</h3>
                                            </div>
                                            <!-- Add Review Box -->
                                            <div id="add-review" class="add-review-box">
                                                <div class="leave-rating-wrap">
                                                    <span class="leave-rating-title">평점 : </span>
                                                    <div class="leave-rating">
                                                        <input type="radio" name="rating" id="rating-1" value="1"/>
                                                        <label for="rating-1" class="fa fa-star-o"></label>
                                                        <input type="radio" name="rating" id="rating-2" value="2"/>
                                                        <label for="rating-2" class="fa fa-star-o"></label>
                                                        <input type="radio" name="rating" id="rating-3" value="3"/>
                                                        <label for="rating-3" class="fa fa-star-o"></label>
                                                        <input type="radio" name="rating" id="rating-4" value="4"/>
                                                        <label for="rating-4" class="fa fa-star-o"></label>
                                                        <input type="radio" name="rating" id="rating-5" value="5"/>
                                                        <label for="rating-5" class="fa fa-star-o"></label>
                                                    </div>
                                                </div>
                                                <!-- Review Comment -->
                                                <form   class="add-comment custom-form">
                                                    <fieldset>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label><i class="fa fa-user-o"></i></label>
                                                                <input type="text" placeholder="Your Name *" value=""/>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label><i class="fa fa-envelope-o"></i>  </label>
                                                                <input type="text" placeholder="Email Address*" value=""/>
                                                            </div>
                                                        </div>
                                                        <textarea cols="40" rows="3" placeholder="Your Review:"></textarea>
                                                    </fieldset>
                                                    <button class="btn  big-btn  color-bg flat-btn">Submit Review <i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
                                                </form>
                                            </div>
                                            <!-- Add Review Box / End -->
                                        </div>
                                        <button class="updatemove" onclick="updatePage()">수정 하기</button>
                                        <!-- list-single-main-item end -->
                                    </div>
                                </div>
                                <!--box-widget-wrap -->
                                <div class="col-md-4">
                                    <div class="box-widget-wrap">
                                        <!--box-widget-item -->
                                        <div class="box-widget-item fl-wrap" style="margin-left:57%;">
                                            <div class="box-widget-item-header">
                                                <h3>Working Hours : </h3>
                                            </div>
                                            <div class="box-widget opening-hours">
                                                <div class="box-widget-content">
                                                    <span class="current-status"><i class="fa fa-clock-o"></i> Now Open</span>
                                                    <ul>
                                                        <li><span class="opening-hours-day">Monday </span><span class="opening-hours-time">9 AM - 5 PM</span></li>
                                                        <li><span class="opening-hours-day">Tuesday </span><span class="opening-hours-time">9 AM - 5 PM</span></li>
                                                        <li><span class="opening-hours-day">Wednesday </span><span class="opening-hours-time">9 AM - 5 PM</span></li>
                                                        <li><span class="opening-hours-day">Thursday </span><span class="opening-hours-time">9 AM - 5 PM</span></li>
                                                        <li><span class="opening-hours-day">Friday </span><span class="opening-hours-time">9 AM - 5 PM</span></li>
                                                        <li><span class="opening-hours-day">Saturday </span><span class="opening-hours-time">9 AM - 3 PM</span></li>
                                                        <li><span class="opening-hours-day">Sunday </span><span class="opening-hours-time">Closed</span></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <!--box-widget-item -->
                                        <!--box-widget-item end -->
                                        <!--box-widget-item -->
                                        <div class="box-widget-item fl-wrap" style="margin-left:57%;">
                                            <div class="box-widget-item-header">
                                                <h3>Location / Contacts : </h3>
                                            </div>
                                            <div class="box-widget">
                                                <div class="map-container">
                                                    <div id="singleMap" data-latitude="40.7427837" data-longitude="-73.11445617675781" data-mapTitle="Our Location"></div>
                                                </div>
                                                <div class="box-widget-content">
                                                    <div class="list-widget-social">
                                                        <ul>
                                                            <li><a href="#" target="_blank" ><i class="fa fa-facebook"></i></a></li>
                                                            <li><a href="#" target="_blank"><i class="fa fa-twitter"></i></a></li>
                                                            <li><a href="#" target="_blank" ><i class="fa fa-vk"></i></a></li>
                                                            <li><a href="#" target="_blank" ><i class="fa fa-whatsapp"></i></a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--box-widget-wrap end -->
                            </div>
                        </div>
                    </section>
                    <!--  section  end-->
                    <div class="limit-box fl-wrap"></div>
                </div>
                <!--  content  end-->
            </div>
            <!-- wrapper end -->
           
            <!--booking-modal-wrap -->
            <div class="booking-modal-wrap">
                <div class="booking-modal-container">
                    <div class="booking-modal-content fl-wrap">
                        <div class="booking-modal-info">
                            <div class="booking-modal-close color-bg"><i class="fa fa-times" aria-hidden="true"></i></div>
                            <div class="bg"  data-bg="images/bg/1.jpg" ></div>
                            <div class="overlay"></div>
                            <div class="booking-modal-info_content fl-wrap">
                                <h4>Luxury Hotel Spa</h4>
                                <ul>
                                    <li>Date : <span>05.05.2020</span></li>
                                    <li>Persons : <span>2</span></li>
                                    <li>Price : <span>$120</span> </li>
                                </ul>
                            </div>
                        </div>
                        <div class="bookiing-form-wrap">
                            <ul id="progressbar">
                                <li class="active"><span>01.</span>Personal Info</li>
                                <li><span>02.</span>Billing Address</li>
                                <li><span>03.</span>Payment Method</li>
                                <li><span>04.</span>Confirm</li>
                            </ul>
                            <!--   list-single-main-item -->
                            <div class="list-single-main-item fl-wrap hidden-section tr-sec">
                                <div class="profile-edit-container">
                                    <div class="custom-form">
                                        <form>
                                            <fieldset class="fl-wrap">
                                                <div class="list-single-main-item-title fl-wrap">
                                                    <h3>Your personal Information</h3>
                                                </div>
                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <label>First Name <i class="fa fa-user"></i></label>
                                                        <input type="text" placeholder="Your Name" value=""/>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <label>Last Name <i class="fa fa-user"></i></label>
                                                        <input type="text" placeholder="Your Last Name" value=""/>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <label>Email Address<i class="fa fa-envelope"></i>  </label>
                                                        <input type="text" placeholder="yourmail@domain.com" value=""/>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <label>Phone<i class="fa fa-phone"></i>  </label>
                                                        <input type="text" placeholder="87945612233" value=""/>
                                                    </div>
                                                </div>
                                                <div class="log-massage">Existing Customer? <a href="#" class="modal-open">Click here to login</a></div>
                                                <div class="log-separator fl-wrap"><span>or</span></div>
                                                <div class="soc-log fl-wrap">
                                                    <p>For faster login or register use your social account.</p>
                                                    <a href="#" class="facebook-log"><i class="fa fa-facebook-f"></i>Connect with Facebook</a>
                                                </div>
                                                <div class="filter-tags">
                                                    <input id="check-ac" type="checkbox" name="check">
                                                    <label for="check-ac">By continuing, you agree to the<a href="#" target="_blank">Terms and Conditions</a>.</label>
                                                </div>
                                                <span class="fw-separator"></span>
                                                <a  href="#"  class="next-form back-form action-button btn  big-btn  color-bg flat-btn">Payment Step
                                                <i class="fa fa-angle-right"></i></a>
                                            </fieldset>
                                            <fieldset class="fl-wrap">
                                                <div class="list-single-main-item-title fl-wrap">
                                                    <h3>Billing Address</h3>
                                                </div>
                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <label>City <i class="fa fa-globe"></i></label>
                                                        <input type="text" placeholder="Your city" value=""/>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <label>Country </label>
                                                        <select data-placeholder="Your Country" class="chosen-select no-search-select" >
                                                            <option>United states</option>
                                                            <option>Asia</option>
                                                            <option>Australia</option>
                                                            <option>Europe</option>
                                                            <option>South America</option>
                                                            <option>Africa</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <label>Street <i class="fa fa-road"></i> </label>
                                                        <input type="text" placeholder="Your Street" value=""/>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-sm-8">
                                                        <label>State<i class="fa fa-street-view"></i></label>
                                                        <input type="text" placeholder="Your State" value=""/>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <label>Postal code<i class="fa fa-barcode"></i> </label>
                                                        <input type="text" placeholder="123456" value=""/>
                                                    </div>
                                                </div>
                                                <div class="list-single-main-item-title fl-wrap">
                                                    <h3>Addtional Notes</h3>
                                                </div>
                                                <textarea cols="40" rows="3" placeholder="Notes"></textarea>
                                                <span class="fw-separator"></span>
                                                <a  href="#"  class="previous-form action-button back-form   color-bg"><i class="fa fa-angle-left"></i> Back</a>
                                                <a  href="#"  class="next-form back-form action-button btn  big-btn  color-bg flat-btn">Payment Step
                                                <i class="fa fa-angle-right"></i></a>
                                            </fieldset>
                                            <fieldset class="fl-wrap">
                                                <div class="list-single-main-item-title fl-wrap">
                                                    <h3>Payment method</h3>
                                                </div>
                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <label>Cardholder's Name<i class="fa fa-user"></i></label>
                                                        <input type="text" placeholder="" value="Adam Kowalsky"/>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <label>Card Number <i class="fa fa-credit-card"></i></label>
                                                        <input type="text" placeholder="xxxx-xxxx-xxxx-xxxx" value=""/>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-sm-3">
                                                        <label>Expiry Month<i class="fa fa-calendar"></i></label>
                                                        <input type="text" placeholder="MM" value=""/>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <label>Expiry Year<i class="fa fa-calendar"></i></label>
                                                        <input type="text" placeholder="YY" value=""/>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <label>CVV / CVC *<i class="fa fa-credit-card"></i></label>
                                                        <input type="password" placeholder="***" value=""/>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <p style="padding-top:20px;">*3 digits number on the back of your card</p>
                                                    </div>
                                                </div>
                                                <div class="log-separator fl-wrap"><span>or</span></div>
                                                <div class="soc-log fl-wrap">
                                                    <p>Select Other Payment Method</p>
                                                    <a href="#" class="paypal-log"><i class="fa fa-paypal"></i>Pay With Paypal</a>
                                                </div>
                                                <span class="fw-separator"></span>
                                                <a  href="#"  class="previous-form  back-form action-button    color-bg"><i class="fa fa-angle-left"></i> Back</a>
                                                <a  href="#"  class="next-form back-form action-button btn  big-btn  color-bg flat-btn">Payment Step
                                                <i class="fa fa-angle-right"></i></a>
                                            </fieldset>
                                            <fieldset class="fl-wrap">
                                                <div class="list-single-main-item-title fl-wrap">
                                                    <h3>Confirmation</h3>
                                                </div>
                                                <div class="success-table-container">
                                                    <div class="success-table-header fl-wrap">
                                                        <i class="fa fa-check-circle decsth"></i>
                                                        <h4>Thank you. Your reservation has been received.</h4>
                                                        <div class="clearfix"></div>
                                                        <p>Your payment has been processed successfully.</p>
                                                        <a href="invoice.html" target="_blank" class="color-bg">View Invoice</a>
                                                    </div>
                                                </div>
                                                <span class="fw-separator"></span>
                                                <a  href="#"  class="previous-form action-button  back-form   color-bg"><i class="fa fa-angle-left"></i> Back</a>
                                            </fieldset>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!--   list-single-main-item end -->
                        </div>
                    </div>
                </div>
            </div>
            <div class="bmw-overlay"></div>
            <a class="to-top"><i class="fa fa-angle-up"></i></a>
            <!--chat-widget -->
            <div class="chat-widget-button"><i class="fa fa-comments-o"></i><span>Chat With Owner</span></div>
            <div class="chat-widget_wrap not-vis-chat">
                <div class="chat-widget_header color-bg">
                    <h3>Chat with  <a href="author-single.html"> Alisa Noory</a></h3>
                    <div class="status st_online"><span></span>Online</div>
                </div>
                <div class="chat-body">
                    <!-- message-->
                    <div class="chat-message chat-message_guest fl-wrap">
                        <div class="dashboard-message-avatar">
                            <img src="images/avatar/1.jpg" alt="">
                        </div>
                        <span class="chat-message-user-name">Jessie</span>
                        <span class="massage-date">25 may 2018  <span>7.51 PM</span></span>
                        <p>Vivamus lobortis vel nibh nec maximus. Donec dolor erat, rutrum ut feugiat sed, ornare vitae nunc. </p>
                    </div>
                    <!-- message end-->
                    <!-- message-->
                    <div class="chat-message chat-message_user fl-wrap">
                        <div class="dashboard-message-avatar">
                            <img src="images/avatar/1.jpg" alt="">
                        </div>
                        <span class="chat-message-user-name">Alica</span>
                        <span class="massage-date">25 may 2018  <span>7.51 PM</span></span>
                        <p>Nulla eget erat consequat quam feugiat dapibus eget sed mauris.</p>
                    </div>
                    <!-- message end-->
                    <!-- message-->
                    <div class="chat-message chat-message_guest fl-wrap">
                        <div class="dashboard-message-avatar">
                            <img src="images/avatar/1.jpg" alt="">
                        </div>
                        <span class="chat-message-user-name">Jessie</span>
                        <span class="massage-date">25 may 2018  <span>7.51 PM</span></span>
                        <p>Sed non neque faucibus, condimentum lectus at, accumsan enim. Fusce pretium egestas cursus..</p>
                    </div>
                    <!-- message end-->
                </div>
                <div class="chat-widget_input fl-wrap">
                    <textarea  placeholder="Type Message"></textarea>
                    <button type="submit"><i class="fa fa-paper-plane-o"></i></button>
                </div>
            </div>
            <!--chat-widget end -->
        </div>
        
        <!-- Main end -->
        <!--=============== scripts  ===============-->
        <script type="text/javascript" src="resources/js/jquery.min.js"></script>
        <script type="text/javascript" src="resources/js/plugins.js"></script>
        <script type="text/javascript" src="resources/js/scripts.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=YOURAPIKEYHERE&libraries=places&callback=initAutocomplete"></script>
        <script type="text/javascript" src="resources/js/map_infobox.js"></script>
        <script type="text/javascript" src="resources/js/markerclusterer.js"></script>
        <script type="text/javascript" src="resources/js/maps.js"></script>
  </body>
</html>