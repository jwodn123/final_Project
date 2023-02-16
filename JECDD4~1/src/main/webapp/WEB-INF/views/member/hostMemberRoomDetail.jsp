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
    left: 40%;
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
    left: 670px;
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
		function hostMember(){
			var checkedValue = $("input[type=radio][name=check]:checked").val() 
			$.ajax({
				url:"beHostMember.do",
				type:"post",
				data:{user_id: checkedValue},
				success: function(data){
					$.ajax({
						url:"roomChangePass.do",
						type:"post",
						data:{user_id: checkedValue},
						success: function(data){
							console.log("success :"+ data)
							location.reload();
						},
						error: function(jqXHR, textstatus, errorthrown){
							console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
						},
					});
					
					console.log("success :"+ data)
					alert(checkedValue + "회원님을 Host계정으로, 숙소를 전체보기로  변경했습니다.");
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
              		호스트 신청 관리
              </header>
	  	<section id="table">
		<table align = "center" width= "1500" cellspacing = "5" cellpadding = "0" class="table table-striped table-advance table-hover">
			<tr>
				<td> Room Number </td>
				<td> 아 이 디 </td>
				<td> 이 름 </td>
				<td> 숙소 이름 </td>
				<td> 숙소 주소</td>
				<td> 전화번호 </td>
				<td> Host Y/N </td>
				<td> Host 신청 허락 </td>
			</tr>
			<c:forEach items="${hostlist }" var = "host">
			<tr>
				<td><a href="moveDetailView.do?room_no=${host.room_no}">${host.room_no }</a></td>
				<td>${host.user_id }</td>
				<td>${host.user_name }</td>
				<td>${host.room_name }</td>
				<td>${host.room_address }</td>
				<td>${host.phone }</td>
				<td>${(host.host_check == null)? "신청 대기중" : "Y"}</td>
				<td><input type="radio" name="check" id ="${host.user_id }" value="${host.user_id }"></td>
			</tr>
			</c:forEach>
			<tr>
				<th colspan = "8">
					 <button onclick="return hostMember();" id="btn">호스트 변경</button>
				</th>
			</tr>
		</table>
		</section>
          </div>
		</div>
			</section>
			<c:import url="/WEB-INF/views/common/footer2.jsp" />
	</body>
</html>