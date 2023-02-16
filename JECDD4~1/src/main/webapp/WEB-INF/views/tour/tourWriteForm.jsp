<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/tourWriteForm.css" rel="stylesheet">
<!-- jquery -->
<script type="text/javascript" src="resources/js/jquery-3.5.1.min.js" ></script>
<!-- ckeditor 4 -->
<link rel="stylesheet" href="resources/ckeditor/contents.css">
﻿
<title>JejuBnB</title> 
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<!-- !!중요. - autoload=false 를 반드시 붙혀주셔야 합니다.-->
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function PostCall() {
    	daum.postcode.load(function(){
            new daum.Postcode({
            	 oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
               

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("PostNumber").value = data.zonecode;
                document.getElementById("tour_roadaddress").value = roadAddr;
               
            }
        }).open();
    })
    }
</script>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />
<div class="thead"></div>
<div style="padding: 100px 0px 0px 0px;"></div>
	<form action="imageUpload.do" method="post">
	<fieldset class="fh">
	 <select name="카테고리">
	 	<option value="live">자연</option>
	 	<option value="food">음식</option>
	 	<option value="act">체험</option>
	 </select>
	 <input type="text" placeholder="관광지 이름 을 입력하세요" required>
	 </fieldset>
	 <fieldset class="fs">
	 	<input type="date" placeholder="시작 날짜">
	 	<input type="date" placeholder="끝나는 날짜">
	 </fieldset>
	 <fieldset class="ft">
	 <script type="text/javascript">
		CKEDITOR.replace('ckeditor'); // 에디터로 생성
     </script>
	 <textarea id="ckeditor" name="tour_content" placeholder="상품설명을 입력하세요"></textarea>
         <br>
	 </fieldset>
	 <fieldset class="ff">
	 <input type="text" id="PostNumber" placeholder="우편번호" required readonly><br>
		<button onclick="PostCall()" type="button">우편번호 검색</button><br>
		<input type="text" id="tour_roadaddress" name="tour_roadaddress" placeholder="도로명주소" readonly><br>
		<input type="text" id="DetailAddress" name="address" placeholder="상세주소" required><br>
	  </fieldset>
	  <fieldset class="fb">
	 <textarea id="moreinfo" placeholder=" 알아두어야 할 사항 을 입력하세요"></textarea> <br>
	 </fieldset>
<input type="submit" value="작성 완료" class="co">
</form> 
<div style="padding: 100px 0px 0px 0px;"></div>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
<script src="//cdn.ckeditor.com/4.15.0/standard/ckeditor.js"></script>
<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
</body>
</html>