<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JejuBnB</title>
	</head>
	<body>
		<c:import url="/WEB-INF/views/common/header.jsp" /> 
		   <hr>
		<h1 align = "center"> 회원정보 수정페이지 </h1>
		<br>
		<form method="post" action="mupdate.do" >
			<table align = "center" width= "500" cellspacing = "5" cellpadding = "0">
				<tr>
					<th> 아 이 디 </th>   
					<td> <input type="text" name="user_id" value= "${requestScope.member.user_id }" readonly ></td>
				</tr>
				<tr>
					<th width = "120"> 이 름  </th>
					<td> <input type="text" name="user_name" value= "${requestScope.member.user_name }" ></td>
				</tr>
				<tr>
					<th> 생년월일 </th>   
					<td> <input type="text" name="birthday"  value = "${requestScope.member.birthday }" ></td>
				</tr>
				<tr>
					<th> 전화번호 </th>
					<td> <input type="tel" name="phone" value = "${requestScope.member.phone }"> </td>
				</tr>
				<tr>
					<th colspan = "2">
						<input type="submit" value = "수정하기"> &nbsp;
						<input type="reset" value = "수정취소"> &nbsp;
						<a href= "javascript:history.go(-1);"> 이전 페이지로 이동 </a> &nbsp;
						<a href="main.do"> 시작페이지로 </a>
					</th>
				</tr>
			</table>
		</form>
		<br>
			<c:import url="/WEB-INF/views/common/header.jsp" />
	</body>
</html>