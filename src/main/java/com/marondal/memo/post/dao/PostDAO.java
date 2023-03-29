package com.marondal.memo.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.marondal.memo.post.model.Post;

@Repository
public interface PostDAO {

	public int insertPost(//행의 갯수리턴 int
			@Param("userId")int userId
			, @Param("title") String title
			, @Param("content") String content
			, @Param("imagePath") String imagePath
			);
		
	public List<Post> selectPostList(@Param("userId") int userId);	
	
	public Post selectPost(@Param("id") int id);//한행이므로 클래스
	
	public int updatePost(
			@Param("id") int id
			, @Param("title") String title
			, @Param("content") String content
			);
	
	public int deletePost(@Param("id") int id);//아이디값 안뜬다고 에러 "postId"->id변경
	
}
