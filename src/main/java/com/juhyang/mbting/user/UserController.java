package com.juhyang.mbting.user;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/user")
public class UserController {


	
	//view
	@RequestMapping("/signin_view")
	public String welcome_view()
	{
		return "user/signin";
	}
	@RequestMapping("/signup_view")
	public String signup_view()
	{
		return "user/signup";
	}
	
	
	@RequestMapping("/find_info_view")
	public String findID_view()
	{
		return "user/findInfo";
	}
	
	@RequestMapping("/mypage_view")
	public String myPage_view() {

		return "user/myPage";
	}
	
	@RequestMapping("/mypage_edit_view")
	public String editprofile_view(HttpServletRequest request
			) {
		HttpSession session = request.getSession();
		String mbti = (String)session.getAttribute("mbti");
		return "user/editProfile";
	}
	
	//id 중복 확인
		@RequestMapping("/sign_out")
		public String signOut(HttpServletRequest request) {
			
			HttpSession session = request.getSession();
			
			// 세션에 회원 정보 제거 
			session.removeAttribute("userId");
			session.removeAttribute("userLoginId");
			session.removeAttribute("userName");
			session.removeAttribute("profile");
			
			return "redirect:/user/signin_view";
		}
}
