package lx.edu.team2.controller;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lx.edu.team2.dao.CommentDAO;
import lx.edu.team2.dao.FollowDAO;
import lx.edu.team2.dao.LikeDAO;
import lx.edu.team2.dao.MemDAO;
import lx.edu.team2.service.MemberServiceImpl;
import lx.edu.team2.vo.FollowVO;
import lx.edu.team2.vo.MemVO;
import lx.edu.team2.vo.PostVO;

@Controller
public class MemberController {

	Logger logger=LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	MemberServiceImpl memServe;
	@Autowired
	MemDAO memDao;
	@Autowired
	FollowDAO followDao;
	@Autowired
	CommentDAO comDao;
	@Autowired
	LikeDAO likeDao;
	
	@RequestMapping("login-form.do")
	public String loginForm() throws Exception{
		return "insta/login-form";
	}
	
	@RequestMapping("signup-form.do")
	public String signForm() throws Exception{
		return "insta/signup-form";
	}
	
	
	@RequestMapping("profile.do")
	public String profile(String memId, HttpSession session, HttpServletRequest req) throws Exception{
		PostVO postVo = new PostVO();
		MemVO vo = memDao.getMem(memId);
		req.setAttribute("owner", vo);
		List<PostVO> list = memDao.getPostById(memId);
		int postCount = memDao.postCount(memId);
		for(int i=0; i<=list.size()-1; i++) {
			postVo = list.get(i);
			MemVO memVo = memDao.getById(vo.memId);
			postVo.memImg = memVo.memImg;
			postVo.comList = comDao.getComList(postVo.postId);
			postVo.sumLike = likeDao.getLikeSum(postVo.postId);
			list.set(i, postVo);
		}
		req.setAttribute("postCount", postCount);
		req.setAttribute("list", list);
		
		FollowVO checkVo = new FollowVO();
		MemVO loginVo = (MemVO) session.getAttribute("memVo");
		checkVo.folId = 0;
		checkVo.following = memId;
		checkVo.memId = loginVo.memId;
		
		int followCheck = followDao.followCheck(checkVo);
		checkVo.following = loginVo.memId;
		checkVo.memId = memId;
		int counterFollowCheck = followDao.counterFollowCheck(checkVo);
		req.setAttribute("followCheck", followCheck);
		req.setAttribute("counterFollowCheck", counterFollowCheck);
		
		req.setAttribute("follower", followDao.getCountFollower(memId));
		req.setAttribute("following", followDao.getCountFollowing(memId));
		return "insta/profile";
	}
	
	
	
	@RequestMapping("signup-action.do")
	public String signUp(MemVO vo) throws Exception{
		vo.memImg = "resources/img/non-profile.png";
		int result = memDao.register(vo);
		return "redirect:login-form.do";
	}
	
	@RequestMapping("loginCheck.do")
	public @ResponseBody String loginCheck(String memId, String memPw, HttpSession session) throws Exception {
		int result = 0;
		MemVO vo = memDao.getMem(memId);
		if (memPw.equals(vo.memPw)) {
			session.setAttribute("memVo", vo);
			
			result = 1;
		}

		return "{\"result\" : " + result + "}";
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session) throws Exception{
		session.setAttribute("memVo", null);
		return "insta/login-form";
	}
	
	@RequestMapping("delete.do")
	public String delete(HttpSession session) throws Exception{
		MemVO memVo = (MemVO) session.getAttribute("memVo");
		
		memServe.deleteMemInfo(memVo);
		session.removeAttribute("memVo");
		return "redirect:login-form.do";
	}
	
	@RequestMapping("editProfile.do")
	public String editForm(String memId, HttpServletRequest req, HttpSession session) throws Exception{
		MemVO vo = (MemVO) session.getAttribute("memVo");
		req.setAttribute("vo", vo);
		return "insta/editProfile";
	}
	@RequestMapping("edit-action.do")
	public String update(MemVO vo, HttpServletRequest req, HttpSession session) throws Exception{
		int result = memDao.update(vo);
		req.setAttribute("owner", vo);
		return "redirect:profile.do?memId=" + vo.memId;
	}
}
