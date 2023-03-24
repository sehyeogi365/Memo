package com.marondal.memo.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.marondal.memo.user.model.User;

@Repository
public interface UserDAO {
	
	public int insertUser(
			@Param("loginId") String loginId
			, @Param("password")String password
			, @Param("name") String name
			, @Param("email") String email
			
			);
	
	//다 그대로 가져워야 저장할수 있는 일치하는 딱 한행을 가져올거라서 User(객체)가 리턴 받을거.
	public User selectUser(
			@Param("loginId") String loginId //조회할 기준 로그인 아이디, 패스워드
			, @Param("password") String password); //select 쿼리 수행할떄 조건으로 활용
			//다오에서 널 리턴해요 객체가 없다. 

	public User selectUserById(@Param("userId") int id);//한행의 정보이니 user
	
}
