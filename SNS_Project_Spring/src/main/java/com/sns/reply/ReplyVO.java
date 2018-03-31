package com.sns.reply;

public class ReplyVO {
	
	private int rid;
	private int post_pid;
	private int rp_user_uid;
	private String contents;
	private String rdate;
	
	public int getRid() {
		return rid;
	}
	
	public void setRid(int rid) {
		this.rid = rid;
	}
	
	public int getPost_pid() {
		return post_pid;
	}
	
	public void setPost_pid(int post_pid) {
		this.post_pid = post_pid;
	}
	
	public int getRp_user_uid() {
		return rp_user_uid;
	}
	
	public void setRp_user_uid(int rp_user_uid) {
		this.rp_user_uid = rp_user_uid;
	}
	
	public String getContents() {
		return contents;
	}
	
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	public String getRdate() {
		return rdate;
	}
	
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	@Override
	public String toString() {
		return "ReplyVO [rid=" + rid + ", post_pid=" + post_pid + ", rp_user_uid=" + rp_user_uid + ", contents="
				+ contents + ", rdate=" + rdate + "]";
	}

}
