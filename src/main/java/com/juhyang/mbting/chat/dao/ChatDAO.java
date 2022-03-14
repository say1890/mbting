package com.juhyang.mbting.chat.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.juhyang.mbting.chat.Chat;
import com.juhyang.mbting.chat.model.ChatDetail;
import com.juhyang.mbting.chat.model.ChatOriginal;

@Repository
public interface ChatDAO {

	int insertRoomInfo(@Param("man")int man, 
			@Param("woman")int woman  );

	List<ChatOriginal> selectRoomList(@Param("UserId") int userId);

}
