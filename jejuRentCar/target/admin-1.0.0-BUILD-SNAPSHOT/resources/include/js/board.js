var keyword = "", search = "", start_date = "", end_date = "";

$(function(){

	if (search != "b_date") {
		$("#dateCheck").hide();
		var date = getDateFormat(new Date());
		$("#start_date").val(date);
		$("#end_date").val(date);
	} else {
		$("#search").val(search);
		$("#textCheck").hide();
		$("#start_date").val(start_date);
		$("#end_date").val(end_date);
	}

	if (keyword != "") {
		$("#search").val(search);
		$("#keyword").val(keyword);
	}

	// 검색 버튼 클릭 시 처리 이벤트
	$("#searchBtn").click(function() {
		if ($("#search").val() != "b_date") {
			if (!chkSubmit($("#keyword"), "검색어를"))
				return;
		} else if ($("#search").val() == "b_date") {
			if (!chkSubmit($("#start_date"), "시작날자를"))
				return;
			else if (!chkSubmit($("#end_date"), "종료날자를"))
				return;
			else if ($("#start_date").val() > $("#end_date").val()) {
				alert("시작날자가 종료날자보다 더 클 수 없습니다.");
				return;
			}
		}
		goPage(1);
	});

	$("#allSearchBtn").click(function() {
		$("#search > option:selected").val("");
		$("#keyword").val("");
		$("#start_date").val("");
		$("#end_date").val("");
		goPage(1);
	});

	// 검색 대상이 변경될 떄마다 처리 이벤트
	$("#search").change(function() {
		if ($("#search").val() != "b_date") {
			$("#dateCheck").hide();
			$("#textCheck").show();
		}
		if ($("#search").val() == "b_date") {
			$("#textCheck").hide();
			$("#dateCheck").show();
		}
	});

	// 엑셀 다운로드 버튼 클릭 시 처리 이벤트
	$("#excelDownBtn").click(function() {
		$("#f_search").attr({
			"method" : "get",
			"action" : "/admin/board/boardExcel.do"
		});

		$("#f_search").submit();
	});
});

function goPage(page) {
	$("#page").val(page);
	$("#f_search").attr({
		"method" : "get",
		"action" : "/admin/board/boardList.do"
	});
	$("#f_search").submit();
}