<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <link rel="stylesheet" href="resources/css/bootstrap.min.css" >
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <style type="text/css">
    @font-face {
       font-family: 'Cafe24Oneprettynight';
       src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Oneprettynight.woff') format('woff');
       font-weight: normal;
       font-style: normal;
     }
    .login,
    .image {
    min-height: 100vh;
    }
    .bg-image {
    background-image: url('resources/images/32.jpg');
    background-size: cover;
    background-position: center center;
    }
    .logo img{
     position: fixed;
	 left: 66%;
	 top: -1%;
    }
    .rounded-pill {
      border-radius: 8px;
    }
    .name {
	    font-family: 'Cafe24Oneprettynight';
	    position: fixed;
        left: 64%;
        top: 21%;
	    font-size: 28px;
	    width: 300px;
	    height: 200px;
    }
    .check_btn {
	    background: #FFC19E;
	    color: white;
	    display: block;
	    width: 92.5%;
	    max-width: 680px;
	    height: 50px;
	    border-radius: 8px;
	    margin: 0 auto;
	    border: none;
	    cursor: pointer;
	    font-size: 14px;
	    font-family: 'Cafe24Oneprettynight';
	    box-shadow: 0 15px 30px rgba(255, 193, 158, 0.36);
	    -webkit-transition: .2s linear;
	    transition: .2s linear;
    }
	.myimg {
		width: 80px;
		height: 80px;
		border-radius: 50%;
		background-image: url('resources/images/프로필.jfif');
		background-size: cover;
		position: fixed;
	    left: 57%;
	    top: 19%;
	}
	.alr {
		font-family: 'Cafe24Oneprettynight';
		position: relative;
    top: -382%;
    left: 5%;
	}
	.xbu {
		border : none;
		background: none;
	    margin-left: 3%;
	    color: red;
	}
    </style>
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
                                 <img src="resources/images/무제.png">
                              </div>
                              <span class="myimg"></span>
                               <div class="name">${loginMember.user_id }</div>
                               <ul class="alr">
                                 <c:forEach items="${list }" var="notice">
                                		<form action="deleteUNotice.do" method="post">
                                		<input type="hidden" name="userid" value="${loginMember.user_id }">
                                		<input type="hidden" name="noticeno" value="${notice.notice_no }">
                                			<li>알림 : ${notice.notice_content } <button id="delete" type="submit" class="xbu"><span>&#10005;</span></button></li>
                                		</form>
                                	</c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
      </div>

      <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
      <script src="resources/js/jquery-3.3.1.slim.min.js"></script>
      <script src="resources/js/bootstrap.bundle.min.js"></script>
  </body>
</html>