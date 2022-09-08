package lx.edu.team2.service;

import java.util.List;
import java.util.Map;

import lx.edu.team2.vo.FollowVO;

public interface FollowService {
	
	public List<FollowVO> getFollower(Map<String, String> FollowerInfo);
	
	public List<FollowVO> getFollowing(Map<String, String> FollowerInfo);
	
	public void DeleteFollowing(FollowVO vo);
	
	public void InsertFollowing(FollowVO vo);
	
	public boolean IsFollowing(FollowVO vo);
	
	public int getCountFollowing(String id);
	
	public int getCountFollower(String id);
}
