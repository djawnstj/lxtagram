package lx.edu.team2.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lx.edu.team2.vo.TagVO;

@Repository
public class TagDAO {

	@Autowired
	SqlSession session;
	
	public int insertTag(TagVO vo) throws Exception {
		return session.insert("insert", vo);
	}
	
	public List<TagVO> selectBypostTag(HashMap<String, Object> map) throws Exception {
		return session.selectList("selectBypostTag", map);
	}
	
	public int deleteTag(int postId) throws Exception {
		return session.delete("deleteTag", postId);
	}
	
	public int getTagByPostId(int postId) throws Exception {
		return session.selectOne("getTagByPostId", postId);
	}
	
}
