package com.juhyang.mbting.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.juhyang.mbting.post.bo.PostBO;
import com.juhyang.mbting.post.model.post;

@Controller
@RequestMapping("/admin")
public class AdminController {

	
	
	@Autowired
	PostBO postBO;
	
	//view
	@RequestMapping("/add_post_view")
	public String welcome_view()
	{
		return "admin/addPost";
	}
	
	//view
	@RequestMapping("/question_view")
	public String question_view(Model model)
	
	{
		List<post> postlist = postBO.getPostList();
		model.addAttribute("postList", postlist);	
		return "admin/question";
	}
	
}
