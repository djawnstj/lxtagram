package lx.edu.team2.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lx.edu.team2.vo.CommentVO;

@Component
public class CommentDAO {
	
	@Autowired
	SqlSession session;
	
	public int setCom(@Param("vo") CommentVO vo) throws Exception {
		session.insert("setCom", vo);
		int comId = vo.getComId();
		return comId;
	}
	
	public CommentVO getCom(int comId) throws Exception {
		return session.selectOne("getCom", comId);
	}
	
	public List<CommentVO> getComList(int postId) throws Exception {
		return session.selectList("getComList", postId);
	}
	
	public int deleteCom(int postId) throws Exception {
		return session.delete("deleteCom", postId);
	}
	
	public int deleteComByMemId(String memId) throws Exception {
		return session.delete("deleteComByMemId", memId);
	}
	
	public int getComByPostId(int postId) throws Exception {
		return session.selectOne("getComByPostId", postId);
	}

}
