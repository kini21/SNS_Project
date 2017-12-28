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
	<title>navbar</title>
	<link href='<c:url value="/common/css/bootstrap.min.css"/>' rel="stylesheet">
    <link href='<c:url value="/common/css/style.css"/>' rel="stylesheet" />
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
      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
          <li>
            <a href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-weight: bold; color:white; text-shadow: 1px 1px 1px grey;">
              <span class="glyphicon glyphicon-bullhorn"></span>&nbsp;알림<span class="badge">50</span>
            </a>
            <span class="caret"></span>
            <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
              <a href="#">
                <li class="nav_dropdown_menu_li">
                  <div class="row" style="width: 100%">
                    <img class="nav_content_img" src='<c:url value="/common/img/circle.gif" />' />
                    <div class="nav_text">
                      <div class="nav_text_box1">
                        <div class="text_count">
                          <span><strong>사용자</strong>님이 <strong>장소</strong>에 게시글을 올렸습니다.</span>
                        </div>
                      </div>
                      <div class="nav_text_box2">
                        <span>오전 4:49 - 2017년 11월 24일</span>
                      </div>
                    </div>
                  </div>
                </li>
              </a>
              <a href="#">
                <li class="nav_dropdown_menu_li">
                  <div class="row" style="width: 100%">
                    <img class="nav_content_img" src='<c:url value="/common/img/circle.gif" />' />
                    <div class="nav_text">
                      <div class="nav_text_box1">
                        <div class="text_count">
                          <span><strong>사용자</strong>님이 <strong>장소</strong>에 게시글을 올렸습니다.</span>
                        </div>
                      </div>
                      <div class="nav_text_box2">
                        <span>오전 4:49 - 2017년 11월 24일</span>
                      </div>
                    </div>
                  </div>
                </li>
              </a>
              <a href="#">
                <li class="nav_dropdown_menu_li">
                  <div class="row" style="width: 100%">
                    <img class="nav_content_img" src='<c:url value="/common/img/circle.gif" />' />
                    <div class="nav_text">
                      <div class="nav_text_box1">
                        <div class="text_count">
                          <span><strong>사용자</strong>님이 <strong>장소</strong>에 게시글을 올렸습니다.</span>
                        </div>
                      </div>
                      <div class="nav_text_box2">
                        <span>오전 4:49 - 2017년 11월 24일</span>
                      </div>
                    </div>
                  </div>
                </li>
              </a>

            </ul>
          </li>


          <li>
            <a href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-weight: bold; color:white; text-shadow: 1px 1px 1px grey;">
              <span class="glyphicon glyphicon-envelope"></span>&nbsp;쪽지<span class="badge">50</span>
            </a>

            <span class="caret"></span>
            <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
              <a href="#">
                <li class="nav_dropdown_menu_li">
                  <div class="row" style="width: 100%">
                    <img class="nav_content_img" src='<c:url value="/common/img/circle.gif" />' />
                    <div class="nav_text">
                      <div class="nav_text_box1">
                        <span><strong>사용자</strong></span>
                      </div>
                      <div class="nav_text_box2">
                        <div class="text_count">
                          <span>다했다했다했다했다했다했다했다했다했다했다했다했다</span>
                        </div>
                      </div>
                      <div class="nav_text_box3">
                        <span>12월 1일</span>
                      </div>
                    </div>
                  </div>
                </li>
              </a>
              <a href="#">
                <li class="nav_dropdown_menu_li">
                  <div class="row" style="width: 100%">
                    <img class="nav_content_img" src='<c:url value="/common/img/circle.gif" />' />
                    <div class="nav_text">
                      <div class="nav_text_box1">
                        <span><strong>사용자</strong></span>
                      </div>
                      <div class="nav_text_box2">
                        <div class="text_count">
                          <span>다했다했다했다했다했다했다했다했다했다했다했다했다</span>
                        </div>
                      </div>
                      <div class="nav_text_box3">
                        <span>12월 1일</span>
                      </div>
                    </div>
                  </div>
                </li>
              </a>
              <a href="#">
                <li class="nav_dropdown_menu_li">
                  <div class="row" style="width: 100%">
                    <img class="nav_content_img" src='<c:url value="/common/img/circle.gif" />' />
                    <div class="nav_text">
                      <div class="nav_text_box1">
                        <span><strong>사용자</strong></span>
                      </div>
                      <div class="nav_text_box2">
                        <div class="text_count">
                          <span>다했다했다했다했다했다했다했다했다했다했다했다했다</span>
                        </div>
                      </div>
                      <div class="nav_text_box3">
                        <span>12월 1일</span>
                      </div>
                    </div>
                  </div>
                </li>
              </a>

            </ul>
          </li>

          <li>
            <a href="#" data-toggle="modal" data-target="#profileModal" style="font-weight: bold; color:white; text-shadow: 1px 1px 1px grey; outline: none;">
              <span class="glyphicon glyphicon-user"></span>&nbsp;프로필
            </a>
            <!-- Modal -->
            <div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="profileModalLabel" aria-hidden="true">
              <div class="modal-dialog" role="document">

                <!-- profile view -->
                <div class="panel panel-profile">


                  <!-- profile body -->
                  <div class="panel-body">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <div class="row">
                      <div class="col-lg-12">

                        <!-- profile form -->
                        <form id="profile-form" action="#" method="post" role="form">
                          <h2>프로필 수정</h2>

                          <!-- insert id -->
                          <div class="form-group">
                            <input type="text" name="id" id="id" tabindex="1" class="form-control" placeholder="아이디" value="">
                          </div>

                          <!-- insert username -->
                          <div class="form-group">
                            <input type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="닉네임" value="">
                          </div>

                          <!-- insert email -->
                          <div class="form-group">
                            <input type="email" name="email" id="email" tabindex="1" class="form-control" placeholder="이메일" value="">
                          </div>

                          <!-- insert password -->
                          <div class="form-group">
                            <input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="비밀번호">
                          </div>

                          <!-- register button -->
                          <div class="form-group">
                            <div class="row">
                              <div class="col-sm-6 col-sm-offset-3">
                                <input type="submit" name="profile-submit" id="profile-submit" tabindex="4" class="form-control btn btn-profile" value="정보수정">
                              </div>
                            </div>
                          </div>

                        </form>
                        <!-- end of profile form -->
                      </div>
                    </div>
                  </div>
                  <!-- end of profile body -->
                </div>
                <!-- end of profile view -->
              </div>
              <!-- end of modal-dialog -->
            </div>
            <!-- end of modal fade & modal -->

          </li>
        </ul>
        <form class="navbar-form navbar-left" role="search">
          <div class="form-group">
            <label class="sr-only" for="form-control">친구 찾기</label>
            <input type="text" class="form-control" placeholder="친구 찾기">
          </div>
          <button type="submit" class="btn btn-default">검색</button>
        </form>
        <ul class="nav navbar-nav navbar-right">
          <li><a href="#" style="font-weight: bold; color:white; text-shadow: 1px 1px 1px grey;"><span class="glyphicon glyphicon-log-in"></span>&nbsp;로그아웃</a></li>
        </ul>
        <form class="navbar-form navbar-right">
          <button type="button" class="btn btn-info" data-toggle="modal" data-target="#writeModal" style="font-weight:bold; outline: none;">
            글 쓰기
          </button>

          <!-- Modal -->
          <div class="modal fade" id="writeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header" style="background-color:#83abc6; border-radius: 6px 6px 0 0;">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  <h4 class="modal-title" id="writeLabel" style="color: #fff;">게시글 쓰기</h4>
                </div>
                <form id="write-form" action="#" method="post" role="form">
                  <div class="modal-body">
                    <textarea rows="44" name="status" class="writeTextArea"></textarea>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="사진 또는 동영상 추가하기" style="float:left;">
                    <span class="glyphicon glyphicon-picture"></span>
                  </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-primary">저장</button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </form>

      </div>
      <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
  </nav>
  <!-- end of nav -->

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <script src='<c:url value="/common/js/bootstrap.min.js"/>'></script>
  <script>
    $('[data-toggle="tooltip"]').tooltip('toggle');
    $('[data-toggle="tooltip"]').tooltip('hide');
  </script>
</body>
</html>