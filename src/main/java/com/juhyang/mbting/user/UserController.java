package com.juhyang.mbting.user;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.juhyang.mbting.like.bo.LikeBO;
import com.juhyang.mbting.post.bo.PostBO;
import com.juhyang.mbting.post.model.PostForMyPage;
import com.juhyang.mbting.user.bo.UserBO;
import com.juhyang.mbting.user.model.UserCharacter;


@Controller
@RequestMapping("/user")
public class UserController {

	
	@Autowired
	UserBO userBO;
	
	@Autowired
	LikeBO likeBO;
	
	@Autowired
	PostBO postBO;
	
	//view
	@RequestMapping("/signin_view")
	public String welcome_view()
	{
		return "user/signin";
	}
	@RequestMapping("/signup_view")
	public String signup_view()
	{
		return "user/signup";
	}
	
	
	@RequestMapping("/find_info_view")
	public String findID_view()
	{
		return "user/findInfo";
	}
	
	@RequestMapping("/mypage_view")
	public String myPage_view(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		List<PostForMyPage> postlist = postBO.getPostListForMypage(userId);
		model.addAttribute("postlist", postlist);
		
		
        int countLike = likeBO.countSender(userId); // 나를 좋아하는 사람의 수 
        model.addAttribute("countLike",countLike);
		
		return "user/myPage";
	}
	
	@RequestMapping("/mypage_edit_view")
	public String editprofile_view(HttpServletRequest request
			,Model model
			) {
		HttpSession session = request.getSession();
		String mbti = (String)session.getAttribute("mbti");
		String introduce = (String)session.getAttribute("introduce");
		int userId = (Integer)session.getAttribute("userId");
		
		//장점
		List<String> merit = userBO.getmeritContent();
		model.addAttribute("merit", merit);
		
		//성격
		List<String> character = userBO.getCharacterContent();
		model.addAttribute("character", character);
		
		//취미
		List<String> hobby = userBO.gethobbyContent();
		model.addAttribute("hobby", hobby);
		
		//나이
		List<String> age = userBO.getageContent();
		model.addAttribute("age", age);
	
		// 사용자가 선택한 옵션
		List<UserCharacter> SelectedOptions = userBO.getSelectOptions(userId);
		model.addAttribute("SelectedOptions", SelectedOptions);
		System.out.print(SelectedOptions);
		
		
		return "user/editProfile";
	}
	
	//id 중복 확인
		@RequestMapping("/sign_out")
		public String signOut(HttpServletRequest request) {
			
			HttpSession session = request.getSession();
			
			// 세션에 회원 정보 제거 
			session.removeAttribute("userId");
			session.removeAttribute("userLoginId");
			session.removeAttribute("userName");
			session.removeAttribute("profile");
			
			return "redirect:/user/signin_view";
		}
}
