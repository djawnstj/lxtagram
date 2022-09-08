package lx.edu.team2.service;

import java.util.HashMap;
import java.util.List;

import lx.edu.team2.vo.PostVO;

public interface PostService {

	public List<PostVO> getPostListContent(HashMap<String, Object> map) throws Exception;

	public List<PostVO> getPostListByTag(HashMap<String, Object> paramMap) throws Exception;
	
	public PostVO getPostContent(int postId) throws Exception;
	
	public void deletePostInfo(int postId) throws Exception;
	
}
