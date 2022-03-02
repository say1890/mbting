package com.juhyang.mbting.user.bo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.juhyang.mbting.common.EncryptUtils;
import com.juhyang.mbting.user.dao.UserDAO;
import com.juhyang.mbting.user.model.User;

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

	public String editProfile(String userName, String introduce, String mbti, List<String> myMeritArr,
			List<String> myHobbyArr, List<String> myCharacterArr, List<String> yourMeritArr, List<String> yourHobbyArr,
			List<String> yourCharacterArr) {
		
		if(myMeritArr== null) {
		}else {
			
		}
		if(myHobbyArr.size() == 0) {
			myHobbyArr.add("empty");
		}
		if(myCharacterArr.isEmpty()) {
			myCharacterArr.add("empty");
		}
		if(yourMeritArr.isEmpty()) {
			yourMeritArr.add("empty");
		}
		if(yourHobbyArr.isEmpty()) {
			yourHobbyArr.add("empty");
		}
		if(yourCharacterArr.isEmpty()) {
			yourCharacterArr.add("empty");
		}
		
		
		for(Object object : myMeritArr) {
		    String element = (String) object;
		    System.out.print(element);
		}
		
		
		return null;
	}
	
}
