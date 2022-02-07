package com.juhyang.mbting.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.juhyang.mbting.user.bo.UserBO;
import com.juhyang.mbting.user.dao.UserDAO;
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
	
	@RequestMapping("/selectbox")
	public String select_view()
	{
		return "user/selectBox";
	}
	
	@RequestMapping("/find_id_view")
	public String findID_view()
	{
		return "user/findId";
	}
	
	@RequestMapping("/find_pw_view")
	public String findPW_view()
	{
		return "user/findPw";
	}
	
	
}
