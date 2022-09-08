package lx.edu.team2.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lx.edu.team2.dao.LikeDAO;
import lx.edu.team2.dao.TagDAO;
import lx.edu.team2.vo.LikeVO;

public class LikeController {

	Logger logger=LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	LikeDAO likeDao;

	@RequestMapping("check-like.do")
	public @ResponseBody LikeVO RequsetMappingTest(int postId, HttpServletRequest req, HttpSession session) throws Exception {


	    return null;
	}	

}
