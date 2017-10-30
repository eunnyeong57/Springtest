package com.newlecture.webapp.dao.mybatis;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.newlecture.webapp.dao.NoticeDao;
import com.newlecture.webapp.entity.Notice;
import com.newlecture.webapp.entity.NoticeView;

public class MyBatisNoticeDao implements NoticeDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<NoticeView> getList(int page,String field,String query) {
		
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);
		List<NoticeView> list = noticeDao.getList(page, field, query);
		
		String output = String.format("p:%s, q:%s", page, query);
		output += String.format("title:%s\n", list.get(0).getTitle());
		
		return list;
	}

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public NoticeView get(String id) {
		
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);
		NoticeView noticeView = noticeDao.get(id);
		
		return noticeView;
	}

	@Override
	public int update(String id, String title, String content) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public NoticeView getPrev(String id) {
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);
		NoticeView result = noticeDao.getPrev(id);
		return result;
	}

	@Override
	public NoticeView getNext(String id) {
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);
		NoticeView result = noticeDao.getNext(id);
		return result;
	}

	@Override
	public int insert(String title, String content, String writerId) {
		return insert(new Notice(title,content,writerId));
	}

	@Override
	public int insert(Notice notice) {
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);
		return noticeDao.insert(notice);
		
	}

	@Override
	public String getNextId() {
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);
		return noticeDao.getNextId();
	}

}
