package com.juhyang.mbting.chat;

import org.springframework.data.mongodb.repository.Query;
import org.springframework.data.mongodb.repository.ReactiveMongoRepository;
import org.springframework.data.mongodb.repository.Tailable;

public interface ChatRepository extends ReactiveMongoRepository<Chat,String>{
	@Tailable // 커서를 안 닫고 계속 유지
	@Query("{sender:?0, receiver:?1}")
	Flux<Chat> mFindBySender(String sender, String receiver);
}
