package com.sns.post;

public class PostVO {
	
	private int pid;
	private String contents;
	private int user_uid;
	private String pdate;
	
	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getUser_uid() {
		return user_uid;
	}

	public void setUser_uid(int user_uid) {
		this.user_uid = user_uid;
	}

	public String getPdate() {
		return pdate;
	}

	public void setPdate(String pdate) {
		this.pdate = pdate;
	}

	@Override
	public String toString() {
		return "PostVO [pid=" + pid + ", contents=" + contents + ", user_uid=" + user_uid + ", pdate=" + pdate + "]";
	}
	
}
