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
import com.juhyang.mbting.post.model.post;

@Controller
@RequestMapping("/post")
public class PostController {
	@Autowired
	PostBO postBO;
	@Autowired
	CommentBO commentBO;
	
	@GetMapping("/main")
	public String main_view(
			HttpServletRequest request
			, Model model) throws ParseException {
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		String userName = (String)session.getAttribute("userName");	
		String profile = (String)session.getAttribute("profile");
		String mbti = (String)session.getAttribute("mbti");
		post post;
		
		LocalDate now = LocalDate.now();
        
        List<post> questionList = postBO.getQuestionForMain(now);
        int PostId = postBO.getPostId(now);
        List<post> commentList = commentBO.getCommentForMain(PostId);
        model.addAttribute("today", now);
        model.addAttribute("questionList", questionList);
		model.addAttribute("commentList", commentList);
		
		return "/post/main";
	}
	
	
	
}
