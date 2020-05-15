/* 함수명 : chkSubmit(유효성 체크 대상, 메시지 내용)
 * 출력영역 : alert으로.
 * 예시 : if(!chkSubmit($('#keyword'),"검색어를"))return;
 */
function chkSubmit(item, msg) {
	if (item.val().replace(/\s/g, "") == "") {
		alert(msg + " 입력해주세요.");
		item.val("");
		item.focus();
		return false;
	} else {
		return true;
	}
}

/*
 * 함수명 : chkFile(파일명) 설명 : 이미지 파일 여부를 확인하기 위해 확장자 확인 함수
 */
function chkFile(item) {
	/*
	 * 배열 내의 값을 찾아서 인덱스를 반환(요소가 없을 경우 -1 반환) jQuery.inArray(찾을 값, 검색 대상의 배열)
	 */
	var ext = item.val().split('.').pop().toLowerCase();
	if (jQuery.inArray(ext, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1) {
		alert('gif,png,jpg,jpeg 파일만 업로드할 수 있습니다.');
		return false;
	} else {
		return true;
	}
}