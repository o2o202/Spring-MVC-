package com.mvc.sy_pj01;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvc.sy_pj01.model.biz.Userbiz;
import com.mvc.sy_pj01.model.dto.Userdto;


@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired Userbiz ubiz;
	
	//index에서 넘어오는 화면
	@RequestMapping("sign.do")
	public String sign() {
		logger.info("sign.do");
		return "Login/Login";
	}
	
	//로그인 처리
	@RequestMapping(value = "/Login.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> Login(HttpSession session, @RequestBody Userdto dto) {
		logger.info("Login.do");
		Userdto login = ubiz.login(dto);
		System.out.println(login);
		System.out.println(dto);
		boolean chk = false;
		if(login != null) {
			session.setAttribute("login", login);
			session.setAttribute("user_id", login.getSy_user_id());
			chk = true;
		}
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("chk", chk);
		
		return map;
	}
	
	//회원가입화면으로 넘어감
	@RequestMapping("signup.do")
	public String signup() {
		logger.info("signup.do");
		return "Login/sign_up";
	}
	
	//회원가입 처리
	@RequestMapping("sign_upres.do")
	public String signupres(Userdto dto) {
		logger.info("sign_upres.do");
		int res = 0;
		res = ubiz.signup(dto);
		
		if(res>0) {
			return "redirect:sign.do";
		} else {
			return "Login.do";
		}
	}
	
	//아이디 확인
	@RequestMapping(value = "/idChk.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> idChk(@RequestBody Userdto dto){
		logger.info("idchk.do");
		Userdto res = ubiz.login(dto);
		boolean chk = false;
		if(res == null) {
			chk= true;
		}else {
			chk= false;
		}
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("chk",chk);
		
		return map;
	}
	
	//휴대폰 번호 중복 확인
		@RequestMapping(value = "/phone_reg.do", method = RequestMethod.POST)
		@ResponseBody
		public Map<String, Boolean> phone_reg(@RequestBody String sy_user_phone){
			logger.info("idchk.do");
			Userdto res = ubiz.phoneChk(sy_user_phone);
			boolean chk = false;
			if(res == null) {
				chk= true;
			}else {
				chk=false;
			}
			Map<String, Boolean> map = new HashMap<String, Boolean>();
			map.put("chk",chk);
			
			return map;
		}
	
}
