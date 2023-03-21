package com.marondal.memo.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondal.memo.common.EncryptService;
import com.marondal.memo.user.dao.UserDAO;
import com.marondal.memo.user.model.User;

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
	
		//조회	아이디 비밀번호가 일치 하는 사용자 정보 모두 리턴
		public User getUser(String loginId, String password) {//임포트 조심하기 오늘 개힘들었음
			//하나의 유저 객체
			
			//똑같은 방식의 암호화
			String ecyptPassword = EncryptService.md5(password);
			
			return userDAO.selectUser(loginId, ecyptPassword);
		}
		
	}

