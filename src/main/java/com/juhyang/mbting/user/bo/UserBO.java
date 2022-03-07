package com.juhyang.mbting.user.bo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.juhyang.mbting.common.EncryptUtils;
import com.juhyang.mbting.common.FileManagerService;
import com.juhyang.mbting.post.model.PostForMyPage;
import com.juhyang.mbting.user.dao.UserDAO;
import com.juhyang.mbting.user.model.User;
import com.juhyang.mbting.user.model.UserCharacter;
import com.juhyang.mbting.user.model.UserDetail;

@Service
public class UserBO {

	@Autowired
	UserDAO userDAO;

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

	public User getUser(String loginId,String password) {
		return userDAO.selectUser(loginId,  EncryptUtils.md5(password));
	}
	
	public boolean CountUser(String loginId) {
		return userDAO.IsDuplicate(loginId);
	}
	
	public int EmailExist(String email) {
		return userDAO.IsEmailExist(email);
	}

	public String getUserByEmail(String email) {
		return userDAO.selectUserByEmail(email);
		
	}
	public int setPassword(String loginId, String password) {
		String encPw = EncryptUtils.md5(password);
		return userDAO.updatePassword(loginId, encPw);
	}

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
		String[] age = ageString.split(",");
		

		// 부등호 
		String chooseAge = "";
		
		// 나의 나이
		int myage = userDAO.getMyage(userId);
		
		for(String ageTitle: age) {
			if(ageTitle.equals("동갑")) {
				chooseAge = "=";
			}
			if(ageTitle.equals("연상")) {
				chooseAge = ">";
			}
			if(ageTitle.equals("연하")) {
				chooseAge = "<";
			}
		}
		

		
		//	사용자가 원하는 나이의 user 정보를 가져옴
		List<UserCharacter> yourInfo = userDAO.selectUsers(myage,chooseAge,sex);
		
		
		
		
		// 최종 매칭될 user의 character list
		List<UserDetail> MatchingList = new ArrayList<>();

		

		
		for(UserCharacter your:yourInfo) {
			int point = 0;
			// 상대의 장점
			String yourMeritString = your.getMyMerit();
			String[] yourMerit = yourMeritString.split(",");
			
			// 상대의 취미
			String yourHobbyString = your.getMyHobby();
			String[] yourHobby = yourHobbyString.split(",");
			
			// 상대의 성격
			String yourCharacterString = your.getMyCharacter();
			String[] yourCharacter = yourCharacterString.split(",");
			
			
			//상대가 바라는 당신의 장점
			String yourIdealMeritString = your.getYourMerit();
			String[] yourIdealMerit = yourIdealMeritString.split(",");
			
			//상대가 바라는 당신의 취미
			String yourIdealHobbyString = your.getYourHobby();
			String[] yourIdealHobby = yourIdealMeritString.split(",");
			
			
			//상대가 바라는 당신의 성격
			String yourIdealCharacterString = your.getYourCharacter();
			String[] yourIdealCharacter = yourIdealCharacterString.split(",");
			
			
			//상대가 원하는 나이
			String yourIdealAge = userDAO.getAge(your.getUser_id());
			
			for(UserCharacter my:myInfo) {
				// 나의 장점
				String myMeritString = my.getMyMerit();
				String[]  myMerit= myMeritString.split(",");
				
				// 나의 취미
				String myHobbyString = my.getMyHobby();
				String[] myHobby = myHobbyString.split(",");
				
				// 나의 성격
				String myCharacterString = my.getMyCharacter();
				String[] myCharacter= myCharacterString.split(",");
				
				
				//이상형의 장점
				String  myIdealMeritString = my.getYourMerit();
				String[]  myIdealMerit= myIdealMeritString.split(",");
				
				// 이상형의 취미
				String myIdealHobbyString = my.getYourHobby();
				String[] myIdealHobby = myIdealHobbyString.split(",");
				
				// 이상형의 성격
				String myIdealCharacterString = my.getMyCharacter();
				String[] myIdealCharacter= myIdealCharacterString.split(",");
				
				
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
						}
					}
				}
				
				
				
				
			 // 성격 비교 반복문
				for(String i:myCharacter) {
					
					for(String j:yourIdealCharacter) {
						// 만약 내 i번째 성격과 상대가 원하는 나의 j번째 성격이 일치한다면
						if(i.equals(j)) {
							point++;
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
				
		 
			if(point>=4) {
			UserDetail userDetail = new UserDetail();
			userDetail.setUserCharacter(your);
			User user = userDAO.selectUserById(your.getUser_id());
			int ageForProfile = userDAO.getMyage(your.getUser_id());
			user.setAgeForProfile(ageForProfile);
			userDetail.setUser(user);
			userDetail.setPoint(point);
			MatchingList.add(userDetail);
			}
				
				
			}
		}
		
		
		return MatchingList;

	}


	
	
}
