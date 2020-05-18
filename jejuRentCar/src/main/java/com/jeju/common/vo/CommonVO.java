package com.jeju.common.vo;

public class CommonVO {

	private String page; // 페이지 번호
	private String pageSize; // 페이지에 보여주는 줄 수
	private String start_row; // 시작 레코드 번호
	private String end_row; // 종료 레코드 번호

	// 조건검색시 사용할 필드
	private String search = "";
	private String keyword = "";

	// 날짜 검색시 사용할 필드
	private String start_date = "";
	private String end_date = "";
	
	// 제목 클릭시 정렬을 위한 필드
	private String order_by;
	private String order_sc;

	// 클라이언트에게 코드나 결과 내용을 위한 필드
	private String result_cd;
	private String result_msg;

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getPageSize() {
		return pageSize;
	}

	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}

	public String getStart_row() {
		return start_row;
	}

	public void setStart_row(String start_row) {
		this.start_row = start_row;
	}

	public String getEnd_row() {
		return end_row;
	}

	public void setEnd_row(String end_row) {
		this.end_row = end_row;
	}

	public String getResult_cd() {
		return result_cd;
	}

	public void setResult_cd(String result_cd) {
		this.result_cd = result_cd;
	}

	public String getResult_msg() {
		return result_msg;
	}

	public void setResult_msg(String result_msg) {
		this.result_msg = result_msg;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getOrder_by() {
		return order_by;
	}

	public void setOrder_by(String order_by) {
		this.order_by = order_by;
	}

	public String getOrder_sc() {
		return order_sc;
	}

	public void setOrder_sc(String order_sc) {
		this.order_sc = order_sc;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

}
