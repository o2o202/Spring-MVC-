package com.mvc.sy_pj01.model.dto;

public class Userdto {
	private int sy_user_no;
	private String sy_user_id;
	private String sy_user_pw;
	private String sy_user_name;
	private String sy_user_phone;

	public Userdto() {
		super();
	}

	public Userdto(int sy_user_no, String sy_user_id, String sy_user_pw, String sy_user_name, String sy_user_phone) {
		super();
		this.sy_user_no = sy_user_no;
		this.sy_user_id = sy_user_id;
		this.sy_user_pw = sy_user_pw;
		this.sy_user_name = sy_user_name;
		this.sy_user_phone = sy_user_phone;
	}

	public int getSy_user_no() {
		return sy_user_no;
	}

	public void setSy_user_no(int sy_user_no) {
		this.sy_user_no = sy_user_no;
	}

	public String getSy_user_id() {
		return sy_user_id;
	}

	public void setSy_user_id(String sy_user_id) {
		this.sy_user_id = sy_user_id;
	}

	public String getSy_user_pw() {
		return sy_user_pw;
	}

	public void setSy_user_pw(String sy_user_pw) {
		this.sy_user_pw = sy_user_pw;
	}

	public String getSy_user_name() {
		return sy_user_name;
	}

	public void setSy_user_name(String sy_user_name) {
		this.sy_user_name = sy_user_name;
	}

	public String getSy_user_phone() {
		return sy_user_phone;
	}

	public void setSy_user_phone(String sy_user_phone) {
		this.sy_user_phone = sy_user_phone;
	}

	@Override
	public String toString() {
		return "Userdto [sy_user_no=" + sy_user_no + ", sy_user_id=" + sy_user_id + ", sy_user_pw=" + sy_user_pw
				+ ", sy_user_name=" + sy_user_name + ", sy_user_phone=" + sy_user_phone + "]";
	}

}
