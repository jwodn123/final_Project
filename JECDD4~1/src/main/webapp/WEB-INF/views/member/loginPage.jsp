<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>JejuBnB</title>
   <link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">
    <link rel="stylesheet" href="resources/css/loginPage.css" >
    <link rel="stylesheet" href="resources/css/bootstrap.min.css" >
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="resources/css/xeicon.css" >
    <style>
		.fLogin {
		    position: relative;
		    overflow: hidden;
		    width: 95%;
		    height: 3.125rem;
		    line-height: 3.125rem;
		    color: #fff;
		    margin-top: 0.625rem;
		    cursor: pointer;
		    background-color: #4867aa;
		    list-style: none;
		    text-align: center;
		}
		.fLogin span {
		    position: absolute;
		    top: 0;
		    left: 0;
		    width: 3.125rem;
		    height: 3.125rem;
		    float: left;
		    border-right: 1px solid #fff;
		    line-height: 3rem;
		}
		.fLogin span i {
		    font-size: 20px;
		    line-height: 3rem;
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
  function click() {
	  if (event.button==2) {
	    location.href="javascript:history.back();";
	  }
	}

	document.onmousedown=click
  </script>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v8.0&appId=341232443584667&autoLogAppEvents=1" nonce="4fmSTMsw"></script>
</head>
<body>
    <div class="container-fluid">
        <div class="row no-gutter">
            <div class="col-md-6 d-none d-md-flex bg-image"></div>
            <div class="col-md-6 bg-light">
                <div class="login d-flex align-items-center py-5">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-10 col-xl-7 mx-auto">
                              <div class="logo">
                                <img src="resources/images/무제.png" >
                              </div>
                                <form action="login.do" method="post">	
                                    <div class="form-group mb-3">
                                        <input id="inputEmail" type="text" placeholder="Email address" required="" autofocus="" class="form-control rounded-pill border-0 shadow-sm px-4" name="user_id">
                                    </div>
                                    <div class="form-group mb-3">
                                        <input id="inputPassword" type="password" placeholder="Password" required="" class="form-control rounded-pill border-0 shadow-sm px-4 text-primary" name="user_pwd">
                                    </div>
                                    <div class="custom-control custom-checkbox mb-3">
                                        <input id="customCheck1" type="checkbox" checked class="custom-control-input">
                                        <label for="customCheck1" class="custom-control-label">비밀번호 기억하기</label> 
                                    </div>
                                    <button type="submit" class="signin__btn">로그인</button>
                                    <div class="separator">
                                      <p>OR</p>
                                    </div>
                                   	 <li id="status" scope="public_profile,email" onclick="javascript:login();" class="fLogin">
                               			 <span>
                               				 <i class="xi-facebook">
                               				 </i>
                          				 </span>페이스북 로그인
                           			</li>
                            			<a href="email.do" class="enroll">회원 가입</a> 
                                        <a href="searchpwdPage.do" class="findpas">비밀번호 찾기</a>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
      </div>
	  		<div id="status">
			</div>
			<div id="fb-root">
			</div>
      <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
      <script src="resources/js/jquery-3.3.1.slim.min.js"></script>
      <script src="resources/js/bootstrap.bundle.min.js"></script>
      <script src="http://oxtag.com/html/js/js1/back.js"></script>
</body>
</html>