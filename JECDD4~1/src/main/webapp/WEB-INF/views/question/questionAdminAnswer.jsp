<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<!--=============== basic  ===============-->
<meta charset="UTF-8">
<title>JejuBnB</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="robots" content="index, follow" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<!--=============== css  ===============-->
<link type="text/css" rel="stylesheet" href="resources/css/reset.css">
<link type="text/css" rel="stylesheet" href="resources/css/plugins.css">
<link type="text/css" rel="stylesheet" href="resources/css/style.css">
<link type="text/css" rel="stylesheet" href="resources/css/color.css">
<!--=============== favicons ===============-->
<link rel="shortcut icon" href="images/favicon.ico">
 <link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">
<!-- Bootstrap CSS -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<!-- bootstrap theme -->
<link href="resources/css/bootstrap-theme.css" rel="stylesheet">
<!--external css-->
<!-- font icon -->
<link href="resources/css/elegant-icons-style.css" rel="stylesheet" />
<link href="resources/css/font-awesome.min.css" rel="stylesheet" />
<!-- Custom styles -->
<link href="resources/css/style.css" rel="stylesheet">
<link href="resources/css/style-responsive.css" rel="stylesheet" />
<style type="text/css">
</style>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery-3.5.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(function(){
	$("#changetype").change(function(){
		$.ajax({
			url:"qTypeChange.do",
			type:"post",
			data:{qtype : $("#changetype").val()},
			dataType:"json",
			success:function(job){
				alert("변경 선공");
				var jobStr = JSON.stringify(job);
				
				var jsonjob = JSON.parse(jobStr);
				console.log(jsonjob.qlist.length);
				var html="";
	               /* for(var i in jsonjob.qlist){
	            	 html += '<tr><th>'+jsonjob.qlist[i].question_no+'</th>';	                                  	              	             	                
	                 html += '<th>'+jsonjob.qlist[i].user_id+'</th>';
	                 html += '<th>'+decodeURIComponent(jsonjob.qlist[i].questiontype_name.replace(/\+/gi, " "))+'</th>';
	                 html += '<th>'+jsonjob.qlist[i].question_title+'</th></tr>'; 
	              
	                 } */
				for(var i = 0; i < jsonjob.qlist.length; i++){
	            	 html += '<tr><th>'+jsonjob.qlist[i].question_no+'</th>';	                                  	              	             	                
	                 html += '<th>'+decodeURIComponent(jsonjob.qlist[i].user_id.replace(/\+/gi, " "))+'</th>';
	                 html += '<th>'+decodeURIComponent(jsonjob.qlist[i].questiontype_name.replace(/\+/gi, " "))+'</th>';
	                 html += '<th>'+decodeURIComponent(jsonjob.qlist[i].question_title.replace(/\+/gi, " "))+'</th></tr>'; 
	              	console.log('i = ' + i);
	                 }
	                  $("#list > tbody").html(html);
	                  
	               },
		
			/* error : function(request, status, errorData){
				console.log("error code : " + request.satus + "\nMessage : " + request.responseText + "\nError" + errorData);
			} */
			});
	});
});
</script>
<body>
	<!-- loader -->
	<div class="loader-wrap">
		<div class="pin"></div>
		<div class="pulse"></div>
	</div>
	<!--  loader end -->
	<!-- Main   -->
	<div id="main">
		<c:import url="/WEB-INF/views/common/header.jsp" />
		<!-- wrapper -->
		<div id="wrapper">
			<!--content -->
			<div class="content">
				<!--section -->
				<section id="sec1">
					<!-- container -->
					<div class="container">
						<!-- profile-edit-wrap -->
						<div class="profile-edit-wrap">
							<div class="profile-edit-page-header">
								<h2>고객센터</h2>
								<div class="breadcrumbs">
									<a href="main.do">Home</a><a href="questionAdminListView.do">고객센터</a><span>관리자
										1:1문의</span>
								</div>
							</div>
							<div class="row">
								<div class="col-md-3">
									<div class="fixed-bar fl-wrap">
										<div class="user-profile-menu-wrap fl-wrap">
											<!-- user-profile-menu-->
											<div class="user-profile-menu">
												<h3>고객센터</h3>
												<ul>
													<li><a href="eventPage.do" class="user-profile-act"><i
															class="fa fa-th-list"></i> 이벤트 </a></li>
													<li><a href="policyPage.do" class="user-profile-act"><i
															class="fa fa-th-list"></i> 약관 및 개인정보 </a></li>

													<li><a href="questionListView.do"
														class="user-profile-act"><i class="fa fa-th-list"></i>
															1:1문의 </a></li>
													<li><a href="faqTop7.do" class="user-profile-act"><i
															class="fa fa-th-list"></i> 자주묻는질문(FAQ) </a></li>
													<c:if
														test="${!empty loginMember and  loginMember.admin_check eq 'Y' }">
														<li><a href="couponPage.do" class="user-profile-act"><i
																class="fa fa-th-list"></i> 쿠폰 </a></li>
													</c:if>
													<c:if
														test="${!empty loginMember and  loginMember.admin_check eq 'Y' }">
														<li><a href="questionAdminListView.do"
															class="user-profile-act"><i class="fa fa-th-list"></i>
																관리자 1:1문의 </a></li>
													</c:if>
												</ul>
											</div>

										</div>
									</div>
								</div>
								<div class="col-md-9">
									<div class="dashboard-list-box fl-wrap">
										<div class="dashboard-header fl-wrap">
											<h3 style="text-align: center;">
												<a href=questionAdminListView.do>답변대기</a> <a
													href="questionAdminAnswer.do">답변완료</a>
											</h3>
										</div>
										<div class="row">
											<select name="questiontype_no" value="${qu.questiontype_no }"
												id="changetype" style="text-align: center; margin: auto;">
												<option value="1">이용</option>
												<option value="2">예약</option>
												<option value="3">결제</option>
												<option value="4">쿠폰</option>
												<option value="5">회원</option>
											</select>

											<div class="col-lg-12">
												<section class="panel">
													<header class="panel-heading"> 1:1문의 답변완료 </header>

													<table
														class="table table-striped table-advance table-hover"
														id="list">
														<thead>
															<tr>
																<th><i class="icon_profile"></i> 번호</th>
																<th><i class="icon_mail_alt"></i> 아이디</th>
																<th><i class="icon_calendar"></i> 문의 유형</th>
																<th><i class="icon_calendar"></i> 문의 제목</th>
															</tr>
														</thead>

														<tbody>
															<c:forEach items="${question }" var="qu">
																<c:if test="${!empty qu.question_rcontent }">

																	<tr>
																		<td>${qu.question_no }</td>
																		<td>${qu.user_id }</td>
																		<td name="questiontype_no">${qu.questiontype_name }</td>
																		<td><a
																			href="adminDetailView.do?question_no=${qu.question_no}">${qu.question_title}</td>
																	</tr>
																</c:if>
															</c:forEach>
														</tbody>
													</table>

												</section>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!--profile-edit-wrap end -->
						</div>
						<!--container end -->
				</section>
				<!-- section end -->
				<div class="limit-box fl-wrap"></div>

			</div>
		</div>
		<!-- wrapper end -->
		<!--footer -->
		<c:import url="/WEB-INF/views/common/footer2.jsp" />
		<!--footer end  -->
		<a class="to-top"><i class="fa fa-angle-up"></i></a>
	</div>
	<!-- Main end -->
	<!--=============== scripts  ===============-->

	<script type="text/javascript" src="resources/js/plugins.js"></script>
	<script type="text/javascript" src="resources/js/scripts.js"></script>

	<!-- javascripts -->

	<script src="resources/js/bootstrap.min.js"></script>
	<!-- nicescroll -->
	<script src="resources/js/jquery.scrollTo.min.js"></script>
	<script src="resources/js/jquery.nicescroll.js" type="text/javascript"></script>
	<!--custome script for all page-->
	<script src="resources/js/scripts.js"></script>

</body>
</html>