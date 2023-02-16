<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
	<style>
		/* 사이드바 스타일 */
		.sidenav {
			height:450px;
			width: 250px;
			position: fixed;
			z-index:1;
			left: 0;
			background-color: rgb(0,154,200);
			overflow-x: hidden;
			transition:0.5s ease-in-out;
			    margin-top: 20%;
  			 margin-left: 5%;
		}
		.sidenav a {
			padding: 8px 8px 8px 32px;
			text-decoration: none;
			font-size: 25px;
			color: #fff;
			display: block;
			transition: 0.2s ease-in-out;
		}
		.sidenav a:hover, .offcanvas a:focus {
			color: #000;
		}
		.closebtn {
			position: absolute;
			top: 0;
			right: 25px;
			font-size: 36px !important;
			margin-left: 50px;
		}
		.openmenu:hover {
			color:rgb(0,154,200);
			transition:0.5s ease-in-out;
		}
		.openmenu {
			padding-top: 0;
			margin-top: 15%;
		    margin-left: 5%;
			width: 15%;
   			height: 5%;
			font-size: 45px;
			cursor:pointer;
			position: fixed;
			transition:0.5s ease-in-out;
		}
		.openmenu > i {
			font-size: 30px;
		}
		/* 미디어쿼리 적용 */
		@media screen and (max-height:450px) {
			.sidenav {
				padding-top:0;
			}
			.sidenav a {
				font-size: 18px;
			}
		}
	</style>
<title>Insert title here</title>
</head>
<body>
<div id="mysidenav" class="sidenav" value="고객센터">
		<a href="#" class="closebtn" onclick='closeNav()'>x</a>
		<a href="eventPage.do">이벤트</a>
		<c:if test="${!empty loginMember and  loginMember.admin_check eq 'Y' }"> 		
		<a href="couponPage.do">쿠폰</a>
		</c:if> 
		<a href="policyPage.do">약관 및 개인정보</a>
		<a href="#">1:1문의</a>
		<a href="#">자주묻는질문(FAQ)</a>
	</div>
	<span class="openmenu" onclick='openNav()'><i class="fa fa-angle-double-left fa-5" aria-hidden="true"></i> 고객센터</span>

	<script>
		function openNav() {
			document.getElementById('mysidenav').style.width = '250px';
		}
		function closeNav() {
			document.getElementById('mysidenav').style.width = '0';
		}
	</script>
</body>
</html>