package com.juhyang.mbting.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.juhyang.mbting.user.model.User;

@Repository
public interface UserDAO {

	public void InsertUser(
			@Param("loginId") String loginId,
			@Param("userName")String userName,
			@Param("password")String password,
			@Param("sex")String sex, 
			@Param("mbti")String mbti,
			@Param("email") String email

			);
	public User selectUser(
			@Param("loginId") String loginId,
			@Param("password")String password);
	
	
	public boolean IsDuplicate( @Param("loginId") String loginId);
	
	public boolean IsEmailExist( @Param("email") String email);

	

}
