package lx.edu.team2.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lx.edu.team2.dao.CommentDAO;
import lx.edu.team2.vo.CommentVO;

@Controller
public class CommentController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	CommentDAO comDao;
	

	@RequestMapping("comment.do")
	public @ResponseBody CommentVO setCom(String comment, String comMem, String postId, HttpServletRequest req, HttpSession session) throws Exception {
		CommentVO vo = new CommentVO();
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("YYYY년 MM월 dd일 HH시 mm분 ss초");
		vo.comTime = format.format(date);
		vo.comMem = comMem;
		vo.comment = comment;
		vo.postId = Integer.parseInt(postId);
		int comId = comDao.setCom(vo);
	
		CommentVO comVo = comDao.getCom(comId);

		return comVo;
	}	

	@RequestMapping("get-comment.do")
	public @ResponseBody List<CommentVO> getCom(String postIdStr, HttpServletRequest req, HttpSession session) throws Exception {

		int postId = Integer.parseInt(postIdStr);
		List<CommentVO> comList = comDao.getComList(postId);
		
		return comList;
	}
	
	
	

	
	
	
	
	
	
	

}
