<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
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
        <script type="text/javascript" src="resources/js/jquery.min.js"></script>
        <script type="text/javascript" src="resources/js/plugins.js"></script>
        <script type="text/javascript" src="resources/js/scripts.js"></script>
      <style type="text/css">
        #movemail {
        background: #3b9098;
        float: left;
       width: 100%;
       padding: 13px 0;
       color: #fff;
       margin-bottom: 10px;
       border-radius: 4px;
       font-size: 14px;
       line-height: 30px;
       font-weight: 500;
        }

        </style>
        
      <script>
       function statusChangeCallback(response) {  
             console.log('statusChangeCallback');
             console.log(response);                   
             if (response.status === 'connected') {   
               testAPI();  
             } else {                                 
               document.getElementById('status').innerHTML = 'Please log ' +
                 'into this webpage.';
             }
           }
           function login() {
               FB.login(function(response) {
         
                   statusChangeCallback(response);
         
               }, {scope: 'public_profile,email'});            
           }
           function checkLoginState() {               
             FB.getLoginStatus(function(response) {   
               statusChangeCallback(response);
             });
           }
           window.fbAsyncInit = function() {
             FB.init({
               appId      : '{341232443584667}',
               cookie     : true,                    
               xfbml      : true,                     
               version    : '{v8.0}'           
             });
             FB.getLoginStatus(function(response) {   
               statusChangeCallback(response);        
             });
           };
           function testAPI() {                     
             console.log('Welcome!  Fetching your information.... ');
             FB.api('/me?fields=id,name,email', function(response) {
               console.log('Successful login for: ' + response.name);
               document.getElementById('status').innerHTML =
                 'Thanks for logging in, ' + response.name + '!';
                 location.href ="facebooklogin.do?name="+response.name+"&email="+response.email
             });
           }
          
           function message() {
                 window.open("moveMessageList.do?user_one=${loginMember.user_id }" , "????????????",
              "width=374, height=640, left=500, top=50, toolbar=no, menubar=no, scrollbars=no, resizable=yes" ); 
              }
           
           function moveAdFilterPage()
            {   
            var popupX = (document.body.offsetWidth / 2) - (800 / 2);
            //&nbsp;?????? ????????? ?????? ????????? 1/2 ?????? ??????????????? ????????????

            var popupY= (window.screen.height / 2) - (800 / 2);
            //&nbsp;?????? ????????? ?????? ????????? 1/2 ?????? ??????????????? ????????????

               window.name = "ListView";
                window.open("moveFilterList.do","??????","width=800,height=800, left="+ popupX + ", top="+ popupY);
                
            }
     </script>
   <script async defer crossorigin="anonymous" src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v8.0&appId=341232443584667&autoLogAppEvents=1" nonce="4fmSTMsw"></script>
    </head>
    <body>       
            <!-- header-->
            <header class="main-header dark-header fs-header sticky">
                <div class="header-inner">
                    <div class="logo-holder">
                        <a class="navbar-brand" href="main.do"><div class="logo">JejuBnB</div></a>
                    </div>
                    <form action="roomlist.do">
                    <div class="header-search vis-header-search">
                        <div class="header-search-input-item">
                            <input type="text" placeholder="??????" name="people" style="padding-left:50px;"/>
                        </div>
                       <div class="header-search-input-item" style="border-top-left-radius:0;border-bottom-left-radius:0;width: 200px;padding:0;">
                            <input type="date" name="checkin" style="width:100%"/>
                        </div>
                        <div class="header-search-input-item"  style="border-top-left-radius:0;border-bottom-left-radius:0;width: 200px;padding:0;" >
                            <input type="date" name="checkout" style="width:100%"/>
                        </div>
                        <button class="header-search-button" type="submit">Search</button>                        
                    </div>
                    </form>
                    <div class="show-search-button"><i class="fa fa-search"></i> <span>Search</span></div>
                   <c:if test="${empty loginMember }">
                	    <div class="show-reg-form modal-open"><i class="fa fa-sign-in"></i>Sign In</div>
                    </c:if>
                    <c:if test="${!empty loginMember and empty loginMember.admin_check  and loginMember.host_check eq 'Y'}">
                   <div class="nav-holder main-menu">
                        <nav>
                            <ul>
                                <li>
                                    <a href="#">Hello , ${loginMember.user_name } </a>  
                                    <ul>
                                        <li><a href="moveMyPage.do">??? ?????? ??????</a></li>                                    
                                        <li><a href="javascript:message();">?????????</a></li> 
                                        <li><a href="logout.do">????????????</a></li>
                                    </ul>                                 
                                </li>
                        </ul>
                        </nav>
                    </div>
                    </c:if>
                        <c:if test="${! empty loginMember and loginMember.admin_check eq 'Y' and empty loginMember.host_check }">
                   <div class="nav-holder main-menu">
                        <nav>
                            <ul>
                                <li>
                                    <a href="#">Hello , ${loginMember.user_name } </a>  
                                    <ul>
                                        <li><a href="moveAdminMemberPage.do">?????? ??????</a></li>
                                        <li><a href="moveHostRequestPage.do">host ??????</a></li>                                    
                                        <li><a href="javascript:message();">?????????</a></li> 
                                        <li><a href="logout.do">????????????</a></li>
                                    </ul>                                 
                                </li>
                        </ul>
                        </nav>
                    </div>
                    </c:if>
                     <c:if test="${! empty loginMember and empty loginMember.admin_check and empty loginMember.host_check }">
                   <div class="nav-holder main-menu">
                        <nav>
                            <ul>
                                <li>
                                    <a href="#">Hello , ${loginMember.user_name } </a>  
                                     <ul>
                                        <li><a href="moveMyPage.do">??? ?????? ??????</a></li>                                    
                                        <li><a href="javascript:message();">?????????</a></li> 
                                        <li><a href="logout.do">????????????</a></li>
                                    </ul>                                 
                                </li>
                        </ul>
                        </nav>
                    </div>
                    </c:if>
                    <!-- nav-button-wrap--> 
                    <div class="nav-button-wrap color-bg">
                        <div class="nav-button">
                            <span></span><span></span><span></span>
                        </div>
                    </div>
                    <!-- nav-button-wrap end-->
                    <!--  navigation --> 
                    <c:if test="${empty loginMember }">
                    <div class="nav-holder main-menu">
                        <nav>
                            <ul>
                               <li>
                                    <a href="main.do">Home </a>                                  
                                </li>
                                <li>
                                    <a href="roomlist.do">?????? </a>                                                                    
                                </li>
                                <li>
                                    <a href="tlist.do">????????? </a>    
                                    <ul>
                                        <li><a href="tlist.do?tour_catigory_no=1">??????</a></li>
                                        <li><a href="tlist.do?tour_catigory_no=2">??????</a></li>
                                        <li><a href="tlist.do?tour_catigory_no=3">??????</a></li>
                                    </ul>                                
                                </li>
                               
                                <li>
                                    <a href="eventPage.do">???????????? </a>     
                                    <ul>
                                         <li><a href="eventPage.do">?????????</a></li>                           
                              <li><a href="policyPage.do">?????? ??? ????????????</a></li>      
                              <li><a href="questionListView.do">1:1??????</a></li>    
                              <li><a href="faqTop7.do">??????????????????(FAQ)</a></li>
                                    </ul> 
                                </li>                               
                            </ul>
                        </nav>
                    </div>
                    </c:if>         
                    
                    <c:if test="${!empty loginMember and loginMember.admin_check eq 'Y' and empty loginMember.host_check}">
                       <div class="nav-holder main-menu">
                        <nav>
                            <ul>
                               <li>
                                    <a href="main.do">Home </a>                                  
                                </li>
                                <li>
                                    <a href="roomlist.do">?????? </a>  
                                    <ul>
                                        <li><a href="moveRoomWrite.do">?????? ??????</a></li>
                                        <li><a onclick="moveAdFilterPage()">?????? ?????? ??????</a></li>
                                    </ul>                                 
                                </li>
                                <li>
                                    <a href="tlist.do">????????? </a>    
                                    <ul>
                                        <li><a href="tlist.do?tour_catigory_no=1">??????</a></li>
                                        <li><a href="tlist.do?tour_catigory_no=2">??????</a></li>
                                        <li><a href="tlist.do?tour_catigory_no=3">??????</a></li>
                                        <li><a href="test.do">????????? ??????</a></li>
                                    </ul>                                
                                </li>
                               
                                <li>
                                    <a href="#">???????????? </a>     
                                    <ul>
                                         <li><a href="eventPage.do">?????????</a></li>                                 
                         	     <li><a href="policyPage.do">?????? ??? ????????????</a></li>                              
                           	   <li><a href="questionListView.do">1:1??????</a></li>    
                            	  <li><a href="faqTop7.do">??????????????????(FAQ)</a></li>
                            	  <li><a href="couponPage.do">??????</a></li>
                           	   <li><a href="questionAdminListView.do">????????? 1:1??????</a></li>
                                    </ul> 
                                </li>                               
                            </ul>
                        </nav>
                    </div>
                    </c:if>
                    <c:if test="${!empty loginMember and loginMember.host_check eq 'Y' and loginMember.admin_check ne 'Y' }">
                       <div class="nav-holder main-menu">
                        <nav>
                            <ul>
                               <li>
                                    <a href="main.do">Home </a>                                  
                                </li>
                                <li>
                                    <a href="roomlist.do">?????? </a>  
                                    <ul>
                                        <li><a href="moveRoomWrite.do">?????? ??????</a></li>                                       
                                    </ul>                                 
                                </li>
                                <li>
                                    <a href="tlist.do">????????? </a>    
                                    <ul>
                                        <li><a href="tlist.do?tour_catigory_no=1">??????</a></li>
                                        <li><a href="tlist.do?tour_catigory_no=2">??????</a></li>
                                        <li><a href="tlist.do?tour_catigory_no=3">??????</a></li>
                                        <li><a href="test.do">????????? ??????</a></li>                                        
                                    </ul>                                
                                </li>
                               
                                <li>
                                    <a href="#">???????????? </a>     
                                    <ul>
                                         <li><a href="eventPage.do">?????????</a></li>                           
                              <li><a href="policyPage.do">?????? ??? ????????????</a></li>      
                              <li><a href="questionListView.do">1:1??????</a></li>    
                              <li><a href="faqTop7.do">??????????????????(FAQ)</a></li>
                                    </ul> 
                                </li>                               
                            </ul>
                        </nav>
                    </div>
                    </c:if>
                    <c:if test="${!empty loginMember and loginMember.admin_check ne 'Y' and loginMember.host_check ne 'Y'}">
                       <div class="nav-holder main-menu">
                        <nav>
                            <ul>
                               <li>
                                    <a href="main.do">Home </a>                                  
                                </li>
                                <li>
                                    <a href="roomlist.do">?????? </a>  
                                    <ul>
                                        <li><a href="moveRoomWrite.do">?????? ??????</a></li>                                        
                                    </ul>                                 
                                </li>
                                <li>
                                   <a href="tlist.do">????????? </a>    
                                    <ul>
                                        <li><a href="tlist.do?tour_catigory_no=1">??????</a></li>
                                        <li><a href="tlist.do?tour_catigory_no=2">??????</a></li>
                                        <li><a href="tlist.do?tour_catigory_no=3">??????</a></li>
                                        <li><a href="test.do">????????? ??????</a></li>
                                    </ul>                                
                                </li>
                               
                                <li>
                                    <a href="#">???????????? </a>     
                                    <ul>
                                         <li><a href="eventPage.do">?????????</a></li>                           
                              <li><a href="policyPage.do">?????? ??? ????????????</a></li>      
                              <li><a href="questionListView.do">1:1??????</a></li>    
                              <li><a href="faqTop7.do">??????????????????(FAQ)</a></li>
                                    </ul> 
                                </li>                               
                            </ul>
                        </nav>
                    </div>
                    </c:if>
                    <!-- navigation  end -->
                </div>          
            </header>
              <!--register form -->
            <div class="main-register-wrap modal">
                <div class="main-overlay"></div>
                <div class="main-register-holder">
                    <div class="main-register fl-wrap">
                        <div class="close-reg"><i class="fa fa-times"></i></div>
                        <h3>Sign In <span>JejuBnB</span></h3>
                        <div class="soc-log fl-wrap">
                            <p>??? ?????? ?????????????????? ??????????????? ?????? ????????? ??????????????????.</p>
                            <a href="javascript:login();" id="status" class="facebook-log"><i class="fa fa-facebook-official"></i>???????????? ?????????</a>
                            <a href="email.do" id="movemail">????????????</a>
                        </div>
                        
                        <div class="log-separator fl-wrap"><span>??????</span></div>
                        <div id="tabs-container">
                            <ul class="tabs-menu">
                                <li class="current"><a href="#tab-1">Login</a></li>
                            </ul>
                            <div class="tab">
                                <div id="tab-1" class="tab-content">
                                    <div class="custom-form">
                                        <form method="post" action="login.do"  name="registerform">
                                            <label>????????? * </label>
                                            <input name="user_id" type="email"   onClick="this.select()"> 
                                            <label >???????????? * </label>
                                            <input name="user_pwd" type="password"   onClick="this.select()"> 
                                            <button type="submit"  class="log-submit-btn"><span>Log In</span></button> 
                                            <div class="clearfix"></div>
                                           
                                        </form>
                                        <div class="lost_password" >
                                            <a href="searchpwdPage.do">???????????? ??????</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab">
                                    <div id="tab-2" class="tab-content">
                                        <div class="custom-form">
                                            <form method="post" action="enroll.do"  name="registerform" class="main-register-form" id="main-register-form2">
                                                <label >?????? * </label>
                                                <input name="user_name" type="text" placeholder="??????"> 
                                                <label>????????? * </label>
                                                <input name="user_id" type="email" placeholder="????????? " onClick="this.select()" >
                                                <label>???????????? * </label>
                                                <input name="user_pwd" type="password" placeholder="???????????? " onClick="this.select()">                                              
                                                <label >???????????? * </label>
                                                <input name="phone" type="tel" placeholder="???????????? " onClick="this.select()"> 
                                                <label >???????????? </label>
                                                <input name="birthday" type="text" placeholder="???????????? "  onClick="this.select()"> 
                                                <button type="submit"     class="log-submit-btn"  ><span>????????????</span></button>  
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
           
            </body>
            </html>