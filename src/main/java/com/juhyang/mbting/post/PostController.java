package com.juhyang.mbting.post;

import java.text.ParseException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.juhyang.mbting.comment.bo.CommentBO;
import com.juhyang.mbting.post.bo.PostBO;
import com.juhyang.mbting.post.model.Post;
import com.juhyang.mbting.user.bo.UserBO;
import com.juhyang.mbting.user.model.UserCharacter;
import com.juhyang.mbting.user.model.UserDetail;

@Controller
@RequestMapping("/post")
public class PostController {
	@Autowired
	PostBO postBO;
	@Autowired
	CommentBO commentBO;
	@Autowired
	UserBO userBO;
	
	@GetMapping("/main")
	public String main_view(
			HttpServletRequest request
			, Model model) throws ParseException {
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		String userName = (String)session.getAttribute("userName");	
		String profile = (String)session.getAttribute("profile");
		String mbti = (String)session.getAttribute("mbti");
		String sex = (String)session.getAttribute("sex");
		Post post;
		
		
		/* 오늘의 질문 받아오기 */
		LocalDate now = LocalDate.now();
        List<Post> questionList = postBO.getQuestionForMain(now);
       

        try{ 
        	 Integer PostId = postBO.getPostId(now);
        	 List<Post> commentList = commentBO.getCommentForMain(PostId);
        	 model.addAttribute("commentList", commentList);
        }
        catch(NullPointerException e) { 
        	System.out.print("post 없음"); 
        } 	
        
        
        
        model.addAttribute("today", now);
        model.addAttribute("questionList", questionList);
		
		
        
        /* 오늘의 추천 받아오기 */
        List<UserDetail> userList = userBO.getRecommendedUser(userId,sex);
        model.addAttribute("userList", userList);

        
		return "/post/main";
	}
	
	
	
}
