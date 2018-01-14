<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page session="true" %>

<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>SNS Project</title>
  <link href='<c:url value="/common/css/bootstrap.min.css"/>' rel="stylesheet">
  <link href='<c:url value="/common/css/style.css"/>' rel="stylesheet" />
  <link href='<c:url value="/common/css/login.css"/>' rel="stylesheet" />
  <script src='<c:url value="https://code.jquery.com/jquery-1.10.2.js"/>'></script>

</head>
<script type="text/javascript">
$(document).ready(function(){                
  $('#loginid').keyup(function(){
	  var a = id_chk();
  });
  $('#email').keyup(function() {
	 var a = email_chk(); 
  });
});
</script>
<script type="text/javascript">
function logincheck() {
	
	  	var addr = "<c:url value='/user/loginIdPwCheck.do' />";
	  
	      $.post(addr, {"login_id" : $("#login_id").val(), "pass_word" : $("#pass_word").val()}, function(data){
	        if(data.idpwcheck =='yes'){
	          $('#idpwcheck').html('<span>아이디 또는 비밀번호가 일치하지 않습니다.</span>');
	          $('#idpwcheck').css('color', 'red');
	          return false;
	        } else {
	        	$("#login-form").attr("action", "<c:url value= '/user/login.do' />").submit();
	        	return true;
	        }
	               }
	         );
}  
</script>
<script>
function id_chk() {
     var addr = "<c:url value='/user/existloginIdCheck.do' />";
     var loginid = $('#loginid').val();

     if(loginid.length >= 4){
        $.post(addr, {"loginid":loginid}, function(data){
          if(data.idcheck =='yes'){
            $('#idcheck').val('사용불가');
            $('#idcheck').css('color', 'red');
            return false;
                 }
          else if(loginid.length >= 13) {
              $('#idcheck').val('12자 초과');
              $('#idcheck').css('color', 'red');
              return false;
           } else {
              $('#idcheck').val('사용가능');
              $('#idcheck').css('color', 'blue');
              return true;
           }
         });    
      } else{
          $('#idcheck').val('4자 미만');
          $('#idcheck').css('color', 'red');
          return false;
        }
}

function email_chk() {
	var regExp2 = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/i;
    var addr = "<c:url value='/user/loginEmailCheck.do' />";
    var email = $('#email').val();
    if (regExp2.test(email)) {
        $.post(addr, {"email":email}, function(data) {
         if(data.ret =='y'){
            $('#emailcheck').val('사용불가');
            $('#emailcheck').css('color', 'red');
            return false;
         	} else {
              $('#emailcheck').val('사용가능');
              $('#emailcheck').css('color', 'blue');
              return true;
         }
        });    
     } else{
       $('#emailcheck').val('사용불가');
       $('#emailcheck').css('color', 'red');
       return false;
     }
}
function register_check() {
	event.preventDefault();
	
	var loginid = $("#loginid").val();
	var password = $("#password").val();
	var email = $("#email").val();
	var nick = $("#nick").val();
	
	var regExp1 = /^[a-zA-Z0-9]{4,12}$/;
    //id와 비밀번호의 유효성 검사
    var regExp2 = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/i;
    //email의 유효성 검사

	if(loginid === ""){
			alert("아이디를 입력하세요.");
			document.register_form.loginid.focus();
			return; 
	} 
	else if(!regExp1.test(loginid)) {
           alert("아이디는 4자에서 12자의 영문 또는 숫자로 입력해주세요.");
           document.register_form.loginid.value = "";
           document.register_form.loginid.focus();
           return false;
    }
    
	if(password === ""){
			alert("비밀번호를 입력하세요.");
			document.register_form.password.focus();
			return false;
	}
	else if (!regExp1.test(password))
    {
        alert("비밀번호는 4자에서 12자의 영문 또는 숫자로 입력해주세요.");
        document.register_form.password.value = "";
        document.register_form.password.focus();
        return false;
    }
	else if ((password.slice(0, password.length) === loginid.slice(0, loginid.length))) 
    {
        alert("비밀번호가 아이디와 동일하면 안됩니다.");
        document.register_form.loginid.value = "";
        document.register_form.loginid.focus();
        document.register_form.password.value = "";
        document.register_form.password.focus();
        return false;
    }

	if(email === ""){
		alert("이메일을 입력하세요.");
		$("#email").focus();
		return;
	}
	else if (!regExp2.test(email))
    {
        alert("올바른 이메일 형식이 아닙니다.");
        document.register_form.email.value = "";
        document.register_form.email.focus();
        return false;
    }
	
	if(nick === ""){
		alert("닉네임을 입력하세요.");
		document.register_form.nick.focus();
		return false;
	}
	if(document.register_form.nick.value.length >= 7 ) {
        alert('닉네임은 6자 미만으로 입력하세요.');
        document.register_form.nick.value = "";
        document.register_form.nick.focus();
        return false;
    }

	if($('#idcheck').val() == '사용가능') {
		if($('#emailcheck').val() == '사용가능') {
			document.register_form.submit();
		} else {
			alert("이메일이 중복됩니다. 다른 이메일로 다시 입력해주세요.");
		}
	} else {
		alert("아이디가 중복됩니다. 다른 아이디로 다시 입력해주세요.");
		return false;
	}
}
</script>
<body>

  <nav class="navbar navbar-default navbar-fixed-top" style="background-color:#83abc6;">
    <div class="container center-block">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">BLUECOCO</a>
      </div>

      <ul class="nav navbar-nav navbar-right">
        <li>
          <!-- login modal display -->
          <a href="#" data-toggle="modal" data-target="#loginModal" style="color:white; text-shadow: 1px 1px 1px grey; outline:none; ">
              <span class="glyphicon glyphicon-log-in" />&nbsp;로그인
          </a>

          <!-- Modal -->
          <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">

              <!-- login & register view -->
              <div class="panel panel-login">


                <!-- login & register body -->
                <div class="panel-body">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  <div class="row">
                    <div class="col-lg-12">


                      <!-- login form -->
                      <form id="login-form" name="login_form" <%-- action="<c:url value="/user/login.do" />" --%>  method="post" role="form" style="display: block;">
                        <h2>로그인</h2>

                        <!-- insert id -->
                        <div class="form-group">
                          <input type="text" name="loginid" id="login_id" tabindex="1" class="form-control" placeholder="사용자 아이디" value="">
                        </div>

                        <!-- insert password -->
                        <div class="form-group">
                          <input type="password" name="password" id="pass_word" tabindex="2" class="form-control" placeholder="비밀번호">
                        </div>
						
						<div class="form-group">
                        	<label id="idpwcheck"> </label>            	
                        </div>
						
                        <!-- remember id & find password -->
                        <div class="col-xs-6 form-group pull-left checkbox">
                          <input id="checkbox1" type="checkbox" name="remember">
                          <label for="checkbox1">ID 저장</label>
                          <a href="#" class="forgot-password">비밀번호 찾기</a>
                        </div>
                        
                        <!-- login button -->
                        <div class="col-xs-6 form-group pull-right">
                          <input type="button" name="login-submit" id="login_submit" onClick="logincheck()" tabindex="3" class="form-control btn btn-login" value="로그인">
                        </div>
                        
                      </form>
                      <!-- end of login form -->

                      <!-- register form -->
                      <form id="register-form" name="register_form" action="<c:url value="/user/insertUser.do" />" method="post" style="display: none;">
                        <h2>회원가입</h2>
						
                        <!-- insert loginid -->
                        <div class="form-group">
                          <input type="text" name="loginid" id="loginid" tabindex="1" class="form-control" placeholder="아이디" value="">
                        </div>
                        
                        <div class="form-group">
                        	<input type="text" id="idcheck" style="border:0; background-color: rgba(0,0,0,0); align-text: center;" value="중복확인" readonly>              	
                        </div>
						
						 <!-- insert password -->
                        <div class="form-group">
                          <input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="비밀번호">
                        </div>

                        <!-- insert email -->
                        <div class="form-group">
                          <input type="email" name="email" id="email" tabindex="3" class="form-control" placeholder="이메일" value="">
                        </div>
                        
                        <div class="form-group">
                        	<input type="text" id="emailcheck" style="border:0; background-color: rgba(0,0,0,0); align-text: center;" value="중복확인" readonly>              	
                        </div>
						
						<!-- insert nick -->
                        <div class="form-group">
                          <input type="text" name="nick" id="nick" tabindex="4" class="form-control" placeholder="닉네임" value="">
                        </div>
						
                        <!-- register button -->
                        <div class="form-group">
                          <div class="row">
                            <div class="col-sm-6 col-sm-offset-3">
                              <input type="button" id="register_submit" onClick="register_check();" tabindex="5" class="form-control btn btn-register" value="회원가입">
                            </div>
                          </div>
                        </div>

                      </form>
                      <!-- end of register form -->
                    </div>
                  </div>
                </div>
                <!-- end of login & register body -->

                <!-- login & register separator -->
                <div class="panel-heading">
                  <div class="row">
                    <div class="col-xs-6 tabs">
                      <a href="#" class="active" id="login-form-link">
                        <div class="login">로그인하기</div>
                      </a>
                    </div>
                    <div class="col-xs-6 tabs">
                      <a href="#" id="register-form-link">
                        <div class="register">회원가입하기</div>
                      </a>
                    </div>
                  </div>
                </div>

              </div>
              <!-- end of login & register view -->

            </div>
            <!-- end of modal-dialog -->
          </div>
          <!-- end of modal fade & modal -->

        </li>
      </ul>

    </div>
    <!-- /.container-fluid -->
  </nav>
  <!-- end of nav -->
  
  <div class="container-fluid">
    <div class="row">
        <img src='<c:url value="/common/img/background.png"/>' alt="" style="resize: both; width:100%; max-width:100%; height:auto; float: center; margin:0; padding:0; overflow: auto" />
    </div>
  </div>

 <jsp:include page="footer.jsp" flush="false"/>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <script src='<c:url value="/common/js/bootstrap.min.js"/>'></script>
  <script src='<c:url value="/common/js/login.js"/>'></script>
  
  <script>
    $('[data-toggle="tooltip"]').tooltip('toggle');
    $('[data-toggle="tooltip"]').tooltip('hide');
  </script>
</body>

</html>
