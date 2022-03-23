package com.juhyang.mbting.user.model;


public class UserDetail {

	private User user;
	private UserCharacter userCharacter;
	private int point;
	private boolean isLike;
	private boolean isHate;
	private String character;
	private String merit;
	private String hobby;
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
	public String getCharacter() {
		return character;
	}
	public void setCharacter(String character) {
		this.character = character;
	}
	public String getMerit() {
		return merit;
	}
	public void setMerit(String merit) {
		this.merit = merit;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	



	
	
	
}