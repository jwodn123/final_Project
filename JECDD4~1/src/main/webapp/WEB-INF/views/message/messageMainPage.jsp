<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JejuBnB</title>
		<script type="text/javascript">
			function message() {
		 	window.open("message.do?user_one=${loginMember.user_id }&user_two=user02" , "메세지함",
			"width=800, height=900, left=100, top=50, toolbar=no, menubar=no, scrollbars=no, resizable=yes" ); 
			}
		 	function moveMessageListPage() {
		 	 	window.open("moveMessageList.do?user_one=${loginMember.user_id }", "메세지창",
		 		"width=1700, height=900, left=100, top=50, toolbar=no, menubar=no, scrollbars=no, resizable=yes" ); 
		 	}
		</script>
	</head>
	<body>
		<c:import url="/WEB-INF/views/common/header.jsp" /> <br>
		<h1>Message 보내기 버튼 임시 페이지</h1>
		<c:url value="moveMessageList.do" var="message">
			<c:param name="user_one" value="${loginMember.user_id }"/>
		</c:url>
		<button onclick="return message();">메세지창 user02</button>
		<button onclick="javascript:location.href='${message }'">메세지함 가기</button>
	</body>
</html>