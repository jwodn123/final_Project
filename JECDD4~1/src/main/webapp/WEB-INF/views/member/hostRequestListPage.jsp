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
	</head>
	<body>
		<c:import url="/WEB-INF/views/common/header.jsp" />
			<br>
			<section id="s1">
	<div class="row">
          <div class="col-lg-12">
              <header class="panel-heading">
              		Host 신청 목록
              </header>
	  	<section id="table">
		<table align = "center" width= "800" cellspacing = "5" cellpadding = "0" class="table table-striped table-advance table-hover">
			<tr>
				<td> 아 이 디 </td>
				<td> 이 름 </td>
				<td> 전화번호</td>
				<td> Host Y/N </td>
			</tr>
			<c:forEach items="${hostlist }" var = "host">
			<tr>
				<td><a href="hostListDetail.do?user_id=${host.user_id }">${host.user_id }</a></td>
				<td>${host.user_name }</td>
				<td>${host.phone }</td>
				<td>${(host.host_check == null)? "신청 대기중" : "Y"}</td>
			</tr>
			</c:forEach>
			<tr>
				<th colspan = "4">
					<a href="main.do" > 시작페이지로 </a>
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