<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
<script type="text/javascript">
		function moveReviewWrite() {
			window.open("trwrite.do", "리뷰 작성",
					"width=800, height=900, left=300, top=50, toolbar=no, menubar=no, scrollbars=no, menubar=no");
		}
</script>
</head>
<body>
<div class="rvso">
	<span>&#9733;</span> 4.8 점 ( 135 ) 개
</div>
<fieldset>
  <c:forEach items="${ requestScope.list }" var="tour_review">
    <div class="one">
          <div class="reviewdate"><fmt:formatDate value="${ tour_review.tour_review_date }" pattern="yyyy-MM-dd" /></div><br>
			 ${ tour_review.tour_review_content }
           </div>
   </c:forEach>
</fieldset>
        <button class="rvwrite" onclick="moveReviewWrite()">리뷰 작성하기</button>
</body>
</html>