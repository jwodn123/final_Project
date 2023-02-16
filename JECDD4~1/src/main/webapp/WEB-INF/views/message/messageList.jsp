<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<c:import url="/WEB-INF/views/common/header.jsp" />
<c:url var="callMyinfo" value="myinfo.do">
     <c:param name="user_id" value="${ sessionScope.loginMember.user_id }" />
</c:url>
<c:url var="moveMyCoupon" value="moveMyCoupon.do">
     <c:param name="user_id" value="${ sessionScope.loginMember.user_id }" />
</c:url>
<c:url var="moveMyRoom" value="seleteMyRoom.do">
     <c:param name="user_id" value="${ sessionScope.loginMember.user_id }" />
</c:url>
<c:url var="moveIncome" value="IncomeHost.do">
     <c:param name="user_id" value="${ sessionScope.loginMember.user_id }" />
</c:url>	
	<head>
		<meta charset="UTF-8">
		<title>JejuBnB</title>
		 <link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">
	</head>
		<body>
		 <div id="wrapper">
                <div class="content">
                    <section id="sec1">
                        <div class="container">
                            <div class="profile-edit-wrap">
     
                                <div class="row">

                                    <div class="col-md-9">
                                        <div class="dashboard-list-box fl-wrap">
                                            <div class="dashboard-header fl-wrap">
                                                <h3>Message</h3>
                                            </div>
                                            <c:forEach items="${messagelist }" var="list">
                                            <div class="dashboard-list">
                                                <div class="dashboard-message">
                                                    <div class="dashboard-message-avatar">
                                                        <img src="resources/images/messageico.jpg" alt="">
                                                    </div>
                                                    <div class="dashboard-message-text">
                                                    <c:if test="${list.user_one != loginMember.user_id }">
														<c:url value="message.do" var="message">
															<c:param name="user_one" value="${loginMember.user_id }"/>
															<c:param name="user_two" value="${list.user_one }"/>
														</c:url>
														<h4><a href="${message}">${list.user_one }</a> <br>
														<span>20 December 2020</span></h4>
                                                        <p>메세지를 작성해 호스트와 대화하세요.  </p>
													</c:if>
													<c:if test="${list.user_two != loginMember.user_id }">
														<c:url value="message.do" var="message">
															<c:param name="user_one" value="${loginMember.user_id }"/>
															<c:param name="user_two" value="${list.user_two }"/>
														</c:url>
														<h4><a href="${message}">${list.user_two }</a> <br>
														<span>25 December 2020</span></h4>
                                                        <p>메세지를 작성해 호스트와 대화하세요. </p>
													</c:if>
                                                    </div>
                                                </div>
                                            </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <div class="limit-box fl-wrap"></div>
                </div>
            </div>	
	</body>
</html>