package com.juhyang.mbting.user.bo;

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
			String sex,
			String mbti,
			String email) {
	
		String encPw = EncryptUtils.md5(password);
		userDAO.InsertUser(loginId, encPw, userName, sex, mbti, email);
	}

	public User getUser(String loginId,String password) {
		return userDAO.selectUser(loginId,  EncryptUtils.md5(password));
	}
	
	public boolean CountUser(String loginId) {
		return userDAO.IsDuplicate(loginId);
	}
	
	public boolean EmailExist(String email) {
		return userDAO.IsDuplicate(email);
	}
	
}
