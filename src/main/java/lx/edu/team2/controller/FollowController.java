package lx.edu.team2.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lx.edu.team2.dao.FollowDAO;
import lx.edu.team2.service.FollowService;
import lx.edu.team2.vo.FollowVO;

@Controller
public class FollowController {
	
	Logger logger;
	
	@Autowired
	FollowService followService;
	
	@Autowired
	FollowDAO followDao;
	
	@RequestMapping(value="/follow", method = RequestMethod.POST)
	@ResponseBody
	public int follow(@RequestBody FollowVO vo, Model model) {
		
		int result = 0;
		
		if (followService.IsFollowing(vo)) {
			result = 0;
		}else {
			followService.InsertFollowing(vo);
			result = 1;
		}
		
		return result;
	}
	
	@RequestMapping(value="/unfollow", method=RequestMethod.POST)
	@ResponseBody
	public int unfollow(@RequestBody FollowVO vo, Model model) {
		
		int result = 0;

		if (followService.IsFollowing(vo)) {
			followService.DeleteFollowing(vo);

			result = 1;
		} else {
			result = 0;
		}

		return result;

	}
	
	@RequestMapping("follow-action")
	public String dofollow(FollowVO vo) {
		int result = followDao.dofollow(vo);
		return "redirect:profile.do?memId=" + vo.following;
	}
	
	@RequestMapping("unfollow-action")
	public String dounfollow(FollowVO vo) {
		int result = followDao.dounfollow(vo);
		return "redirect:profile.do?memId=" + vo.following;
	}
	
	@RequestMapping("checkFollowInfo.do")
	public @ResponseBody String checkFollowInfo(String pageMemId, String loginMemId) throws Exception {
		int count = 0;
		count = followDao.getCountFollower(pageMemId);
		int result = 0;
		FollowVO followVo = new FollowVO();
		followVo.memId = loginMemId;
		followVo.following = pageMemId;
		
		int checkInfo = followDao.followCheck(followVo);
		if(checkInfo==1) {
			// 이용자가 팔로우 중. 팔로워 버튼.
			result = 0;
			
		} else if(checkInfo==0) {
			followVo.memId = pageMemId;
			followVo.following = loginMemId;
			checkInfo = followDao.followCheck(followVo);
			if(checkInfo==1) {
				// 이용자를 팔로우 중. 맞팔하기 버튼.
				result = 2;
			} else if(checkInfo==0) {
				// 둘 다 팔로우 안함. 팔로우 하기 버튼.
				result = 1;
			}
		}
		return "{\"result\" : " + result + ", \"count\" : " + count + "}";
	}
	
	@RequestMapping("insertFollowInfo.do")
	public @ResponseBody String insertFollowInfo(String pageMemId, String loginMemId) throws Exception {
		int result = 0;
		FollowVO followVo = new FollowVO();
		followVo.memId = loginMemId;
		followVo.following = pageMemId;
		
		int checkInfo = followDao.followCheck(followVo);
		if(checkInfo==1) {
			// 이용자가 팔로우 중. 언팔하기.
			followDao.dounfollow(followVo);
			result = 0;
		} else if(checkInfo==0) {
			followDao.dofollow(followVo);
			result = 1;
		}

		return "{\"result\" : " + result + "}";
	}
	
}
