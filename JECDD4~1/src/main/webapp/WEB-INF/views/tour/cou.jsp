<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
<style type="text/css">
 body {
 	margin : 0;
 	padding : 0;
}
 input.clo {
 	position: absolute;
    left: 94%;
    top: 94.7%;
    background: none;
    border: none;
}
  p {
	position: absolute;
    top: 90.3%;
    left: 5%;
  }
</style>
</head>
<body>
<div class="couimg">
	<a href="#"><img src="resources/images/coupon.png" width=100% height=100%></a>
</div>
<input type="checkbox" ><p>오늘 하루 보지 않기</p>
<input class="clo" type="button" value="X"onclick="self.close()">
</body>
</html>