package com.jeju.admin.notice.vo;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

import com.jeju.admin.common.vo.CommonVO;

public class AdminNoticeVO extends CommonVO{
	private int nt_number=0;
	private String nt_heading=""; //머릿말
	private String nt_title="";	//제목
	private String nt_content="";	//내용
	private String nt_image=""; //실제 서버에 저장할 파일명
	private Timestamp nt_regdate;	//작성일
	
	//파일 업로드 작성해야함
	private MultipartFile file;	//이미지

	
	public int getNt_number() {
		return nt_number;
	}

	public void setNt_number(int nt_number) {
		this.nt_number = nt_number;
	}

	public String getNt_heading() {
		return nt_heading;
	}

	public void setNt_heading(String nt_heading) {
		this.nt_heading = nt_heading;
	}

	public String getNt_title() {
		return nt_title;
	}

	public void setNt_title(String nt_title) {
		this.nt_title = nt_title;
	}

	public String getNt_content() {
		return nt_content;
	}

	public void setNt_content(String nt_content) {
		this.nt_content = nt_content;
	}

	public String getNt_image() {
		return nt_image;
	}

	public void setNt_image(String nt_image) {
		this.nt_image = nt_image;
	}

	public Timestamp getNt_regdate() {
		return nt_regdate;
	}

	public void setNt_regdate(Timestamp nt_regdate) {
		this.nt_regdate = nt_regdate;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	
}

