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
    <script src='<c:url value="https://code.jquery.com/jquery-1.10.2.js"/>'></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
</head>
<script type="text/javascript">
    $(document).ready(function() {
       $("#follow").on('click', function() {           
           var insertAddr = "<c:url value='/follow/insertFollow.do' />";
           var delAddr = "<c:url value='/follow/deleteFollow.do' />";
   	  	   var from_uid = "${user.uid}";
   	  	   var to_uid = "${otherUser.uid}";
              
            if($('#follow').attr('data-following') == 'false') { // FOLLOW
                $.post(insertAddr, {"from_uid" : from_uid, "to_uid" : to_uid} , function(data) {
                });
                
                $('#follow').attr('data-following', 'true');
                $(this).removeClass('btn btn-default btn-lg');
                $('#follow').mouseover(function(){
                	$('#follow').text('언팔로우');
                	$(this).removeClass('btn btn-info btn-lg');
                	$(this).addClass('btn btn-danger btn-lg');
                });
                $('#follow').mouseout(function(){
                	$('#follow').text('팔로잉');
                	$(this).removeClass('btn btn-danger btn-lg');
                	$(this).addClass('btn btn-info btn-lg');
                });
            }  else { // UNFOLLOW
                $.post(delAddr, {"from_uid" : from_uid, "to_uid" : to_uid} , function(data) {
                });
                $('#follow').attr('data-following', 'false');
                $('#follow').mouseover(function(){
                	$('#follow').text('팔로우');
                	$(this).removeClass('btn btn-danger btn-lg').addClass('btn btn-default btn-lg');
                });
                $('#follow').mouseout(function(){
                	$('#follow').text('팔로우');
                	$(this).removeClass('btn btn-info btn-lg').addClass('btn btn-default btn-lg');
                });
            } 
       });
       
       if($('#follow').attr('data-following') == 'true') {
    		   $('#follow').mouseover(function(){
               	$('#follow').text('언팔로우');
               	$(this).removeClass('btn btn-info btn-lg');
               	$(this).addClass('btn btn-danger btn-lg');
               });
               $('#follow').mouseout(function(){
               	$('#follow').text('팔로잉');
               	$(this).removeClass('btn btn-danger btn-lg');
               	$(this).addClass('btn btn-info btn-lg');
               });
       }
       
       $("#followingModal").click(function(e) {
    	   
    	   var addr = "<c:url value='/follow/getFollowList.do' />";
   		   var from_uid = 0;
   		   
   		   if("${otherUser.uid}" > 0){
   			   from_uid = "${otherUser.uid}";
   		   } else {
   			   from_uid = "${user.uid}";
   		   }
   		   
   		$.ajax({
   			url : addr,
   			type : "get",
   			data : {
   				"from_uid" : from_uid
   			},
   			success : function(responseData) {

   				var html = '';
				var no = 1;
				
   				$("#ajax").remove();
   				$(responseData.followlist).each(function() { 
   				 
   					html += '<tr style="cursor:pointer" onclick=\"otherUserTimeline(\'' + this.uid + '\')\">';
   					html += '<td>' + no++ + '</td>';
   					html += '<td>' + this.nick + '</td>';
   					html += '<td>' + this.loginid + '</td>';
   					html += '</tr>';
   				 
   					$('#follwingList > tbody:last').empty();
   					$('#follwingList > tbody:last').append(html);
   				});// end each
   			}// end
   		});// end ajax
    	   
      });
   });
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
	<body>
          <div class="sidebar">
          <div class="sidebarProfile">
            <a class="profileCardLink" href="#" aria-hidden="true"></a>
            <div class="profileCardContent">
              <a class="profileImgLink" href="#" title="nickname" aria-hidden="true">
                <img src='<c:url value="/common/img/circle.gif" />' alt="70x70" class="img-circle" width="70" height="70">
              </a>
          
               <c:choose>
				    <c:when test="${otherUser ne null}">
				    <input type="hidden" id="to_uid" value="${otherUser.uid}" />
				      <div class="profileUseridAndNick">
		                <div class="userid">
		                  <a href="#" style="color: inherit!important;">${otherUser.nick}</a>
		                </div>
		                <span class="userNick">
		                  <a class="uN" href="#">@${otherUser.loginid}</a>
		                </span>
		              </div>
				    </c:when>

				    <c:otherwise>
					 <div class="profileUseridAndNick">
		                <div class="userid">
		                  <a href="#" style="color: inherit!important;">${user.nick}</a>
		                </div>
		                <span class="userNick">
		                  <a class="uN" href="#">@${user.loginid}</a>
		                </span>
		              </div>
				    </c:otherwise>				
			   </c:choose>

            </div>
          </div>
        </div>

        <div class="sidebar2">
          <div class="list-group">
            <c:choose>
        	   <c:when test="${otherUser ne null}">
          			<a href="#" class="list-group-item list-group-item-success" data-toggle="tooltip" data-placement="top" title="${otherUser.nick}님이 쓴 글 2345개">
		            	${otherUser.nick}님이 쓴 글 : 2345개
		            </a>
		            <a href="#" id="followingModal" class="list-group-item list-group-item-info" data-toggle="modal" data-target="#followModal" title="${otherUser.nick}님의 팔로잉  ${otherFollow}명">
		            	${otherUser.nick}님의 팔로잉 : ${otherFollow}명
		            </a>
		            
		        </c:when>
		        <c:otherwise>
		            <a href="#" class="list-group-item list-group-item-success" data-toggle="tooltip" data-placement="top" title="내가 쓴 글 2345개">
		            	내가  쓴 글 : 2345개
		            </a>
		            <a href="#" id="followingModal" class="list-group-item list-group-item-info" data-toggle="modal" data-target="#followModal" title="팔로잉 ${follow}명">
		            	팔로잉 : ${follow}명
		            </a>
		        </c:otherwise>				
			   </c:choose>
          </div>

          <!-- Modal -->
          <div class="modal fade" id="followModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header" style="background-color:#83abc6; border-radius: 6px 6px 0 0;">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  
                  <c:choose>
        	        <c:when test="${otherUser ne null}">                  
                      <h4 class="modal-title" id="writeLabel" style="color: #fff;">${otherUser.nick}님의 팔로잉 목록</h4>
                    </c:when>
                    <c:otherwise>
                      <h4 class="modal-title" id="writeLabel" style="color: #fff;">내 팔로잉 목록</h4>
                    </c:otherwise> 
                  </c:choose>
                  
                </div>

                  <div class="modal-body">
                    <table class="table table-hover" id="follwingList">
                        <thead>
                          <tr>
                            <th>No.</th>
                            <th>닉네임</th>
                            <th>아이디</th>                            
                          </tr>
                        </thead>
                        <tbody>
                         
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
           <c:if test="${otherUser ne null}">			 
			<c:choose>
			   <c:when test="${checkFollow eq true}">
			   <div style="text-align:center;">	  
				<button type="button" data-following="true" id="follow" class="btn btn-info btn-lg">팔로잉</button>
			   </div>
			   </c:when>
			  <c:otherwise>
			   <div style="text-align:center;">	  
				<button type="button" data-following="false" id="follow" class="btn btn-default btn-lg">팔로우</button>
			   </div>
			  </c:otherwise>
			 </c:choose>
  			</c:if>
        </div>	


  <script>
    $('[data-toggle="tooltip"]').tooltip('toggle');
    $('[data-toggle="tooltip"]').tooltip('hide');
  </script>
</body>
</html>