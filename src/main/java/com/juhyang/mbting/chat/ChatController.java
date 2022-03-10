package com.juhyang.mbting.chat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChatController {
	@GetMapping("/chat")
	public String chat(HttpServletRequest request,  Model model) {
		HttpSession session = request.getSession();
		String userName = (String)session.getAttribute("userName");
		model.addAttribute("userName", userName);
		return "/chat/chat";
	}
	
}
