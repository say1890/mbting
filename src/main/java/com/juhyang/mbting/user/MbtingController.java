package com.juhyang.mbting.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.juhyang.mbting.user.bo.UserBO;
import com.juhyang.mbting.user.dao.UserDAO;
@Controller
@RequestMapping("/user")
public class MbtingController {

	//autowired
	@Autowired
	UserBO userBO;
	UserDAO userDAO;
	
	
	//view
	@RequestMapping("/welcome")
	public String welcome_view()
	{
		return "welcome/welcome";
	}
	@RequestMapping("/join")
	public String join_view()
	{
		return "welcome/join";
	}
	
	@RequestMapping("/selectbox")
	public String select_view()
	{
		return "welcome/selectBox";
	}
	
	
	
	//api
	
	
}
