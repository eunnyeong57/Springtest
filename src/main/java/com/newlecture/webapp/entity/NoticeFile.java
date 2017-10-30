package com.newlecture.webapp.entity;

public class NoticeFile extends Notice {
	
	private String id;
	private String src;
	private String noticeId;
	

	public NoticeFile(String id,String src, String noticeId) {
		super();
		this.id = id;
		this.src = src;
		this.noticeId = noticeId;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getnoticeId() {
		return noticeId;
	}

	public void setnoticeId(String noticeId) {
		this.noticeId = noticeId;
	}

	public String getSrc() {
		return src;
	}

	public void setSrc(String src) {
		this.src = src;
	}
	
	

}
