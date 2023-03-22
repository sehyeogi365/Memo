package com.marondal.memo.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.marondal.memo.common.FileManagerService;
import com.marondal.memo.post.dao.PostDAO;
import com.marondal.memo.post.model.Post;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	public int addPost(int userId, String title, String content, MultipartFile file) {
		
		
						//bo서도 일단 파라미터 추가해서 얻음
		// 파일 저장 - > 파일 경로 생성 -> DB에 저장
		String imagePath = FileManagerService.saveFile(userId, file);//로그인한 아이디, 멀티파트파일 저장
		return postDAO.insertPost(userId, title, content, imagePath);//맨첨에 0이 나옴 사용자id를 넣어야 하는데
			
		
	}
	
	public List<Post>getPostList(int userId) {//여러개이므로 리스트 게시글들 영러개 저장 <>안에 객체 여기도 파라미터
		return postDAO.selectPostList(userId);
		
		
	}
	
	public Post getPost(int id) {
		
		return postDAO.selectPost(id);//하나의 정보이므로 객체, 클래스로 리턴
				//쿼리수행한결과 dao
	}
	
	
}
