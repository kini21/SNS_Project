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
        <a class="navbar-brand" href="#">BULECOCO</a>
      </div>
      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
          <li>
            <a href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-weight: bold; color:white; text-shadow: 1px 1px 1px grey;">
              <span class="glyphicon glyphicon-bullhorn"></span>&nbsp;알림
            </a>
            <span class="caret"></span>
            <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
              <a href="#">
                <li class="nav_dropdown_menu_li">
                  <div class="row" style="width: 100%">
                    <img class="nav_content_img" src="../img/circle.gif" />
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
                    <img class="nav_content_img" src="../img/circle.gif" />
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
                    <img class="nav_content_img" src="../img/circle.gif" />
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
              <span class="glyphicon glyphicon-envelope"></span>&nbsp;쪽지
            </a>

            <span class="caret"></span>
            <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
              <a href="#">
                <li class="nav_dropdown_menu_li">
                  <div class="row" style="width: 100%">
                    <img class="nav_content_img" src="../img/circle.gif" />
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
                    <img class="nav_content_img" src="../img/circle.gif" />
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
                    <img class="nav_content_img" src="../img/circle.gif" />
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

  <div class="container">
    <div class="row">
      <div class="col-md-3">
        <div class="sidebar">
          <div class="sidebarProfile">
            <a class="profileCardLink" href="#" aria-hidden="true"></a>
            <div class="profileCardContent">
              <a class="profileImgLink" href="#" title="nickname" aria-hidden="true">
                <img src="../img/circle.gif" alt="70x70" class="img-circle" width="70" height="70">
              </a>

              <div class="profileUseridAndNick">
                <div class="userid">
                  <a href="#" style="color: inherit!important;">박호균</a>
                </div>
                <span class="userNick">
                  <a class="uN" href="#">purplecow</a>
                </span>
              </div>

            </div>
          </div>
        </div>

        <div class="sidebar2">
          <div class="list-group">
            <a href="#" class="list-group-item list-group-item-success" data-toggle="tooltip" data-placement="top" title="내가 쓴 글 2345개">
            내가 쓴 글 : 2345개
          </a>
            <a href="#" class="list-group-item list-group-item-info" data-toggle="modal" data-target="#followModal" title="팔로잉 670명">
            팔로잉 : 670명
          </a>
          </div>

          <!-- Modal -->
          <div class="modal fade" id="followModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header" style="background-color:#83abc6; border-radius: 6px 6px 0 0;">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  <h4 class="modal-title" id="writeLabel" style="color: #fff;">팔로잉 목록</h4>
                </div>

                  <div class="modal-body">
                    <table class="table table-hover">
                        <thead>
                          <tr>
                            <th>No</th>
                            <th>아이디</th>
                            <th>닉네임</th>
                            <th>#</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td>1</td>
                            <td>박호균</td>
                            <td>purplecow</td>
                            <td>언팔로우</td>
                          </tr>
                          <tr>
                            <td>2</td>
                            <td>한광식</td>
                            <td>Mugunghwa</td>
                            <td>언팔로우</td>
                          </tr>
                          <tr>
                            <td>3</td>
                            <td>조재형</td>
                            <td>BNF KOREA</td>
                            <td>언팔로우</td>
                          </tr>
                          <tr>
                            <td>4</td>
                            <td>김준기</td>
                            <td>넷오우션</td>
                            <td>언팔로우</td>
                          </tr>
                          <tr>
                            <td>5</td>
                            <td>블루코코</td>
                            <td>BLUECOCO</td>
                            <td>언팔로우</td>
                          </tr>
                        </tbody>
                      </table>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
                  </div>
                </form>
              </div>
            </div>
          </div>


        </div>
      </div>
      <div class="col-md-9">
        <div class="main_content_wrap">
          <div class="main_contents">
            <div class="page-header" style="margin:0px; padding-bottom:0px;">
              <h4 style="font-weight:bold;">게시글</h4>
            </div>
            <div class="timeline">
              <ol class="timeline">
                <li class="timeline_li" onMouseOver="this.style.backgroundColor='#f5f8fa';" onMouseOut="this.style.backgroundColor='#fff'">
                  <div class="tl_text">
                    <div class="content" style="margin-left:58px;">
                      <div class="content_header" style="display: flex;">
                        <a href="#" style="margin-right:5px;">
                           <img class="content_img" src="../img/circle.gif" />
                           <span class="nameGroup">
                             <strong class="uid">박호균</strong>
                           </span>
                           <span class="uname">
                              <b style="font-weight: normal">purplecow</b>
                           </span>
                         </a>
                        <small class="time" data-toggle="tooltip" data-placement="top" title="오전 4:49 - 2017년 11월 24일">
                            · 11월 24일
                         </small>
                      </div>
                      <!-- End of content_header -->
                      <div>
                        <p class="text_box">
                          그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!!! 그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!! 그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!! 그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!! 그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!! 그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!!그림판 켜고
                          블로그 켜라!!
                        </p>
                      </div>
                      <div class="imgBoxContainer">
                        <div class="imgBox">
                          <div class="soleImg">
                            <div class="imgInnerContainer">
                              <img src="../img/f029.png" style="width:100%; height:100%" />
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="content_footer">
                        <div class="button_list">
                          <div class="reply_btn">
                            <a href="#" class="btn2" data-toggle="tooltip" data-placement="top" title="댓글달기">
                              <div class="iconBox" data-toggle="modal" data-target="#replyModal">
                                <span class="glyphicon glyphicon-comment" aria-hidden="true"> </span>
                              </div>
                            </a>
                          </div>

                          <!-- Modal -->
                          <div class="modal fade" id="replyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                              <div class="modal-content">
                                <div class="modal-header" style="background-color:#83abc6; border-radius: 6px 6px 0 0;">
                                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                  <h4 class="modal-title" id="replyLabel" style="color: #fff;">댓글 쓰기</h4>
                                </div>
                                <form id="reply-form" action="#" method="post" role="form">
                                  <div class="modal-body">
                                    <div class="row">

                                      <div class="content_header" style="display: flex;">

                                        <img class="reply_content_img" src="../img/circle.gif" />
                                        <span class="reply_nameGroup">
                                               <a href="#"><strong class="uid">박호균</strong></a>
                                             </span>
                                        <span class="reply_uname">
                                                <b>purplecow</b>
                                             </span>

                                        <small class="reply_time" data-toggle="tooltip" data-placement="top" title="오전 4:49 - 2017년 11월 24일">
                                              · 11월 24일
                                           </small>
                                      </div>
                                      <div class="reply_text_box">
                                        <p>
                                          그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!!! 그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!! 그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!! 그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!! 그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!! 그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!!그림판 켜고
                                          블로그 켜라!!
                                        </p>
                                      </div>

                                    </div>
                                    <div class="row">
                                      <div class="reply-row-textArea">
                                        <textarea rows="44" name="status" class="writeTextArea"></textarea>
                                      </div>
                                    </div>
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

                          <div class="ddabong" style="min-width:26px; display: inline-block;">
                            <a href="#" class="btn2" data-toggle="tooltip" data-placement="top" title="따봉">
                              <div class="iconBox">
                                <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
                              </div>
                            </a>
                            <span class="ddabongCnt">
                                    9452
                                </span>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </li>
                <!-- end of content1 -->

                <li class="timeline_li" onMouseOver="this.style.backgroundColor='#f5f8fa';" onMouseOut="this.style.backgroundColor='#fff'">
                  <div class="tl_text">
                    <div class="content" style="margin-left:58px;">
                      <div class="content_header" style="display: flex;">
                        <a href="#" style="margin-right:5px;">
                           <img class="content_img" src="../img/circle.gif" />
                           <span class="nameGroup">
                             <strong class="uid">박호균</strong>
                           </span>
                           <span class="uname">
                              <b style="font-weight: normal">purplecow</b>
                           </span>
                         </a>
                        <small class="time" data-toggle="tooltip" data-placement="top" title="오전 4:49 - 2017년 11월 24일">
                            · 11월 24일
                         </small>
                      </div>
                      <!-- End of content_header -->
                      <div>
                        <p class="text_box">
                          그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!!! 그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!! 그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!! 그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!! 그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!! 그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!!그림판 켜고
                          블로그 켜라!!
                        </p>
                      </div>
                      <div class="content_footer">
                        <div class="button_list">
                          <div class="reply_btn">
                            <a href="#" class="btn2" data-toggle="tooltip" data-placement="top" title="댓글달기">
                              <div class="iconBox">
                                <span class="glyphicon glyphicon-comment" aria-hidden="true"> </span>
                              </div>
                            </a>
                          </div>
                          <div class="ddabong" style="min-width:26px; display: inline-block;">
                            <a href="#" class="btn2" data-toggle="tooltip" data-placement="top" title="따봉">
                              <div class="iconBox">
                                <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"> </span>
                              </div>
                            </a>
                            <span class="ddabongCnt">
                                    4
                                </span>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </li>
                <!-- end of content1 -->


                <li class="timeline_li" onMouseOver="this.style.backgroundColor='#f5f8fa';" onMouseOut="this.style.backgroundColor='#fff'">
                  <div class="tl_text">
                    <div class="content" style="margin-left:58px;">
                      <div class="content_header" style="display: flex;">
                        <a href="#" style="margin-right:5px;">
                           <img class="content_img" src="../img/circle.gif" />
                           <span class="nameGroup">
                             <strong class="uid">박호균</strong>
                           </span>
                           <span class="uname">
                              <b style="font-weight: normal">purplecow</b>
                           </span>
                         </a>
                        <small class="time" data-toggle="tooltip" data-placement="top" title="오전 4:49 - 2017년 11월 24일">
                            · 11월 24일
                         </small>
                      </div>
                      <!-- End of content_header -->
                      <div>
                        <p class="text_box">
                          그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!!! 그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!! 그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!! 그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!! 그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!! 그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!!그림판 켜고
                          블로그 켜라!!
                        </p>
                      </div>
                      <div class="content_footer">
                        <div class="button_list">
                          <div class="reply_btn">
                            <a href="#" class="btn2" data-toggle="tooltip" data-placement="top" title="댓글달기">
                              <div class="iconBox">
                                <span class="glyphicon glyphicon-comment" aria-hidden="true"> </span>
                              </div>
                            </a>
                          </div>
                          <div class="ddabong" style="min-width:26px; display: inline-block;">
                            <a href="#" class="btn2" data-toggle="tooltip" data-placement="top" title="따봉">
                              <div class="iconBox">
                                <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"> </span>
                              </div>
                            </a>
                            <span class="ddabongCnt">
                                    2
                                </span>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </li>
                <!-- end of content1 -->

                <li class="timeline_li" onMouseOver="this.style.backgroundColor='#f5f8fa';" onMouseOut="this.style.backgroundColor='#fff'">
                  <div class="tl_text">
                    <div class="content" style="margin-left:58px;">
                      <div class="content_header" style="display: flex;">
                        <a href="#" style="margin-right:5px;">
                           <img class="content_img" src="../img/circle.gif" />
                           <span class="nameGroup">
                             <strong class="uid">박호균</strong>
                           </span>
                           <span class="uname">
                              <b style="font-weight: normal">purplecow</b>
                           </span>
                         </a>
                        <small class="time" data-toggle="tooltip" data-placement="top" title="오전 4:49 - 2017년 11월 24일">
                            · 11월 24일
                         </small>
                      </div>
                      <!-- End of content_header -->
                      <div>
                        <p class="text_box">
                          그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!!! 그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!! 그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!! 그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!! 그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!! 그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!!그림판 켜고
                          블로그 켜라!!
                        </p>
                      </div>
                      <div class="content_footer">
                        <div class="button_list">
                          <div class="reply_btn">
                            <a href="#" class="btn2" data-toggle="tooltip" data-placement="top" title="댓글달기">
                              <div class="iconBox">
                                <span class="glyphicon glyphicon-comment" aria-hidden="true"> </span>
                              </div>
                            </a>
                          </div>
                          <div class="ddabong" style="min-width:26px; display: inline-block;">
                            <a href="#" class="btn2" data-toggle="tooltip" data-placement="top" title="따봉">
                              <div class="iconBox">
                                <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"> </span>
                              </div>
                            </a>
                            <span class="ddabongCnt">
                                    0
                                </span>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </li>
                <!-- end of content1 -->

                <li class="timeline_li" onMouseOver="this.style.backgroundColor='#f5f8fa';" onMouseOut="this.style.backgroundColor='#fff'">
                  <div class="tl_text">
                    <div class="content" style="margin-left:58px;">
                      <div class="content_header" style="display: flex;">
                        <a href="#" style="margin-right:5px;">
                           <img class="content_img" src="../img/circle.gif" />
                           <span class="nameGroup">
                             <strong class="uid">박호균</strong>
                           </span>
                           <span class="uname">
                              <b style="font-weight: normal">purplecow</b>
                           </span>
                         </a>
                        <small class="time" data-toggle="tooltip" data-placement="top" title="오전 4:49 - 2017년 11월 24일">
                            · 11월 24일
                         </small>
                      </div>
                      <!-- End of content_header -->
                      <div>
                        <p class="text_box">
                          그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!!! 그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!! 그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!! 그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!! 그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!! 그림판 켜고 블로그 켜라!!그림판 켜고 블로그 켜라!!그림판 켜고
                          블로그 켜라!!
                        </p>
                      </div>
                      <div class="imgBoxContainer">
                        <div class="imgBox">
                          <div class="soleImg">
                            <div class="imgInnerContainer">
                              <img src="../img/f029.png" style="width:100%; height:100%" />
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="content_footer">
                        <div class="button_list">
                          <div class="reply_btn">
                            <a href="#" class="btn2" data-toggle="tooltip" data-placement="top" title="댓글달기">
                              <div class="iconBox">
                                <span class="glyphicon glyphicon-comment" aria-hidden="true"> </span>
                              </div>
                            </a>
                          </div>
                          <div class="ddabong" style="min-width:26px; display: inline-block;">
                            <a href="#" class="btn2" data-toggle="tooltip" data-placement="top" title="따봉">
                              <div class="iconBox">
                                <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"> </span>
                              </div>
                            </a>
                            <span class="ddabongCnt">
                                  5
                                </span>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </li>
                <!-- end of content1 -->

              </ol>
            </div>
            <nav>
              <ul class="pager" style="margin-top:30px;">
                <li class="previous" style="font-weight:bold;"><a href="#"><span aria-hidden="true">&larr;</span>&nbsp;이전 페이지</a></li>
                <li class="next" style="font-weight:bold;"><a href="#">다음 페이지 <span aria-hidden="true">&rarr;</span></a></li>
              </ul>
            </nav>
          </div>
        </div>
        <div class="content_bottom"> </div>
      </div>
    </div>
  </div>

  <footer class="footer" style="border-bottom: #3c98d4 2px solid;">
    <div class="container" style="position:relative;">
      <ul class="bottom_ul">
        <li style="text-align:center; float: left; position: relative;">
          <a href="#" class="MOVE_TOP_BTN">위로가기</a>
        </li>
      </ul>
    </div>
    </div>
  </footer>
  <footer class="footer" style="height:95px; margin-top: 0px; position: absolute;
        left: 0px; width: 100%; background: black; opacity: 0.7;">
    <div class="container">
      <div class="bottom_copyright">
        <p class="text-muted">
          Copyright OOOOO.com. All Right Reserved.</br>
          Contact us, OOOOOOO@google.com
        </p>
      </div>
    </div>
    </div>
  </footer>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <script src="../js/bootstrap.min.js"  '<c:url value="/common/js/bootstrap.min.js"/>'></script>
  <script>
    $('[data-toggle="tooltip"]').tooltip('toggle');
    $('[data-toggle="tooltip"]').tooltip('hide');
  </script>
</body>

</html>
