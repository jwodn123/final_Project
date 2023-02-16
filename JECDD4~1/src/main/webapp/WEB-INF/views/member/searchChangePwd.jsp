<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  errorPage="/WEB-INF/views/common/error.jsp"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JejuBnB</title>
		 <link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">
		<script type="text/javascript" src="resources/js/jquery-3.5.1.min.js"></script>
		<script>
			function validate(){
			var pwdValue = document.getElementById("userpwd").value;
			var pwdValue2 = document.getElementById("userpwd2").value;
			if (pwdValue !== pwdValue2) {
				alert ("암호와 암호 확인의 값이 일치하지 않습니다.")
				document.getElementById("userpwd").select();
				return false; 
			}
			return true; 
		}
		</script>
	</head>
	<body>
		<c:import url="/WEB-INF/views/common/header.jsp" />
		<br><br><br><br><br><br><br><br><br><br><br><br>
		<form action="updatepwd.do" method="post" onsubmit="return validate();">
		<div class="profile-edit-container">
	        <div class="profile-edit-header fl-wrap" style="margin-top:30px">
	            <h4>Change Password</h4>
	        </div>
	        <div class="custom-form no-icons">
	            <div class="pass-input-wrap fl-wrap">
	                <label>New Password</label>
	                <input type="password" class="pass-input" placeholder="새로운 비밀번호" id="userpwd" name="user_pwd" required/>
	                <span class="eye"><i class="fa fa-eye" aria-hidden="true"></i> </span>
	            </div>
	            <div class="pass-input-wrap fl-wrap">
	                <label>Confirm New Password</label>
	                <input type="password" class="pass-input" placeholder="비밀번호  확인" id="userpwd2"/>
	                <input type="hidden" name="user_id" value="${user_id }">
	                <span class="eye"><i class="fa fa-eye" aria-hidden="true"></i> </span>
	            </div>
	            <button class="btn  big-btn  color-bg flat-btn">Save Changes<i class="fa fa-angle-right"></i></button>
	        </div>
        </div>
        </form>                                    
		<c:import url="/WEB-INF/views/common/footer2.jsp" />
	</body>
</html>