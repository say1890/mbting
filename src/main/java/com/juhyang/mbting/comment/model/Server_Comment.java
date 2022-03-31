package com.juhyang.mbting.comment.model;

import java.util.Date;

public class Server_Comment {
	 private int id;
	 private int server_postId;
	 private String comment;
	 private int user_id;
	 private String user_name;
	 private Date createdAt;
	 private  Date updatedAt;
	 
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getServer_postId() {
		return server_postId;
	}
	public void setServer_postId(int server_postId) {
		this.server_postId = server_postId;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	 
	 
	 
	 
}
