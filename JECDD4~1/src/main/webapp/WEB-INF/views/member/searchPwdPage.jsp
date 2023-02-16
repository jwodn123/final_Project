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
		<link rel="stylesheet" href="resources/css/searchPwdPage.css" >
		<script type="text/javascript" src="resources/js/jquery-3.5.1.min.js"></script>
		<script>
		function infoCheck(){
			$.ajax({
				url:"infocheck.do",
				type:"post",
				data:{user_id: $("#user_id").val(), birthday: $("#birthday").val()},
				success: function(data){
					console.log("success :"+ data)
					if (data == "ok") {
						alert("이메일로 인증번호를 전송 했습니다.");
						$.ajax({
							url:"sendEmail.do",
							type:"post",
							data:{e_mail: $("#user_id").val()},
							dataType: "json",
							success: function(jsonData){
								$("#dice").val(jsonData.no);
							},
							error: function(jqXHR, textstatus, errorthrown){
								console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
							},
						});
					} else {
						alert("회원 정보와 일치하지 않습니다..\n 다시입력");
						$('#user_id').select();
					}
				},
				error: function(jqXHR, textstatus, errorthrown){
					console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
				},
			});
			return false;
		}
		</script>
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
                                <form action="searchPwd.do" method="post">
                                    <div class="form-group mb-3">
                                        <input id="user_id" type="email" placeholder="Email address" required="" autofocus="" class="form-control rounded-pill border-0 shadow-sm px-4" name="user_id">
                                    </div>
                                    <div class="form-group mb-3">
                                        <input id="birthday" type="text" placeholder="생년월일" required="" class="form-control rounded-pill border-0 shadow-sm px-4" name="birthday"><div class="example"> ex) 970602 </div>
                                    </div>
                                    <div id="submitbutton" class="ab">
                                  				<input type="button" value="본인 인증" onclick=" return infoCheck();">
                                  			</div>
                                          <div class="form-group mb-3">
                                  			<input type="number" name="email_injeung" class="form-control rounded-pill border-0 shadow-sm px-4" placeholder="  인증번호를 입력하세요. " required>
                                        </div>
                                  			<input type="hidden" name="dice" id="dice"> <br>
                                    <button type="submit" class="check_btn" name="submit">인증 번호 확인</button>
                                </form>
                                      <div class="separator">
                                  <p>OR</p>
                                </div>
                                <a href="email.do" class="findpas">Create an Account</a> <br>
                                <a href="login.do" class="enroll">Already have an account? Login</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
      </div>
	</body>
</html>