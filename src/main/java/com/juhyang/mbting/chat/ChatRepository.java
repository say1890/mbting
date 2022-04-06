package com.juhyang.mbting.chat;

import org.springframework.data.mongodb.repository.Query;
import org.springframework.data.mongodb.repository.ReactiveMongoRepository;
import org.springframework.data.mongodb.repository.Tailable;

import reactor.core.publisher.Flux;

//ReactiveMongoRepository > 새로운 문서의 저장에 최적화
public interface ChatRepository extends ReactiveMongoRepository<Chat,String>{
	@Tailable // 커서를 안 닫고 계속 유지
	//원래는 클라이언트가 모든 결과를 읽었을때 자동으로 커서를 닫지만, tailable 어노테이션으로 인해서 지속적으로 데이터를 읽을 수 있게끔 
	@Query("{ sender : ?0, receiver : ?1}")
	Flux<Chat> mFindBySender(String sender, String receiver); // Flux (흐름) response를 유지하면서 데이터를 계속 흘려보내기

	@Tailable
	@Query("{ roomNum: ?0 }")
	Flux<Chat> mFindByRoomNum(Integer roomNum);
}
