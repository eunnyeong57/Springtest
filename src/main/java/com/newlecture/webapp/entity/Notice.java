package com.newlecture.webapp.entity;

import java.util.Date;

public class Notice {
	private String id;
	private String title;
	private String content;
	private String writerId;
	private Date regDate;
	private int hit;
	private String fileName;

	public Notice() {

	}   

	

	public Notice(String id, String title, String content, String writerId, Date regDate, int hit, String fileName) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.writerId = writerId;
		this.regDate = regDate;
		this.hit = hit;
		this.fileName = fileName;
	}



	public Notice(String title, String content, String writerId) {
		this.title = title;
		this.content = content;
		this.writerId = writerId;
	}



	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public String getWriterId() {
		return writerId;
	}

	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}

	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}



	public String getFileName() {
		return fileName;
	}



	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


}