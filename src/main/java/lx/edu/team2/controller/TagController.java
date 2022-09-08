package lx.edu.team2.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import lx.edu.team2.dao.TagDAO;

@Controller
public class TagController {
	
	Logger logger=LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	TagDAO dao;
	
	@RequestMapping("search-tag1.do")
	public String RequsetMappingTest(String url, HttpServletRequest request) {

		return "search-page";
	}
	
	

}
