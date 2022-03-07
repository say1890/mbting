package com.juhyang.mbting.chat;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChatController {
	@GetMapping("/chat")
	public String chat() {
		return "/chat/chat";
	}
}
