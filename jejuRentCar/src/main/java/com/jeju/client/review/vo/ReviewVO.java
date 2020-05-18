package com.jeju.client.review.vo;

import org.springframework.web.multipart.MultipartFile;

import com.jeju.admin.common.vo.CommonVO;

public class ReviewVO extends CommonVO {

	private int re_number= 0;		// 게시글 고유 번호
	private String mem_id="";		// 회원 아이디
	private String re_title="";		// 게시글 제목
	private String re_content="";	// 게시글 내용
	private String re_image1=""; 	// 실제 서버에 저장한 업로드 파일명
	private String re_regdate="";	// 게시글 작성일
	private String re_reply = ""; 	// 댓글(답변)
	private MultipartFile file;		// 첨부 파일
	
	
	// getters and setters
	public int getRe_number() {
		return re_number;
	}
	public void setRe_number(int re_number) {
		this.re_number = re_number;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getRe_title() {
		return re_title;
	}
	public void setRe_title(String re_title) {
		this.re_title = re_title;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public String getRe_image1() {
		return re_image1;
	}
	public void setRe_image1(String re_image1) {
		this.re_image1 = re_image1;
	}
	public String getRe_regdate() {
		return re_regdate;
	}
	public void setRe_regdate(String re_regdate) {
		this.re_regdate = re_regdate;
	}
	
	public String getRe_reply() {
		return re_reply;
	}
	public void setRe_reply(String re_reply) {
		this.re_reply = re_reply;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	
	
	
}
