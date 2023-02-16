<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JejuBnB</title>
		<style type="text/css">
	.panel .panel-heading {
    line-height: 34px;
    padding: 0 15px;
    min-height: 34px;
    border-left: 1px solid #ccc;
    border-right: 1px solid #ccc;
    -webkit-border-radius: 0px;
    -moz-border-radius: 0px;
    border-radius: 0px;
    position: relative;
    box-shadow: inset 0 -2px 0 rgba(0,0,0,.05);
    -moz-box-shadow: inset 0 -2px 0 rgba(0,0,0,.05);
    -webkit-box-shadow: inset 0 -2px 0 rgba(0,0,0,.05);
}
.panel-heading, .modal-header {
    background: #F7F7F7;
    color: #688a7e;
}
.table thead > tr > th, .table tbody > tr > th, .table tfoot > tr > th, .table thead > tr > td, .table tbody > tr > td, .table tfoot > tr > td {
    padding: 8px;
    line-height: 1.428571429;
    vertical-align: top;
    border-top: 1px solid #dddddd;
    color: #688a7e;
}
#table{
	
    margin-left: -600px;
    margin-right: -15px;
	float: left;
    left: 65%;
    width: 100%;
    position: relative;
    padding: 80px 0;
    overflow: hidden;
    background: #fff;
    z-index: 1;
}
#btn{
	background: #4DB7FE;
	position: relative;
    left: -150px;
    padding: 15px 40px;
    padding: 12px 30px;
    border-radius: 6px;
    color: #ffffff;
    font-weight: 600;
    appearance: button;
    -webkit-writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: -internal-light-dark(buttontext, rgb(170, 170, 170));
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: center;
    align-items: flex-start;
    cursor: default;
    background-color: -internal-light-dark(rgb(239, 239, 239), rgb(74, 74, 74));
    box-sizing: border-box;
    margin: 0em;
    font: 400 13.3333px Arial;
    padding: 10px 10px;
    border-width: 2px;
    border-style: outset;
    border-color: -internal-light-dark(rgb(118, 118, 118), rgb(195, 195, 195));
    border-image: initial;
}
#btu2{
	left: 6%;
	padding: 40px ;
}
section {
    float: left;
    width: 100%;
    position: relative;
    padding: 12px 0;
    overflow: hidden;
    background: #fff;
    z-index: 1;
}
	</style>
		 <link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">
		<script type="text/javascript" src="resources/js/jquery-3.5.1.min.js"></script>
		<script>
		
		function deleteMember(){
			var checkedValue = $("input[type=radio][name=check]:checked").val() 
			$.ajax({
				url:"adminDel.do",
				type:"post",
				data:{user_id: checkedValue},
				success: function(data){
					console.log("success :"+ data)
					alert(checkedValue + "회원님을 삭제헀습니다.");
					location.reload();
				},
				error: function(jqXHR, textstatus, errorthrown){
					console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
				},
			});
		}
		function beNotHostMember(){
			var checkedValue = $("input[type=radio][name=check]:checked").val() 
			$.ajax({
				url:"beNotHostMember.do",
				type:"post",
				data:{user_id: checkedValue},
				success: function(data){
					console.log("success :"+ data)
					alert(checkedValue + "회원님의 계정을 일반회원으로 변경헀습니다.");
					location.reload();
				},
				error: function(jqXHR, textstatus, errorthrown){
					console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
				},
			});
		}
		function adminMember(){
			var checkedValue = $("input[type=radio][name=check]:checked").val() 
			$.ajax({
				url:"beAdminMember.do",
				type:"post",
				data:{user_id: checkedValue},
				success: function(data){
					console.log("success :"+ data)
					alert(checkedValue + "회원님을 관리자로 변경헀습니다.");
					location.reload();
				},
				error: function(jqXHR, textstatus, errorthrown){
					console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
				},
			});
		}
		</script>
	</head>
	<body>
		<c:import url="/WEB-INF/views/common/header.jsp" />
			<br>
			<section id="s1">
	<div class="row">
          <div class="col-lg-12">
              <header class="panel-heading">
              		회원 관리
              </header>
	  	<section id="table">
		<table align="center" border="1" cellspacing = "0" cellpadding = "3" class="table table-striped table-advance table-hover">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>생년월일</th>
				<th>전화번호</th>
				<th>host check</th>
				<th>페이스북 아이디 check</th>
				<th>관리자 check</th>
				<th>선택</th>
			</tr>
		<c:forEach items="${memberlist}" var = "list">
			<tr>
				<th>${list.user_id }</th>
				<th>${list.user_name }</th>
				<th>${list.birthday }</th>
				<th>${list.phone }</th>
				<th>${list.host_check }</th>
				<th>${list.facebook_id }</th>
				<th>${list.admin_check }</th>
				<th><input type="radio" name="check" id ="${list.user_id }" value="${list.user_id }"></th>
			</tr>
		</c:forEach>
		</table>
			<button onclick="return deleteMember();" id="btn">회원 삭제</button>
			<button onclick="return beNotHostMember();" id="btn">호스트 해제</button>
			<button onclick="return adminMember();" id="btn">관리자 등업</button>
		</section>
          </div>
		</div>
			</section>
		
	</body>
</html>