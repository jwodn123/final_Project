<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="robots" content="index, follow"/>
<meta name="keywords" content=""/>
<meta name="description" content=""/>

<title>JejuBnB</title>

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="resources/summernote/lang/summernote-ko-KR.js"></script>

        <!--=============== favicons ===============-->
        <link rel="shortcut icon" href="resources/images/favicon.png">

<style type="text/css">
.tihead {
      float: left;
      width: 1194px;
      height: 60px;
      position: relative;
      padding: 15px 30px;
      border-radius: 6px;
      border: 1px solid #eee;
      margin-bottom: 30px;
      background: #F8FBFE;
      left: 18%;
    }
    h2 {
      text-align: left;
      font-size: 26px;
      color: #334e6f;
      font-weight: 500;
      float: left;
      margin: 1px 0px 10px;
    }
    .tih a{
      color : #000;
      text-decoration: none;
      margin-right: 24px;
    }
    .tih span {
      color : #4DB7FE;
    }
    .ti1 {
      margin-top: 30px;
      padding-bottom: 30px;
      float: left;
      width: 100%;
    }
    hr {
      border: 1px solid #eee;
    }
    .tih {
      float: right;
      position: relative;
      top: 8px;
      font-size: 13px;
    }
    h4{
      text-align: left;
      font-size: 18px;
      color: #98AAB8;
      font-weight: 700;
      padding-bottom: 20px;
    }
    label {
      float: left;
      text-align: left;
      margin-bottom: 10px;
      font-weight: 500;
      color: #666;
      font-size: 13px;
    }
    select {
      background-color: #4DB7FE;
      color: #fff;
      border-radius: 4px;
      float: left;
      width: 100%;
      margin-bottom: 20px;
      margin: 0px 0px 20px;
      padding: 0px 30px 0px 18px;
      -webkit-tap-highlight-color: transparent;
      border-radius: 5px;
      border: solid 1px #e8e8e8;
      box-sizing: border-box;
      clear: both;
      cursor: pointer;
      display: block;
      float: left;
      font-family: inherit;
      font-size: 13px;
      font-weight: normal;
      font-weight: 400;
      height: 48px;
      line-height: 48px;
      outline: 0;
      padding-left: 18px;
      padding-right: 30px;
      position: relative;
      text-align: left!important;
      -webkit-transition: all .2s ease-in-out;
      transition: all .2s ease-in-out;
      -webkit-user-select: none;
      -moz-user-select: none;
      -ms-user-select: none;
      user-select: none;
      white-space: nowrap;
      width: auto;
}
    option {
      width: 427px;
      height: 210px;
      padding: 80px 12px 10px;
      background: #fff;
      color : #666;
      border-radius: 4px;
    }
    .tna {
      margin-top: 5%;
    }
    .tna input {
      float: left;
      border: 1px solid #eee;
      background: #f9f9f9;
      width: 50%;
      padding: 15px 20px 15px 55px;
      border-radius: 6px;
      color: #666;
      font-size: 13px;
      margin-left: -4%;
      margin-top: 0.5%;
    }
    .tdate input {
      float: left;
      border: 1px solid #eee;
      background: #f9f9f9;
      width: 50%;
      padding: 15px 20px 15px 55px;
      border-radius: 6px;
      color: #666;
      font-size: 13px;
      margin-left: -4%;
      margin-top: 0.5%;
    }
    .tdate2 input {
      float: left;
      border: 1px solid #eee;
      background: #f9f9f9;
      width: 50%;
      padding: 15px 20px 15px 55px;
      border-radius: 6px;
      color: #666;
      font-size: 13px;
      margin-left: -4%;
      margin-top: 0.5%;
    }
    #PostNumber {
      float: left;
      border: 1px solid #eee;
      background: #f9f9f9;
      width: 50%;
      padding: 15px 20px 15px 55px;
      border-radius: 6px;
      color: #666;
      font-size: 13px;
      margin-left: -4%;
      margin-top: 0.5%;
    }
    .ti2 {
      margin-top: 30px;
      padding-bottom: 30px;
      border-bottom: 1px solid #eee;
      float: left;
      width: 100%;
    }
    .tdate input {
      margin-left : -5%;
    }
    .tdate2 input {
      margin-left: -5.5%;
    }
    .tdate2 {
      margin-top: 4%;
    }
    .ti3 {
      margin-top: 30px;
      padding-bottom: 30px;
      border-bottom: 1px solid #eee;
      float: left;
      width: 100%;
    }
    .ti4 {
      margin-top: 30px;
      padding-bottom: 30px;
      border-bottom: 1px solid #eee;
      float: left;
      width: 100%;
    }
    .ti5 {
      margin-top: 30px;
      padding-bottom: 30px;
      border-bottom: 1px solid #eee;
      float: left;
      width: 100%;
    }
    #PostNumber {
      padding-left:5%;
      width:20%;
      margin-top: 1.5%;
      margin-left: -3%;
    }
    .postsea {
      background-color: #4DB7FE;
      margin:0px 0px 20px;
      height:48px;
      border-radius:5px;
      color:#fff;
      width:130px;
      border: none;
      margin-top: 1.5%;
      margin-left: 1%;
    }
    #tour_roadaddress {
      float: left;
      border: 1px solid #eee;
      background: #f9f9f9;
      width: 27.6%;
      padding: 15px 20px 15px 55px;
      border-radius: 6px;
      color: #666;
      font-size: 13px;
      margin-left: 0%;
      margin-top: 0.5%;
    }
    #DetailAddress {
      float: left;
      border: 1px solid #eee;
      background: #f9f9f9;
      width: 28%;
      padding: 15px 20px 15px 55px;
      border-radius: 6px;
      color: #666;
      font-size: 13px;
      margin-left: -27.5%;
      margin-top: 3.5%;
    }
    .tins {
      position: relative;
      left : 22%;
    }
    .ti5 textarea{
    float: left;
    border: 1px solid #eee;
    background: #f9f9f9;
    width: 100%;
    padding: 15px 20px 15px 55px;
    border-radius: 6px;
    color: #666;
    font-size: 13px;
    -webkit-appearance: none;
    height: 200px;
    resize: none;
    padding: 25px 20px;
    width: 1000px;
    }
    .co {
      width: 191px;
      height: 52px;
      background: #4DB7FE;
      color : #fff;
      padding: 15px 40px;
      border: none;
      border-radius: 5px;
    }
    .co:hover {
      background: #2F3B59;
    }
    .to-top {
      position: fixed;
          bottom: 60px;
          right: 50px;
          width: 40px;
          height: 40px;
          color: #fff;
          line-height: 40px;
          font-size: 17px;
          background: #292929;
          z-index: 116;
          cursor: pointer;
          display: none;
          border-radius: 3px;
          box-shadow: 0px 0px 0px 7px rgba(255,255,255,0.2);
          -webkit-transform: translate3d(0,0,0);
    }
    .ti6{
      margin-top: 30px;
      padding-bottom: 30px;
      border-bottom: 1px solid #eee;
      float: left;
      width: 100%;
    }
    .imagePreview{
   	  width: 180px;
	  height: 180px;
 	  background-position: center center;
 	  background-size: cover;
 	  -webkit-box-shadow: 0 0 1px 1px rgba(0, 0, 0, .3);
 	  display: inline-block;
}
</style>
</head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
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
<%-- <c:import url="/WEB-INF/views/common/header.jsp" /> --%>
<body>
  
  <div class="loader-wrap">
      <div class="pin"></div>
      <div class="pulse"></div>
  </div>			
  <div style = "padding: 80px 0px 0px 0px;" ></div>
     <div class="tihead">
       <h2>관광지 등록 하기</h2>
        <div class="tih">
          <a href="#">Home</a>
          <a href="#">관광지</a>
          <span>관광지 등록</span>
        </div>
    </div>
    <form class="tins" action="tinsert.do" method="post">
    <div class="ti1">
      <div class="tih1">
      <h4>관광지 정보</h4>
      </div>
      <div class="tca">
      <label>카테고리</label>
      <select name="tour_category_no" class="tcselect">
          <option value="category">카테고리</option>
          <option value="1">자 연</option>
          <option value="2">음 식</option>
          <option value="3">체 험</option>
      </select>
    </div> <br>
    <div class="tna">
      <label>관광지 이름<i class="fa fa-plane" ></i></label> <br>
      <input type="text" placeholder="Name of Tour" name="tour_name"/>
    </div>
  </div>
  <div class="ti2">
    <div class="tih1">
    <h4>체험 날짜</h4>
    </div>
  <div class="tdate">
    <label>체험 시작 날짜<i class="fa fa-calendar-o"></i></label> <br>
    <input type="date" class="tds" name="tour_act_start_date" placeholder="체험 시작 날짜">
  </div>
  <br>
  <div class="tdate2">
    <label>체험 끝나는 날짜<i class="fa fa-calendar-o"></i></label> <br>
    <input type="date" class="tdd" name="tour_act_end_date" placeholder="체험 끝나는 날짜">
  </div>
</div>
<div class="ti3">
  <div class="tih1">
  <h4>관광지 정보</h4>
  </div>
  <textarea name="tour_content" id="summernote" class="summernote"></textarea>
  <script>
  $(document).ready(function() { $('#summernote').summernote();
  });
  $('.summernote').summernote({
    height : 300,
    width : 1000,
    lang : 'ko-KR',
    placeholder : '관광지 내용 을 입력해 주세요',
    onImageUpload: function(files, editor, welEditable) { sendFile(files[0], editor, welEditable);
    }
  });
</script>
</div>
<div class="ti4">
  <div class="tih1">
  <h4>위치</h4>
  </div>
  <label>Address<i class="fa fa-map-marker"></i></label>
  <input type="text" placeholder="Address of your business" id="PostNumber" placeholder="우편번호" required readonly>
  <button onclick="PostCall()" type="button" class="postsea">우편번호 검색</button><br>
  <input type="text" id="tour_roadaddress" name="tour_roadaddress" placeholder="도로명주소" readonly><br>
  <input type="text" id="DetailAddress" name="address" placeholder="상세주소"><br>
</div>
<div class="ti5">
  <div class="tih1">
  <h4>알아두어야 할 사항</h4>
  </div>
  <textarea name="tour_moreinfo" placeholder="알아야 할 사항 을 입력해 주세요"></textarea>
</div>
<div class="imagePreview"></div>
<input id="uploadFile" type="file" name="tour_thum_image" class="img" />
<script type="text/javascript">

$(function() {
    $("#uploadFile").on("change", function(){
        var files = !!this.files ? this.files : [];
        if (!files.length || !window.FileReader) return; 
        if (/^image/.test( files[0].type)){ 
            var reader = new FileReader(); 
            reader.readAsDataURL(files[0]); 
            reader.onloadend = function(){ 
             $('.imagePreview').css("background-image", "url("+this.result+")"); 
            };
        }
    });
});
</script>
<input type="hidden" name="user_id" value="${ loginMember.user_id }" >
<div class="ti6">
<input type="submit" value="작성 완료" class="co">
</div>
</form>		
            <a class="to-top"><i class="fa fa-angle-up"></i></a>
</body>
<%-- <c:import url="/WEB-INF/views/common/footer.jsp" /> --%>
        <!--=============== scripts  ===============-->
        <script type="text/javascript" src="resources/js/jquery.min.js"></script>
        <script type="text/javascript" src="resources/js/plugins.js"></script>
        <script type="text/javascript" src="resources/js/scripts.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=YOURAPIKEYHERE&libraries=places&callback=initAutocomplete"></script>
        <script type="text/javascript" src="resources/js/map_infobox.js"></script>
        <script type="text/javascript" src="resources/js/markerclusterer.js"></script>
        <script type="text/javascript" src="resources/js/maps.js"></script>
</html>
