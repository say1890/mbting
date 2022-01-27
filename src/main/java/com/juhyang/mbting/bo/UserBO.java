package com.juhyang.mbting.bo;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.juhyang.mbting.dao.UserDAO;

@Service
public class UserBO {

	@Autowired
	UserDAO userDAO;

	public void addUser(String loginId,
			String password,
			String email) {
	
		userDAO.InsertUser(loginId, password, email);
	}

	public boolean CountUser(String loginId) {
		return userDAO.IsDuplicate(loginId);
	}
	
}
