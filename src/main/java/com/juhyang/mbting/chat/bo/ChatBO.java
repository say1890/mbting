package com.juhyang.mbting.chat.bo;

import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.juhyang.mbting.chat.dao.ChatDAO;
import com.juhyang.mbting.chat.model.ChatOriginal;


@Service
public class ChatBO {
@Autowired
ChatDAO chatDAO;
private static ChatDAO staticChatDAO;
	

@PostConstruct
private void initStatic() {
	staticChatDAO = this.chatDAO;
}


public int makeRoomInfo(int man, int woman) {
	return  chatDAO.insertRoomInfo(man,woman);
}



public List<ChatOriginal> getRoomList(int userId){
	return chatDAO.selectRoomList(userId);
}



public int addChatData(int id, String manName, String womanName, String manProfile, String womanProfile) {
	return chatDAO.updateChatData(id,manName,womanName,manProfile,womanProfile);
}



public static ChatOriginal getRoomInfo(int roomNum) {

	return	staticChatDAO.selectRoomInfo(roomNum);
	
};



}
