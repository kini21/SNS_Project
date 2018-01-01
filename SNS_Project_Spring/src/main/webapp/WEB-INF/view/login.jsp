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
</head>

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
                      <form id="login-form" action='<c:url value="/user/login.do" />' method="post" role="form" style="display: block;">
                        <h2>로그인</h2>

                        <!-- insert id -->
                        <div class="form-group">
                          <input type="text" name="loginid" tabindex="1" class="form-control" placeholder="사용자 아이디" value="">
                        </div>

                        <!-- insert password -->
                        <div class="form-group">
                          <input type="password" name="password" tabindex="2" class="form-control" placeholder="비밀번호">
                        </div>

                        <!-- remember id & find password -->
                        <div class="col-xs-6 form-group pull-left checkbox">
                          <input id="checkbox1" type="checkbox" name="remember">
                          <label for="checkbox1">ID 저장</label> ∙
                          <a href="#" class="forgot-password">비밀번호 찾기</a>
                        </div>

                        <!-- login button -->
                        <div class="col-xs-6 form-group pull-right">
                          <input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="로그인">
                        </div>

                      </form>
                      <!-- end of login form -->

                      <!-- register form -->
                      <form id="register-form" action="<c:url value='/user/insertUser.do' />" method="post" style="display: none;">
                        <h2>회원가입</h2>

                        <!-- insert loginid -->
                        <div class="form-group">
                          <input type="text" name="loginid" tabindex="1" class="form-control" placeholder="아이디" value="">
                        </div>
						
						 <!-- insert password -->
                        <div class="form-group">
                          <input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="비밀번호">
                        </div>
						
                        <!-- insert nick -->
                        <div class="form-group">
                          <input type="text" name="nick" tabindex="1" class="form-control" placeholder="닉네임" value="">
                        </div>

                        <!-- insert email -->
                        <div class="form-group">
                          <input type="email" name="email" tabindex="1" class="form-control" placeholder="이메일" value="">
                        </div>

                        <!-- register button -->
                        <div class="form-group">
                          <div class="row">
                            <div class="col-sm-6 col-sm-offset-3">
                              <input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="회원가입">
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
