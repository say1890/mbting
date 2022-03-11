package com.juhyang.mbting.like;



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
	public String likeView(HttpServletRequest request,Model model) {
	    /* 날 좋아하는 사람의 정보 가져오기 */
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
        int countLike = likeBO.countSender(userId); // 나를 좋아하는 사람의 수
        model.addAttribute("countLike",countLike);

       
       
        if(countLike!=0) {
        	 List<Integer> idList = likeBO.getHowLikesMe(userId);
        	 List<UserDetail> ListWhoLikesMe = userBO.getProfileWhoLikesMe(idList,userId);
        	 model.addAttribute("likeList", ListWhoLikesMe);
        }
        
		return "/like/seeLike";
	}
	
}
