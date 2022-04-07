package com.juhyang.mbting.chat.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.juhyang.mbting.chat.model.ChatOriginal;

@Repository
public interface ChatDAO {

  int insertRoomInfo(@Param("man") int man, @Param("woman") int woman);

  List<ChatOriginal> selectRoomList(@Param("UserId") int userId);

  int updateChatData(@Param("id") int id, @Param("manName") String manName,
      @Param("womanName") String womanName, @Param("manProfile") String manProfile,
      @Param("womanProfile") String womanProfile);

  ChatOriginal selectRoomInfo(@Param("id") int roomNum);

}
