function fileChoose() {
  console.log("fileChoose");
  $("#uploadFiles").trigger('click');
}

function findFileName(e) {
  // 이미지 정보들을 초기화
  sel_files = [];
  $(".file_label_wrap").empty();

  var files = e.target.files;
  var filesArr = Array.prototype.slice.call(files);

  var index = 1;
  filesArr.forEach(function(f) {

    sel_files.push(f);

    var reader = new FileReader();
    reader.onload = function(e) {
      var html = "<a href=\"javascript:void(0);\" onclick=\"deleteFileAction(" + index + ")\" id=\"fil_id_" + index + "\" style=\"float:left; height:auto; width:50%; \">"+
                  "<span style=\"float:left;\"> &nbsp;· " + f.name + "</span>" +
                 "</a>";
      
      $(".file_label_wrap").append(html);
      index++;

    };
    reader.readAsDataURL(f);

  });
}

function deleteFileAction(index) {
  console.log("index : " + index);
  console.log("sel length : " + sel_files.length);

  sel_files.splice(index, 1);

  var fil_id = "#fil_id_" + index;
  $(fil_id).remove();
}

function deleteOldFileAction(index) {
  var old_id = "#old_id_" + index;
  $(old_id).remove();
}
