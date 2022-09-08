package lx.edu.team2.dao;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lx.edu.team2.vo.MemVO;
import lx.edu.team2.vo.PostVO;

@Repository
public class MemDAO {

	@Autowired
	SqlSession session;
	
	public int register(MemVO vo)  throws Exception {
		return session.insert("register", vo);
	}

	public String checkMemPw(String id)  throws Exception {
		return session.selectOne("checkMemPw", id);
	}
	
	public MemVO getMem(String id)  throws Exception {
		return session.selectOne("getMem", id);
	}
	
	public List<MemVO> getRandomMem(String MemId) throws Exception {
		return session.selectList("getRandomMem", MemId);
	}

	public int delete(String memId) throws Exception {
		return session.delete("delete", memId);
	}

	public MemVO getById(String memId) throws Exception {
		return session.selectOne("getById", memId);
	}

	public int update(MemVO vo) throws Exception {
		return session.update("update", vo);
	}

	public List<PostVO> getPostById(String memId) throws Exception {
		return session.selectList("getPostById",memId);
	}

	public int postCount(String memId) throws Exception{
		return session.selectOne("postCount", memId);
	}

	public int checkMemId(String memId) throws Exception{
		return session.selectOne("checkMemId", memId);
	}

	public List<MemVO> searchMem(String memId) throws Exception{
		return session.selectList("searchMem", memId);
	}
	
}
