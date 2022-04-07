package com.juhyang.mbting.user.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.juhyang.mbting.user.model.User;
import com.juhyang.mbting.user.model.UserCharacter;

@Repository
public interface UserDAO {

  public void InsertUser(@Param("loginId") String loginId, @Param("password") String password,
      @Param("userName") String userName, @Param("birthday") Date birthday,
      @Param("sex") String sex, @Param("mbti") String mbti, @Param("email") String email

  );

  public User selectUser(@Param("loginId") String loginId, @Param("password") String password);

  public User selectUserById(@Param("userId") int userId);

  public boolean IsDuplicate(@Param("loginId") String loginId);

  public int IsEmailExist(@Param("email") String email);

  public String selectUserByEmail(@Param("email") String email);

  public int updatePassword(@Param("loginId") String loginId, @Param("password") String password);

  public int updateMatchingProfile(@Param("userId") int userId, @Param("mymerit") String mymerit,
      @Param("myHobby") String myHobby, @Param("myCharacter") String myCharacter,
      @Param("yourMerit") String yourMerit, @Param("yourHobby") String yourHobby,
      @Param("yourCharacter") String yourCharacter, @Param("age") String age);

  public int updateBasicProfile(@Param("userId") int userId, @Param("userName") String userName,
      @Param("introduce") String introduce, @Param("mbti") String mbti,
      @Param("profile") String filePath);

  public List<UserCharacter> selectOptions(@Param("userId") int userId);

  public List<String> selectMeritContent();

  public List<String> selectCharacterContent();

  public List<String> selectHobbyContent();

  public List<String> selectAgeContent();

  public List<UserCharacter> selectRecommendedUser(@Param("userId") int userId);

  public List<UserCharacter> getMyInfo(int userId);

  public List<UserCharacter> selectUsers(@Param("userId") int userId, @Param("myage") int myage,
      @Param("chooseAge") String chooseAge, @Param("sex") String sex);

  public int getMyage(@Param("userId") int userId);

  public String getAge(@Param("userId") int userId);

  public UserCharacter selectOptionsForSeeProfile(@Param("userId") int userId);

  public void updateLoginTime(@Param("userId") int userId);

  public void deleteUserProfile(@Param("userId") int userId);

  public void updateBasicProfileExceptFile(@Param("userId") int userId,
      @Param("userName") String userName, @Param("introduce") String introduce,
      @Param("mbti") String mbti);

}
