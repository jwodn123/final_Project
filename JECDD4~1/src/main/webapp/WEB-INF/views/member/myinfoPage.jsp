<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JejuBnB</title>
		 <link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">
		<script type="text/javascript" src="/second/resources/js/jquery-3.5.1.min.js"></script>
		<script type="text/javascript">
		function moveUpdateView() {
			location.href = "mupview.do?user_id=${member.user_id}";
		}
		function sendDelete () {
			location.href = "mdel.do?user_id=${requestScope.member.user_id}";
		}
		function moveUpdatePwd () {
			location.href = "moveUpdatePwdPage.do";
		}
		</script>
	</head>
	<body>
			<c:import url="/WEB-INF/views/common/header.jsp" />
		   <hr>
		<h1 align="center"> 내 정보 보기 페이지  </h1>
		<br>
		<table align = "center" width= "500" cellspacing = "5" cellpadding = "0">
			<tr>
				<th width = "120"> 이 름  </th>
				<td> ${member.user_name} </td>
			</tr>
			<tr>
				<th> 아 이 디 </th>
				<td>${member.user_id} </td>
			</tr>
			<tr>
				<th> 생년월일 </th>
				<td>${member.birthday} </td>
			</tr>
			<tr>
				<th> 전화번호 </th>
				<td> ${member.phone} </td>
			</tr>
			<tr>
				<th colspan = "2">
					<button onclick="moveUpdatePwd();"> 비밀번호 변경 </button> &nbsp;
					<button onclick="moveUpdateView();"> 수정페이지로 이동 </button> &nbsp;
					<button onclick="sendDelete();"> 탈퇴하기 </button> &nbsp;
					<a href="main.do"> 시작페이지로 </a>
				</th>
			</tr>
		</table>
		<hr>
			<c:import url="/WEB-INF/views/common/header.jsp" />
	</body>
</html>