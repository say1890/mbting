package com.juhyang.mbting.user.model;

import java.util.List;

public class UserDetail implements Comparable<UserDetail> {

  private User user;
  private UserCharacter userCharacter;
  private int point;
  private boolean isLike;
  private boolean isHate;
  private List<String> character;
  private List<String> merit;
  private List<String> hobby;
  private long passedDay;
  private long passedTime;

  public long getPassedDay() {
    return passedDay;
  }

  public void setPassedDay(long passedDay) {
    this.passedDay = passedDay;
  }

  public long getPassedTime() {
    return passedTime;
  }

  public void setPassedTime(long passedTime) {
    this.passedTime = passedTime;
  }

  public User getUser() {
    return user;
  }

  public void setUser(User user) {
    this.user = user;
  }

  public UserCharacter getUserCharacter() {
    return userCharacter;
  }

  public void setUserCharacter(UserCharacter userCharacter) {
    this.userCharacter = userCharacter;
  }

  public int getPoint() {
    return point;
  }

  public void setPoint(int point) {
    this.point = point;
  }

  public boolean isLike() {
    return isLike;
  }

  public void setLike(boolean isLike) {
    this.isLike = isLike;
  }

  public boolean isHate() {
    return isHate;
  }

  public void setHate(boolean isHate) {
    this.isHate = isHate;
  }

  // 포인트 높은 순으로 정렬

  public List<String> getMerit() {
    return merit;
  }

  public void setMerit(List<String> merit) {
    this.merit = merit;
  }

  public List<String> getHobby() {
    return hobby;
  }

  public void setHobby(List<String> hobby) {
    this.hobby = hobby;
  }

  @Override
  public int compareTo(UserDetail user) {
    if (user.point < point) {
      return -1;
    } else if (user.point > point) {
      return 1;
    }
    return 0;
  }

  public List<String> getCharacter() {
    return character;
  }

  public void setCharacter(List<String> character) {
    this.character = character;
  }

}
