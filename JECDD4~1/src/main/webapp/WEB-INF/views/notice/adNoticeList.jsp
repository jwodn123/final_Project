<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$("#update").on('click', function(){
		$.ajax({
			url : "adNoticeUpdate.do",
			type : "post",
			data : {notice_name=$("#notice_name").val() , notice_content1 = $("#notice_content1").val() , notice_content2=$("#notice_content2").val(), notice_type_no=},
			success : function(data) {
				
			}
		});
	});
});

function updateN(name, content1, content2){
	 $().html('<input type="text" name="notice_type_no" value="${notice.notice_type_no}">');
	 $("#type").html('<input type="text" name="notice_name" value="'+name+'">');
     $("#content1").html('<input type="text" name="notice_content1" value="'+content1+'">');
     $("#content2").html('<input type="text" name="notice_content2" value="'+content2+'">');
     $("#updateForm").html('<button id="update" onclick="update()">수정</button>')
     
}

function noch(){
	var no = $("input[name=notice_type_no]:checked").val();
	if(no != null){
		return true;
	}else {
		alert("선택 없음");
		return false;
	}
	
}
	
</script>
</head>
<body>
<h1>관리자 알림 설정</h1>
<form action="deleteNotice.do" method="post" onsubmit="return noCh()"> 
<ul>
<c:forEach items="${list }" var="notice">
<li>알림 타입 번호 : ${notice.notice_type_no}</li>
<li><span id="type">알림 타입 : ${notice.notice_name}</span> </li>
<ul>
<li><span id="content1">알림 내용 1 :${notice.notice_content1 }</span></li>
<li><span id="content2">알림 내용 2 : ${notice.notice_content2 }</span></li>
</ul>
<li> <button id="updateForm" onclick="updateN('${notice.notice_name}', '${notice.notice_content1 }', '${notice.notice_content2 }');" type="button" > 수정하기</button> <br> 
삭제 선택 : <input type="checkbox" name="notice_type_no" value="${notice.notice_type_no }" > </li>
</c:forEach>
</ul>
<button type="submit">삭제하기</button>
</form>
</body>
</html>