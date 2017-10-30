package com.newlecture.webapp.controller.admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.mysql.jdbc.Connection;
import com.newlecture.webapp.dao.MemberDao;
import com.newlecture.webapp.dao.NoticeDao;
import com.newlecture.webapp.dao.NoticeFileDao;
import com.newlecture.webapp.entity.Notice;
import com.newlecture.webapp.entity.NoticeFile;
import com.newlecture.webapp.entity.NoticeView;
import com.newlecture.webapp.service.admin.BoardService;

@Controller
@RequestMapping("/admin/board/*")
public class BoardController {
	
	   /*@Autowired
	   private NoticeDao noticeDao;
	   
	   @Autowired
	   private NoticeFileDao noticeFileDao;
	   
	   @Autowired
	   private MemberDao memberDao;*/
	
	@Autowired
	private BoardService service;
	   
	@RequestMapping("notice")
		   public String notice(@RequestParam(value="p", defaultValue="1") Integer page, 
			         @RequestParam(value="f", defaultValue="title") String field,
			         @RequestParam(value="q", defaultValue="") String query,
			         Model model) {
			      
			      List<NoticeView> list = service.getNoticeList();
			      model.addAttribute("list", list);
			      
			      /*String output = String.format("p:%s, q:%s", page, query);
			      output += String.format("title : %s\n", list.get(0).getTitle());
			      */
			      //return "customer/notice";
		return "admin.board.notice.list";
	}
	
	   @RequestMapping("notice/{id}")
	   public String noticeDetail(@PathVariable("id") String id,Model model) {
	      
	      model.addAttribute("n", service.getNotice(id));
	      model.addAttribute("prev", service.getNoticePrev(id));
	      model.addAttribute("next", service.getNoticeNext(id));
	      
	      return "admin.board.notice.detail";
	   }
	   
	   @RequestMapping(value="notice/reg", method=RequestMethod.GET)
	   public String noticeReg() {
	      
	      return "admin.board.notice.reg";
	   }
	   
	   @RequestMapping(value="notice/reg", method=RequestMethod.POST)
	   public String noticeReg(Notice notice, String aa, MultipartFile file, HttpServletRequest request, Principal principal) throws IOException {

		// title = new String(title.getBytes("ISO-8859-1"),"UTF-8"); //한글깨짐 방지
		// System.out.println(title);

		// Date curDate = new Date(); //날짜 얻는법1

		Calendar cal = Calendar.getInstance(); // 날짜 얻는법2
		// Date curdate2 = cal.getTime();
		int year = cal.get(Calendar.YEAR);

		/*
		 * SimpleDateFormat fmt = new SimpleDateFormat("hh:mm:ss"); //날짜 얻는법3
		 * fmt.format(arg0);
		 */
		String nextId = service.getNoticeNextId();

		ServletContext ctx = request.getServletContext();
		String path = ctx.getRealPath(String.format("/resource/customer/notice" + year + "/" + nextId));

		System.out.println(path);

		File f = new File(path);

		if (!f.exists()) {
			if (!f.mkdirs())
				System.out.println("디렉토리를 생성할수 없습니다.");
		}

		path += File.separator + file.getOriginalFilename();
		File f2 = new File(path);

		InputStream fis = file.getInputStream();
		OutputStream fos = new FileOutputStream(f2);

		byte[] buf = new byte[1024];
		int size = 0;
		while ((size = fis.read(buf)) > 0)
			fos.write(buf, 0, size);

		fos.close();
		fis.close();

		// file.getInputStream();
		String fileName = file.getOriginalFilename();
		System.out.println(fileName);

		String writerId = "newlec";
		System.out.println(notice.getTitle());

		notice.setWriterId(writerId);
		
		// 업무명
		// int row = noticeDao.insert(title, content, writerId);
		int row = service.insertAndPointUp(notice);
		//memberDao.pointUp(principal.getName());
		
		// noticeFileDao.insert(new NoticeFile(null,fileName,nextId));

		/*
		 * Connection con = ?; con.setAutoCommit(false);
		 * 
		 * Statement st = con.createStatement();
		 */

		return "redirect:../notice";
	}
	   
		@RequestMapping(value = "notice/edit/{id}", method = RequestMethod.GET)
		public String noticeEdit(@PathVariable("id") String id, Model model) {
	
			model.addAttribute("n", service.getNotice(id));
	
			return "admin.board.notice.edit";
		}
		
		@RequestMapping(value = "notice/edit/{id}", method = RequestMethod.POST)
		public String noticeEdit(@PathVariable("id") String id, String title, String content) {
			
			int row = service.updateNotice(id,  title, content);
			
			return "redirect:../{id}";
		}
}
