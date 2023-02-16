<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JejuBnB</title>
 <link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">
    <link rel="stylesheet" href="resources/css/bootstrap.min.css" >
    <link rel="stylesheet" href="resources/css/email_injeung.css" >
</head>
<body>
<div class="container-fluid">
        <div class="row no-gutter">
            <div class="col-md-6 d-none d-md-flex bg-image"></div>
            <div class="col-md-6 bg-light">
                <div class="login d-flex align-items-center py-5">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-10 col-xl-7 mx-auto">
                              <div class="logo">
                                  <a onclick='history.back(-1);'><img src="resources/images/무제.png" ></a>
                              </div>
                               <div class="em"> 인증 번호가 맞아야 다음 단계로 넘어 가실 수 있습니다 . </div>
                                <form action="join_injeung.do" method="post">
                                    <div class="form-group mb-3">
                                        <input id="inputEmail" name="email_injeung" placeholder="인증번호를 입력하세요 " required="" autofocus="" class="form-control rounded-pill border-0 shadow-sm px-4" name="e_mail">
                                    </div>
                                      <input type="hidden" name="dice" value="${dice }">
                         			  <input type="hidden" name="user_id" value="${user_id }">
                                    <button type="submit" class="check_btn" name="submit">인증 번호 확인</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
      </div>
</body>
</html>
