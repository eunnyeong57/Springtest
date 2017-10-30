package com.newlecture.webapp.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.newlecture.webapp.dao.MemberDao;
import com.newlecture.webapp.dao.NoticeDao;
import com.newlecture.webapp.dao.NoticeFileDao;
import com.newlecture.webapp.entity.Notice;
import com.newlecture.webapp.entity.NoticeView;

//BoardController를 위한 데이터 제공
public class BoardService {

	@Autowired
	private NoticeDao noticeDao;

	@Autowired
	private NoticeFileDao noticeFileDao;

	@Autowired
	private MemberDao memberDao;

	public List<NoticeView> getNoticeList() {

		return noticeDao.getList(1, "title", "%");
	}

	List<NoticeView> getNoticeList(String field, String query) {

		return null;
	}

	@Transactional
	public int insertAndPointUp(Notice notice) {

		noticeDao.insert(notice);
		memberDao.pointUp(notice.getWriterId());
		
		return 0;
	}

	public Object getNotice(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	public Object getNoticePrev(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	public Object getNoticeNext(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	public String getNoticeNextId() {
		// TODO Auto-generated method stub
		return null;
	}

	public int updateNotice(String id, String title, String content) {
		// TODO Auto-generated method stub
		return 0;
	}
}
