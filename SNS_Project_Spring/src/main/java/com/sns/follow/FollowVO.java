package com.sns.follow;

public class FollowVO {
	private int from_uid;
	private int to_uid;
	
	public int getFrom_uid() {
		return from_uid;
	}
	public void setFrom_uid(int from_uid) {
		this.from_uid = from_uid;
	}
	public int getTo_uid() {
		return to_uid;
	}
	public void setTo_uid(int to_uid) {
		this.to_uid = to_uid;
	}
	
	@Override
	public String toString() {
		return "FollowVO [from_uid=" + from_uid + ", to_uid=" + to_uid + "]";
	}
	
}
