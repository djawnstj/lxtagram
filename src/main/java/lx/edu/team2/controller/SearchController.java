package lx.edu.team2.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lx.edu.team2.dao.MemDAO;
import lx.edu.team2.vo.MemVO;

@Controller
public class SearchController {
	
	@Autowired
	MemDAO dao;
	
	
	@RequestMapping("mem-list.do")
	public @ResponseBody MemVO getById(String memId, HttpServletRequest req) throws Exception {

		MemVO vo = dao.getById(memId);
		return vo;
	}
}
