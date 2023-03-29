package com.marondal.memo.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.marondal.memo.post.bo.PostBO;

@RestController
@RequestMapping("/post")
public class PostRestController {//api를 위한 컨트롤러

	@Autowired
	private PostBO postBO;
	
	@PostMapping("/create") //메모입력 당연히 포스트 패키지내
	public Map<String, String> postCreate(//userId 어떻게 처리할건가?
			
			@RequestParam("title") String title
			, @RequestParam("content") String content
			, @RequestParam(value="file", required=false) MultipartFile file//실제파일과 파일 관련정보저장	//Required request part 'file' is not present 파일이없어도 글이 저장되게 하려면???value="file", required=false
			, HttpSession session) {// session을 통해서 값을 얻어오기
		
		int userId = (Integer)session.getAttribute("userId");//값구해오기
						//object 라서 빨간줄이뜬다. //session ctrl+클릭해보기 //오브젝트클래스는 모든클래스의 부모클래스 
						//원래 형태인 Integer 형태로 캐스팅해서 저장
						
		int count = postBO.addPost(userId, title, content, file);
		// get Attribute null 오류 = 로그인이 안되었다는 뜻.
		Map<String, String> resultMap = new HashMap<>();//제이슨 형태인 맵
		
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;	
	
	}
	
	@PostMapping("/update")
	public Map<String, String>modifyPost(
			@RequestParam("postId") int postId
			, @RequestParam("title") String title
			, @RequestParam("content") String content) {
				
		
		int count = postBO.updatePost(postId, title, content);//행의 갯수 리턴
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
		
		
	}
	
	
	
	@GetMapping("/delete")
	public Map<String, String>deletePost(
			@RequestParam("postId") int postId) {
		
		
		int count = postBO.deletePost(postId);
		
		Map<String, String> resultMap = new HashMap<>();
		
		
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		
		return resultMap;
		
		
		
	}
	
	
	
	
}
