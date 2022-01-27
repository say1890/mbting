package com.juhyang.mbting;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.juhyang.mbting.bo.UserBO;

@RestController
public class MbtingRestController {
	@Autowired
	UserBO userBO;
	
	@RequestMapping("/sign_up")
	public Map<String,String> signUp(@RequestParam("loginId") String loginId, 
			@RequestParam("password") String password,
			@RequestParam("email") String email) {
		
		Map<String,String> result = new HashMap<>();
		userBO.addUser(loginId, password, email);
		result.put("result", "success");
		return result;
	}
	
	
	@RequestMapping("/checkId")
	public Map<String, Boolean>checkId(@RequestParam("loginId") String loginId){
		Map<String,Boolean> result = new HashMap<>();
		result.put("is_duplication", userBO.CountUser(loginId));
		return result;
	}
	
}
