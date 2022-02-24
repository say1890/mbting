package com.juhyang.mbting.user;


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
	public String editprofile_view() {
		return "user/editProfile";
	}
	
	
}
