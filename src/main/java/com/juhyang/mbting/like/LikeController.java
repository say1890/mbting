package com.juhyang.mbting.like;



import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.juhyang.mbting.like.bo.LikeBO;
import com.juhyang.mbting.user.bo.UserBO;
import com.juhyang.mbting.user.model.UserDetail;

@Controller
@RequestMapping("/like")
public class LikeController {
	@Autowired
	LikeBO likeBO;
	@Autowired
	UserBO userBO;
	@GetMapping("/see_like_view")
	public String likeView(HttpServletRequest request,Model model) throws ParseException {
	    /* 날 좋아하는 사람의 정보 가져오기 */
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
        int countLike = likeBO.countSender(userId); // 나를 좋아하는 사람의 수
        model.addAttribute("countLike",countLike);

        List<UserDetail> ListWhoLikesMe = new ArrayList<>();
        // 나를 좋아하는 사람 리스트
        if(countLike!=0) {
        	 List<Integer> idList = likeBO.getWhoLikesMe(userId);
        	 ListWhoLikesMe = userBO.getProfileWhoLikesMe(idList,userId);
        	 model.addAttribute("likeList", ListWhoLikesMe);
        }
       
        // 내가 좋아하는 사람 리스트
        List<UserDetail> ListWhoILike = new ArrayList<>();
        int SendLike = likeBO.countSendLike(userId);
        if(SendLike!=0) {
        	List<Integer> idList = likeBO.getWhoILike(userId); 
        	ListWhoILike = userBO.getProfileWhoILike(idList,userId);
        	model.addAttribute("likedList", ListWhoILike);
        }
        
        
  
      
        
        
        
        
		return "/like/seeLike";
	}
	
	
	
	
	
	
	
	/*
	int userId = (Integer)session.getAttribute("userId");
	String sex = (String)session.getAttribute("sex");
	if(sex.equals("여")) {
		ChatBO.makeRoom();
	}
	*/
}

