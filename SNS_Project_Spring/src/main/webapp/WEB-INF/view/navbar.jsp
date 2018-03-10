<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page session="true"%>

<html lang="ko">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>navbar</title>
<link href='<c:url value="/common/css/bootstrap.min.css"/>' rel="stylesheet">
<link href='<c:url value="/common/css/style.css"/>' rel="stylesheet" />
<script src='<c:url value="https://code.jquery.com/jquery-1.10.2.js"/>'></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="<c:url value='/common/js/listajax.js' />"></script>

</head>
<script type="text/javascript">
	$(document).ready(function() {
		$('#search_submit').bind("click", function() {

			var searchKeyword = $("#searchKeyword").val();

			if (searchKeyword === "") {
				alert("검색어를 입력해주세요.")
				return false;
			} else {
				follow_search();
			}
		});
		
		$(".chkbox-all").click(function() {
			$(".chkbox").prop("checked", this.checked);
		});
		
		$("#msglist").click(function() {
			$('#msgTable > tbody:last').empty();
			$('ul.nav-tabs a[href="#msgTabs-1"]').trigger("click");
			$('#senderAndreceive').attr('data-del','receive');
			receiveMsg(1);
		});
		
		$('ul.nav-tabs a[href="#msgTabs-1"]').click(function (e) {
			  e.preventDefault()
			  $(this).tab('show')
			  $('#msgTable > tbody:last').empty();
			  $('#senderAndreceive').text("보낸 사람(ID)");
			  $('#senderAndreceive').attr('data-del','receive');
			  receiveMsg(1);
			  		  
			});
		
		$('ul.nav-tabs a[href="#msgTabs-2"]').click(function (e) {
			  e.preventDefault()
			  $(this).tab('show')
			  $('#senderAndreceive').text("받는 사람(ID)");
			  $('#msgTable > tbody:last').empty();
			  $('#senderAndreceive').attr('data-del','send');
			  sendMsg(1);
			});
		
		
		$(".pagination").on("click", "li a", function(event){		
			event.preventDefault();

			pageNum = $(this).attr("href");
			if($('#senderAndreceive').attr('data-del') == 'receive') {
				receiveMsg(pageNum);
			} else {
				sendMsg(pageNum);
			}
		});
		
		$("#sendMessage").click(function() {
			if($('#sendLoginid').val() === ""){
				alert("받는사람(ID)을 입력하세요.");
				return; 
			} else if ($('#contents').val() === ""){
				alert("보내실 쪽지 내용을 입력해주세요.");
			} else if ($('#contents').val().length > 300){
				alert("쪽지는 공백 포함 300자 미만으로 입력해주세요.");
			} else {
				writeMsg();
				history.go(0);
			}
		});
		
		$('#delete').on("click", function() {
			inputObjArr = document.getElementsByTagName("input"); // input 시작태그 객체들
			cnt = 0;
			for (i = 0; i < inputObjArr.length; i++) {
				if (inputObjArr[i].getAttribute("type") == "checkbox" && inputObjArr[i].checked == true
					&& inputObjArr[i].value != "on" && $('#senderAndreceive').attr('data-del') == 'receive') { // 체크박스만
					
				    $.post('<c:url value="/message/deleteMsg.do" />', {"mid": inputObjArr[i].value, "from_del":"Y"} , function(data){});
					cnt++;
					
				} else if(inputObjArr[i].getAttribute("type") == "checkbox" && inputObjArr[i].checked == true
						&& inputObjArr[i].value != "on" && $('#senderAndreceive').attr('data-del') == 'send'){
										
					$.post('<c:url value="/message/deleteMsg.do" />', {"mid": inputObjArr[i].value, "to_del":"Y"} , function(data){});
					cnt++;
				}
			}
			if(cnt > 0){
				alert(cnt + "개의 쪽지가 삭제 되었습니다.");
				history.go(0);
			}else{
				alert("삭제하실 쪽지를 선택하세요.");
			}
		});

	});
</script>
<script>
	function receiveMsg(pageNum){
		var param =  { "to_uid" : "${user.uid}", 
				       "pageNum" : pageNum
					};	
		u.doAjaxGet("<c:url value='/message/receiveAndSend.do' />", param, msgList);
	}
	
	function sendMsg(pageNum){
		var param =  { 
				"from_uid" : "${user.uid}",
				"pageNum" : pageNum
				 };	
		u.doAjaxGet("<c:url value='/message/receiveAndSend.do' />", param, msgList);
	}
	
	function writeMsg(){
		var param =  { 
				"from_uid" : "${user.uid}",
				"loginid" : $("#sendLoginid").val(),
				"contents" : $("#contents").val()
				};	
		u.doAjaxPost("<c:url value='/message/sendMsg.do' />", param, writeMsgsucc);
	}
	
	function writeMsgsucc(){
		alert($("#sendLoginid").val() + "님에게 쪽지를 보냈습니다.")
	}
	
	function writeMsgError(){
		alert("존재하지 않는 아이디이거나 잘못 입력한 아이디입니다.")
	}
	
	function msgList(data){
		var html = "";
			
		$(data.msgLists).each(function(){
		  html += "<tr>";
		  html += "<td style='text-align: center;'><input type='checkbox' class='chkbox' aria-label='...' value=\"" + this.mid + "\"></td>";
		  html += "<td style='text-align: center;'>" + this.receiverAndSender + "</td>";
		  html += "<td style='text-align: center;'><a class='readmsg' onclick=\'readMsg(\"" + this.mid + "\")\'  data-backdrop='static' data-keyboard='false' data-toggle='modal' href='#messageModal' style='outline: none;'>"	
		  				+ this.contents + 
		  		  "</a></td>";
		  html += "<td style='text-align: center;'>" + this.mdate + "</td>";
		  html += "</tr>";	
		});
		
		$('#msgTable > tbody:last').empty();
		$('#msgTable > tbody:last').append(html);
		
		printPaging(data.pageMaker);
	}
	
	function printPaging(pageMaker){
		
		var html="";
		
		if(pageMaker.prev){
			html += "<li><a href'"+(pageMaker.startPage-1)+"' aria-label='Previous'><span aria-hidden='true'>«</span></a></li>";
		}
		
		for(var i=pageMaker.startPage, len = pageMaker.endPage; i <= len; i++){
			var htmlclass = pageMaker.cri.page == i ? 'class=active' : '';
			html +="<li " +htmlclass+"><a href='"+i+"'>"+i+"</a></li>";
		}
		
		if(pageMaker.next){
			html += "<li><a href='"+(pageMaker.endPage + 1)+"' aria-label='Next'><span aria-hidden='true'> » </span></a></li>";
		}
		
		$('.pagination').html(html);
	}

	function readMsg(remid){
		var mid = remid;
		var addr = "<c:url value='/message/readMsg.do' />";
		
		$.ajax({
			url : addr,
			type : "get",
			data : {
   				"mid" : mid
   			},
			success: function(data){
				var readMsg = data.readMsg;
				$('#sender').html(readMsg.sender);
				$('#receiver').html(readMsg.receiver);
				$('#msgDate').html(readMsg.mdate);
				$('#msgArea').html(readMsg.contents);
			}
	 });
	}
</script>
<script>
	function follow_search() {
		event.preventDefault();

		var addr = "<c:url value='/user/getUserList.do' />";
		var id = '${user.loginid}';
		
		$.ajax({
			url : addr,
			type : "get",
			data : {
				"searchKeyword" : $("#searchKeyword").val()
			},
			success : function(responseData) {

				var html = '';

				$("#ajax").remove();
				$(responseData.userlist).each(function() {
					
				  if(id == this.loginid){
					    html += '<tr style="cursor:pointer" onclick=\"otherUserTimeline() \">';
						html += '<td>' + this.nick + '</td>';
						html += '<td>' + this.loginid + '</td>';
						html += '<td>나</td>';
						html += '</tr>';
				  }	else{ 
					html += '<tr style="cursor:pointer" onclick=\"otherUserTimeline(\'' + this.uid + '\')\">';
					html += '<td>' + this.nick + '</td>';
					html += '<td>' + this.loginid + '</td>';
					html += '<td>언팔로우</td>';
					html += '</tr>';
				 } 
					$('#userListTable > tbody:last').empty();
					$('#userListTable > tbody:last').append(html);
				});// end each
			}// end
		});// end ajax		
	}
</script>
<script>
function otherUserTimeline(uid){
	if(uid > 0){
		window.location.href= '<c:url value="/follow/getOtherUser.do" />?uid=' + uid;
	} else {
		window.location.href= '<c:url value="/user/index.do" />';
	}
	
}

</script>

<!-- file choose -->
<script src='<c:url value="/common/js/bootstrap.min.js"/>'></script>
<script src="<c:url value='/common/js/fileView.js' />"></script>

<script>
	$('[data-toggle="tooltip"]').tooltip('toggle');
	$('[data-toggle="tooltip"]').tooltip('hide');

	$(document).ready(function() {
		$("#uploadFiles").on("change", findFileName);
	});
</script>

<script src='<c:url value="https://code.jquery.com/jquery-1.10.2.js"/>'></script>
<script src="<c:url value='/common/js/ajax.js' />"></script>
<!-- ajax javascript -->

<script>
	function writePost() {
		var formData = new FormData();
		formData.append("status", $('#status').val());

		var fileInput = document.getElementById("uploadFiles"); //id로 파일 태그를 호출

		var files = fileInput.files; //업로드한 파일들의 정보를 넣는다.

		for (var i = 0; i < files.length; i++) {
			formData.append('file-' + i, files[i]); //업로드한 파일을 하나하나 읽어서 FormData 안에 넣는다.
		}

		util.ajaxFileAction("<c:url value='/post/writePost.do' />", formData, result);
	}

	function result(data) {
		if (data.success) {
			window.location.href="<c:url value='/user/index.do' />";
			/* window.location.reload(); */
		}
	}
</script>

<body>

	<nav class="navbar navbar-default navbar-fixed-top" style="background-color: #83abc6;">
		<div class="container center-block">

			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="<c:url value='/user/index.do' />">BLUECOCO</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li>
						<a href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-weight: bold; color: white; text-shadow: 1px 1px 1px grey;">
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
										<img class="nav_content_img"
											src='<c:url value="/common/img/circle.gif" />' />
										<div class="nav_text">
											<div class="nav_text_box1">
												<div class="text_count">
													<span><strong>사용자</strong>님이 <strong>장소</strong>에
														게시글을 올렸습니다.</span>
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
										<img class="nav_content_img"
											src='<c:url value="/common/img/circle.gif" />' />
										<div class="nav_text">
											<div class="nav_text_box1">
												<div class="text_count">
													<span><strong>사용자</strong>님이 <strong>장소</strong>에
														게시글을 올렸습니다.</span>
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
						<a href="#listModal" id="msglist" data-backdrop="static" data-keyboard="false" data-toggle="modal" style="font-weight: bold; color: white; text-shadow: 1px 1px 1px grey; outline: none;">
							<span class="glyphicon glyphicon-envelope"></span>&nbsp;쪽지 <span class="badge">50</span>
						</a>

						<div class="modal fade bs-example-modal-lg" id="listModal" style="display: none; z-index: 1050;" aria-hidden="true">
							<div class="modal-dialog modal-lg">
								<div class="modal-content" id="tabs">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="outline: none;">
											<span aria-hidden="true">&times;</span>
										</button>
										
										<ul class="nav nav-tabs" role="tablist">
										  <li role="presentation" class="active"><a href="#msgTabs-1" aria-controls="msgTabs-1" role="tab">받은 쪽지함</a></li>
										  <li role="presentation"><a href="#msgTabs-2" aria-controls="msgTabs-2" role="tab">보낸 쪽지함</a></li>
										  <li role="presentation"><a href="#writeMsg" data-backdrop="static" data-keyboard="false" data-toggle="modal">쪽지 쓰기</a></li>
										</ul>
									</div>
								
								<div class="tab-content">	
								<div role="tabpanel" class="tab-pane active">
									<div class="modal-body">
										
										<div class="table-responsive">
										<table class="table" id="msgTable" width="100" style="table-layout:fixed;">
										  <thead>
											<tr>
												<th style="width: 10%; text-align: center;"><input type="checkbox" class="chkbox-all" aria-label="..."></th>
												<th style="width: 20%; text-align: center;" id="senderAndreceive"> </th>
												<th style="width: 50%; text-align: center;">내용</th>
												<th style="width: 20%; text-align: center;">날짜</th>
											</tr>
										  </thead>
										  <tbody>
										  
										  </tbody>	
											
										</table>
										</div> 

										<div class="text-Center" style="text-align: center;">
									      <ul class="pagination">
									        <!-- <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
									        <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
									        <li><a href="#">2</a></li>
									        <li><a href="#">3</a></li>
									        <li><a href="#">4</a></li>
									        <li><a href="#">5</a></li>
									        <li><a href="#">6</a></li>
									        <li><a href="#">7</a></li>
									        <li><a href="#">8</a></li>
									        <li><a href="#">9</a></li>
									        <li><a href="#">10</a></li>
									        <li><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li> -->
									     </ul>
									   	</div>
									   									   
									</div>
								</div>

								</div>
									
									<div class="modal-footer">
										<button type="button" id="delete" class="btn btn-primary" data-del="receive">쪽지 삭제</button>
										<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
									</div>
								</div>
							</div>
						</div>

						<div class="modal fade bs-example-modal-lg" id="messageModal" style="display: none; z-index: 1060;" aria-hidden="true">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="outline: none;">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title">쪽지</h4>
									</div>
									<div class="modal-body">

										<table class="table">									
											<tr>
												<td style="font-weight: bold;">보낸 사람(ID)</td>
												<td id="sender"></td>
												<td style="font-weight: bold;">받는 사람(ID)</td>
												<td id="receiver"></td>
												<td style="font-weight: bold;">작성일</td>
												<td id="msgDate"></td>
											</tr>
										  	
											<tr>
												<td colspan="6">
													<textarea id="msgArea" style="width: 100%; height: 400px" readonly="readonly">
													</textarea>
												</td>
											</tr>
										</table>

									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
									</div>
								</div>
							</div>
						</div>
						
						<div class="modal fade bs-example-modal-lg" id="writeMsg" style="display: none; z-index: 1060;" aria-hidden="true">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="outline: none;">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title">쪽지</h4>
									</div>
									<div class="modal-body">

										<table class="table">									
											<tr>
												<td style="font-weight: bold; padding-top: 14px;">받는 사람(ID)</td>
												<td><input type="text" name="loginid" id="sendLoginid" class="form-control" placeholder="받는 사람(ID) 입력" value=""></td>
											</tr>
										  	
											<tr>
												<td colspan="4">
													<textarea id="contents" name="contents" style="width: 100%; height: 400px" value=""></textarea>
												</td>
											</tr>
										</table>

									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-primary" id="sendMessage">보내기</button>
										<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
									</div>
								</div>
							</div>
						</div>					
						</li>

					<li>
						<a href="#" data-backdrop="static" data-keyboard="false" data-toggle="modal" data-target="#profileModal" style="font-weight: bold; color: white; text-shadow: 1px 1px 1px grey; outline: none;">
							<span class="glyphicon glyphicon-user"></span>&nbsp;프로필
						</a>
					
					<!-- Modal -->
						<div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="profileModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">

								<!-- profile view -->
								<div class="panel panel-profile">


									<!-- profile body -->
									<div class="panel-body">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										
										<div class="row">
											<div class="col-lg-12">

												<!-- profile form -->
												<form id="profile-form" action='<c:url value="/user/updateUser.do" />' method="post" role="form">
													<h2>프로필 수정</h2>

													<!-- insert id -->
													<div class="form-group">
														<label>아이디</label>
														<input type="text" name="loginid" id="loginid" tabindex="1" class="form-control" value="${user.loginid}" readonly>
													</div>

													<!-- insert password -->
													<div class="form-group">
														<label>비밀번호</label>
														<input type="password" name="password" id="password" tabindex="1" class="form-control" value="${user.password}">
													</div>

													<!-- insert email -->
													<div class="form-group">
														<label>이메일</label>
														<input type="text" name="email" id="email" tabindex="2" class="form-control" value="${user.email}">
													</div>

													<!-- insert nick -->
													<div class="form-group">
														<label>닉네임</label>
														<input type="text" name="nick" id="nick" tabindex="3" class="form-control" value="${user.nick}">
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



				<form class="navbar-form navbar-left" name="search_form" action='<c:url value="/user/getUserList.do" />' role="search">
					<div class="form-group">
						<label class="sr-only" for="form-control">팔로우 검색</label>
						<input type="text" name="searchKeyword" id="searchKeyword" class="form-control" placeholder="팔로우 검색">
					</div>
					<button type="button" id="search_submit" class="btn btn-default" data-backdrop="static" data-keyboard="false" data-toggle="modal" data-target="#followSearchModal">검색</button>
				</form>

				<!-- Modal -->
				<div class="modal fade" id="followSearchModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header" style="background-color: #83abc6; border-radius: 6px 6px 0 0;">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="writeLabel" style="color: #fff;">팔로우 검색 목록</h4>
							</div>

							<div class="modal-body">
								<table class="table table-hover" id="userListTable">

									<thead>
										<tr>
											<th>닉네임</th>
											<th>아이디</th>
											<th>팔로잉 여부</th>
										</tr>
									</thead>
									<tbody>
									
									</tbody>
								</table>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
							</div>

						</div>
					</div>
				</div>

				<ul class="nav navbar-nav navbar-right">
					<li>
						<a href="<c:url value='/user/logout.do' />" style="font-weight: bold; color: white; text-shadow: 1px 1px 1px grey;">
							<span class="glyphicon glyphicon-log-in"></span>&nbsp;로그아웃
						</a>
					</li>
				</ul>

				<!-- 글쓰기 영역 -->
				<form class="navbar-form navbar-right">
					<button type="button" class="btn btn-info" data-backdrop="static" data-keyboard="false" data-toggle="modal" data-target="#writeModal" style="font-weight: bold; outline: none;">
						글 쓰기
					</button>

					<!-- 게시글 쓰기 Modal -->
					<div class="modal fade" id="writeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">

								<!-- 게시글 쓰기 Modal header -->
								<div class="modal-header" style="background-color: #83abc6; border-radius: 6px 6px 0 0;">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="writeLabel" style="color: #fff;">게시글 쓰기</h4>
								</div>

								<!-- 게시글 쓰기 Model body -->
								<div class="modal-body">
									<!-- textarea 쓰기 영역 -->
									<textarea rows="44" id="status" name="status" class="writeTextArea"></textarea>
								</div>

								<!-- 게시글 쓰기 Model footer -->
								<div class="modal-footer">

									<!-- 첨부파일 영역 -->
									<div>
										<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="top"
											title="사진 또는 동영상 추가하기" style="float: left;" onclick="javascript:fileChoose();">
											<span class="glyphicon glyphicon-picture"></span>
										</button>
										<input type="file" id="uploadFiles" style="display: none" multiple />

										<div class="col-md-8">
											<div class="file_label_wrap" style="float: left; height: auto; width:100%;">
												<span id="label_file"></span>
											</div>
										</div>
									</div>

									<!-- 버튼 영역 -->
									<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
									<button type="button" class="btn btn-primary" onclick="javascript:writePost();">저장</button>
								</div>
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

</body>
</html>