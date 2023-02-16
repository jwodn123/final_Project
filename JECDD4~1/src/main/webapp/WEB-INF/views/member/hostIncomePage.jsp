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

}
#table {
    float: left;
    left: -90px;
    width: 100%;
    position: relative;
    padding: 80px 0;
    overflow: hidden;
    background: #fff;
    z-index: 1;
}
	</style>
	 <link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">
	  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	  <script type="text/javascript">
	    google.charts.load("current", {packages:['corechart']});
	    google.charts.setOnLoadCallback(drawChart);
	    function drawChart() {
	      var data = google.visualization.arrayToDataTable([
	        ["5월", "Density", { role: "style" } ],
	        ["6월", 600000, "#4DB7FE"],
	        ["7월", $("#7income").val(), "#4DB7FE"],
	        ["8월", $("#8income").val(), "#4DB7FE"],
	        ["9월", $("#9income").val(), "#4DB7FE"]
	      ]);
	      var view = new google.visualization.DataView(data);
	      view.setColumns([0, 1,
	                       { calc: "stringify",
	                         sourceColumn: 1,
	                         type: "string",
	                         role: "annotation" },
	                       2]);
	      var options = {
	        title: "호스트 월 매출",
	        width: 900,
	        height: 300,
	        bar: {groupWidth: "95%"},
	        legend: { position: "none" },
	      };
	      var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
	      chart.draw(view, options);
	  }
	  </script>
			<script type="text/javascript" src="resources/js/jquery-3.5.1.min.js"></script>
			<script>
			function checkIncome(){
				var checkedValue = $("input[type=radio][name=check]:checked").val() 
				$.ajax({
					url:"checkIncome.do",
					type:"post",
					data:{re_num: checkedValue},
					success: function(data){
						console.log("success :"+ data)
						alert("결제를 완료 처리 했습니다.");
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
              		호스트 수입
              </header>
	  <div id="columnchart_values" style="width: 900px; height: 300px; align: center; "></div>
	  <hr>
	  <br>
	  
	  	<section id="table">
			<table align = "right" width= "800" cellspacing = "5" cellpadding = "0" class="table table-striped table-advance table-hover">
				<tr>
					<td> Room Number </td>
					<td> 숙소 이름 </td>
					<td> 게스트 아이디</td>
					<td> 요금 </td>
					<td> 체크인 </td>
					<td> 체크아웃 </td>
					<td> 결제 상태 </td>
					<td> 결제 확인완료  </td>
				</tr>
				<c:forEach items="${list }" var = "list">
				<tr>
					<td><a href="moveDetailView.do?room_no=${list.room_no}">${list.room_no }</a></td>
					<td>${list.room_name }</td>
					<td>${list.guest_id }</td>
					<c:if test="${!empty list.room_weekday }">
					<td>${list.room_weekday }</td>
					</c:if>
					<c:if test="${empty list.room_weekday }">
					<td>${list.room_weekend }</td>
					</c:if>
					<td>${list.checkin_date }</td>
					<td>${list.checkout_date }</td>
					<td>${(list.payment_status == 'N')? "결제 대기중" : "결제 완료" }</td>
					<td><input type="radio" name="check" id ="${list.re_num }" value="${list.re_num }"></td>
				</tr>
				</c:forEach>
				<tr>
					<td colspan = "8" align="right">
						<button onclick="return checkIncome();" class="btn  big-btn  color-bg flat-btn">결제 확인</button>
					</td>
				</tr>
			</table>
                     </section>
          </div>
		</div>
			</section>
			
			
			
			
			
			
			
			
			
			
			
			
		<c:set var="total6" value="0"/>
		<c:set var="total7" value="0"/>
		<c:set var="total8" value="0"/>
		<c:set var="total9" value="0"/>
	<c:forEach items="${list }" var = "list">
		<c:if test="${list.payment_status =='Y' and  '2020-07-01' gt list.checkin_date and list.checkin_date ge '2020-06-01' }">
		<input type="hidden" value="${list.room_weekday }">
		<c:set var="total6" value="${total6 + list.room_weekday + list.room_weekend}"/>
		</c:if>
	</c:forEach>
	<c:forEach items="${list }" var = "list">
		<c:if test="${list.payment_status =='Y' and '2020-08-01' gt list.checkin_date and list.checkin_date ge '2020-07-01' }">
		<input type="hidden" value="${list.room_weekday }" >
		<c:set var="total7" value="${total7 + list.room_weekday + list.room_weekend}"/>
		</c:if>
	</c:forEach>
	<c:forEach items="${list }" var = "list">
		<c:if test="${list.payment_status =='Y' and '2020-09-01' gt list.checkin_date and list.checkin_date ge '2020-08-01' }">
		<input type="hidden" value="${list.room_weekday }" >
		<c:set var="total8" value="${total8 + list.room_weekday + list.room_weekend}"/>
		</c:if>
	</c:forEach>
	<c:forEach items="${list }" var = "list">
		<c:if test="${list.payment_status =='Y' and '2020-10-01' gt list.checkin_date and list.checkin_date ge '2020-09-01' }">
		<input type="hidden" value="${list.room_weekday }" >
		<c:set var="total9" value="${total9 + list.room_weekday + list.room_weekend}"/>
		</c:if>
	</c:forEach>
		<input type="hidden" value="${total6 }" id="6income">
		<input type="hidden" value="${total7 }" id="7income">
		<input type="hidden" value="${total8 }" id="8income">
		<input type="hidden" value="${total9 }" id="9income">
		<c:import url="/WEB-INF/views/common/footer2.jsp" />
  </body>
	
</body>
</html>