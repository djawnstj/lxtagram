package lx.edu.team2.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lx.edu.team2.dao.FollowDAO;
import lx.edu.team2.vo.FollowVO;

@Service("FollowSevice")
public class FollowServiceImpl implements FollowService {

	@Autowired
	FollowDAO followDAO;

	@Override
	public List<FollowVO> getFollower(Map<String, String> FollowerInfo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<FollowVO> getFollowing(Map<String, String> FollowerInfo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void DeleteFollowing(FollowVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void InsertFollowing(FollowVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean IsFollowing(FollowVO vo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int getCountFollowing(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getCountFollower(String id) {
		// TODO Auto-generated method stub
		return 0;
	}
}
