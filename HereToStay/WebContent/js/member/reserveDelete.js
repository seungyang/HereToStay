/**
 * reservationDetail.jsp 페이지 유효성 검사 JS
 */

$(document).ready(function(){
	// 리뷰작성 버튼 클릭 시 이벤트
	$('#insertReview').click(function() {
		var count = 0;
		
		if( $('#revTitle').val() == "" ) {
			alert('리뷰 제목을 입력해주세요.');
			count ++;
		} else if( $('#revContext').val() == "" ) {
			alert('리뷰 내용을 입력해주세요.');
			count ++;
		}
		
		if(count == 0) {
			$('#writeReview').submit();
		}
		
	});
});