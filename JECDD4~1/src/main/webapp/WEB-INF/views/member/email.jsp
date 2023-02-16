<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>JejuBnB</title>
    <link rel="stylesheet" href="resources/css/bootstrap.min.css" >
    <link rel="stylesheet" href="resources/css/email.css" >
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
     <link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">
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
                               <div class="em"> 이메일 인증 을 받아야 다음 단계 로 넘어 갈 수 있습니다 . </div>
                                <form action="auth.do" method="post">
                                    <div class="form-group mb-3">
                                        <input id="inputEmail" type="email" placeholder="Email address" required="" autofocus="" class="form-control rounded-pill border-0 shadow-sm px-4" name="e_mail">
                                    </div>
                                    <button type="submit" class="check_btn" name="submit">이메일 인증 받기 ( Send Email )</button>
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