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

<title>SNS Project</title>
<link href='<c:url value="/common/css/bootstrap.min.css"/>' rel="stylesheet">
<link href='<c:url value="/common/css/style.css"/>' rel="stylesheet" />

</head>

<body>

	<div class="container">
	
		<br /><br /><br /><br /><br />
		<!-- 게시글 수정 -->

		<div class="modal-dialog">
			<div class="modal-content">

				<!-- 게시글 수정  header -->
				<div class="modal-header"style="background-color: #83abc6; border-radius: 6px 6px 0 0;">
					<h4 class="modal-title" style="color: #fff;">게시글 수정</h4>
				</div>

				<!-- 게시글 수정 body -->
				<div class="modal-body">
					<!-- textarea 쓰기 영역 -->
					<textarea rows="44" id="status" name="status" class="writeTextArea">${post.contents}</textarea>
					<input type="hidden" id="pid" value="${post.pid}">
				</div>

				<!-- 게시글 수정 footer -->
				<div class="modal-footer">

					<!-- 첨부파일 영역 -->
					<div>
						<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="top"
							title="사진 또는 동영상 추가하기" style="float: left;" onclick="javascript:fileChoose();">
							<span class="glyphicon glyphicon-picture"></span>
						</button>
						<input type="file" id="uploadFiles" style="display: none" multiple />
						
						<c:if test="${not empty postfileList}">
							<div class="col-md-8">
							
								<div style="float: left; height: auto; width: 100%;">
									<c:forEach items="${postfileList}" var="file" varStatus="status">
										<a href="javascript:void(0);" onclick="deleteOldFileAction(${file.file_key})" id="old_id_${file.file_key}"  style="float:left; height:auto; width:50%;">
			                  				<span style="float:left"> &nbsp;· ${file.file_realname}</span>
			                  				<input type="hidden" id="file_key" value="${file.file_key}">
			                				</a>
		                 			</c:forEach>
								</div>
								
								<div class="file_label_wrap" style="float: left; height: auto; width: 100%;">
									<span id="label_file"></span>
								</div>
								
							</div>
						</c:if>
						
						<c:if test="${empty postfileList}">
							<div class="col-md-8">
								<div class="file_label_wrap" style="float: left; height: auto; width: 100%;">
									<span id="label_file"></span>
								</div>
							</div>
						</c:if>
					</div>

					<!-- 버튼 영역 -->
					<button type="button" class="btn btn-default" onclick="javascript:cancel();">취소</button>
					<button type="button" class="btn btn-primary" onclick="javascript:updatePost();">저장</button>
				</div>
			</div>

		</div>
		
		<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
		
	</div>

	<jsp:include page="footer.jsp" flush="false" />
	
	<script src="<c:url value='/common/js/fileView.js' />"></script>
	<!-- file choose -->
	
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
		function updatePost() {
			event.preventDefault();
			
			var formData = new FormData();
			formData.append("pid", $('#pid').val());
			formData.append("status", $('#status').val());
			
			/* 기존 파일 */
			$("input[id=file_key]").each(function(i) {
				formData.append("oldFile-"+i, $(this).val());
			});

			/* 새로 추가된 파일 */
			var fileInput = document.getElementById("uploadFiles"); //id로 파일 태그를 호출

			var files = fileInput.files; //업로드한 파일들의 정보를 넣는다.

			for (var i = 0; i < files.length; i++) {
				formData.append('file-' + i, files[i]); //업로드한 파일을 하나하나 읽어서 FormData 안에 넣는다.
			}

			util.ajaxFileAction("<c:url value='/post/updatePost.do' />", formData, result);
		}
		
		function result(data) {
			if (data.success) {
				window.location.href="<c:url value='/user/index.do' />";
				/* window.location.reload(); */
			}
		}
	
		function cancel() {
			window.location.href="<c:url value='/user/index.do' />";
		}
	</script>
</body>

</html>
