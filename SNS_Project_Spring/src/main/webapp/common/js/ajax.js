/**
 * 
 */

var util = [];

util.ajaxFileAction = function(url, param, result) {
	$.ajax({
		processData : false,
		contentType : false,
		url : url,
		method : "POST",
		dataType : "JSON",
		data : param,
		success : result,
//		error : error,
		error : function(request, status, error) {
			console.log("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
			alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
		}
	});
}