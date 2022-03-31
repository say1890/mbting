package com.juhyang.mbting.user.model;

import java.util.Date;

public class UserCharacter {

	private int id;
	private int user_id;
	private String myMerit;
	private String myHobby;
	private String myCharacter;
	private String yourMerit;
	private String yourHobby;
	private String yourCharacter;
	private String age;
	private Date updatedAt;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getMyMerit() {
		return myMerit;
	}

	public void setMyMerit(String myMerit) {
		this.myMerit = myMerit;
	}

	public String getMyHobby() {
		return myHobby;
	}

	public void setMyHobby(String myHobby) {
		this.myHobby = myHobby;
	}

	public String getMyCharacter() {
		return myCharacter;
	}

	public void setMyCharacter(String myCharacter) {
		this.myCharacter = myCharacter;
	}

	public String getYourMerit() {
		return yourMerit;
	}

	public void setYourMerit(String yourMerit) {
		this.yourMerit = yourMerit;
	}

	public String getYourHobby() {
		return yourHobby;
	}

	public void setYourHobby(String yourHobby) {
		this.yourHobby = yourHobby;
	}

	public String getYourCharacter() {
		return yourCharacter;
	}

	public void setYourCharacter(String yourCharacter) {
		this.yourCharacter = yourCharacter;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

}
