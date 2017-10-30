package com.newlecture.webapp.entity;

public class Member {
	private String id;
	private String pwd;
	private String islunar;
	private String name;
	private String gender;
	private String birthday;
	private String phone;
	private String email;
	private int regDate;
	private int point;
	

	public Member(String id, String pwd, String islunar, String name, String gender, String birthday, String phone,
			String email) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.islunar = islunar;
		this.name = name;
		this.gender = gender;
		this.birthday = birthday;
		this.phone = phone;
		this.email = email;
	}


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwds(String pwd) {
		this.pwd = pwd;
	}

	public String getislunar() {
		return islunar;
	}

	public void setislunar(String islunar) {
		this.islunar = islunar;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public int getRegDate() {
		return regDate;
	}


	public void setRegDate(int regDate) {
		this.regDate = regDate;
	}


	public int getPoint() {
		return point;
	}


	public void setPoint(int point) {
		this.point = point;
	}
}

