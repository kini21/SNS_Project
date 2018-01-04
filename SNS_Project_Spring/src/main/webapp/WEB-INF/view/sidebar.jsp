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
	<title>sidebar</title>
	<link href='<c:url value="/common/css/bootstrap.min.css"/>' rel="stylesheet">
    <link href='<c:url value="/common/css/style.css"/>' rel="stylesheet" />
</head>
<body>
	
          <div class="sidebar">
          <div class="sidebarProfile">
            <a class="profileCardLink" href="#" aria-hidden="true"></a>
            <div class="profileCardContent">
              <a class="profileImgLink" href="#" title="nickname" aria-hidden="true">
                <img src='<c:url value="/common/img/circle.gif" />' alt="70x70" class="img-circle" width="70" height="70">
              </a>

              <div class="profileUseridAndNick">
                <div class="userid">
                  <a href="#" style="color: inherit!important;">${user.nick}</a>
                </div>
                <span class="userNick">
                  <a class="uN" href="#">@${user.loginid}</a>
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

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <script src='<c:url value="/common/js/bootstrap.min.js"/>'></script>
  <script>
    $('[data-toggle="tooltip"]').tooltip('toggle');
    $('[data-toggle="tooltip"]').tooltip('hide');
  </script>
</body>
</html>