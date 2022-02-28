package com.juhyang.mbting.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	
	//view
	@RequestMapping("/signin_view")
	public String welcome_view()
	{
		return "admin/signin";
	}
}
