/**
 * 
 */

var u = {};

u.doAjaxGet = function(addr, param, msgList){
	$.ajax({
		url : addr,
		type : "get",
		data : param,
		success : msgList
	});
}

u.doAjaxPost = function(addr, param, writeMsgsucc){
	$.ajax({
		url : addr,
		type : "post",
		data : param,
		success : writeMsgsucc,
		error : writeMsgError
	});
}