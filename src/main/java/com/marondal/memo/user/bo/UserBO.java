package com.marondal.memo.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondal.memo.common.EncryptService;
import com.marondal.memo.user.dao.UserDAO;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	public int addUser(
			String loginId
			, String password
			, String name
			, String email) {
		
		//비오서 암호화한담에 전달한다면?? -> 전달받은데이터 가공->디비로 전달
	
	
		String ecryptPassword = EncryptService.md5(password);//암호화할 대상 만들고 변수에 저장()안에 암호화할 대상 넣는다.
		//노란줄이 뜬다. 다오에 암호화 된걸 저장시킨다.
		return userDAO.insertUser(loginId, ecryptPassword, name, email);//행의 갯수 리턴
	
			
			
	}
}
