package lx.edu.team2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lx.edu.team2.dao.CommentDAO;
import lx.edu.team2.dao.FollowDAO;
import lx.edu.team2.dao.LikeDAO;
import lx.edu.team2.dao.MemDAO;
import lx.edu.team2.dao.PostDAO;
import lx.edu.team2.dao.TagDAO;
import lx.edu.team2.vo.MemVO;
import lx.edu.team2.vo.PostVO;

@Service("MemberService")
public class MemberServiceImpl implements MemberService {

@Autowired
MemDAO memDao;
@Autowired
PostDAO postDao;
@Autowired
TagDAO tagDao;
@Autowired
CommentDAO commentDao;
@Autowired
LikeDAO likeDao;
@Autowired
FollowDAO followDao;
	
@Override
public void deleteMemInfo(MemVO memVo) throws Exception {
	List<PostVO> postList = postDao.searchPostId(memVo.memId);
	for(PostVO post:postList) {
		System.out.println("게시물 불러옴 : " + post.postId);
		int countCom = commentDao.getComByPostId(post.postId);
		System.out.println("댓글 카운트함 : " + countCom);
		if(countCom>0) {
			commentDao.deleteCom(post.postId);
			System.out.println("댓글 지움");
		}
		int countTag = tagDao.getTagByPostId(post.postId);
		System.out.println("태그 카운트함 : " + countTag);
		if(countTag>0) {
			tagDao.deleteTag(post.postId);
			System.out.println("태그 지움");
		}
		postDao.deletePost(post.postId);
		System.out.println("게시물 지움");
	}
	// postId 를 select 해서 List형태로 리턴 받고 tag/comment 삭제 후 post 삭제
	// 팔로우 삭제 후 members 삭제
	commentDao.deleteComByMemId(memVo.memId);
	likeDao.deleteLikeByMember(memVo.memId);
	followDao.deleteFollowing(memVo.memId);
	followDao.deleteFollower(memVo.memId);
	memDao.delete(memVo.memId);
	
	}
}
