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
		<style type="text/css">
		.input-form textarea,
		.input-form input[type="tel"],
		.input-form input[type="text"],
		.input-form input[type=email],
		.input-form input[type=password],
		.input-form input[type=button] {
	    float: left;
	    border: 1px solid #eee;
	    background: #f9f9f9;
	    width: 50%;
	    padding: 15px 20px 15px 55px;
	    border-radius: 6px;
	    color: #666;
	    font-size: 13px;
	    -webkit-appearance: none;
        padding-left: 20px;
        margin-bottom: 20px;
        box-sizing: border-box;
	        
		}
		.input-form label {
        padding-bottom: 12px;
	    float: left;
	    position: relative;
	    width: 50%;
	    text-align: left;
	    font-weight: 500;
	    color: #666;
	    
		}
		.input-form .log-submit-btn {
	    float: left;
	    padding: 13px 35px;
	    border: none;
	    border-radius: 4px;
	    color: #fff;
	    cursor: pointer;
	    -webkit-appearance: none;
	    margin-top: 12px;
	    background: #4DB7FE;
		}
		.input-form {
		left: 3%;
	    float: left;
	    width: 90%;
	    position: relative;
		}
		</style>	
	</head>
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
	<body>
		<c:import url="/WEB-INF/views/common/header.jsp" />
		<br>
		<br><br><br><br><br><br><br>
		 <div class="input-form">
                   <form method="post" action="enroll.do"  name="input-form" class="input-form" id="input-form" onsubmit= "return validate();">
                       <label >이름 * </label><br><br>
                       <input type="text" name="user_name" id ="user_name" required ><br><br><br><br><br>
                       <label>이메일 * </label><br><br><br>
                       <input type="text" name="user_id" id="user_id" value="${user_id }" readonly><br><br><br><br><br>
                       <label> *비밀번호 </label><br><br><br>
                       <input type="password" name="user_pwd" id = "userpwd" required><br><br><br><br><br>
                       <label> *비밀번호 확인 </label><br><br><br>
                       <input type="password" id="userpwd2"><br><br><br><br><br>
                       <label >전화번호 * </label><br><br>
                       <input name="phone" type="tel" placeholder="전화번호 " onClick="this.select()"><br><br><br><br><br> 
                       <label >생년월일 </label><br><br>
                       <input name="birthday" type="text" placeholder="생년월일 "  onClick="this.select()"><br><br><br><br><br> 
                       <button type="submit"     class="log-submit-btn"  ><span>회원가입</span></button><br><br>  
                   <a href="main.do"> 시작페이지로 </a>
                   </form>
               </div>
               
               <c:import url="/WEB-INF/views/common/footer2.jsp" />
	</body>
</html>