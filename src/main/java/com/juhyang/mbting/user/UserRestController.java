package com.juhyang.mbting.user;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.juhyang.mbting.user.bo.UserBO;
import com.juhyang.mbting.user.model.User;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserRestController {
	@Autowired
	UserBO userBO;
	User user;
	@Autowired
	JavaMailSender mailSender;

	
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
			session.setAttribute("introduce", user.getIntroduce());
			session.setAttribute("profile", user.getProfile());
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
	@PostMapping("/editProfile")
	public String editProfile() {
		return null;
		
	}
	
	@GetMapping("/getRecommendedKeyword")
	public String json(Locale locale, Model model) {    
	    String[] merit = {
	    		"머릿결이 좋은","예쁜 눈","큰 키","꿀같은 목소리","애교쟁이","듬직한","날씬한","웃는게 예쁜",
	    		"노래를 잘하는","웃긴","좋은 향기가 나는","꿀피부","청순한","진중한","해바라기","무쌍","속쌍","겉쌍"
	    		,"도톰한입술"
	    };
	    
	    String[] hobby = {"운동", "요리", "산책", "악기 연주","언어 공부","쇼핑","넷플릭스", "그림 그리기"
	    		,"노래 부르기","여행 가기","독서","음악 감상","사진 찍기","춤","낚시", "애니메이션"};
	    
	    String[] personality = {"감성적인", "내성적인", "외향적인", "열정적인","섬세한","배려깊은","센스있는"
	    		,"눈치있는","신중한","현실적인","당당한","적극적인","4차원","솔직한"};
	    
	    
	    
	        Gson gson = new Gson();
	         
	    return gson.toJson(personality); // 배열 반환
	}
	
	
	}

	

