package lx.edu.team2.vo;

public class CommentVO {
	
	public int comId;
	public String comment;
	public int postId;
	public String comMem;
	public String comTime;
	
	@Override
	public String toString() {
		return "CommentVO [comId=" + comId + ", comment=" + comment + ", postId=" + postId + ", comMem=" + comMem
				+ ", comTime=" + comTime + "]";
	}
	
	public int getComId() {
		return comId;
	}
	public void setComId(int comId) {
		this.comId = comId;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public String getComMem() {
		return comMem;
	}
	public void setComMem(String comMem) {
		this.comMem = comMem;
	}
	public String getComTime() {
		return comTime;
	}
	public void setComTime(String comTime) {
		this.comTime = comTime;
	}
	
}
