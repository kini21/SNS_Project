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
<title>mainContent</title>
<link href='<c:url value="/common/css/bootstrap.min.css"/>' rel="stylesheet">
<link href='<c:url value="/common/css/style.css"/>' rel="stylesheet" />
</head>
<body>

	<c:choose>
		<c:when test="${welcomeMsg eq true}">
			<div class="alert alert-success alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<strong>환영합니다!</strong> 회원가입이 완료되었습니다!
			</div>
		</c:when>
		<c:when test="${updateMsg eq true}">
			<div class="alert alert-success alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<strong>프로필</strong> 수정이 완료되었습니다!
			</div>
		</c:when>
		<c:when test="${updatePwMsg eq true}">
			<div class="alert alert-success alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<strong>비밀번호</strong> 변경이 완료되었습니다!
			</div>
		</c:when>
	</c:choose>

	<div class="main_content_wrap">
		<div class="main_contents">
			<div class="page-header" style="margin: 0px; padding-bottom: 0px;">
				<h4 style="font-weight: bold;">게시글</h4>
			</div>
			<div class="timeline">
				<ol class="timeline">

					<!-- 사용자의 게시물이 없는 경우. -->
					<c:if test="${empty postInfoList}">
						<li class="timeline_li" onMouseOver="this.style.backgroundColor='#f5f8fa';" onMouseOut="this.style.backgroundColor='#fff'">
							<div class="tl_text">
								<div class="content" style="margin-left: 58px;">

									<!-- 글 작정자 정보 영역 -->
									<div class="row">
										<div class="col-md-12">
											<div class="content_header" style="display: flex;">&nbsp;</div>
										</div>
									</div>

									<!-- 글 본문 영역 -->
									<div class="row">
										<div class="col-md-12" style="text-align: center;">
											<h5 style="font-weight: bold; color: #999">첫번째 게시물을 작성해보세요.</h5>
										</div>
									</div>
								</div>
							</div>
						</li>
					</c:if>

					<!-- 사용자의 게시물이 있는 경우. -->
					<c:if test="${not empty postInfoList}">
						<c:forEach items="${postInfoList}" var="postInfoList" varStatus="status">

							<li class="timeline_li" onMouseOver="this.style.backgroundColor='#f5f8fa';" onMouseOut="this.style.backgroundColor='#fff'">
								<div class="tl_text">
									<div class="content" style="margin-left: 58px;">

										<!-- 글 작정자 정보 영역 -->
										<div class="row">
											<div class="col-md-12">
												<div class="content_header" style="display: flex;">
												<div style="width:95%;">
													<a href="#" style="margin-right: 5px;">
													
													<!-- 사용자 프로필 이미지 -->
														<img class="content_img" src="<c:url value='/common/img/circle.gif' />" />
													
													<!-- 사용자 닉네임 -->
														<span class="nameGroup">
															<strong class="uid">${postInfoList.nick}</strong>
														</span>
														
													<!-- 사용자 아이디 -->
														<span class="uname">
															<b style="font-weight: normal">${postInfoList.loginid}</b>
														</span>
													</a>
													
													<!-- 작성일 -->
													<small class="time" data-toggle="tooltip" data-placement="top" title="${postInfoList.datetime}">
														· ${postInfoList.date}
													</small>
													
												</div>
													
													<!-- 수정 & 삭제 -->
													<c:if test="${sessionScope.user.loginid eq postInfoList.loginid}">
														<div class="dropdown">
															<span class="dropdown-toggle" id="writeAndDel" data-toggle="dropdown" aria-expanded="true">
																&nbsp;
																<span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
																<span class="caret"></span>
															</span>
															<ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="writeAndDel">
																<li role="presentation">
																	<a role="menuitem" tabindex="-1" href="<c:url value="/post/contentUpdate.do?pid=${postInfoList.pid}" />">수정</a>
																</li>
																<li role="presentation">
																	<a role="menuitem" tabindex="-1" href="#" onclick="javascript:postDelete(${postInfoList.pid});">삭제</a>
																</li>
															</ul>
														</div>
													</c:if>
												</div>
											</div>
										</div>
										<!-- End of content_header -->

										<!-- 글 본문 영역 -->
										<div class="row">
											<div class="col-md-12">

												<!-- 모달 선택 영역 -->
												<a href="#" style="color: #000;">
													<div class="iconBox" data-toggle="modal" data-backdrop="static" data-keyboard="false" data-target="#mainModal${postInfoList.pid}">

														<!-- 본문 글 영역 -->
														<div>
															<p class="text_box">${postInfoList.contents}</p>
														</div>

														<!-- 본문 이미지 영역 -->
														<c:if test="${not empty postInfoList.mainImage}">
															<div class="imgBoxContainer">
																<c:forEach items="${postInfoList.mainImage}" var="mainImage" varStatus="status2">
																	<c:if test="${status2.count lt 4}">
																		<div class="imgBox">
																			<img src="<c:url value='${mainImage.image}' />" style="width: 100%; height: 100%" />
																		</div>
																	</c:if>
																	<c:if test="${status2.count eq 4}">
																		<div class="imgBox">
																			<p>...</p>
																		</div>
																	</c:if>
																</c:forEach>
															</div>
														</c:if>
														
													</div>
												</a>

												<!-- 글 본문 모달 -->
												<div class="modal fade" id="mainModal${postInfoList.pid}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header" style="background-color: #83abc6; border-radius: 6px 6px 0 0;">
																<button type="button" class="close" data-dismiss="modal" aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
																<h4 class="modal-title" id="replyLabel" style="color: #fff;">세부 페이지</h4>
															</div>

															<form id="reply-form" action="#" method="post" role="form">
																<div class="modal-body">

																	<!-- 모달 글 영역-->
																	<div class="row">
																		<div class="content_header" style="display: flex;">
																			<!-- 사용자 프로필 이미지 -->
																			<img class="reply_content_img" src="<c:url value='/common/img/circle.gif' />" />

																			<!-- 사용자 닉네임 -->
																			<span class="reply_nameGroup">
																				<a href="#">
																					<strong class="uid">${postInfoList.nick}</strong>
																				</a>
																			</span>

																			<!-- 사용자 아이디 -->
																			<span class="reply_uname">
																				<b>${postInfoList.loginid}</b>
																			</span>

																			<!-- 작성일 -->
																			<small class="reply_time" data-toggle="tooltip" data-placement="top" title="${postInfoList.datetime}">
																			 · ${postInfoList.date}
																			</small>
																		</div>
																		<div class="reply_text_box">
																			<p>${postInfoList.contents}</p>
																		</div>

																		<!-- 세부페이지 모달 이미지 영역 -->
																		<div class="row" style="width: 100%; margin: auto;">
																		<c:if test="${empty postInfoList.firstImage and empty postInfoList.detailImage}">
																			&nbsp;
																		</c:if>
																		<c:if test="${not empty postInfoList.firstImage or not empty postInfoList.detailImage}">
																			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="width: 100%; margin-top: 50px;">

																				<!-- Wrapper for slides -->
																				<div class="carousel-inner" role="listbox">
																					
																						<c:forEach items="${postInfoList.firstImage}" var="firstImage" varStatus="status">

																							<div class="item active">
																								<img src="<c:url value='${firstImage.image}' />" alt="">
																								<div class="carousel-caption"></div>
																							</div>
																						</c:forEach>
																					
																					
																						<c:forEach items="${postInfoList.detailImage}" var="detailImage" varStatus="status">
																							<div class="item">
																								<img src="<c:url value='${detailImage.image}' />" alt="">
																								<div class="carousel-caption"></div>
																							</div>
																						</c:forEach>
																					
																				</div>
																				<c:if test="${not empty postInfoList.detailImage}">
																					<!-- Controls -->
																					<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
																						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
																						<span class="sr-only">Previous</span>
																					</a>
																					<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
																						<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
																						<span class="sr-only">Next</span>
																					</a>
																				</c:if>
																			</div>
																			</c:if>
																		</div>
																	</div>
																	
																	<!-- 댓글 & 따봉 수 표시 영역 -->
																	<div class="row" style="margin-top:30px;">
																		<div class="content_footer" style="width:100%; margin-left:15px;">
																			<!-- 댓글 버튼 영역 -->
																			<div class="reply" style="width: 12%; float:left;">
																				<a class="markers" style="font-size: 16px;">
																					<span class="glyphicon glyphicon-comment" aria-hidden="true"></span>
																				</a>
																				<a class="infoCnt" style="font-weight: bold; font-size: 14px;">&nbsp;${postInfoList.replyCount}</a>
																			</div>
																			
																			<!-- 따봉 버튼 영역 -->
																			<div class="ddabong" style="width: 10%; float:left;">
																				<a class="markers" style="font-size: 16px;">
																					<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
																				</a>
																				<a class="infoCnt" style="font-weight: bold; font-size: 14px;">&nbsp;9452</a>
																			</div>
																		</div>
																	</div>

																	<!-- 세부페이지 댓글 확인 영역(설정 안됨) -->
																	<div class="row">
																		<div class="col-md-11">
																			<c:if test="${not empty postInfoList.replyInfo}">
																				<br/>
																				<table class="table">
																				
																					<c:forEach items="${postInfoList.replyInfo}" var="replyInfo" varStatus="status">
																						<tr>
																							<td style="width: 10%;">${replyInfo.nick}</td>
																							<td style="width: 90%;">
																							
																								<c:if test="${not empty replyInfo.contents}">
																									<div class="col-md-9">
																										${replyInfo.contents}
																									</div>
																								</c:if>
																								
																								<div class="col-md-3" style="float:right; vertical-align:right;">
																									<a href="#"><span>수정</span></a>
																									&nbsp;|&nbsp;
																									<a href="javascript:deleteReply(${replyInfo.rid})"><span>삭제</span></a>
																								</div>
																								
																								<c:if test="${not empty replyInfo.image}">
																									<br/>
																									<div style="width:250px; height:200px;">
																										<img src="<c:url value='${replyInfo.image}' />" style="width: 100%; height: 100%" alt=""/>
																									</div>
																								</c:if>
																								
																								
																								
																							</td>
																						</tr>
																					</c:forEach>
																					
																				</table>
																			</c:if>
																		</div>
																	</div>

																	<!-- 세부페이지 댓글 텍스트 영역 -->
																	<div class="row">
																		<div class="reply-row-textArea">
																			<textarea rows="44" id="reply_status" class="writeTextArea"></textarea>
																		</div>
																	</div>
																</div>
																<div class="modal-footer">
																	<div>
																		<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="top"
																		title="사진 또는 동영상 추가하기" style="float: left;" onclick="javascript:fileReplyChoose();">
																			<span class="glyphicon glyphicon-picture"></span>
																		</button>
																	
																		<input type="file" id="reply_uploadFiles" style="display: none"/>
								
																		<div class="col-md-8">
																			<div class="file_reply_wrap" style="float: left; height: auto; width:100%;">
																				<span id="label_file"></span>
																			</div>
																		</div>
																	</div>
																	
																	<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
																	<button type="button" class="btn btn-primary" onclick="javascript:writeReply(${postInfoList.pid})">저장</button>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>

										<!-- 댓글 & 따봉 영역(설정 안됨, db post에 good 필드 추가) -->
										<div class="row" style="margin-botton: 30px;">
											<br/>
											<div class="col-md-12">
								
												<div class="content_footer" style="width:100%">
													<!-- 댓글 버튼 영역 -->
													<div class="reply" style="width: 12%; float:left;">
														<a class="markers" style="font-size: 16px;">
															<span class="glyphicon glyphicon-comment" aria-hidden="true"></span>
														</a>
														<a class="infoCnt" style="font-weight: bold; font-size: 14px;">&nbsp;${postInfoList.replyCount}</a>
													</div>
													
													<!-- 따봉 버튼 영역 -->
													<div class="ddabong" style="width: 10%; float:left;">
														<a class="markers" style="font-size: 16px;">
															<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
														</a>
														<a class="infoCnt" style="font-weight: bold; font-size: 14px;">&nbsp;9452</a>
														
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</li>
						</c:forEach>
					</c:if>
					<!-- end of content -->

				</ol>
			</div>

		</div>
	</div>

	<div class="content_bottom"></div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src='<c:url value="/common/js/bootstrap.min.js"/>'></script>
	
	<script src="<c:url value='/common/js/fileView.js' />"></script>
	<script>
	
		$('[data-toggle="tooltip"]').tooltip('toggle');
		$('[data-toggle="tooltip"]').tooltip('hide');
		
		$(document).ready(function() {
			$("#reply_uploadFiles").on("change", findReplyFileName);
		});
	</script>
	
	<script src='<c:url value="https://code.jquery.com/jquery-1.10.2.js"/>'></script>
	<!-- ajax javascript -->
	<script>
		function postDelete(pid) {
			event.preventDefault();
			
			if (confirm("정말 삭제하시겠습니까??") == true){    //확인
				var param = JSON.stringify({
					"pid" : pid
				});
	
				$.ajax({
					contentType : "application/json;charset=UTF-8",
					url : "<c:url value='/post/postDelete.do' />",
					method : "POST",
					dataType : "JSON",
					data : param,
					success : function() {
	
						alert("삭제되었습니다.");
						
						window.location.href="<c:url value='/user/index.do' />";
						
					},// success end
					error : function() {
						alert("에러!!!");
					}
				});// end ajax
			} else {   //취소
			    return;
			}
			
			
		}
		
		function writeReply(pid) {
			event.preventDefault();
			
			var formData = new FormData();
			formData.append("reply_status", $('#reply_status').val());
			formData.append("pid", pid);

			var fileInput = document.getElementById("reply_uploadFiles"); //id로 파일 태그를 호출

			var files = fileInput.files; //업로드한 파일들의 정보를 넣는다.

			for (var i = 0; i < files.length; i++) {
				formData.append('file-' + i, files[i]); //업로드한 파일을 하나하나 읽어서 FormData 안에 넣는다.
			}

			util.ajaxFileAction("<c:url value='/reply/writeReply.do' />", formData, result);
		}
		
		function deleteReply(rid) {
			event.preventDefault();

			if (confirm("정말 삭제하시겠습니까??") == true){    //확인
				var param = JSON.stringify({
					"rid" : rid
				});
			
				$.ajax({
					contentType : "application/json;charset=UTF-8",
					url : "<c:url value='/reply/replyDelete.do' />",
					method : "POST",
					dataType : "JSON",
					data : param,
					success : result,// success end
					error : function() {
						alert("에러!!!");
					}
				});// end ajax
			} else {   //취소
			    return;
			}
		}

		function result(data) {
			if (data.success) {
				window.location.href="<c:url value='/user/index.do' />";
				/* window.location.reload(); */
			}
		}
	</script>
</body>
</html>