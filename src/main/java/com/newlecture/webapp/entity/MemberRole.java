package com.newlecture.webapp.entity;

import java.util.Date;

public class MemberRole {
	private String memberId;
	private String roleId;
	private String regAdmin;
	private Date regDate;
	private int defaultRole;
	
	
	
	
	public MemberRole(String memberId, String roleId, String regAdmin, Date regDate, int defaultRole) {
		super();
		this.memberId = memberId;
		this.roleId = roleId;
		this.regAdmin = regAdmin;
		this.regDate = regDate;
		this.defaultRole = defaultRole;
	}
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	public String getRegAdmin() {
		return regAdmin;
	}
	public void setRegAdmin(String regAdmin) {
		this.regAdmin = regAdmin;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getDefaultRole() {
		return defaultRole;
	}
	public void setDefaultRole(int defaultRole) {
		this.defaultRole = defaultRole;
	}
	
	
}

