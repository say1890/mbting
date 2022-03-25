package com.juhyang.mbting.user;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.juhyang.mbting.common.FileManagerService;
import com.juhyang.mbting.like.bo.LikeBO;
import com.juhyang.mbting.user.bo.UserBO;
import com.juhyang.mbting.user.dao.UserDAO;
import com.juhyang.mbting.user.model.User;


@RestController
@RequestMapping("/user")
public class UserRestController {
	@Autowired
	UserBO userBO;
	User user;
	@Autowired
	JavaMailSender mailSender;
	@Autowired
	LikeBO likeBO;
	@Autowired
	UserDAO userDAO;
	// 회원가입
	@RequestMapping("/signup")
	public Map<String,String> signUp(@RequestParam("loginId") String loginId, 
			@RequestParam("password") String password,
			@RequestParam("userName") String userName,
			@RequestParam("birthday") String birthday,
			@RequestParam("sex") String sex,
			@RequestParam("mbti") String mbti,
			@RequestParam("email") String email) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = sdf.parse(birthday);
		Map<String,String> result = new HashMap<>();
		
		  
		userBO.addUser(loginId, password, userName, date, sex, mbti,email);
		
		result.put("result", "가입이 완료됐습니다.");
		return result;
	}
	
	
	// 로그인 
	@PostMapping("/signin")
	public  Map<String,String> signIn(@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			HttpServletRequest request
			){
		Map<String,String> result = new HashMap<>();
		User user = userBO.getUser(loginId, password);
		if(user != null) {
			// 로그인 성공
			result.put("result", "success");
			HttpSession session = request.getSession();
			
			// id, loginId, name
			session.setAttribute("userId", user.getId());
			session.setAttribute("userLoginId", user.getLoginId());
			session.setAttribute("userName", user.getUserName());
			session.setAttribute("birthday", user.getBirthday());
			session.setAttribute("mbti", user.getMbti());
			session.setAttribute("sex", user.getSex());
			session.setAttribute("introduce", user.getIntroduce());
			session.setAttribute("profile", user.getProfile());
			
			userBO.setLoginTime(user.getId());
		} else {
			// 로그인 실패
			result.put("result", "fail");
		}
		
		return result;
	}
	
	//id 중복 확인
	@RequestMapping("/checkId")
	public Map<String, Boolean>checkId(@RequestParam("loginId") String loginId){
		Map<String,Boolean> result = new HashMap<>();
		boolean exist =userBO.CountUser(loginId);
		result.put("result",exist );
		return result;
	}
	
	
	//이메일 중복 확인
		@RequestMapping("/checkEmail")
		public Map<String, Boolean>checkEmail(@RequestParam("email") String email){
			Map<String,Boolean> result = new HashMap<>();
			int Isexist =userBO.EmailExist(email);
			if(Isexist==1) {
				result.put("result",true );
			}
			else {
				result.put("result",false );
			}
			return result;
		}
	
	
	
	
	

	//비밀번호 찾기
	@RequestMapping("/findPw")
	public String sendMail(
			@RequestParam("email") String email
			) throws MessagingException, UnsupportedEncodingException  {
		
		int result = userBO.EmailExist(email);
		if(result==1){
			Random r = new Random();
			int num = r.nextInt(999999);
			
			
			String setfrom = "say1890@naver.com";
			String tomail = email;
			String title = "[Mbting] 비밀번호 변경 인증 이메일입니다 🍓"; 
			String loginId = userBO.getUserByEmail(email);
			String password = Integer.toString(num);
			userBO.setPassword(loginId, password);
			
			String content = System.getProperty("line.separator") + "안녕하세요 회원님:)"
			+ System.getProperty("line.separator")
			+ "회원님의 id는 " + loginId +" 이고,"
			+ "회원님의 변경된 pw는 " + num + " 입니다." 
			+ System.getProperty("line.separator");
			
			
			
			try {
				
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");

				messageHelper.setFrom(setfrom); 
				messageHelper.setTo(tomail); 
				messageHelper.setSubject(title);
				messageHelper.setText(content); 

				mailSender.send(message);
			} catch (Exception e) {
				return (e.getMessage());
			}

			return "success";
		}else {
			
			return "fail";
		}
			
		}
	
	
	//프로필 수정
	@PostMapping("/editProfile")
	public int editProfile(
			@RequestParam("userName") String userName,
			@RequestParam("introduce") String introduce,
			@RequestParam("mbti") String mbti,
			@RequestParam(value ="myMeritArr[]", required = false) List<String> myMeritArr,
			@RequestParam(value ="myHobbyArr[]", required = false) List<String> myHobbyArr,
			@RequestParam(value ="myCharacterArr[]", required = false) List<String> myCharacterArr,
			@RequestParam(value ="yourMeritArr[]", required = false) List<String> yourMeritArr,
			@RequestParam(value ="yourHobbyArr[]", required = false) List<String> yourHobbyArr,
			@RequestParam(value ="yourCharacterArr[]", required = false) List<String> yourCharacterArr,
			@RequestParam(value ="ageArr[]", required = false) List<String> ageArr,
			@RequestParam(value = "file", required = false) MultipartFile file,
			@RequestParam(value ="password", required = false) String password,
			HttpServletRequest request
			) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		userBO.editBasicInfo(userId,userName,introduce,mbti,file,password);
		User user = userDAO.selectUserById(userId);
		session.setAttribute("profile", user.getProfile());
		session.setAttribute("introduce", user.getIntroduce());
		session.removeAttribute("firstconnection");
		
		return userBO.editMatchingProfile(userId,myMeritArr,myHobbyArr,myCharacterArr, yourMeritArr, yourHobbyArr,yourCharacterArr,ageArr);
		
	}
	
	
	
	
	@GetMapping("/deleteProfile")
	public void deleteProfile(HttpServletRequest request) {
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		User user = userDAO.selectUserById(userId);
		String userProfile = user.getProfile();
		FileManagerService.removeFile(userProfile);
		userBO.removeUserProfile(userId);
		
	}
	
	
	
	
	
	
	}

	

