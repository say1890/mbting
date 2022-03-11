package com.juhyang.mbting.user.bo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.juhyang.mbting.common.EncryptUtils;
import com.juhyang.mbting.common.FileManagerService;
import com.juhyang.mbting.like.bo.LikeBO;
import com.juhyang.mbting.user.dao.UserDAO;
import com.juhyang.mbting.user.model.User;
import com.juhyang.mbting.user.model.UserCharacter;
import com.juhyang.mbting.user.model.UserDetail;

@Service
public class UserBO {

	@Autowired
	UserDAO userDAO;
	@Autowired
	LikeBO likeBO;
	//사용자 추가
	public void addUser(String loginId,
			String password,
			String userName,			
			Date birthday,
			String sex,
			String mbti,
			String email) {
	
		String encPw = EncryptUtils.md5(password);
		userDAO.InsertUser(loginId, encPw, userName, birthday, sex, mbti, email);
	}
	//사용자 로그인 과정
	public User getUser(String loginId,String password) {
		return userDAO.selectUser(loginId,  EncryptUtils.md5(password));
	}
	//로그인 아이디 중복 체크
	public boolean CountUser(String loginId) {
		return userDAO.IsDuplicate(loginId);
	}
	
	public int EmailExist(String email) {
		return userDAO.IsEmailExist(email);
	}

	public String getUserByEmail(String email) {
		return userDAO.selectUserByEmail(email);
		
	}
	//비밀번호 설정
	public int setPassword(String loginId, String password) {
		String encPw = EncryptUtils.md5(password);
		return userDAO.updatePassword(loginId, encPw);
	}
	// 매칭 프로필 변경
	public int editMatchingProfile(int userId, List<String> myMeritArr,
			List<String> myHobbyArr, List<String> myCharacterArr, List<String> yourMeritArr, List<String> yourHobbyArr,
			List<String> yourCharacterArr, List<String> ageArr) {
		
		List<String> emptyArr = new ArrayList<>();
		String before = ""; // 마지막 콤마 제거하기 전 문자열
		String mymerit = "";
		
		if(myMeritArr== null) {
			myMeritArr = emptyArr;
		}else {
			before = "";
			for(Object object : myMeritArr) {
			   
				String element = (String) object + ",";
				before +=element;
				mymerit = before.replaceAll(",$", "");
			}
			
		}
		
		
		
		String myHobby = "";
		if(myHobbyArr== null) {
			myHobbyArr = emptyArr;
		
		}else {
			
			before = "";
			for(Object object : myHobbyArr) {
			   
				String element = (String) object + ",";
				before +=element;
				myHobby = before.replaceAll(",$", "");
			}
			System.out.print(myHobby);
		}
		
		
		
		
		
		String myCharacter = "";
		if(myCharacterArr== null) {
			myCharacterArr = emptyArr;
			
		}else {
			before = ""; // 마지막 콤마 제거하기 전 문자열
			
			for(Object object : myCharacterArr) {
			   
				String element = (String) object + ",";
				before +=element;
				myCharacter = before.replaceAll(",$", "");
			}
			System.out.print(myCharacter);
		}
		
		
		String yourMerit = "";
		if(yourMeritArr== null) {
			yourMeritArr = emptyArr;
			
		}else {
			before = ""; // 마지막 콤마 제거하기 전 문자열
			
			for(Object object : yourMeritArr) {
			   
				String element = (String) object + ",";
				before +=element;
				yourMerit = before.replaceAll(",$", "");
			}
			System.out.print(yourMerit);
		}
		
		String yourHobby = "";
		if(yourHobbyArr== null) {
			yourHobbyArr = emptyArr;
		
		}else {
			before = ""; // 마지막 콤마 제거하기 전 문자열
			
			for(Object object : yourHobbyArr) {
			   
				String element = (String) object + ",";
				before +=element;
				yourHobby = before.replaceAll(",$", "");
			}
			System.out.print(yourHobby);
		}
		
		
		String yourCharacter = "";
		if(yourCharacterArr== null) {
			yourCharacterArr = emptyArr;
			
		}else {
			before = ""; // 마지막 콤마 제거하기 전 문자열
			
			for(Object object : yourCharacterArr) {
			   
				String element = (String) object + ",";
				before +=element;
				yourCharacter = before.replaceAll(",$", "");
			}
			
		}
		
		
		String age = "";
		if(ageArr== null) {
			ageArr = emptyArr;
			
		}else {
			before = ""; // 마지막 콤마 제거하기 전 문자열
			
			for(Object object : ageArr) {
			   
				String element = (String) object + ",";
				before +=element;
				age = before.replaceAll(",$", "");
			}
			
		}
		
		
		
		
		return userDAO.updateMatchingProfile(userId,
				mymerit,myHobby, myCharacter, 
				yourMerit, yourHobby,yourCharacter,age);

	}
	// 기본 프로필 변경
	public int editBasicInfo(int userId, String userName, String introduce, String mbti, MultipartFile file) {
		String filePath = FileManagerService.saveFile(userId, file);
		
		return userDAO.updateBasicProfile(userId, userName,introduce,mbti,filePath);
		
	}

	public List<UserCharacter> getSelectOptions(int userId) {
		return userDAO.selectOptions(userId);
		
	}
	


	
	public List<String> getmeritContent() {
		
		return userDAO.selectMeritContent();
	}
	
	public List<String> getCharacterContent() {
		return userDAO.selectCharacterContent();
	}

	public List<String> gethobbyContent() {
		
		return userDAO.selectHobbyContent();
	}

	public List<String> getageContent() {
		return userDAO.selectAgeContent();
	}

	public List<UserDetail> getRecommendedUser(int userId, String sex) {
		//나의 정보를 가져옴
		List<UserCharacter> myInfo = userDAO.selectOptions(userId);

		
		// 내가 원하는 나이
		String ageString = userDAO.getAge(userId);
		if(ageString==null) {
			ageString = "=";
		}
		String[] age = ageString.split(",");
		

		// 부등호 
		String chooseAge = "";
		
		// 나의 나이
		int myage = userDAO.getMyage(userId);
		
		for(String ageTitle: age) {
			if(ageTitle.equals("동갑")) {
				chooseAge = "=";
			}
			else if(ageTitle.equals("연상")) {
				chooseAge = ">";
			}
			else if(ageTitle.equals("연하")) {
				chooseAge = "<";
			}
			else {
				chooseAge = "=";
			}
			
		}
		

		
		//	사용자가 원하는 나이의 user 정보를 가져옴
		List<UserCharacter> yourInfo = userDAO.selectUsers(myage,chooseAge,sex);
		
		
		
		
		// 최종 매칭될 user의 character list
		List<UserDetail> MatchingList = new ArrayList<>();

		

		
		for(UserCharacter your:yourInfo) {
			UserDetail userDetail = new UserDetail();
			int point = 0;
			// 상대의 장점
			String yourMeritString = your.getMyMerit();
			String[] yourMerit = null;
			if(yourMeritString==null) {
				yourMeritString ="기본값,";	
			}
			yourMerit = yourMeritString.split(",");
			
			
			
			// 상대의 취미
			String yourHobbyString = your.getMyHobby();
			String[] yourHobby = null;
			if(yourHobbyString==null) {
				yourHobbyString ="기본값,";
			}
				yourHobby= yourHobbyString.split(",");
			
			
			
			// 상대의 성격
			String yourCharacterString = your.getMyCharacter();
			String[] yourCharacter = null;
			if(yourCharacterString==null) {
				yourCharacterString ="기본값,";
			}
			 yourCharacter = yourCharacterString.split(",");
				
			
			
			
			
			//상대가 바라는 당신의 장점
			String yourIdealMeritString = your.getYourMerit();
			String[] yourIdealMerit =null;
			if(yourIdealMeritString==null) {
				yourIdealMeritString ="기본값,";
			}
			 yourIdealMerit  = yourIdealMeritString.split(",");
			
			
			
			//상대가 바라는 당신의 취미
			String yourIdealHobbyString = your.getYourHobby();
			String[] yourIdealHobby= null;
			if(yourIdealHobbyString==null) {
				yourIdealHobbyString ="기본값,";
			}
				yourIdealHobby= yourIdealHobbyString.split(",");
			
			
			
			
			//상대가 바라는 당신의 성격
			String yourIdealCharacterString = your.getYourCharacter();
			String[] yourIdealCharacter = null;
			if(yourIdealCharacterString==null) {
				yourIdealCharacterString ="기본값,";
			}
				yourIdealCharacter = yourIdealCharacterString.split(",");
			
			
			
			
			
			//상대가 원하는 나이
			String yourIdealAge = userDAO.getAge(your.getUser_id());
			
			for(UserCharacter my:myInfo) {
				// 나의 장점
				String myMeritString = my.getMyMerit();
				String[]  myMerit= null;
				if(myMeritString==null) {
					myMeritString = "기본값,";
				}
			
					myMerit= myMeritString.split(",");
			
				
				// 나의 취미
				String myHobbyString = my.getMyHobby();
				String[] myHobby = null;
				if(myHobbyString==null) {
					myHobbyString = "기본값,";
				}
	
					 myHobby = myHobbyString.split(",");
	
				
				
				// 나의 성격
				String myCharacterString = my.getMyCharacter();
				String[] myCharacter = null;
				if(myCharacterString==null) {
					myCharacterString = "기본값,";
				}
		
					myCharacter = myCharacterString.split(",");
			
				
				
				
				//이상형의 장점
				String  myIdealMeritString = my.getYourMerit();
				String[] myIdealMerit = null;
				if(myIdealMeritString==null) {
					myIdealMeritString = "기본값,";
				}
		
					myIdealMerit = myIdealMeritString.split(",");
		
				
				
				
				// 이상형의 취미
				String myIdealHobbyString = my.getYourHobby();
				String[] myIdealHobby = null;
				if(myIdealHobbyString==null) {
					myIdealHobbyString = "기본값,";
				}
	
					myIdealHobby = myIdealHobbyString.split(",");
		
				
				
			
				
				// 이상형의 성격
				String myIdealCharacterString = my.getMyCharacter();
				String[] myIdealCharacter = null;
				if(myIdealCharacterString==null) {
					myIdealCharacterString = "기본값,";
				}

					myIdealCharacter = myIdealCharacterString.split(",");
				
				
				
			
				
				
				// 장점 비교 반복문 ( 상대 기준 )
				for(int i=0;i<myMerit.length;i++) {
					for(int j=0; j< yourIdealMerit.length;j++) {
						// 만약 내 i번째 장점과 상대가 원하는 나의 j번째 장점이 일치한다면
						if(myMerit[i].equals(yourIdealMerit[j])) {
							point++;
						}
					}
				}
				
				// 장점 비교 반복문 ( 사용자 기준 )
				for(String i:myIdealMerit) {
					
					for(String j:yourMerit) {
						// 만약 내 이상형의 장점과 상대의 장점이 일치할 경우
						if(i.equals(j)) {
							point++;
							userDetail.setMerit(j);
						}
					}
				}
				
				
				
				// 취미 비교 반복문 ( 상대 기준 )
				for(String i:myHobby) {
					
					for(String j:yourIdealHobby) {
						// 만약 내 i번째 취미와 상대가 원하는 나의 j번째 취미가 일치한다면
						if(i.equals(j)) {
							point++;
						}
					}
				}
				
				
				// 취미 비교 반복문 ( 사용자 기준 )
				for(String i:myIdealHobby) {
					
					for(String j:yourHobby) {
						// 만약 내 이상형의 취미와 상대의 취미가 일치할 경우
						if(i.equals(j)) {
							point++;
							userDetail.setHobby(j);
						}
					}
				}
				
				
				
				
			 // 성격 비교 반복문
				for(String i:myCharacter) {
					
					for(String j:yourIdealCharacter) {
						// 만약 내 i번째 성격과 상대가 원하는 나의 j번째 성격이 일치한다면
						if(i.equals(j)) {
							point++;
							userDetail.setCharacter(j);
						}
					}
				}
			// 성격 비교 반복문  ( 사용자 기준 )
				for(String i:myIdealCharacter) {
					
					for(String j:yourCharacter) {
						// 만약 내 i번째 성격과 상대가 원하는 나의 j번째 성격이 일치한다면
						if(i.equals(j)) {
							point++;
						}
					}
				}		
				
		 
			if(point>=6) {
			
			userDetail.setUserCharacter(your);
			User user = userDAO.selectUserById(your.getUser_id());
			int ageForProfile = userDAO.getMyage(your.getUser_id());
			user.setAgeForProfile(ageForProfile);
			userDetail.setUser(user);
			userDetail.setPoint(point);
			boolean isLike = likeBO.isLike(userId, your.getUser_id());
			userDetail.setLike(isLike);
			MatchingList.add(userDetail);
			}
		
				
			}
		}
		
		
		return MatchingList;

	}
	public UserDetail getUserProfile(int userId) {
		UserDetail userDetailForSeeProfile = new UserDetail();
		UserCharacter userCharacter =userDAO.selectOptionsForSeeProfile(userId);
		User user =userDAO.selectUserById(userId); 
		userDetailForSeeProfile.setUser(user);
		userDetailForSeeProfile.setUserCharacter(userCharacter);
		return userDetailForSeeProfile;
	}
	
	
	// 날 좋아하는 사람의 프로필 가져오기
	public List<UserDetail> getProfileWhoLikesMe(List<Integer> idList, int myId) {
		List<UserDetail> PeopleWhoLikesYou = new ArrayList<>();
		UserDetail userDetail = new UserDetail();
		for(int id :idList) {
			User user = userDAO.selectUserById(id);
			UserCharacter userCharacter =userDAO.selectOptionsForSeeProfile(id);
			//	나이
			int ageForProfile = user.getAgeForProfile();
			user.setAgeForProfile(ageForProfile);
			userDetail.setUser(user);
			userDetail.setUserCharacter(userCharacter);
			// 좋아요 여부
			boolean isLike = likeBO.isLike(id, myId);
			userDetail.setLike(isLike);
			PeopleWhoLikesYou.add(userDetail);
		}
		return PeopleWhoLikesYou;
		
		
	}


	
	
}
