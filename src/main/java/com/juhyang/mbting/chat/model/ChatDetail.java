package com.juhyang.mbting.chat.model;

import java.util.List;

import com.juhyang.mbting.user.model.UserDetail;

public class ChatDetail {
private ChatOriginal chat;
private List<UserDetail> user;
public ChatOriginal getChat() {
	return chat;
}
public void setChat(ChatOriginal chat) {
	this.chat = chat;
}
public List<UserDetail> getUser() {
	return user;
}
public void setUser(List<UserDetail> user) {
	this.user = user;
}


}
