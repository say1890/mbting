package com.juhyang.mbting.like.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDAO {

	int insertLike(@Param("userId")int userId,
				   @Param("receiver")int receiver);

	int countLike(@Param("userId")int userId);

}
