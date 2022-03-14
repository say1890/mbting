package com.juhyang.mbting.chat;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.juhyang.mbting.chat.bo.ChatBO;
import com.juhyang.mbting.chat.model.ChatDetail;
import com.juhyang.mbting.chat.model.ChatOriginal;
import com.juhyang.mbting.user.bo.UserBO;
import com.juhyang.mbting.user.model.User;
import com.juhyang.mbting.user.model.UserDetail;


@Controller
public class ChatController {
	
	@Autowired
	ChatBO chatBO; 
	@Autowired
	UserBO userBO;
	
	@GetMapping("/chat")
	public String chat(HttpServletRequest request,  Model model) {
		HttpSession session = request.getSession();
		
		return "/chat/chat";
	}
	
	
	@GetMapping("/chattingList")
	public String chattingListView(HttpServletRequest request,  Model model) {
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		String sex = (String)session.getAttribute("sex");
		String userName = (String)session.getAttribute("userName");
		// 사용자의 채팅방 번호 조회
		List<ChatOriginal> room = chatBO.getRoomList(userId);
		
		
		
		List<ChatDetail> chatDetail = new ArrayList<>();
		
			for(ChatOriginal original: room) {
				List<UserDetail> userDetail = new ArrayList<>();
				List<ChatOriginal> chatOriginal =  new ArrayList<>();
					int hisId =	original.getMan();
					UserDetail he = userBO.getUserProfile(hisId);
					userDetail.add(he);
					ChatDetail chat = new ChatDetail();
					int herId =	original.getWoman();
					UserDetail she = userBO.getUserProfile(herId);
					userDetail.add(she);
					chat.setUser(userDetail);
					chat.setChat(original);
					chatDetail.add(chat);
					}
				
		model.addAttribute("chatDetail", chatDetail);
	
		
		
		
		
		return "/chat/ChattingList";
	}
	
	
	
	
	
	
	
}
