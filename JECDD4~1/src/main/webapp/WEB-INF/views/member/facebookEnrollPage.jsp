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
	<body>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<c:import url="/WEB-INF/views/common/header.jsp" />
		<br>
               <div class="input-form">
                   <form method="post" action="enroll.do"  name="input-form" class="input-form" id="input-form">
                       <label >이름 * </label><br><br>
                       <input name="user_name" type="text" placeholder="이름" value="${param.name }"required ><br><br><br><br><br>
                       <label>이메일 * </label><br><br><br>
                       <input name="user_id" type="email" placeholder="이메일 " onClick="this.select()" value="${param.email }" readonly><br><br><br><br><br>
                       <input name="user_pwd" type="hidden" placeholder="비밀번호 " onClick="this.select()" value="18728378"> 
                       <input type="hidden" name="facebook_id" value="Y">                                           
                       <label >전화번호 * </label><br><br>
                       <input name="phone" type="tel" placeholder="전화번호 " onClick="this.select()"><br><br><br><br><br><br> 
                       <label >생년월일 </label><br><br>
                       <input name="birthday" type="text" placeholder="생년월일 "  onClick="this.select()"><br><br><br><br><br> 
                       <button type="submit"     class="log-submit-btn"  ><span>회원가입</span></button><br><br>  
                   <a href="main.do"> 시작페이지로 </a>
                   </form>
               </div>
               <c:import url="/WEB-INF/views/common/footer2.jsp" />
	</body>
</html>