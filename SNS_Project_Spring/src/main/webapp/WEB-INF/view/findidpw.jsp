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
	<title>findidpw</title>
	<link href='<c:url value="/common/css/bootstrap.min.css"/>' rel="stylesheet">
	<script src='<c:url value="https://code.jquery.com/jquery-1.10.2.js"/>'></script>
   </head>     
<script>
function email_chk() {
	var addr = "<c:url value='/user/loginEmailCheck.do' />";	
	var email = $("#email").val();
	var regExp2 = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/i;
	  	  
	  if(email === ""){
   	  $('#emailCheck').html('<span>이메일 주소를 입력해주세요.</span>');
        $('#emailCheck').css('color', 'red');
		  return false;
	  } else if (regExp2.test(email)) {
	        $.post(addr, {"email":email}, function(data) {
	            if(data.emailcheck =='yes'){
	           	    /* $('#emailCheck').html('<span>존재하는 이메일입니다.</span>');
	                $('#emailCheck').css('color', 'red'); */
	                $("#send_email").attr("action", "<c:url value= '/user/sendidpw.do' />").submit();
	               return true;
	            	} else {
		                $('#emailCheck').html('<span>존재하지 않는 이메일입니다.</span>');
		                $('#emailCheck').css('color', 'red');
	                 return false;
	            }
	           });    
	        } else{
	       	 $('#emailCheck').html('<span>올바른 이메일 형식이 아닙니다.</span>');
	         $('#emailCheck').css('color', 'red');
	            document.send_email.email.value = "";
	            document.send_email.email.focus();
	          return false;
	        }	
}
</script>
<body>

  <body style="padding-top: 40px;
    padding-bottom: 40px;
    background-color: #eee;">

    <div class="container" style="padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto; max-width:350px;">

      <form class="form-signin" name="send_email" id="send_email" method="post">
        <h3 class="form-signin-heading">아이디 · 비밀번호 찾기</h2>
        <h6 class="form-signin-heading">입력하신 이메일로 아이디와 비밀번호를 보내드립니다.</h5>
        <label for="inputEmail" class="sr-only">이메일 주소</label>
        <input type="email" name="email" id="email" class="form-control" placeholder="이메일 주소"/>

        <button id="send_email" class="btn btn-lg btn-primary btn-block" onClick="email_chk();" type="button" style="margin-top:10px;">전송</button>
        
        <lable id="emailCheck"> </lable>
        
      </form>

    </div> <!-- /container -->


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src='<c:url value="/common/js/bootstrap.min.js"/>'></script>
  </body>
</html>
