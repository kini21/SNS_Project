package com.sns.message;

public class MessageVO {
	private int mid;
	private int from_uid;
	private int to_uid;
	private String from_del;
	private String to_del;
	private String contents;
	private String mdate;
	private String receiver;
	private String sender;
	private String receiverAndSender;
	private String loginid;
	private int msgCnt;

	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
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
	public String getFrom_del() {
		return from_del;
	}
	public void setFrom_del(String from_del) {
		this.from_del = from_del;
	}
	public String getTo_del() {
		return to_del;
	}
	public void setTo_del(String to_del) {
		this.to_del = to_del;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getMdate() {
		return mdate;
	}
	public void setMdate(String mdate) {
		this.mdate = mdate;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReceiverAndSender() {
		return receiverAndSender;
	}
	public void setReceiverAndSender(String receiverAndSender) {
		this.receiverAndSender = receiverAndSender;
	}
	public String getLoginid() {
		return loginid;
	}
	public void setLoginid(String loginid) {
		this.loginid = loginid;
	}
	public int getMsgCnt() {
		return msgCnt;
	}
	public void setMsgCnt(int msgCnt) {
		this.msgCnt = msgCnt;
	}
	
	@Override
	public String toString() {
		return "MessageVO [mid=" + mid + ", from_uid=" + from_uid + ", to_uid=" + to_uid + ", from_del=" + from_del
				+ ", to_del=" + to_del + ", contents=" + contents + ", mdate=" + mdate + ", receiver=" + receiver
				+ ", sender=" + sender + ", receiverAndSender=" + receiverAndSender + ", loginid=" + loginid
				+ ", msgCnt=" + msgCnt + "]";
	}
}
