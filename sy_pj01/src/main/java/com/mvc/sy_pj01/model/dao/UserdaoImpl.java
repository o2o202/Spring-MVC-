package com.mvc.sy_pj01.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.sy_pj01.model.dto.Userdto;

@Repository
public class UserdaoImpl implements Userdao {
	@Autowired
	private SqlSessionTemplate sqlsession;

	private Logger logger = LoggerFactory.getLogger(Userdao.class);
	
	//로그인
	@Override
	public Userdto login(Userdto dto) {
		logger.info("Login dao");
		Userdto res = null;
		res = sqlsession.selectOne(NAMESPACE+"Login", dto);
		return res;
	}
	
	//회원가입
	@Override
	public int signup(Userdto dto) {
		logger.info("Sign_up dao");
		int res = 0;
		res = sqlsession.insert(NAMESPACE+"signup", dto);
		return res;
	}
	
	//핸드폰 중복확인
	@Override
	public Userdto phoneChk(String sy_user_phone) {
		Userdto res = null;
		res = sqlsession.selectOne(NAMESPACE+"phoneChk", sy_user_phone);
		return res;
	}

	

}
