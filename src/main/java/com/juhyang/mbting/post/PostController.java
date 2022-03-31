package com.juhyang.mbting.post;

import java.text.ParseException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.juhyang.mbting.chat.bo.ChatBO;
import com.juhyang.mbting.chat.model.ChatOriginal;
import com.juhyang.mbting.comment.bo.CommentBO;
import com.juhyang.mbting.like.bo.LikeBO;
import com.juhyang.mbting.post.bo.PostBO;
import com.juhyang.mbting.post.model.Post;
import com.juhyang.mbting.user.bo.UserBO;
import com.juhyang.mbting.user.dao.UserDAO;
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
	@Autowired
	UserDAO userDAO;
	@Autowired
	LikeBO likeBO;
	@Autowired
	ChatBO chatBO; 
	
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
		
		
		/*사용자가 정보 수정을 했는지 확인 */
		List<UserCharacter> list = userBO.checkUserInfo(userId); 
		if(list.isEmpty()) {
			likeBO.sendHate(userId,1);
			session.setAttribute("firstconnection", "yes");	
		}
		else {
			session.removeAttribute("firstconnection");
		}
		
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
        // 사용자가 사용자 정보를 다 입력했을 경우 추천을 받아온다.

        	List<UserDetail> userList = userBO.getRecommendedUser(userId,sex);
        	Collections.sort(userList);
            model.addAttribute("userList", userList);

            /* 날 좋아하는 사람의 정보 가져오기 */
            int countLike = likeBO.countSender(userId); // 나를 좋아하는 사람의 수 
            model.addAttribute("countLike",countLike);
           
            // 내가 좋아하는 사람 리스트
            List<UserDetail> ListWhoILike = new ArrayList<>();
            int SendLike = likeBO.countSendLike(userId);
            if(SendLike!=0) {
            	List<Integer> idList = likeBO.getWhoILike(userId); 
            	ListWhoILike = userBO.getProfileWhoILike(idList,userId);
            	for(UserDetail who:ListWhoILike) {
            		long passedDay = who.getPassedDay();
            		if(passedDay>=5) {
            			int likedId = who.getUser().getId();
            			likeBO.deleteLike(likedId, userId);
            		}
            	}
            }
            
        
        
        /*채팅 상대가 있는지 확인*/
            List<ChatOriginal> room = chatBO.getRoomList(userId);
    		if(!room.isEmpty()) {
    			session.setAttribute("IsRoomExist", "yes");
    		}
    		
		return "/post/main";
	}
	
	@GetMapping("/question")
	public String question_view(Model model)
	{	
		return "/post/question";
	}
	
	
}
