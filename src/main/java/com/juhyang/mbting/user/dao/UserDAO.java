package com.juhyang.mbting.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.juhyang.mbting.user.model.User;

@Repository
public interface UserDAO {

	public void InsertUser(
			@Param("loginId") String loginId,
			@Param("password")String password,
			@Param("userName")String userName,
			@Param("sex")String sex, 
			@Param("mbti")String mbti,
			@Param("email") String email

			);
	public User selectUser(
			@Param("loginId") String loginId,
			@Param("password")String password);
	
	
	public boolean IsDuplicate( @Param("loginId") String loginId);
	
	public int IsEmailExist( @Param("email") String email);
	
	
	public String selectUserByEmail(@Param("email") String email);
	
	public int updatePassword(@Param("loginId") String loginId, 
			@Param("password")String password);

	

}
