package com.juhyang.mbting.chat.bo;

import org.springframework.stereotype.Service;

import com.juhyang.mbting.chat.Chat;

@Service
public class ChatBO {

Chat chat = new Chat();

public void makeRoom() {
	chat.setRoomNum(null);
}



}
