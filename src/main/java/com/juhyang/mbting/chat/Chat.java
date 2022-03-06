package com.juhyang.mbting.chat;

import java.time.LocalDateTime;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="chat")
public class Chat {
	@Id
	private String id;
	private String msg;
	private String sender; // 보내는 사람
	private String receiver;
	
	private LocalDateTime createdAt;
}
