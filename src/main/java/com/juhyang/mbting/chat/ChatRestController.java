package com.juhyang.mbting.chat;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.juhyang.mbting.chat.bo.ChatBO;
import com.juhyang.mbting.chat.model.ChatOriginal;

import com.juhyang.mbting.user.dao.UserDAO;
import com.juhyang.mbting.user.model.User;

import lombok.RequiredArgsConstructor;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;
import reactor.core.scheduler.Schedulers;

@RequiredArgsConstructor
@RestController
public class ChatRestController {

  private final ChatRepository chatRepository;


  @Autowired
  ChatBO chatBO;

  @Autowired
  UserDAO userDAO;


  @CrossOrigin
  @GetMapping(value = "/sender/{sender}/receiver/{receiver}",
      produces = MediaType.TEXT_EVENT_STREAM_VALUE)
  public Flux<Chat> getMsg(@PathVariable String sender, @PathVariable String receiver) {
    return chatRepository.mFindBySender(sender, receiver).subscribeOn(Schedulers.boundedElastic());
  }

  @CrossOrigin
  @GetMapping(value = "/chat/roomNum/{roomNum}", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
  public Flux<Chat> findByRoomNum(@PathVariable Integer roomNum) {
    return chatRepository.mFindByRoomNum(roomNum).subscribeOn(Schedulers.boundedElastic());
  }

  @CrossOrigin
  @PostMapping("/chat")
  public Mono<Chat> setMsg(@RequestBody Chat chat) {
    chat.setCreatedAt(LocalDateTime.now());
    return chatRepository.save(chat); // Object를 리턴하면 자동으로 JSON 변환 (MessageConverter)
  }



  @PostMapping("/addChatData")
  public int addChatData(@RequestParam("roomNum") int id) {
    ChatOriginal RoomInfo = chatBO.getRoomInfo(id);
    int man = RoomInfo.getMan();
    int woman = RoomInfo.getWoman();
    User UserMan = userDAO.selectUserById(man);
    User UserWoman = userDAO.selectUserById(woman);

    String manName = UserMan.getUserName();
    String womanName = UserWoman.getUserName();
    String manProfile = UserMan.getProfile();
    String womanProfile = UserWoman.getProfile();
    return chatBO.addChatData(id, manName, womanName, manProfile, womanProfile);
  }



}

