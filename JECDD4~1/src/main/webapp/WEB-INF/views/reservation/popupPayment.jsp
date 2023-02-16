<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
 <link href="https://fonts.googleapis.com/css2?family=Alex+Brush&display=swap" rel="stylesheet">
<script type="text/javascript">
	/* function change(act) {
		if(act=='kakao') {
			location.href="pay.do?room_no=" + ${room_no};		
		}
		else if(act=='mu') {
			location.href="pay2.do?room_no=" + ${room_no};
		}
		else {
			alert('결제 방법을 선택해주세요');
		}
	} */
	$(document).ready(function(){
		$('#btn').click(function(){
			var act = $("#sel_act").val();
			
			if(act == 'kakao') {
				//location.href="pay.do?room_no=" + ${room_no};	
				$("#form_act").attr("action", "pay.do");
				$("#form_act").submit();
				
			}
			else if(act=='mu') {
				//location.href="pay2.do?room_no=" + ${room_no};
				$("#form_act").attr("action", "pay2.do");
				$("#form_act").submit();
			}
			else {
				alert('결제 방법을 선택해주세요');
				return false;
			}
		});
	});
</script>
<style>
       .payment {
         border : 1px solid gray;
         width : 600px;
         height : 300px;
         padding: 24px;
       }
       select {
        width: 111px;
	    height: 25px;
	    position: absolute;
	    top: 16.4%;
	    margin-left: 4%;
	    left: 22%;
       }
       p {
         font-size: 13px;
         margin-left: 16%;
       }
       button {
         width: 100px;
         height: 42px;
         color: #fff;
         border: none;
         font-size: 13px;
         background-color: #1753da;
         float: right;
         margin-top: 7%;
       }
       button:hover {
         background-color: #0e3794;
       }
       .st {
       	 font-family: 'Alex Brush', cursive;
	      font-size: 35px;
	      position: relative;
	      left: 2%;
	      top: 17%;
	      color: black;
       }
       </style>

</head>
<body>
<strong class="st">JejuBnB</strong>
<div class="payment">
 <strong>결제 방법 선택 :</strong>
<form id="form_act" method="POST">
<input type="hidden" name="room_no" value="${room.room_no}">
<input type="hidden" name="date" value="${date}">
<input type="hidden" name="re_num" value="${reserv.re_num}">
<input type="hidden" name="cald" value="${cald}">
<input type="hidden" name="pay" value="${pay}">
<input type="hidden" name="pay1" value="${pay1}">
<select id="sel_act" name="act">
	<option value="">선택없음</option>
	<option value="kakao">카카오페이</option>
	<option value="mu">무통장입금</option>
</select> 
</form>
<div style = "padding: 20px 0px 0px 0px;"></div>
<hr>
        <div style = "padding: 20px 0px 0px 0px;"></div>
        <strong>결제 안내</strong> <br>
          <p> - 주문 후 5일 이내 입금 확인이 되지 않으면 주문이 자동 취소 될 수 있습니다. <br>
              - 입금 시 예금 주명은 '', 'JejuBnB' 등으로 확인 될 수 있습니다. <br>
              - 입금 시 주문자 이름과 상관없이 금액만 일치하면 정상 입금 처리 됩니다. <br>
              - 해외 은행 계좌에서 입금 시에는 반드시 원화로 입금하셔야 합니다. <br>
              - 취소 / 반품 신청시 환불 수단을 무통장으로 환불 받으실 수 있습니다. <br>
          </p>

<button id="btn">결제진행</button>
</div>
</body>
</html>