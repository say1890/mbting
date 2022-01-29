package com.juhyang.mbting.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.juhyang.mbting.user.bo.UserBO;

@RestController
public class MbtingRestController {
	@Autowired
	UserBO userBO;
	
	@RequestMapping("/sign_up")
	public Map<String,String> signUp(@RequestParam("loginId") String loginId, 
			@RequestParam("password") String password,
			@RequestParam("userName") String userName,
			@RequestParam("sex") String sex,
			@RequestParam("mbti") String mbti,
			@RequestParam("email") String email) {
		
		Map<String,String> result = new HashMap<>();
		userBO.addUser(loginId, password, userName, sex, mbti,email);
		result.put("result", "가입이 완료됐습니다.");
		return result;
	}
	
	
	@RequestMapping("/checkId")
	public Map<String, Boolean>checkId(@RequestParam("loginId") String loginId){
		Map<String,Boolean> result = new HashMap<>();
		boolean exist =userBO.CountUser(loginId);
		result.put("result",exist );
		return result;
	}
	
}
