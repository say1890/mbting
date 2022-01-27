package com.juhyang.mbting;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.juhyang.mbting.bo.UserBO;
import com.juhyang.mbting.dao.UserDAO;
@Controller
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
	@RequestMapping("/test")
	public String test_view()
	{
		return "welcome/test";
	}
	@RequestMapping("/selectbox")
	public String select_view()
	{
		return "welcome/selectBox";
	}
	
	
	
	//api
	
	
}
