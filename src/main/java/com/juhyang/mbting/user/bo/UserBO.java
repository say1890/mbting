package com.juhyang.mbting.user.bo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.juhyang.mbting.common.EncryptUtils;
import com.juhyang.mbting.common.FileManagerService;
import com.juhyang.mbting.user.dao.UserDAO;
import com.juhyang.mbting.user.model.User;
import com.juhyang.mbting.user.model.UserCharacter;

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


	
	
}
