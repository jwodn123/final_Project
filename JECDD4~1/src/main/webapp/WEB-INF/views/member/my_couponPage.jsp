<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<c:import url="/WEB-INF/views/common/header.jsp" />
<c:url var="callMyinfo" value="myinfo.do">
     <c:param name="user_id" value="${ sessionScope.loginMember.user_id }" />
</c:url>
<c:url var="moveMyCoupon" value="moveMyCoupon.do">
     <c:param name="user_id" value="${ sessionScope.loginMember.user_id }" />
</c:url>
<c:url var="moveMyRoom" value="seleteMyRoom.do">
     <c:param name="user_id" value="${ sessionScope.loginMember.user_id }" />
</c:url>
<c:url var="moveIncome" value="IncomeHost.do">
     <c:param name="user_id" value="${ sessionScope.loginMember.user_id }" />
</c:url>	
	<head>
		<meta charset="UTF-8">
		<title>JejuBnB</title>
		 <link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">
	</head>
	<body>
		<div id="wrapper">
                <div class="content">
                    <section id="sec1">
                        <div class="container">
                            <div class="profile-edit-wrap">
                                <div class="profile-edit-page-header">
                                    <h2>My Coupon</h2>
                                    <div class="breadcrumbs"><a href="main.do">Home</a><a href="moveMyPage.do">Dasboard</a><span>My Coupon</span></div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="fixed-bar fl-wrap">
                                            <div class="user-profile-menu-wrap fl-wrap">
                                                <div class="user-profile-menu">
                                                    <h3>Main</h3>
                                                    <ul>
                                                    	<li><a href="moveMyPage.do"><i class="fa fa-user-o"></i> Edit profile</a></li>
                                                        <li><a href="moveMessageList.do?user_one=${loginMember.user_id }"><i class="fa fa-envelope-o"></i> Messages </a></li>
                                                        <li><a href="moveUpdatePwdPage.do?user_id=${loginMember.user_id }"><i class="fa fa-unlock-alt"></i>Change Password</a></li>
                                                    </ul>
                                                </div>
                                                <div class="user-profile-menu">
                                                    <h3>Listings</h3>
                                                    <ul>
                                                        <c:if test="${!empty loginMember and empty loginMember.admin_check  and loginMember.host_check eq 'Y'}">
                                                        <li><a href="${moveIncome}"><i class="fa fa-th-list"></i> Host Income  </a></li>
                                                        </c:if>
                                                        <c:if test="${!empty loginMember and empty loginMember.host_check }">
                                                        <li><a href="${moveMyRoom}"><i class="fa fa-th-list"></i> My list  </a></li>
                                                        </c:if>
                                                        <li><a href="dashboard-bookings.html"> <i class="fa fa-calendar-check-o"></i> Bookings </a></li>
                                                        <li><a href="${moveMyCoupon}" class="user-profile-act"><i class="fa fa-plus-square-o"></i> My Coupon</a></li>
                                                    </ul>
                                                </div>
                                                <a href="logout.do" class="log-out-btn">Log Out</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-9">
                                        <div class="dashboard-list-box fl-wrap">
                                            <div class="dashboard-header fl-wrap">
                                                <h3>My Coupon</h3>
                                            </div>
                                            <c:forEach items="${mycouponlist }" var="list">
                                            <div class="dashboard-list">
                                                <div class="dashboard-message">
                                                <div class="dashboard-message-avatar">
                                                        <img src="resources/images/coupon2.jpg" alt="">
                                                    </div>
                                                    <div class="dashboard-message-text">
                                                        <div class="booking-details fl-wrap">
                                                            <span class="booking-title">쿠폰 번호</span> :
                                                            <span class="booking-text"><a href="listing-sinle.html">${list.coupon_no }</a></span>
                                                        </div>
                                                        <div class="booking-details fl-wrap">
                                                            <span class="booking-title">할인 금액 </span> : 
                                                            <span class="booking-text">${list.coupon_money }원</span>
                                                        </div>
                                                        <div class="booking-details fl-wrap">
                                                            <span class="booking-title">쿠폰 사용 가능  기한</span> : 
                                                            <span class="booking-text">${list.coupon_begin }</span>
                                                        </div>
                                                        <div class="booking-details fl-wrap">                                                               
                                                            <span class="booking-title">쿠폰 만료 기한 </span> : 
                                                            <span class="booking-text">${list.coupon_end }</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                           	</c:forEach> 
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <div class="limit-box fl-wrap"></div>
                </div>
            </div>
            <c:import url="/WEB-INF/views/common/footer2.jsp" />
	</body>
</html>