<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<style type="text/css">
	#chekcbutton{
    float: left;
    color: #fff;
    padding: 15px 40px;
    outline: none;
    border: none;
    cursor: pointer;
    margin-top: 1px;
    margin-bottom: 25px;
    background: #4DB7FE;
    -webkit-appearance: none;
    border-radius: 6px;
}
#pwdchangebut{
    float: left;
    color: #fff;
    padding: 15px 40px;
    outline: none;
    border: none;
    cursor: pointer;
    margin-top: 1px;
    margin-bottom: 25px;
    background: #4DB7FE;
    -webkit-appearance: none;
    border-radius: 6px;
}
</style>
<script type="text/javascript" src="resources/js/jquery-3.5.1.min.js"></script>
<script>
			function validate(){
			var pwdValue = document.getElementById("user_pwd").value;
			var pwdValue2 = document.getElementById("user_pwd2").value;
			if (pwdValue !== pwdValue2) {
				alert ("비밀번호와 비밀번호 확인의 값이 일치하지 않습니다.")
				document.getElementById("user_pwd").select();
				return false; 
			}
			}
			function pwdcheck(){
			$.ajax({
				url:"memberpwdcheck.do",
				type:"post",
				data:{user_id: $("#user_id").val(), user_pwd: $("#originPwd").val()},
				success: function(data){
					console.log("success :"+ data)
					if (data == "ok") {
						alert("기존 비밀번호와 일치 합니다.");
					} else {
						alert("기존 비밀번호가  일치하지 않습니다..\n 다시입력");
						$('#originPwd').val('');
					}
				},
				error: function(jqXHR, textstatus, errorthrown){
					console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
				},
			});
			return false;
		}
		</script>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />
	<br>
	<br>


            <div id="wrapper">
                <div class="content">
                    <section id="sec1">
                        <div class="container">
                            <div class="profile-edit-wrap">
                                <div class="profile-edit-page-header">
                                    <h2>Change Password</h2>
                                    <div class="breadcrumbs"><a href="main.do">Home</a><a href="moveMyPage.do">Dasboard</a><span>Change Password</span></div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="fixed-bar fl-wrap">
                                            <div class="user-profile-menu-wrap fl-wrap">
                                                <div class="user-profile-menu">
                                                    <h3>Main</h3>
                                                    <ul>
                                                    	<li><a href="moveMyPage.do" ><i class="fa fa-user-o"></i> Edit profile</a></li>
                                                        <li><a href="moveMessageList.do?user_one=${loginMember.user_id }"><i class="fa fa-envelope-o"></i> Messages </a></li>
                                                        <li><a href="moveUpdatePwdPage.do?user_id=${loginMember.user_id }" class="user-profile-act"><i class="fa fa-unlock-alt"></i>Change Password</a></li>
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
                                    <form action="updatepwd2.do" method="post" onsubmit="return validate();">
                                    <div class="col-md-9">
                                        <div class="profile-edit-container">
                                            <div class="profile-edit-header fl-wrap" style="margin-top:30px">
                                                <h4>Change Password</h4>
                                            </div>
                                            <div class="custom-form no-icons">
                                                <div class="pass-input-wrap fl-wrap">
                                                    <label>Current Password</label>
                                                    <input type="password" id="originPwd" class="pass-input" placeholder="기존 비밀번호" required/>
                                                    <span class="eye"><i class="fa fa-eye" aria-hidden="true"></i> </span>
                                                </div>
                                                    <button id="chekcbutton" onclick="return pwdcheck();" id="oripwdbut">비밀번호 확인 </button>
                                                <div class="pass-input-wrap fl-wrap">
                                                    <label>New Password</label>
                                                    <input type="password" class="pass-input" name="user_pwd"  id="user_pwd" required/>
                                                    <span class="eye"><i class="fa fa-eye" aria-hidden="true"></i> </span>
                                                </div>
                                                <div class="pass-input-wrap fl-wrap">
                                                    <label>Confirm New Password</label>
                                                    <input type="password" class="pass-input" required id="user_pwd2"/>
                                                    <span class="eye"><i class="fa fa-eye" aria-hidden="true"></i> </span>
                                                </div>
                                                <input type="hidden" name="user_id" id="user_id" value="${loginMember.user_id }">
                                            </div>
                                                <input type="submit" value = "Save Changes" class="btn  big-btn  color-bg flat-btn" id="pwdchangebut">
                                        </div>
                                    </div>
                                    </form>
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