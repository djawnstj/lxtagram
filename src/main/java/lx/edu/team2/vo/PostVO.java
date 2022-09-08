package lx.edu.team2.vo;

import java.util.List;

public class PostVO {
	public int postId;
	public String post;
	public String postImg;
	public String memId;
	public String memImg;
	public String postTime;
	public String addrInfo;
	public String addrArea;
	public List<CommentVO> comList;
	public int sumLike;
	
	@Override
	public String toString() {
		return "PostVO [postId=" + postId + ", post=" + post + ", postImg=" + postImg + ", memId=" + memId + ", memImg="
				+ memImg + ", postTime=" + postTime + ", addrInfo=" + addrInfo + ", addrArea=" + addrArea + ", comList="
				+ comList + ", sumLike=" + sumLike + "]";
	}
	
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getPostImg() {
		return postImg;
	}
	public void setPostImg(String postImg) {
		this.postImg = postImg;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemImg() {
		return memImg;
	}
	public void setMemImg(String memImg) {
		this.memImg = memImg;
	}
	public String getPostTime() {
		return postTime;
	}
	public void setPostTime(String postTime) {
		this.postTime = postTime;
	}
	public String getAddrInfo() {
		return addrInfo;
	}
	public void setAddrInfo(String addrInfo) {
		this.addrInfo = addrInfo;
	}
	public String getAddrArea() {
		return addrArea;
	}
	public void setAddrArea(String addrArea) {
		this.addrArea = addrArea;
	}
	public List<CommentVO> getComList() {
		return comList;
	}
	public void setComList(List<CommentVO> comList) {
		this.comList = comList;
	}
	public int getSumLike() {
		return sumLike;
	}
	public void setSumLike(int sumLike) {
		this.sumLike = sumLike;
	}

}
