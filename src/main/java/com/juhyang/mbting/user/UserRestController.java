package com.juhyang.mbting.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.juhyang.mbting.user.bo.UserBO;
import com.juhyang.mbting.user.model.User;

@RestController
@RequestMapping("/user")

public class UserRestController {
	@Autowired
	UserBO userBO;
	

	

	
	// 회원가입
	@RequestMapping("/signup")
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
	
	
	// 로그인 
	@PostMapping("/signin")
	public  Map<String,String> signIn(@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			HttpServletRequest request
			){
		Map<String,String> result = new HashMap<>();
		User user = userBO.getUser(loginId, password);
		if(user != null) {
			// 로그인 성공
			result.put("result", "success");
			HttpSession session = request.getSession();
			
			// id, loginId, name
			session.setAttribute("userId", user.getId());
			session.setAttribute("userLoginId", user.getLoginId());
			session.setAttribute("userName", user.getUserName());
			
		} else {
			// 로그인 실패
			result.put("result", "fail");
		}
		
		return result;
	}
	
	//id 중복 확인
	@RequestMapping("/checkId")
	public Map<String, Boolean>checkId(@RequestParam("loginId") String loginId){
		Map<String,Boolean> result = new HashMap<>();
		boolean exist =userBO.CountUser(loginId);
		result.put("result",exist );
		return result;
	}
	
	private MailSender sender;
	public void sendMail() {
		
	}

	
}
