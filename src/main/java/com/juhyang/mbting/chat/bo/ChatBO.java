package com.juhyang.mbting.chat.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.juhyang.mbting.chat.Chat;
import com.juhyang.mbting.chat.dao.ChatDAO;
import com.juhyang.mbting.chat.model.ChatDetail;
import com.juhyang.mbting.chat.model.ChatOriginal;
import com.juhyang.mbting.user.model.User;

@Service
public class ChatBO {

@Autowired
ChatDAO chatDAO;
	




public int makeRoomInfo(int man, int woman) {
	return  chatDAO.insertRoomInfo(man,woman);
}



public List<ChatOriginal> getRoomList(int userId ){
	return chatDAO.selectRoomList(userId);
};



}
