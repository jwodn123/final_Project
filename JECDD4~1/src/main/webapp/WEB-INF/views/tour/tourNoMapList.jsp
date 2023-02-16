<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>JejuBnB</title>
   		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="resources/css/tourNoMapList.css" >
  </head>
  <body>
    <div class="mainhead">
         <div class="logo">
           <a href="main.do"><img src="resources/images/무제.png"></a>
         </div>
    <div class="dropdown"><span class="myimg"></span></div>
          <c:if test="${ !empty loginMember and  loginMember.admin_check eq 'Y' }">
     	<ul class="dropdown-list">
	     	<li onclick="javascript:location.href='moveAdminPage.do'"> 관리자 </li>
	        <li onclick="winOpen1()"> 필터 관리</li>
       		<li onclick="winOpen3()"> 알림 관리</li>
	        <li onclick="winOpen2()"> 알림</li>
	        <hr class="divider">
	        <li> 고객센터</li>
	        <li onclick="javascript:location.href='logout.do'"> 로그아웃</li>
        </ul>
     </c:if>
     <c:if test="${empty loginMember }">
     	<ul class="dropdown-list">
     	   <li onclick="javascript:location.href='roomlist.do'"> 숙소</li>
     	   <li onclick="javascript:location.href='tlist.do'"> 관광지</li>
     	   <hr class="divider">
	       <li> 고객센터</li>
	       <li onclick="movePage()">로그인</li>
        </ul>
     </c:if>
     <c:if test="${!empty loginMember and  empty loginMember.admin_check}">
     <ul class="dropdown-list">
       <li onclick="javascript:location.href='moveMyPage.do'"> 내 정보 보기</li>
       <li onclick="javascript:location.href='moveMyRoom.do?userid=${loginMember.user_id }'"> 저장 목록</li>
       <li onclick="winOpen2()"> 알림</li>
       <li onclick="javascript:location.href='moveRoomWrite.do'"> 사장님 신청하기</li>
       <hr class="divider">
       <li onclick="javascript:location.href='roomlist.do'"> 숙소</li>
       <li onclick="javascript:location.href='tlist.do'"> 관광지</li>
       <hr class="divider">
       <li> 고객센터</li>
       <li onclick="javascript:location.href='logout.do'"> 로그아웃</li>
     </ul>
     </c:if>
  </div>
   <div class="thead"><h1 class="tour">관광지</h1></div>
    <div style="padding: 100px 0px 0px 0px;"></div>
     <button class="live">자연</button>
     <button class="cook">맛집</button>
     <button class="act">액티비티</button>
     <button class="movelist" onclick="javascipt:location.href='tlist.do'"><i class="fas fa-map-marked-alt"></i></button>
     <div style="padding: 100px 0px 0px 0px;"></div>
       <div class="tourlist">
	       <c:forEach items="${ requestScope.list }" var="t">
	         <div class="one">
	           <a href="tdetail.do?tour_no=${ t.tour_no }" target="_blank"><img src="resources/images/01.jpg" width=100% height=100%>
	            <span>&#9733;</span> 4.8 ( 135 )<br>
	             <br>${ t.tour_name }
	           </a>
	         </div>
	        </c:forEach>
	    </div>
	    <div style="padding: 100px 0px 0px 0px;"></div>
		       <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		       <script src="resources/js/head.js"></script>
       <c:import url="/WEB-INF/views/common/footer.jsp" />
  </body>
</html>