package com.newlecture.webapp.dao;

import com.newlecture.webapp.entity.Member;

public interface MemberDao {

	int insert(String id, String string, String name,String moon, String gender, String birthday, String phone, String email);

	int insert(Member member);

	Member get(String id);

	int pointUp(String id);
}
