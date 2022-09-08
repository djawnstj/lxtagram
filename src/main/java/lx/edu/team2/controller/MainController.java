package lx.edu.team2.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lx.edu.team2.dao.CommentDAO;
import lx.edu.team2.dao.LikeDAO;
import lx.edu.team2.dao.MemDAO;
import lx.edu.team2.dao.PostDAO;
import lx.edu.team2.dao.TagDAO;
import lx.edu.team2.service.PostServiceImpl;
import lx.edu.team2.service.TagServiceImpl;
import lx.edu.team2.utils.HashTag;
import lx.edu.team2.utils.UploadFileUtils;
import lx.edu.team2.vo.CommentVO;
import lx.edu.team2.vo.LikeVO;
import lx.edu.team2.vo.MemVO;
import lx.edu.team2.vo.PostVO;
import lx.edu.team2.vo.TagVO;

@Controller
public class MainController {

	@Autowired
	PostDAO postDao;
	@Autowired
	MemDAO memDao;
	@Autowired
	TagDAO tagDao;
	@Autowired
	LikeDAO likeDao;
	@Autowired
	CommentDAO comDao;
	@Autowired
	TagServiceImpl tagServ;
	@Autowired
	PostServiceImpl postServ;
	

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String test(HttpServletRequest req, HttpSession session) throws Exception {
		//		PostDAO dao = new PostDAO();
		//		List<PostVO> list = dao.getPostList();
		//		req.setAttribute("list", list);


		return "convert";
	}

	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String main(HttpServletRequest req, HttpSession session) throws Exception {

		int pageNation = 0;
		MemVO memVo = (MemVO) session.getAttribute("memVo");
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("memId", memVo.memId);
		paramMap.put("pageNation", pageNation);
		
		List<PostVO> postList = postServ.getPostListContent(paramMap);
		req.setAttribute("postList", postList);
		List<MemVO> memRecomendList = memDao.getRandomMem(memVo.memId);
		if(memRecomendList.size()!=0) {
			req.setAttribute("memRecomendList", memRecomendList);
		}
		return "/insta/index";
	}

	@RequestMapping(value = "/post-upload.do", method = RequestMethod.GET)
	public String postUpload(HttpServletRequest req, int postId) throws Exception {

		req.setAttribute("postId", postId);
		return "/insta/post-upload";
	}

	@GetMapping("/uploadForm")
	public void uploadForm() {
	}

	@PostMapping("post-upload-action.do")
	public String uploadFormPost(HttpServletRequest req, HttpSession session, MultipartFile[] postImg, Model model, String post, String addrLat, String addrLng, String addrInfo, String addrArea, int receivedPostId) throws Exception {
		if(receivedPostId==0) {
			Date date = new Date();
			Random random = new Random();
			String fileName;
			MultipartFile uploadImg = postImg[0];
			String uploadFolder = "/Users/eomjunseo/eclipse-workspace/teamspring-server/src/main/webapp/resources/uploadImg/";
			// C:/lx/apache-tomcat-9.0.52/webapps/teamspring-server/resources/uploadImg
			String extension = uploadImg.getOriginalFilename();
			String ext = extension.substring(extension.lastIndexOf(".") + 1);
			
			SimpleDateFormat fileDateFormat = new SimpleDateFormat("YYYYMMddHHmmss");
			fileName = fileDateFormat.format(date)+"_"+random.nextInt(1000000)+"."+ext;
			File saveFile = new File(uploadFolder, fileName);
			
			while(saveFile.exists()) {
				if(saveFile.exists()) {
					fileName = fileDateFormat.format(date)+"_"+random.nextInt(1000000);
					saveFile = new File(uploadFolder, fileName);
				}
			}
			
			try {
				uploadImg.transferTo(saveFile);
			} catch (Exception e) {
				logger.error(e.getMessage());
			}
			
			HashTag tag = new HashTag();
			List<String> list = tag.setLinkHashTag(post);
	
	
			SimpleDateFormat format = new SimpleDateFormat("YYYY년 MM월 dd일 HH시 mm분 ss초");
	
			PostVO vo = new PostVO();
			MemVO memVo = (MemVO) session.getAttribute("memVo");
			vo.memId  = memVo.memId;
			vo.post = list.get(list.size()-1);
			vo.postTime = format.format(date);
			vo.postImg = "resources/uploadImg/"+fileName;
			vo.addrInfo = addrInfo;
			vo.addrArea = addrArea;
	
			
			int postId = postDao.addPost(vo);
			
			tagServ.insertTag(postId, post);
		} else {
			Date date = new Date();
			SimpleDateFormat format = new SimpleDateFormat("YYYY년 MM월 dd일 HH시 mm분 ss초");
			
			HashTag tag = new HashTag();
			List<String> list = tag.setLinkHashTag(post);
	
			PostVO vo = postDao.getPostPage(receivedPostId);
			vo.post = list.get(list.size()-1);
			vo.postTime = format.format(date);
			if(addrInfo!=null||!addrInfo.equals("")) {
				vo.addrInfo = addrInfo;
			}
			if(addrArea!=null|!addrArea.equals("")) {
				vo.addrArea = addrArea;
			}
			
			int postId = postDao.updatePost(vo);
			
			tagServ.updateTag(postId, post);
		}

		return "redirect:/index.do";
	}

	@RequestMapping(value = "/post-page.do", method = RequestMethod.GET)
	public String goPostPage(HttpServletRequest req, int postId) throws Exception {
		PostVO postVo = postServ.getPostContent(postId);
		req.setAttribute("postVo", postVo);
		MemVO memVo = memDao.getById(postVo.memId);
		postVo.memImg = memVo.memImg;
		
		return "/insta/post-page";
	}

	@RequestMapping(value = "/search-area.do", method = RequestMethod.GET)
	public String selectByArea(HttpServletRequest req, String area, HttpSession session) throws Exception {
		int pageNation = 0;
		MemVO loginMemVo = (MemVO) session.getAttribute("memVo");
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("memId", loginMemVo.memId);
		paramMap.put("addrArea", area);
		paramMap.put("pageNation", pageNation);
		List<PostVO> postList = postDao.serachPostByArea(paramMap);
		
		MemVO memVo = (MemVO) session.getAttribute("memVo");
		List<MemVO> memRecomendList = memDao.getRandomMem(memVo.memId);
		if(memRecomendList.size()!=0) {
			req.setAttribute("memRecomendList", memRecomendList);
		}
		if(postList.size()==0) {
			return "redirect:index.do";
		}
		
		req.setAttribute("area", area);
		req.setAttribute("postList", postList);
		
		return "/insta/index";
	}
	
	@RequestMapping(value = "/search-tag.do", method = RequestMethod.GET)
	public String selectBypostTag(HttpServletRequest req, String url, HttpSession session) throws Exception {
		int pageNation = 0;
		MemVO loginMemVo = (MemVO) session.getAttribute("memVo");
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("memId", loginMemVo.memId);
		paramMap.put("postTag", url);
		paramMap.put("pageNation", pageNation);
		List<PostVO> postList = new ArrayList();
		List<TagVO> tagList = tagDao.selectBypostTag(paramMap);
		MemVO memVo = (MemVO) session.getAttribute("memVo");
		List<MemVO> memRecomendList = memDao.getRandomMem(memVo.memId);
		if(memRecomendList.size()!=0) {
			req.setAttribute("memRecomendList", memRecomendList);
		}
		if(tagList.size()==0) {
			return "redirect:index.do";
		}
		for(TagVO vo : tagList) {
			PostVO postVo = postDao.serachPostByTag(vo.postNo);
			MemVO selectMemVo = memDao.getById(postVo.memId);
			postVo.memImg = selectMemVo.memImg;
			postList.add(postVo);
		}
		req.setAttribute("tag", url);
		req.setAttribute("postList", postList);
		
		return "/insta/index";
	}
	
	@RequestMapping("delete-action.do")
	public @ResponseBody String deletePost(int postId) throws Exception {
		int result = 0;
		try {
			postServ.deletePostInfo(postId);
			result = 1;
		} catch(Exception e) {
			System.out.println(e);
		}
		
		return "{\"result\" : " + result + "}";
	}
	
	@RequestMapping("getLikeInfo.do")
	public @ResponseBody String getLikeInfo(int likePost, String likeMem) throws Exception {
		LikeVO likeVo = new LikeVO();
		likeVo.likePost = likePost;
		likeVo.likeMem = likeMem;
		int result = likeDao.getLikeInfo(likeVo);
		
		int likeSum = likeDao.getLikeSum(likePost);

		return "{\"result\" : " + result + ", \"likeSum\" : " + likeSum + "}";
	}
	
	@RequestMapping("setLikeInfo.do")
	public @ResponseBody String setLikeInfo(int likePost, String likeMem) throws Exception {
		LikeVO likeVo = new LikeVO();
		likeVo.likePost = likePost;
		likeVo.likeMem = likeMem;
		int result = likeDao.getLikeInfo(likeVo);
		if(result==1) {
			likeDao.deleteLikeInfo(likeVo);
			result=0;
		} else {
			likeDao.setLikeInfo(likeVo);
			result=1;
		}
		
		int likeSum = likeDao.getLikeSum(likePost);

		return "{\"result\" : " + result + ", \"likeSum\" : " + likeSum + "}";
	}
	
	@RequestMapping("getLikeSum.do")
	public @ResponseBody String getLikeSum(int postId) throws Exception {
		int result = likeDao.getLikeSum(postId);

		return "{\"result\" : " + result + "}";
	}
	
	@RequestMapping("checkMemId.do")
	public @ResponseBody String checkMemId(@Param("memId") String memId) throws Exception {
		int result = memDao.checkMemId(memId);

		return "{\"result\" : " + result + "}";
	}

	@RequestMapping(value = "/post-update.do", method = RequestMethod.GET)
	public String goUpdatePage(HttpServletRequest req, int postId) throws Exception {
		PostVO postVo = postServ.getPostContent(postId);
		req.setAttribute("postVo", postVo);
		
		return "/insta/post-upload";
	}

	@RequestMapping(value = "/search-member.do", method = RequestMethod.GET)
	public String searchMem(HttpServletRequest req, String searchMem) throws Exception {
		int index = 0;
		List<MemVO> searchMemList = new ArrayList<MemVO>();
		MemVO vo = memDao.getMem(searchMem);
		if(vo!=null) {
			searchMemList.add(0, vo);	
			index += 1;
		}
		List<MemVO> searchList = memDao.searchMem(searchMem);
		for(MemVO memVo:searchList) {
			searchMemList.add(index, memVo);
			index += 1;
		}
		req.setAttribute("searchMemList", searchMemList);
		req.setAttribute("searchKeyword", searchMem);
		
		return "/insta/search-list";
	}
	
	@RequestMapping("loadingPost.do")
	public @ResponseBody List<PostVO> loadingPost(int pageNation, String tag, String area, String location, HttpServletRequest req, HttpSession session) throws Exception {
		List<PostVO> postList = new ArrayList<PostVO>();
		MemVO memVo = (MemVO) session.getAttribute("memVo");
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("memId", memVo.memId);
		paramMap.put("pageNation", pageNation);
		if(tag!=null) {
			paramMap.put("postTag", tag);
			postList = postServ.getPostListByTag(paramMap);
		} else if(area!=null) {
			paramMap.put("addrArea", area);
			postList = postDao.serachPostByArea(paramMap);
			for(int i=0; i<=postList.size()-1; i++) {
				PostVO vo = new PostVO();
				vo = postList.get(i);
				MemVO postMemVo = memDao.getById(vo.memId);
				vo.comList = comDao.getComList(vo.postId);
				vo.sumLike = likeDao.getLikeSum(vo.postId);
				vo.memImg = postMemVo.memImg;
				postList.set(i, vo);
			}
		} else if(location!=null) {
			paramMap.put("addrInfo", location);
			
			postList = postDao.serachPostByLocation(paramMap);
			for(int i=0; i<=postList.size()-1; i++) {
				PostVO vo = new PostVO();
				vo = postList.get(i);
				MemVO postMemVo = memDao.getById(vo.memId);
				vo.comList = comDao.getComList(vo.postId);
				vo.sumLike = likeDao.getLikeSum(vo.postId);
				vo.memImg = postMemVo.memImg;
				postList.set(i, vo);
			}
		} else {
			
			postList = postServ.getPostListContent(paramMap);
		}
		req.setAttribute("postList", postList);
		
		return postList;
	}
	
	@RequestMapping("search-location.do")
	public String searchLocation(String location, HttpServletRequest req) throws Exception {
		int pageNation = 0;
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("addrInfo", location);
		paramMap.put("pageNation", pageNation);
		
		List<PostVO> postList = postDao.serachPostByLocation(paramMap);
		for(int i=0; i<=postList.size()-1; i++) {
			PostVO vo = new PostVO();
			vo = postList.get(i);
			MemVO memVo = memDao.getById(vo.memId);
			vo.comList = comDao.getComList(vo.postId);
			vo.sumLike = likeDao.getLikeSum(vo.postId);
			vo.memImg = memVo.memImg;
			postList.set(i, vo);
		}
		req.setAttribute("postList", postList);
		req.setAttribute("location", location);
		return "insta/index";
	}
	
	@RequestMapping("explorePost.do")
	public String explorePost(String memId, HttpServletRequest req) throws Exception {
		int pageNation = 0;
		
		List<PostVO> postList = postDao.explorePost(pageNation);
		for(int i=0; i<=postList.size()-1; i++) {
			PostVO vo = new PostVO();
			vo = postList.get(i);
			MemVO memVo = memDao.getById(vo.memId);
			vo.memImg = memVo.memImg;
			vo.comList = comDao.getComList(vo.postId);
			vo.sumLike = likeDao.getLikeSum(vo.postId);
			postList.set(i, vo);
		}
		req.setAttribute("postList", postList);
		return "insta/explorePost";
	}
	
	@RequestMapping("loadingExplorer.do")
	public @ResponseBody List<PostVO> loadingExplorer(int pageNation, HttpServletRequest req) throws Exception {
		
		List<PostVO> postList = postDao.explorePost(pageNation);
		for(int i=0; i<=postList.size()-1; i++) {
			PostVO vo = new PostVO();
			vo = postList.get(i);
			MemVO memVo = memDao.getById(vo.memId);
			vo.comList = comDao.getComList(vo.postId);
			vo.sumLike = likeDao.getLikeSum(vo.postId);
			vo.memImg = memVo.memImg;
			postList.set(i, vo);
		}
	
		return postList;
	}

}
