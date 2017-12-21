$(function(){
	$('.file_input input[type=file]').change(function(e) {
		var fileName = $(this).val();
		var fileCount = $(this).get(0).files.length;
		if($(this).get(0).files.length == 1){
  		  $('.file_input input[type=text]').val(fileName);
		}
		 else {
  		  $('.file_input input[type=text]').val('파일 '+fileCount+'개');
		 }
		// 파일 미리보기 실행
		handleImgFileSelect(e);
		
	});
})

function startRoomInsert(){
	document.location.href = "/owner/Step1Pension.do";
}
function startRoomApply(){
	// 컨트롤을 타기전에 comfirm 확인 / 취소 이벤트 발생
	var con_test = confirm("검수 요청 신청시 더이상 수정이 불가능 합니다.\n요청하시겠습니까?");

	// ture 값일경우 컨트롤 진입 // 내 맘대로 ex) Apply.do
	// false 리턴 // 컨트롤 진입할껀데 주소는 main.do?mode=apply
	if(con_test == true){
		document.location.href = "/owner/Step4Apply.do";
	}
	else if(con_test == false){
		document.location.href = "/owner/Main.do";
	}
}
function startRoomQna(){
	document.location.href = "/owner/QnAWrite.do";
}

function changeFileSelect(){
	var fileCount = $('.selProductFile').length;
		$('.file_input input[type=text]').val('파일 '+fileCount+'개');
}
// 미리보기 이벤트
function handleImgFileSelect(e) {

    // 이미지 정보들을 초기화
    sel_files = [];
    $(".imgs_wrap").empty();

    var files = e.target.files;
    var filesArr = Array.prototype.slice.call(files);

    var index = 0;
    filesArr.forEach(function(f) {
        if(!f.type.match("image.*")) {
            alert("확장자는 이미지 확장자만 가능합니다.");
            return;
        }

        sel_files.push(f);

        var reader = new FileReader();
        reader.onload = function(e) {
            var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove'></a>";
            $(".imgs_wrap").append(html);
            index++;

        }
        reader.readAsDataURL(f);
        
    });
}
function deleteImageAction(index) {
    console.log("index : "+index);
    console.log("sel length : "+sel_files.length);

    sel_files.splice(index, 1);

    var img_id = "#img_id_"+index;
    $(img_id).remove(); 
    changeFileSelect();
}
function mainMode(){
	document.location.href="/owner/Main.do";
}

function mainLogin(){
	document.location.href="/index.jsp";
}