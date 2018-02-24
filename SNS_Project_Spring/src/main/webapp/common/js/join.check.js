$(document).ready(function(){  
  $('#loginid').keyup(function(){ // 아이디를 입력할 때
//	  var a = id_chk();
	  var a = jsrun('id_chk');
	  reg_chk();
  });
  $('#email').keyup(function() { // 이메일을 입력할 때
//	 var a = email_chk();
	 var a = jsrun('email_chk');
	 reg_chk();
  });
  $('#password').keyup(function() { // 비밀번호를 입력할 때
//	 var a = password_chk();
	 var a = jsrun('password_chk');
	 reg_chk();
  });
  $('#nick').keyup(function() { // 닉네임을 입력할 때
//	 var a = nick_chk();
	 var a = jsrun('nick_chk');
	 reg_chk();
  });
});

function logincheck(i, j) { // 로그인 체크
	
//	var addr = "<c:url value='/user/loginIdPwCheck.do' />";
	var addr = i;
  
      $.post(addr, {"login_id" : $("#login_id").val(), "pass_word" : $("#pass_word").val()}, function(data){
        if(data.idpwcheck =='yes'){
          $('#idpwcheck').html('<span>아이디 또는 비밀번호가 일치하지 않습니다.</span>');
          $('#idpwcheck').css('color', 'red');
          return false;
        } else {
//        	$("#login-form").attr("action", "<c:url value= '/user/login.do' />").submit();
        	$("#login-form").attr("action", j).submit();
        	return true;
        }
       });
}

function id_chk(i) { // 아이디체크
//    var addr = "<c:url value='/user/existloginIdCheck.do' />";
    var addr = i;
    var loginid = $('#loginid').val();
    var regExp1 = /^[a-zA-Z0-9]{4,12}$/;

    if(loginid.length >= 4){
       $.post(addr, {"loginid":loginid}, function(data){
//    	   		alert(data.idcheck);
			if(data.idcheck == 'yes'){
				$('#register_form_id_text').attr('class', 'form-group has-error has-feedback');
				$('#register_form_id_icon').attr('class', 'glyphicon glyphicon-remove form-control-feedback');
				$('#reg_id_chk').val('아이디가 중복되었습니다.');
				return false;
			} else if(loginid.length >= 13) {
				$('#register_form_id_text').attr('class', 'form-group has-error has-feedback');
				$('#register_form_id_icon').attr('class', 'glyphicon glyphicon-remove form-control-feedback');
				$('#reg_id_chk').val('아이디는 4자에서 12자의 영문 또는 숫자로 입력해주세요.');
				return false;
			} else if(!regExp1.test(loginid)) {
				$('#register_form_id_text').attr('class', 'form-group has-error has-feedback');
				$('#register_form_id_icon').attr('class', 'glyphicon glyphicon-remove form-control-feedback');
				$('#reg_id_chk').val('아이디는 4자에서 12자의 영문 또는 숫자로 입력해주세요.');
				return false;
			} else {
				$('#register_form_id_text').attr('class', 'form-group has-success has-feedback');
				$('#register_form_id_icon').attr('class', 'glyphicon glyphicon-ok form-control-feedback');
				$('#reg_id_chk').val('1');
				return true;
			}
        });    
     } else{
       $('#register_form_id_text').attr('class', 'form-group has-error has-feedback');
       $('#register_form_id_icon').attr('class', 'glyphicon glyphicon-remove form-control-feedback');
       $('#reg_id_chk').val('아이디는 4자에서 12자의 영문 또는 숫자로 입력해주세요.');
       return false;
     }
}

function email_chk(i) { // 이메일 체크
	var regExp2 = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/i;
//   var addr = "<c:url value='/user/loginEmailCheck.do' />";
   var addr = i;
   var email = $('#email').val();
   if (regExp2.test(email)) {
       $.post(addr, {"email":email}, function(data) {
        if(data.ret =='y'){
				$('#register_form_email_text').attr('class', 'form-group has-error has-feedback');
				$('#register_form_email_icon').attr('class', 'glyphicon glyphicon-remove form-control-feedback');
				$('#reg_em_chk').val('이메일이 중복되었습니다.');
           return false;
        	} else {
				$('#register_form_email_text').attr('class', 'form-group has-success has-feedback');
				$('#register_form_email_icon').attr('class', 'glyphicon glyphicon-ok form-control-feedback');
				$('#reg_em_chk').val('1');
          		return true;
        	}
       });    
    } else{
   	 	$('#register_form_email_text').attr('class', 'form-group has-error has-feedback');
		$('#register_form_email_icon').attr('class', 'glyphicon glyphicon-remove form-control-feedback');
		$('#reg_em_chk').val('이메일 형식이 잘못되었습니다.');
      return false;
    }
}

function password_chk() { // 비밀번호 체크
	var regExp1 = /^[a-zA-Z0-9]{4,12}$/;
	var loginid = $('#loginid').val();
	var password = $('#password').val();
	if(password === ""){
		$('#reg_pw_chk').val('비밀번호를 입력해주세요.');
		document.register_form.password.focus();
		$('#register_form_password_text').attr('class', 'form-group has-error has-feedback');
		$('#register_form_password_icon').attr('class', 'glyphicon glyphicon-remove form-control-feedback');
		return false;
	} else if (!regExp1.test(password)) {
	    $('#reg_pw_chk').val('비밀번호는 4자에서 12자의 영문 또는 숫자로 입력해주세요.');
	    $('#register_form_password_text').attr('class', 'form-group has-error has-feedback');
		$('#register_form_password_icon').attr('class', 'glyphicon glyphicon-remove form-control-feedback');
	    return false;
	} else if ((password.slice(0, password.length) === loginid.slice(0, loginid.length))) {
	    $('#reg_pw_chk').val('비밀번호는 아이디와 동일하면 안됩니다.');
	    $('#register_form_password_text').attr('class', 'form-group has-error has-feedback');
		$('#register_form_password_icon').attr('class', 'glyphicon glyphicon-remove form-control-feedback');
	    return false;
	} else {
		$('#reg_pw_chk').val('1');
		$('#register_form_password_text').attr('class', 'form-group has-success has-feedback');
		$('#register_form_password_icon').attr('class', 'glyphicon glyphicon-ok form-control-feedback');
	}
}

function nick_chk() { // 닉네임 체크
	var regExp = ["운영자", "admin", "관리자"];
	var nick = $('#nick').val();
	for(var i=0; i<regExp.length; i++) {
		if(nick == regExp[i]) {
			$('#reg_nn_chk').val('사용할 수 없는 닉네임입니다.');
			$('#register_form_nick_text').attr('class', 'form-group has-error has-feedback');
			$('#register_form_nick_icon').attr('class', 'glyphicon glyphicon-remove form-control-feedback');
			return false;
		} else {
			$('#reg_nn_chk').val('1');
			$('#register_form_nick_text').attr('class', 'form-group has-success has-feedback');
			$('#register_form_nick_icon').attr('class', 'glyphicon glyphicon-ok form-control-feedback');
		}
	}
	if(nick == "") {
		$('#reg_nn_chk').val('닉네임을 입력해주세요.');
		$('#register_form_nick_text').attr('class', 'form-group has-error has-feedback');
		$('#register_form_nick_icon').attr('class', 'glyphicon glyphicon-remove form-control-feedback');
	}
	return true;
}

function reg_chk() { // 회원가입
	var id_t = $('#reg_id_chk').val();
	var pw_t = $('#reg_pw_chk').val();
	var em_t = $('#reg_em_chk').val();
	var nn_t = $('#reg_nn_chk').val();
	
	if(id_t == 1 && pw_t == 1 && em_t == 1 && nn_t == 1) {
		$('#register_submit').attr('disabled', false);
		$('#register_submit').val('회원가입');
		return true;
	} else {
		$('#register_submit').attr('disabled', true);
	}
	
	if(id_t != 1) {
		$('#register_submit').val(id_t);
	} else if(pw_t != 1) {
		$('#register_submit').val(pw_t);
	} else if(em_t != 1) {
		$('#register_submit').val(em_t);
	} else if(nn_t != 1) {
		$('#register_submit').val(nn_t);
	}
}