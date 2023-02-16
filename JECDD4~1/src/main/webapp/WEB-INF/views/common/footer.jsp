<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" isErrorPage="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
        <script type="text/javascript" src="resources/js/jquery.min.js"></script>
        <script type="text/javascript" src="resources/js/plugins.js"></script>
        <script type="text/javascript" src="resources/js/scripts.js"></script>
  </head>
  <body>
<footer class="main-footer dark-footer  ">
                <div class="container">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="footer-widget fl-wrap">
                                <h3>About Us</h3>
                                <div class="footer-contacts-widget fl-wrap">
                                    <p>바쁜 일상 속 현대인들에게 좋은 공간과 체험을 소개시켜주는 Jeju BnB 입니다. </p>
                                    <ul  class="footer-contacts fl-wrap">
                                        <li><span><i class="fa fa-envelope-o"></i> Mail :</span><a href="#" target="_blank">jbk3148@gmail.com</a></li>
                                        <li> <span><i class="fa fa-map-marker"></i> Address :</span><a href="#" target="_blank">서울 중구 남대문로 120 대일빌딩 KH 정보 교육원</a></li>
                                        <li><span><i class="fa fa-phone"></i> Phone :</span><a href="#">010 7151 3148</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="footer-widget fl-wrap">
                                <h3>팀원 소개  : 팀장</h3> 
                                <div class="widget-posts fl-wrap">
                                    <ul>
                                        <li class="clearfix">
                                            <a href="myinfo.do?user_id=jbk3148@naver.com"  class="widget-posts-img"><img src="resources/images/범관.jpg" class="respimg" alt=""></a>
                                            <div class="widget-posts-descr">
                                                <a href="#" title="">전 범관</a>
                                                <span class="widget-posts-date"> 010 7151 3148 </span> 
                                            </div>
                                        </li>
                                                                            
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="footer-widget fl-wrap">
                                <h3>팀원 소개  : 팀원</h3>
                                <div class="widget-posts fl-wrap">
                                    <ul>
                                        <li class="clearfix">
                                            <a href="#"  class="widget-posts-img"><img src="resources/images/뚱이.jpg" class="respimg" alt=""></a>
                                            <div class="widget-posts-descr">
                                                <a href="myinfo.do?user_id=leedh2752@naver.com" title="">이 동훈</a>
                                                <span class="widget-posts-date"> 010 8713 6648 </span> 
                                            </div>
                                        </li>
                                        <li class="clearfix">
                                            <a href="#"  class="widget-posts-img"><img src="resources/images/오승석.png" class="respimg" alt=""></a>
                                            <div class="widget-posts-descr">
                                                <a href="myinfo.do?user_id=oss7900@gmail.com" title=""> 오 승석</a>
                                                <span class="widget-posts-date"> 010 5365 7917</span> 
                                            </div>
                                        </li>                                       
                                    </ul>
                                </div>
                            </div>
                        </div>
                         <div class="col-md-3">
                            <div class="footer-widget fl-wrap">
                                <h3>팀원 소개  : 팀원 </h3>
                                <div class="widget-posts fl-wrap">
                                    <ul>
                                        <li class="clearfix">
                                            <a href="#"  class="widget-posts-img"><img src="resources/images/전재우.png" class="respimg" alt=""></a>
                                            <div class="widget-posts-descr">
                                                <a href="myinfo.do?user_id=" title="">전 재우</a>
                                                <span class="widget-posts-date"> 010 3728 6657 </span> 
                                            </div>
                                        </li>  
										<li class="clearfix">
                                            <a href="#"  class="widget-posts-img"><img src="resources/images/변근영.jpg" class="respimg" alt=""></a>
                                            <div class="widget-posts-descr">
                                                <a href="myinfo.do?user_id=bgy8135@naver.com" title=""> 변 근영</a>
                                                <span class="widget-posts-date"> 010 3364 0602 </span> 
                                            </div>
                                        </li>                                                                          
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="sub-footer fl-wrap">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="about-widget">
                                 <a class="navbar-brand" href="main.do"><div class="logo">JejuBnB</div></a>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="copyright"> &#169; Jeju BnB 2020 .  All rights reserved.</div>
                            </div>
                            <div class="col-md-4">
                                <div class="footer-social">
                                    <ul>
                                        <li><a href="#" target="_blank" ><i class="fa fa-facebook-official"></i></a></li>
                                        <li><a href="#" target="_blank"><i class="fa fa-twitter"></i></a></li>
                                        <li><a href="#" target="_blank" ><i class="fa fa-chrome"></i></a></li>
                                        <li><a href="#" target="_blank" ><i class="fa fa-vk"></i></a></li>
                                        <li><a href="#" target="_blank" ><i class="fa fa-whatsapp"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
             <script type="text/javascript" src="resources/js/jquery.min.js"></script>
        <script type="text/javascript" src="resources/js/plugins.js"></script>
        <script type="text/javascript" src="resources/js/scripts.js"></script>
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDwJSRi0zFjDemECmFl9JtRj1FY7TiTRRo&libraries=places&callback=initAutocomplete"></script>
   
  </body>
</html>