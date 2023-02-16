<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JejuBnB</title>
	 <link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">
</head>
<body>
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
            <div id="wrapper">
                <div class="content">
                    <section>
                        <div class="container">
                            <div class="profile-edit-wrap">
                                <div class="profile-edit-page-header">
                                    <h2>Edit profile</h2>
                                    <div class="breadcrumbs"><a href="main.do">Home</a><a href="moveMyPage.do">Dasboard</a><span>Edit profile</span></div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="fixed-bar fl-wrap">
                                            <div class="user-profile-menu-wrap fl-wrap">
                                                <div class="user-profile-menu">
                                                    <h3>Main</h3>
                                                    <ul>
                                                        <li><a href="moveMyPage.do" class="user-profile-act"><i class="fa fa-user-o"></i> Edit profile</a></li>
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
                                                        <li><a href="${moveMyCoupon}"><i class="fa fa-plus-square-o"></i> My Coupon</a></li>
                                                    </ul>
                                                </div>
                                                <a href="logout.do" class="log-out-btn">Log Out</a>
                                            </div>
                                        </div>
                                    </div>
                                    <form method="post" action="mupdate.do" >
                                    <div class="col-md-7">
                                        <div class="profile-edit-container">
                                            <div class="profile-edit-header fl-wrap">
                                                <h4>My Account</h4>
                                            </div>
                                            <div class="custom-form">
                                                <label>Your Name </label>
                                                <input type="text" name="user_name" value="${loginMember.user_name }"/>
                                                <label>Email Address  </label>
                                                <input type="text" name="user_id" value="${loginMember.user_id }" readonly/>
                                                <label>Phone</label>
                                                <input type="text" name="phone" value="${loginMember.phone }"/>
                                                <label> birthday</label>
                                                <input type="text" name="birthday" value="${loginMember.birthday }"/>
                                            </div>
                                        </div>
                                        <div class="profile-edit-container">
                                            <div class="custom-form">
                                            <input type="submit" value = "Save Changes" class="btn  big-btn  color-bg flat-btn" >
                                            </div>
                                        </div>
                                	</div>
                                    </form>
		                           </div>
		                       </div>
		                      </div> 
		                   </section>
		               </div>
		           </div>

<c:import url="/WEB-INF/views/common/footer2.jsp" />

</body>
</html>