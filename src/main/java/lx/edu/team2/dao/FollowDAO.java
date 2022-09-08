package lx.edu.team2.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lx.edu.team2.vo.FollowVO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

@Repository
public class FollowDAO {
	
	@Autowired
	SqlSession session;
	
	public List<FollowVO> getFollower(Map<String, String> FollowerInfo) {
		return session.selectList("getFollower", FollowerInfo);
	}
	
	public List<FollowVO> getFollowing(Map<String, String> FollowingInfo) {
		return session.selectList("getFollowing", FollowingInfo);
	}
	
	public void deleteFollowing(String memId) {
		session.delete("deleteFollowing", memId);
	}
	
	public void deleteFollower(String memId) {
		session.delete("deleteFollower", memId);
	}
	
	public boolean IsFollowing(FollowVO vo) {
		int result = session.selectOne("IsFollowing", vo);
		
		if(result >=1)
			return true;
		else
			return false;
	}
	
	public int getCountFollowing (String id) {
		return session.selectOne("getCountFollowing", id);
	}
	
	public int getCountFollower (String id) {
		return session.selectOne("getCountFollower", id);
	}
	
	public int dofollow (FollowVO vo) {
		return session.insert("dofollow", vo);
	}

	public int followCheck(FollowVO vo) throws Exception{
		return session.selectOne("followCheck", vo);
	}

	public int dounfollow(FollowVO vo) {
		return session.delete("dounfollow", vo);
	}

	public int counterFollowCheck(FollowVO vo) {
		return session.selectOne("counterFollowCheck", vo);
	}
}
