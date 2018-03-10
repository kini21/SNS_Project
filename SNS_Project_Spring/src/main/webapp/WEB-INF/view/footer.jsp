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
	<title>footer</title>
	<link href='<c:url value="/common/css/bootstrap.min.css"/>' rel="stylesheet">
    <link href='<c:url value="/common/css/style.css"/>' rel="stylesheet" />
</head>
<body>

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
<script src='<c:url value="/common/js/bootstrap.min.js"/>'></script>

  <script>
    $('[data-toggle="tooltip"]').tooltip('toggle');
    $('[data-toggle="tooltip"]').tooltip('hide');
  </script>
</body>
</html>