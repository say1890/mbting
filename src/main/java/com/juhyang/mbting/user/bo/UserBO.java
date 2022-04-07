package com.juhyang.mbting.user.bo;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.juhyang.mbting.chat.ChatRestController;
import com.juhyang.mbting.chat.bo.ChatBO;
import com.juhyang.mbting.common.EncryptUtils;
import com.juhyang.mbting.common.FileManagerService;
import com.juhyang.mbting.like.bo.LikeBO;
import com.juhyang.mbting.like.dao.LikeDAO;
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

  // 사용자 추가
  public void addUser(String loginId, String password, String userName, Date birthday, String sex,
      String mbti, String email) {

    String encPw = EncryptUtils.md5(password);
    userDAO.InsertUser(loginId, encPw, userName, birthday, sex, mbti, email);
  }

  // 사용자 로그인 과정
  public User getUser(String loginId, String password) {
    return userDAO.selectUser(loginId, EncryptUtils.md5(password));
  }

  // 로그인 아이디 중복 체크
  public boolean CountUser(String loginId) {
    return userDAO.IsDuplicate(loginId);
  }

  public int EmailExist(String email) {
    return userDAO.IsEmailExist(email);
  }

  public String getUserByEmail(String email) {
    return userDAO.selectUserByEmail(email);

  }

  // 비밀번호 설정
  public int setPassword(String loginId, String password) {
    String encPw = EncryptUtils.md5(password);
    return userDAO.updatePassword(loginId, encPw);
  }

  // 매칭 프로필 변경
  public int editMatchingProfile(int userId, List<String> myMeritArr, List<String> myHobbyArr,
      List<String> myCharacterArr, List<String> yourMeritArr, List<String> yourHobbyArr,
      List<String> yourCharacterArr, List<String> ageArr) {


    String mymerit = "";
    mymerit = makeReturnString(myMeritArr);


    String myHobby = "";
    myHobby = makeReturnString(myHobbyArr);


    String myCharacter = "";
    myCharacter = makeReturnString(myCharacterArr);

    String yourMerit = "";
    yourMerit = makeReturnString(yourMeritArr);


    String yourHobby = "";
    yourHobby = makeReturnString(yourHobbyArr);


    String yourCharacter = "";
    yourCharacter = makeReturnString(yourCharacterArr);


    String age = "";
    age = makeReturnString(ageArr);



    return userDAO.updateMatchingProfile(userId, mymerit, myHobby, myCharacter, yourMerit,
        yourHobby, yourCharacter, age);

  }

  // Array를 컴마가 들어간 문자열로 바꿔주는 메소드
  public String makeReturnString(List<String> array) {

    StringBuilder before = new StringBuilder(); // 마지막 콤마 제거하기 전 문자열
    before.setLength(0);
    String finalString; // 완성된 String
    if (array == null) {
      finalString = "";
    } else {
      for (String object : array) {
        String element = object + ",";
        before.append(element);
      }
      int lastComma = before.length();
      before.deleteCharAt(lastComma - 1);
      finalString = before.toString();
    }

    return finalString;

  }

  // 기본 프로필 변경
  public void editBasicInfo(int userId, String userName, String introduce, String mbti,
      MultipartFile file, String password) {
    User user = userDAO.selectUserById(userId);
    String userProfile = user.getProfile();
    String filePath = null;

    // 사용자가 사진을 추가했을 때
    if (file != null) {
      // 기존 프사가 있을 때
      if (userProfile != null) {
        FileManagerService.removeFile(userProfile);
        filePath = FileManagerService.saveFile(userId, file);
      }
      // 기존 프사가 없을 때
      else {
        filePath = FileManagerService.saveFile(userId, file);
      }
      userDAO.updateBasicProfile(userId, userName, introduce, mbti, filePath);
    }

    // 사진을 추가하지 않았을 때
    else {
      userDAO.updateBasicProfileExceptFile(userId, userName, introduce, mbti);
    }

    if (password.length() >= 6) {
      String encPw = EncryptUtils.md5(password);
      String loginId = user.getLoginId();
      userDAO.updatePassword(loginId, encPw);
    }

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

    // 나의 정보를 가져옴
    List<UserCharacter> myInfo = userDAO.selectOptions(userId);
    // 나의 나이
    int myage = userDAO.getMyage(userId);
    // 내가 원하는 나이
    String ageString = userDAO.getAge(userId);
    if (ageString == null) {
      ageString = "=";
    }

    String[] age = ageString.split(",");
    // 부등호
    String chooseAge = "";
    List<UserCharacter> yourInfo = new ArrayList<>();

    // 최종 매칭될 user의 list
    List<UserDetail> matchingList = new ArrayList<>();
    List<UserDetail> list = new ArrayList<>();
    for (String ageTitle : age) {
      if (ageTitle.equals("동갑")) {
        chooseAge = "=";
        // 사용자가 원하는 나이의 user 정보를 가져옴
        yourInfo = userDAO.selectUsers(userId, myage, chooseAge, sex);
        list = recommendUser(yourInfo, myInfo, userId);
        matchingList.addAll(list);
      } else if (ageTitle.equals("연상")) {
        chooseAge = ">";
        // 사용자가 원하는 나이의 user 정보를 가져옴
        yourInfo = userDAO.selectUsers(userId, myage, chooseAge, sex);
        list = recommendUser(yourInfo, myInfo, userId);
        matchingList.addAll(list);
      } else if (ageTitle.equals("연하")) {
        chooseAge = "<";
        // 사용자가 원하는 나이의 user 정보를 가져옴
        yourInfo = userDAO.selectUsers(userId, myage, chooseAge, sex);
        list = recommendUser(yourInfo, myInfo, userId);
        matchingList.addAll(list);
      } else {
        chooseAge = "=";
        // 원하는 나이를 선택하지 않았을 경우에 동갑 사용자를 보여줌
        yourInfo = userDAO.selectUsers(userId, myage, chooseAge, sex);
        list = recommendUser(yourInfo, myInfo, userId);
        matchingList.addAll(list);
        break;
      }

    }
    return matchingList;

  }

  public List<UserDetail> recommendUser(List<UserCharacter> yourInfo,
      List<UserCharacter> myInfo, int userId) {

    // 최종 매칭될 user의 character list
    List<UserDetail> matchingList = new ArrayList<>();
    for (UserCharacter your : yourInfo) {
      UserDetail userDetail = new UserDetail();
      int point = 0;
      // 상대의 장점
      String yourMeritString = your.getMyMerit();
      String[] yourMerit = null;
      if (yourMeritString == null) {
        yourMeritString = "기본값,";
      }
      yourMerit = yourMeritString.split(",");

      // 상대의 취미
      String yourHobbyString = your.getMyHobby();
      String[] yourHobby = null;
      if (yourHobbyString == null) {
        yourHobbyString = "기본값,";
      }
      yourHobby = yourHobbyString.split(",");

      // 상대의 성격
      String yourCharacterString = your.getMyCharacter();
      String[] yourCharacter = null;
      if (yourCharacterString == null) {
        yourCharacterString = "기본값,";
      }
      yourCharacter = yourCharacterString.split(",");

      // 상대가 바라는 당신의 장점
      String yourIdealMeritString = your.getYourMerit();
      String[] yourIdealMerit = null;
      if (yourIdealMeritString == null) {
        yourIdealMeritString = "기본값,";
      }
      yourIdealMerit = yourIdealMeritString.split(",");

      // 상대가 바라는 당신의 취미
      String yourIdealHobbyString = your.getYourHobby();
      String[] yourIdealHobby = null;
      if (yourIdealHobbyString == null) {
        yourIdealHobbyString = "기본값,";
      }
      yourIdealHobby = yourIdealHobbyString.split(",");

      // 상대가 바라는 당신의 성격
      String yourIdealCharacterString = your.getYourCharacter();
      String[] yourIdealCharacter = null;
      if (yourIdealCharacterString == null) {
        yourIdealCharacterString = "기본값,";
      }
      yourIdealCharacter = yourIdealCharacterString.split(",");

      // 상대가 원하는 나이
      String yourIdealAge = userDAO.getAge(your.getUser_id());

      for (UserCharacter my : myInfo) {
        // 나의 장점
        String myMeritString = my.getMyMerit();
        String[] myMerit = null;
        if (myMeritString == null) {
          myMeritString = "기본값,";
        }

        myMerit = myMeritString.split(",");

        // 나의 취미
        String myHobbyString = my.getMyHobby();
        String[] myHobby = null;
        if (myHobbyString == null) {
          myHobbyString = "기본값,";
        }

        myHobby = myHobbyString.split(",");

        // 나의 성격
        String myCharacterString = my.getMyCharacter();
        String[] myCharacter = null;
        if (myCharacterString == null) {
          myCharacterString = "기본값,";
        }

        myCharacter = myCharacterString.split(",");

        // 이상형의 장점
        String myIdealMeritString = my.getYourMerit();
        String[] myIdealMerit = null;
        if (myIdealMeritString == null) {
          myIdealMeritString = "기본값,";
        }

        myIdealMerit = myIdealMeritString.split(",");

        // 이상형의 취미
        String myIdealHobbyString = my.getYourHobby();
        String[] myIdealHobby = null;
        if (myIdealHobbyString == null) {
          myIdealHobbyString = "기본값,";
        }

        myIdealHobby = myIdealHobbyString.split(",");

        // 이상형의 성격
        String myIdealCharacterString = my.getMyCharacter();
        String[] myIdealCharacter = null;
        if (myIdealCharacterString == null) {
          myIdealCharacterString = "기본값,";
        }

        myIdealCharacter = myIdealCharacterString.split(",");

        // 장점 비교 반복문 ( 상대 기준 )
        for (int i = 0; i < myMerit.length; i++) {
          for (int j = 0; j < yourIdealMerit.length; j++) {
            // 만약 내 i번째 장점과 상대가 원하는 나의 j번째 장점이 일치한다면
            if (myMerit[i].equals(yourIdealMerit[j])) {
              point++;

            }
          }
        }

        List<String> list = new ArrayList<>();

        // 장점 비교 반복문 ( 사용자 기준 )
        for (String i : myIdealMerit) {

          for (String j : yourMerit) {
            // 만약 내 이상형의 장점과 상대의 장점이 일치할 경우
            if (i.equals(j)) {
              point++;
              if (list.size() < 3) {
                list.add(j);
              }

              userDetail.setMerit(list);
            }
          }
        }

        // 취미 비교 반복문 ( 상대 기준 )
        for (String i : myHobby) {

          for (String j : yourIdealHobby) {
            // 만약 내 i번째 취미와 상대가 원하는 나의 j번째 취미가 일치한다면
            if (i.equals(j)) {
              point++;
            }
          }
        }

        list = new ArrayList<>();
        // 취미 비교 반복문 ( 사용자 기준 )
        for (String i : myIdealHobby) {

          for (String j : yourHobby) {
            // 만약 내가 원하는 상대의 i번째 취미와 상대의 j번째 취미가 일치할 경우
            if (i.equals(j)) {
              point++;
              if (list.size() < 3) {
                list.add(j);
              }
              userDetail.setHobby(list);

            }
          }
        }

        // 성격 비교 반복문
        for (String i : myCharacter) {

          for (String j : yourIdealCharacter) {
            // 만약 내 i번째 성격과 상대가 원하는 나의 j번째 성격이 일치한다면
            if (i.equals(j)) {
              point++;

            }
          }
        }

        list = new ArrayList<>();
        // 성격 비교 반복문 ( 사용자 기준 )
        for (String i : myIdealCharacter) {
          for (String j : yourCharacter) {
            // 만약 내가 원하는 상대의 i번째 성격과 상대의 j번째 성격이 일치한다면
            if (i.equals(j)) {
              point++;
              if (list.size() < 3) {
                list.add(j);
              }
              userDetail.setCharacter(list);

            }
          }
        }

        if (point >= 8) {

          userDetail.setUserCharacter(your);
          User user = userDAO.selectUserById(your.getUser_id());
          int ageForProfile = userDAO.getMyage(your.getUser_id());
          user.setAgeForProfile(ageForProfile);
          userDetail.setUser(user);
          userDetail.setPoint(point);
          boolean isLike = likeBO.isLike(userId, your.getUser_id());
          userDetail.setLike(isLike);
          matchingList.add(userDetail);
        }

      }
    }

    return matchingList;
  }

  public UserDetail getUserProfile(int userId) {
    UserDetail userDetailForSeeProfile = new UserDetail();
    UserCharacter userCharacter = userDAO.selectOptionsForSeeProfile(userId);
    User user = userDAO.selectUserById(userId);
    userDetailForSeeProfile.setUser(user);
    userDetailForSeeProfile.setUserCharacter(userCharacter);
    return userDetailForSeeProfile;
  }

  @Autowired
  ChatBO chatBO;
  @Autowired
  ChatRestController chat;
  @Autowired
  LikeDAO likeDAO;

  // 날 좋아하는 사람의 프로필 가져오기
  public List<UserDetail> getProfileWhoLikesMe(List<Integer> idList, int myId) {
    List<UserDetail> PeopleWhoLikesYou = new ArrayList<>();

    for (int id : idList) {
      UserDetail userDetail = new UserDetail();
      User user = userDAO.selectUserById(id);
      UserCharacter userCharacter = userDAO.selectOptionsForSeeProfile(id);
      // 나이
      int ageForProfile = userDAO.getMyage(id);
      user.setAgeForProfile(ageForProfile);
      userDetail.setUser(user);
      userDetail.setUserCharacter(userCharacter);
      // 내가 상대를 좋아하는지 여부
      boolean isLike = likeBO.isLike(myId, id);
      userDetail.setLike(isLike);
      if (isLike) {
        likeDAO.deleteLike(id, myId);
        User me = userDAO.selectUserById(myId);
        if (me.getSex().equals("여")) {
          chatBO.makeRoomInfo(id, myId);
        } else {
          chatBO.makeRoomInfo(myId, id);

        }

      }

      userDetail.setLike(isLike);
      PeopleWhoLikesYou.add(userDetail);
    }
    return PeopleWhoLikesYou;

  }

  // 내가 좋아하는 사람의 프로필 가져오기
  public List<UserDetail> getProfileWhoILike(List<Integer> idList, int myId) throws ParseException {
    List<UserDetail> PeopleWhoILiked = new ArrayList<>();

    // 현재 시간
    Date today = new Date();

    for (int id : idList) {
      UserDetail userDetail = new UserDetail();
      String likedAt = likeDAO.selectLikeTime(id, myId);
      Date likedTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(likedAt);
      long diffSec = (today.getTime() - likedTime.getTime()) / 1000; // 초 차이
      long diffDays = diffSec / (24 * 60 * 60); // 일자수 차이
      long diffHour = (today.getTime() - likedTime.getTime()) / 3600000;
      if (diffDays >= 5) {
        likeBO.deleteLike(id, myId);
      } else {
        userDetail.setPassedDay(diffDays);
        userDetail.setPassedTime(diffHour);

      }

      User user = userDAO.selectUserById(id);

      UserCharacter userCharacter = userDAO.selectOptionsForSeeProfile(id);
      // 나이
      int ageForProfile = userDAO.getMyage(id);
      user.setAgeForProfile(ageForProfile);

      // 사용자 기본 정보
      userDetail.setUser(user);
      userDetail.setUserCharacter(userCharacter);

      // 좋아요 여부
      boolean isLike = likeBO.isLike(id, myId);

      userDetail.setLike(isLike);
      PeopleWhoILiked.add(userDetail);

    }
    return PeopleWhoILiked;
  }

  public void setLoginTime(int userId) {
    userDAO.updateLoginTime(userId);

  }

  public List<UserCharacter> checkUserInfo(int userId) {
    return userDAO.selectOptions(userId);
  }

  public void removeUserProfile(int userId) {
    userDAO.deleteUserProfile(userId);

  }

}
