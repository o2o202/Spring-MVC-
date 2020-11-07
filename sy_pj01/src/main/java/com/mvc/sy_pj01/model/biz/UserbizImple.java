package com.mvc.sy_pj01.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.sy_pj01.model.dao.Userdao;
import com.mvc.sy_pj01.model.dto.Userdto;

@Service
public class UserbizImple implements Userbiz {
	
	@Autowired
	private Userdao dao;

	
	//로그인
	@Override
	public Userdto login(Userdto dto) {
		// TODO Auto-generated method stub
		return dao.login(dto);
	}

	@Override
	public int signup(Userdto dto) {
		// TODO Auto-generated method stub
		return dao.signup(dto);
	}

	@Override
	public Userdto phoneChk(String sy_user_phone) {
		// TODO Auto-generated method stub
		return dao.phoneChk(sy_user_phone);
	}
}
