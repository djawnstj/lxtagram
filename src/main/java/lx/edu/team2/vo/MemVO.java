package lx.edu.team2.vo;

public class MemVO {

	public String memId;
	public String memPw;
	public String memPhone;
	public String memName;
	public String memEmail;
	public String memIntroduce;
	public String memImg;
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPw() {
		return memPw;
	}
	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}
	public String getMemPhone() {
		return memPhone;
	}
	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getMemIntroduce() {
		return memIntroduce;
	}
	public void setMemIntroduce(String memIntroduce) {
		this.memIntroduce = memIntroduce;
	}
	public String getMemImg() {
		return memImg;
	}
	public void setMemImg(String memImg) {
		this.memImg = memImg;
	}
	@Override
	public String toString() {
		return "MemVO [memId=" + memId + ", memPw=" + memPw + ", memPhone=" + memPhone + ", memName=" + memName
				+ ", memEmail=" + memEmail + ", memIntroduce=" + memIntroduce + ", memImg=" + memImg + "]";
	}

	
	
}
