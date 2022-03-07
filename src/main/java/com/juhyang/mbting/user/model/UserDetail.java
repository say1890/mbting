package com.juhyang.mbting.user.model;

import java.util.List;

public class UserDetail {

	private User user;
	private UserCharacter userCharacter;
	private int point;
	private boolean isLike;
	private boolean isHate;
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
	
	
	
}