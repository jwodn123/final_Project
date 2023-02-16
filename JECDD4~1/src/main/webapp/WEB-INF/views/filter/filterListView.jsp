<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">
<script src="https://kit.fontawesome.com/262e649fa4.js" crossorigin="anonymous"></script>
<style type="text/css">
	body {
		text-align : center;
		margin : 10px;
	}
	
	.list{
		padding-top : 30px;
	}
	#alist {
		width : 100%;
		display : grid;		
		grid-template-columns : 1fr 1fr;
		grid-template-rows : repeat(${(fn:length(Alist))/2}, 100px);
		gap : 10px 5px;
	}
	
	#flist {
		width : 100%;
		display : grid;		
		grid-template-columns : 1fr 1fr;
		grid-template-rows : repeat(${(fn:length(Flist))/2}, 100px);
		gap : 10px 5px;
	}
	
	#blist {
		width : 100%;
		display : grid;		
		grid-template-columns : 1fr 1fr;
		grid-template-rows : repeat(${(fn:length(Blist))/2}, 100px);
		gap : 10px 5px;
	}
	
	#rlist {
		width : 100%;
		display : grid;		
		grid-template-columns : 1fr 1fr;
		grid-template-rows : repeat(${(fn:length(Rlist))/2}, 100px);
		gap : 10px 5px;
	}
	
	.Cbox{
		text-align : left;
		margin-left : 40%;
		pdding : 0;
		
	}
	
	.add{
		margin : 30px;
	}
	
	h4{
		padding : 0;
		margin : 0;
	}
	button {
		border : none;
		background : none;
	}
	
	button img {
		width : 20px;
		height : 20px;
	}
</style>

</head>
<body>
<h1> 필터 관리</h1>

<div id="Adiv" class="list">
<h4>편의 시설</h4>
	<div id="alist">
		<c:forEach var="count1" begin="0" end="${fn:length(Alist)}" step="2">
		<c:forEach items="${Alist }" var="alist" begin="${count1 }" end="${count1 + 1}">
			<span class="Cbox">${ alist.amenity_name }
			<button id="deleteBto" type="button" onclick="javascript:location.href='Adelete.do?amenity_no=${alist.amenity_no }'" style="border:none;background:none;">
			<i class='fa fa-times'></i>
			</button></span>
		</c:forEach>
		</c:forEach>
	</div>
	
	<div id="Aadd" class="add">
		<form action="Ainsert.do" method="post">
		<input type="text" name="amenity_name" placeholder="추가" required>
		<button type="submit">추가하기</button>
		</form>
	</div>
</div>
<hr>
 
<div id="Fdiv" class="list">
<h4>시설 </h4>
	<div id="flist">
		<c:forEach var="count2" begin="0" end="${fn:length(Flist) }" step="2">
		<c:forEach items="${Flist }" var="flist" begin="${count2 }" end="${count2 + 1}">
			<span class="Cbox">${ flist.facility_name }
			<button id="deleteBto" type="button" onclick="javascript:location.href='Fdelete.do?facility_no=${flist.facility_no }'" style="border:none;background:none;">
			<i class='fa fa-times'></i>
			</button></span>
		</c:forEach>
		</c:forEach>
	</div>
	
	<div id="Fadd" class="add">
		<form action="Finsert.do" method="post">
		<input type="text" name="facility_name" placeholder="추가" required>
		<button type="submit">추가하기</button>
		</form>
	</div>
</div>
<hr>

<div id="Bdiv" class="list">
<h4>건물 유형 </h4>
	<div id="blist">
		<c:forEach var="count3" begin="0" end="${fn:length(Blist) }" step="2">
		<c:forEach items="${Blist }" var="blist" begin="${count3 }" end="${count3 + 1}">
			<span class="Cbox">${ blist.bu_type_name }
			<button id="deleteBto" type="button" onclick="javascript:location.href='Bdelete.do?bu_type_no=${blist.bu_type_no }'" style="border:none;background:none;">
			<i class='fa fa-times'></i>
			</button></span>
		</c:forEach>
		</c:forEach>
	</div>
	
	<div id="Badd" class="add">
		<form action="Dinsert.do" method="post">
		<input type="text" name="bu_type_name" placeholder="추가" required>
		<button type="submit">추가하기</button>
		</form>
	</div>
</div>
<hr>

<div id="Rdiv" class="list">
<h4>이용 규칙 </h4>
	<div id="rlist">
		<c:forEach var="count4" begin="0" end="${fn:length(Rlist) }" step="2">
		<c:forEach items="${Rlist }" var="rlist" begin="${count4 }" end="${count4 + 1}">
			<span class="Cbox">${rlist.rule_name }
			<button id="deleteBto" type="button" onclick="javascript:location.href='rdelete.do?rule_no=${rlist.rule_no }'" style="border:none;background:none;">
			<i class='fa fa-times'></i>
			</button></span>
		</c:forEach>
		</c:forEach>
	</div>
	
	<div id="Radd" class="add">
		<form action="Rinsert.do" method="post">
		<input type="text" name="rule_name" placeholder="추가" required>
		<button type="submit">추가하기</button>
		</form>
	</div>
</div>
<hr>
<div style="padding-bottom:30px;"></div>
</body>
</html>