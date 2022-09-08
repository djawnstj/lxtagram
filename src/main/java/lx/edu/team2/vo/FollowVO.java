package lx.edu.team2.vo;

public class FollowVO {
	public int folId;
	public String memId;
	public String following;
	
	public int getFolId() {
		return folId;
	}
	public void setFolId(int folId) {
		this.folId = folId;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getFollowing() {
		return following;
	}
	public void setFollowing(String following) {
		this.following = following;
	}
	@Override
	public String toString() {
		return "FollowVO [folId=" + folId + ", memId=" + memId + ", following=" + following + "]";
	}
	
	
}
