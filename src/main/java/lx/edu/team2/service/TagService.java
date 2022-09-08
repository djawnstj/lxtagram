package lx.edu.team2.service;

import lx.edu.team2.vo.TagVO;

public interface TagService {
	
	public void insertTag(int postId, String post) throws Exception;
	
	public void updateTag(int postId, String post) throws Exception;
	

}
