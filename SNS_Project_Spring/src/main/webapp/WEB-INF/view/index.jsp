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
  
  <jsp:include page="navbar.jsp" flush="false"/>	 
  

  <div class="container">
    <div class="row">
      <div class="col-md-3">
      	<jsp:include page="sidebar.jsp" flush="false"/>
      </div>
      <div class="col-md-9">
      	<jsp:include page="mainContent.jsp" flush="false"/>
      </div>
    </div>
  </div>

  <jsp:include page="footer.jsp" flush="false"/>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <script src='<c:url value="/common/js/bootstrap.min.js"/>'></script>
  <script>
    $('[data-toggle="tooltip"]').tooltip('toggle');
    $('[data-toggle="tooltip"]').tooltip('hide');
  </script>
</body>

</html>
