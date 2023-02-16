<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>JejuBnB</title>
	 <link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">
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
		<script type="text/javascript" src="resources/js/jquery-3.5.1.min.js"></script>
		<script>
		function deleteMyRoom(data){
			var checkedValue2 = data;
			$.ajax({
				url:"deleteMyRoom.do",
				type:"post",
				data:{room_no: checkedValue2},
				success: function(data){
				console.log("success :"+ data)
				alert(checkedValue2 + "번 숙소를 삭제했습니다.");
				location.reload();
				},
				error: function(jqXHR, textstatus, errorthrown){
					console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
				}
			});
		}
		</script>
	</head>	
	<body>
		<c:import url="/WEB-INF/views/common/header.jsp" />
		<div id="wrapper">
                <div class="content">
                    <section id="sec1">
                        <div class="container">
                            <div class="profile-edit-wrap">
                                <div class="profile-edit-page-header">
                                    <h2>My Room List </h2>
                                    <div class="breadcrumbs"><a href="main.do">Home</a><a href="moveMyPage.do">Dasboard</a><span>My Room List</span></div>
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
                                                        <li><a href="${moveMyRoom}" class="user-profile-act"><i class="fa fa-th-list"></i> My list  </a></li>
                                                        </c:if>
                                                        <li><a href="dashboard-bookings.html"> <i class="fa fa-calendar-check-o"></i> Bookings </a></li>
                                                        <li><a href="${moveMyCoupon}"><i class="fa fa-plus-square-o"></i> My Coupon</a></li>
                                                    </ul>
                                                </div>
                                                <a href="logout.do" class="log-out-btn">Log Out</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-9">
                                        <div class="dashboard-list-box fl-wrap">
                                            <div class="dashboard-header fl-wrap">
                                                <h3>My Room</h3>
                                            </div>
                                    		<c:forEach items="${mlist }" var="list">
                                            <div class="dashboard-list">
                                                <div class="dashboard-message">
                                                    <div class="dashboard-listing-table-image">
                                                    <a href="listing-single.html"><img src="images/all/1.jpg" alt=""></a>
                                                        <%-- <a href="moveDetailView.do?room_no=${list.room_no}"><img src="${ pageContext.servletContext.contextPath}/resources/roomThumbnail/${ list.rename_file }" alt=""></a> --%>
                                                    </div>
                                                    <div class="dashboard-listing-table-text">
                                                        <h4><a href="moveDetailView.do?room_no=${list.room_no}">${list.room_name }</a></h4>
                                                        <span class="dashboard-listing-table-address"><i class="fa fa-map-marker"></i><a  href="#">${list.room_address }</a></span>
                                                        <ul class="dashboard-listing-table-opt  fl-wrap">
                                                            <li><a href="#" class="del-btn" onclick="return deleteMyRoom(${list.room_no});">Delete <i class="fa fa-trash-o"></i></a></li>
                                                        </ul>
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