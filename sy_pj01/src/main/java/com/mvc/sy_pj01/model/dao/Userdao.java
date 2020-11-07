package com.mvc.sy_pj01.model.dao;

import com.mvc.sy_pj01.model.dto.Userdto;

public interface Userdao {
	String NAMESPACE ="sy_user.";
	
	//로그인
	public Userdto login(Userdto dto);
	//회원가입 및 아이디 중복확인
	public int signup(Userdto dto);
	//핸드폰 번호 중복확인
	public Userdto phoneChk(String sy_user_phone);
	

}
