package lx.edu.team2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lx.edu.team2.utils.HashTag;
import lx.edu.team2.dao.TagDAO;
import lx.edu.team2.vo.TagVO;

@Service("TagService")
public class TagServiceImpl implements TagService {
	HashTag tag = new HashTag();

	@Autowired
	TagDAO tagDao;

	@Override
	public void insertTag(int postId, String post) throws Exception {
		TagVO vo = new TagVO();
		vo.postNo = postId;
		System.out.println(vo.postNo);
		List<String> list = tag.setLinkHashTag(post);
		
		for (int i = 0; i <= list.size() - 2; i++) {
			vo.postTag = list.get(i);
			tagDao.insertTag(vo);
		}

	}

	@Override
	public void updateTag(int postId, String post) throws Exception {
		TagVO vo = new TagVO();
		vo.postNo = postId;
		System.out.println(vo.postNo);
		List<String> list = tag.setLinkHashTag(post);
		
		tagDao.deleteTag(postId);
		
		for (int i = 0; i <= list.size() - 2; i++) {
			vo.postTag = list.get(i);
			tagDao.insertTag(vo);
		}
		
	}

}
