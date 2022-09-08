package lx.edu.team2.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lx.edu.team2.vo.LikeVO;

@Component
public class LikeDAO {
	
	@Autowired
	SqlSession session;
	
	public int insertLike(LikeVO vo) throws Exception {
		return session.insert("insertLike", vo);
	}
	
	public int getLikeInfo(LikeVO vo) throws Exception {
		return session.selectOne("getLikeInfo", vo);
	}
	
	public int setLikeInfo(LikeVO vo) throws Exception {
		return session.insert("setLikeInfo", vo);
	}
	
	public int deleteLikeInfo(LikeVO vo) throws Exception {
		return session.delete("deleteLikeInfo", vo);
	}
	
	public int deleteLikeByMember(String memId) throws Exception {
		return session.delete("deleteLikeByMember", memId);
	}
	
	public int getLikeSum(int postId) throws Exception {
		return session.selectOne("getLikeSum", postId);
	}

}
