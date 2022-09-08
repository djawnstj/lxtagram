package lx.edu.team2.vo;

public class TagVO {
	public String postTagId;
	public String postTag;
	public int postNo;
	
	public String getPostTagId() {
		return postTagId;
	}
	public void setPostTagId(String postTagId) {
		this.postTagId = postTagId;
	}
	public String getPostTag() {
		return postTag;
	}
	public void setPostTag(String postTag) {
		this.postTag = postTag;
	}
	public int getPostNo() {
		return postNo;
	}
	@Override
	public String toString() {
		return "TagVO [postTagId=" + postTagId + ", postTag=" + postTag + ", postNo=" + postNo + "]";
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	
}
