package lx.edu.team2.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lx.edu.team2.dao.CommentDAO;
import lx.edu.team2.dao.LikeDAO;
import lx.edu.team2.dao.MemDAO;
import lx.edu.team2.dao.PostDAO;
import lx.edu.team2.dao.TagDAO;
import lx.edu.team2.vo.MemVO;
import lx.edu.team2.vo.PostVO;
import lx.edu.team2.vo.TagVO;

@Service("PostService")
public class PostServiceImpl implements PostService {
	
	@Autowired
	PostDAO postDao;	
	@Autowired
	CommentDAO comDao;
	@Autowired
	LikeDAO likeDao;
	@Autowired
	TagDAO tagDao;
	@Autowired
	MemDAO memDao;
	
	@Override
	public List<PostVO> getPostListContent(HashMap<String, Object> map) throws Exception {
		PostVO vo = new PostVO();
		List<PostVO> postList = postDao.getPostList(map);
		for(int i=0; i<=postList.size()-1; i++) {
			vo = postList.get(i);
			MemVO memVo = memDao.getById(vo.memId);
			vo.memImg = memVo.memImg;
			vo.comList = comDao.getComList(vo.postId);
			vo.sumLike = likeDao.getLikeSum(vo.postId);
			postList.set(i, vo);
		}

		return postList;
	}
	
	@Override
	public List<PostVO> getPostListByTag(HashMap<String, Object> paramMap) throws Exception {
		List<TagVO> tagList = tagDao.selectBypostTag(paramMap);
		List<PostVO> postList = new ArrayList<PostVO>();
		
		for(TagVO vo : tagList) {
			PostVO postVo = postDao.serachPostByTag(vo.postNo);
			MemVO selectMemVo = memDao.getById(postVo.memId);
			postVo.memImg = selectMemVo.memImg;
			postList.add(postVo);
			postVo.comList = comDao.getComList(postVo.postId);
			postVo.sumLike = likeDao.getLikeSum(postVo.postId);
		}

		return postList;
	}
	
	@Override
	public PostVO getPostContent(int postId) throws Exception {
		PostVO postVo = postDao.getPostPage(postId);

		postVo.comList = comDao.getComList(postVo.postId);
		postVo.sumLike = likeDao.getLikeSum(postVo.postId);

		return postVo;
	}
	
	@Override
	public void deletePostInfo(int postId) throws Exception {
		tagDao.deleteTag(postId);
		comDao.deleteCom(postId);
		postDao.deletePost(postId);
	}

}
