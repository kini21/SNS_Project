 package com.sns.post.file;

public class PostFileVO {
	
	private int pid;
	private String group_key;
	private int file_key;
	private String file_realname;
	private String file_name;
	private String file_path;
	private int file_length;
	private String file_type;
	private String del_yn;
	private String reg_id;
	private String reg_date;
	private String chg_id;
	private String chg_date;
	
	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getGroup_key() {
		return group_key;
	}

	public void setGroup_key(String group_key) {
		this.group_key = group_key;
	}

	public int getFile_key() {
		return file_key;
	}

	public void setFile_key(int file_key) {
		this.file_key = file_key;
	}

	public String getFile_realname() {
		return file_realname;
	}

	public void setFile_realname(String file_realname) {
		this.file_realname = file_realname;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	public int getFile_length() {
		return file_length;
	}

	public void setFile_length(int file_length) {
		this.file_length = file_length;
	}

	public String getFile_type() {
		return file_type;
	}

	public void setFile_type(String file_type) {
		this.file_type = file_type;
	}

	public String getDel_yn() {
		return del_yn;
	}

	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}

	public String getReg_id() {
		return reg_id;
	}

	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getChg_id() {
		return chg_id;
	}

	public void setChg_id(String chg_id) {
		this.chg_id = chg_id;
	}

	public String getChg_date() {
		return chg_date;
	}

	public void setChg_date(String chg_date) {
		this.chg_date = chg_date;
	}

	@Override
	public String toString() {
		return "PostFileVO [pid=" + pid + ", group_key=" + group_key + ", file_key=" + file_key + ", file_realname="
				+ file_realname + ", file_name=" + file_name + ", file_path=" + file_path + ", file_length="
				+ file_length + ", file_type=" + file_type + ", del_yn=" + del_yn + ", reg_id=" + reg_id + ", reg_date="
				+ reg_date + ", chg_id=" + chg_id + ", chg_date=" + chg_date + "]";
	}

}
