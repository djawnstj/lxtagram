package lx.edu.team2.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lx.edu.team2.vo.PostVO;

@Component
public class PostDAO {
	
	@Autowired
	SqlSession session;
	
	public List<PostVO> getPostList(HashMap<String, Object> map) throws Exception {
		return session.selectList("getPostList", map);
	}
	
	public List<PostVO> explorePost(int pageNation) throws Exception {
		return session.selectList("explorePost", pageNation);
	}
	
	public int addPost(@Param("vo") PostVO vo) throws Exception {
		session.insert("addPost", vo);
		int postId = vo.getPostId();
		return postId;
	}
	
	public int updatePost(@Param("vo") PostVO vo) throws Exception {
		return session.insert("updatePost", vo);
	}
	
	public List<PostVO> searchPostId(String memId) throws Exception {
		return session.selectList("searchPostId", memId);
	}
	
	public PostVO getPostPage(int postId) throws Exception {
		return session.selectOne("getPostPage", postId);
	}
	
	public List<PostVO> serachPostByArea(HashMap<String, Object> map) throws Exception {
		return session.selectList("serachPostByArea", map);
	}
	
	public List<PostVO> serachPostByLocation(HashMap<String, Object> map) throws Exception {
		return session.selectList("serachPostByLocation", map);
	}
	
	public PostVO serachPostByTag(int postId) throws Exception {
		return session.selectOne("serachPostByTag", postId);
	}
	
	public int  deletePost(int postId) throws Exception{
		return  session.delete("deletePost", postId);
	}

}
