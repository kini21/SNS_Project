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
<link href='<c:url value="/common/css/bootstrap.min.css"/>'rel="stylesheet">
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
	<c:when test="${updateCompleteMsg eq true}">
		<div class="alert alert-success alert-dismissible" role="alert">
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			<strong>프로필</strong> 수정이 완료되었습니다!
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
										</div>
									</div>
									<!-- End of content_header -->

									<!-- 글 본문 영역 -->
									<div class="row">
										<div class="col-md-12">
										
											<!-- 모달 선택 영역 -->
											<a href="#" style="color: #000;">
												<div class="iconBox" data-toggle="modal" data-target="#subModal">
												
													<!-- 본문 글 영역 -->
													<div>
														<p class="text_box">${postInfoList.contents}</p>
													</div>
													
													<!-- 본문 이미지 영역 -->									
													<div class="imgBoxContainer">
														<c:forEach items="${postInfoList.imageList}" var="imageList" varStatus="status2">
															<div class="imgBox">	
																<img src="<c:url value='${imageList.image}' />" style="width: 100%; height: 100%" />
															</div>
														</c:forEach>
													</div>
													
												</div>
											</a>
											
											<!-- 글 본문 모달 -->
											<div class="modal fade" id="subModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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

																	<!-- 세부페이지 모달 이미지 영역(설정 안됨) -->
																	<div class="row">
																		<div class="col-md-11" style="margin-left: 58px;">
																			<div class="imgBoxContainer">
																				<div class="imgBox">
																					<div class="soleImg">
																						<div class="imgInnerContainer">
																							<img src="<c:url value='/common/img/f029.png' />" style="width: 100%; height: 100%" />
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>

																<!-- 세부페이지 댓글 확인 영역(설정 안됨) -->
																<div class="row">
																	<div class="col-md-11">
																		<table class="table">
																			<tr>
																				<td style="width: 10%;">김준기</td>
																				<td style="width: 90%;">...................</td>
																			</tr>
																			<tr>
																				<td style="width: 10%;">김준기</td>
																				<td style="width: 90%;">...................</td>
																			</tr>
																			<tr>
																				<td style="width: 10%;">김준기</td>
																				<td style="width: 90%;">...................</td>
																			</tr>
																		</table>
																	</div>
																</div>
																
																<!-- 세부페이지 댓글 텍스트 영역(설정 안됨) -->
																<div class="row">
																	<div class="reply-row-textArea">
																		<textarea rows="44" name="status" class="writeTextArea"></textarea>
																	</div>
																</div>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="사진 또는 동영상 추가하기" style="float: left;">
																	<span class="glyphicon glyphicon-picture"></span>
																</button>
																<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
																<button type="button" class="btn btn-primary">저장</button>
															</div>
														</form>
													</div>
												</div>
											</div>
										</div>
									</div>

									<!-- 댓글달기 & 따봉 영역(설정 안됨, db post에 good 필드 추가) -->
									<div class="row">
										<div class="col-md-12">

											<!-- 댓글달기 버튼 영역 -->
											<div class="content_footer">
												<div class="button_list">
														<div class="reply_btn">
														<a href="#" class="btn2" data-toggle="tooltip" data-placement="top" title="댓글달기">
															<div class="iconBox" data-toggle="modal" data-target="#replyModal">
																<span class="glyphicon glyphicon-comment" aria-hidden="true"></span>
															</div>
														</a>
													</div>

													<!-- 댓글달기 모달 -->
													<div class="modal fade" id="replyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
														<div class="modal-dialog">
															<div class="modal-content">
																<div class="modal-header" style="background-color: #83abc6; border-radius: 6px 6px 0 0;">
																	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
																		<span aria-hidden="true">&times;</span>
																	</button>
																	<h4 class="modal-title" id="replyLabel" style="color: #fff;">댓글 쓰기</h4>
																</div>
																<form id="reply-form" action="#" method="post" role="form">
																	<div class="modal-body">
																		<div class="row" style="height: 70px;">

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
																			
																			<!-- 게시물 본문 영역 -->
																			<div class="reply_text_box">
																				<p>${postInfoList.contents}</p>
																			</div>
																			
																		</div>
																		
																		<!-- 댓글 작성 영역 -->
																		<div class="row">
																			<div class="reply-row-textArea">
																				<textarea rows="44" name="status" class="writeTextArea"></textarea>
																			</div>
																		</div>
																	</div>
																	<div class="modal-footer">
																		<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="top" title="사진 또는 동영상 추가하기" style="float: left;">
																			<span class="glyphicon glyphicon-picture"></span>
																		</button>
																		<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
																		<button type="button" class="btn btn-primary">저장</button>
																	</div>
																</form>
															</div>
														</div>
													</div>

													<!-- 따봉 버튼 영역 -->
													<div class="ddabong" style="min-width: 26px; display: inline-block; margin-top: 4px;">
														<a href="#" class="btn2" data-toggle="tooltip" data-placement="top" title="따봉">
															<div class="iconBox">
																<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
															</div>
														</a>
													<span class="ddabongCnt"> 9452 </span>
												</div>
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
		<nav>
			<ul class="pager" style="margin-top: 30px;">
				<li class="previous" style="font-weight: bold;"><a href="#"><span aria-hidden="true">&larr;</span>&nbsp;이전 페이지</a></li>
				<li class="next" style="font-weight: bold;"><a href="#">다음 페이지 <span aria-hidden="true">&rarr;</span></a></li>
			</ul>
		</nav>
	</div>
</div>

<div class="content_bottom"></div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src='<c:url value="/common/js/bootstrap.min.js"/>'></script>
	<script>
		$('[data-toggle="tooltip"]').tooltip('toggle');
		$('[data-toggle="tooltip"]').tooltip('hide');
	</script>
</body>
</html>