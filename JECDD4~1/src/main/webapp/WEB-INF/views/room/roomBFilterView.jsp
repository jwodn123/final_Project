<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
      
        <link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">
        <script src="https://kit.fontawesome.com/262e649fa4.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="/JejuBnB/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	function movePage(){		
		frm.target="BListView";
		frm.submit();
		window.close();		
		
	}
	
</script>
<style type="text/css">

	#submitBtn{
	color : #fff;
	border-radius :5%;
    background-color: #4DB7FE;
    border : none;
    box-sizing: border-box;
    margin: 0em;
    font: 400 13.3333px Arial;
    padding : 5px;
    width: 150px;
    height: 50px;
    margin-left : 300px;
    
    }
	#mainFilter{
		margin-left : 10px;
		margin-right: 10px;
	}
	.checkBox {
		width : 175px;
		height : 20px;
		margin : 5px;
		padding : 0;
	}
	
	#container1{
		width : 400px;
		display : grid;
		grid-template-columns : 1fr 1fr 1fr 1fr;
		gap : 10px 5px;
		padding : 0;
		margin-bottom : 20px;
	}
	#close{
		border : none;
		background : none;
		float : left;
	}
	
	input[type=checkbox] {
		width : 20px;
		height : 20px;
	}
	
	#head{
		text-align : center;
	}
	
	button img {
		width : 20px;
		height : 20px;
	}
</style>
</head>
<body>
<div id="mainFilter">
	<div id="head">
		<button id="close" onclick="window.close();"><i class='fa fa-times'></i></button>	<h2><span>필터 추가하기</span></h2>
	</div>
<hr>
	<form action="moveSearchBList.do" method="post" name="frm" id="frm">
	<input type="hidden" name="checkin" id="checkin" value="${checkin }">
	<input type="hidden" name="checkout" id="checkout" value="${checkout }">
	<input type="hidden" name="people" id="people" value="${people }">
	<input type="hidden" name="week" id="week" value="${week }">
	<input type="hidden" name="user_id" value="${user_id }">

	
		<h2>침실과 침대</h2>
			침대 수 : <input type="number" name="bedCount" placeholder="0" value="0"> <br>
			침실 수 : <input type="number" name="bedroomCount" placeholder="0" value="0"> <br>
			욕실 수 : <input type="number" name="bathroomCount" placeholder="0" value="0"> <br>
		<hr>
		
		<h2 class="first">편의 시설 </h2>
			<div id="container1">
				<c:forEach var="count1" begin="0" end="${fn:length(Alist)}" step="4">
					<c:forEach items="${Alist }" var="alist" begin="${count1 }" end="${count1 + 3}">
						<div class="checkBox"><input type="checkbox" name="amenity" value="${alist }"> ${ alist }</div>
					</c:forEach>
				</c:forEach>
			</div>
		<hr> 
		
		<h2>시설 </h2>
			<div id="container1">
				<c:forEach var="count2" begin="0" end="${fn:length(Flist)}" step="4">
					<c:forEach items="${Flist }" var="flist" begin="${count2 }" end="${count2 + 2}">
						<div class="checkBox"><input type="checkbox" name="facility" value="${flist }"> ${ flist }</div>
					</c:forEach> 
				</c:forEach>
			</div>
			<hr>
		<h2>건물 유형 </h2>
			<div id="container1">
				<c:forEach var="count3" begin="0" end="${fn:length(Blist)}" step="4">
					<c:forEach items="${Blist }" var="blist" begin="${count3 }" end="${count3 + 3}">
						<div class="checkBox"><input type="checkbox" name="build" value="${blist }"> ${ blist }</div>
					</c:forEach> 
				</c:forEach>
			</div>
			<hr>
		<h2>이용 규칙 </h2>
			<div id="container1">
				<c:forEach var="count4" begin="0" end="${fn:length(Rlist)}" step="4">
					<c:forEach items="${Rlist }" var="rlist" begin="${count4 }" end="${count4 + 3 }">
						<div class="checkBox"><input type="checkbox" name="rule" value="${rlist }">${rlist }</div>
					</c:forEach>
				</c:forEach>
			</div>
			<hr>
			<button onclick="movePage()" id="submitBtn" type="button">검 색<i class="fa fa-angle-right"></i></button>
			
	</form>
</div>
</body>
</html>