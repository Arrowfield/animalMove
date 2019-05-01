package org.field.bean;

//封装数据
public class Login {
	private int uid ;
	private String uname;
	private String tel;
	private String code;
	
	public Login() {
	}
	
	public Login(String tel) {
		this.tel = tel;
	}
	
	
	
	public Login(String tel, String code) {
		this.tel = tel;
		this.code = code;
	}

	public Login(int uid, String uname, String tel) {
		this.uid = uid;
		this.uname = uname;
		this.tel = tel;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
}
