<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메모게시판 - 메모 입력</title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap" class="container">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
			
			
			<section class="contents">
			
				<div class="input-box my-5">
				
				<h1 class="text-center mt-3">메모 입력</h1>
				
				
				
					<div class="d-flex ">
						
						<label class="col-2 ml-3"><h3>제목 :</h3></label><input type="text" id = "titleInput" placeholder="내용을 입력해주세요" class="form-control col-9 mt-4">
					</div>
				
				<textarea cols="20" rows="10" id = "contentInput" placeholder="내용을 입력해주세요" class="mt-4 form-control"></textarea><br>
				
				
				<label for="file">
  					<div class="btn-upload">파일 첨부</div>
				</label>
				<input type="file" name="file" id="fileInput"><br>
				
				
				<div class="d-flex align-items-center justify-content-between">
					<a href="/post/list/view" class="btn btn-info">목록으로</a>
					
					<button type="submit" class="btn btn-secondary" id="saveBtn">저장</button>
				</div>
				
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	<script>
		$(document).ready(function(){
			$("#saveBtn").on("click", function(){
				let title = $("#titleInput").val();
				let content = $("#contentInput").val();//나는 처음앞뒤공백안하겠다 .trim()사용
				let file = $("#fileInput")[0];
				
				
				if(title == "") {
					alert("제목을 입력하새요");
					return;
				}
				if(content.trim() == "") {
					alert("내용을 입력하새요");
					return;
				}
				
				var formData = new FormData();
				formData.append("title", title);//추가
				formData.append("content", content);
				formData.append("file", file.files[0]);//파일목록이 배열처럼 관리가 된다.				
				
				$.ajax({
					type:"post"
					, url:"/post/create"
					, data:formData //여기다가 그대로 넣어주기
					, enctype:"multipart/form-data" // 파일 업로드 필수
					, processData:false // 파일 업로드 필수
					, contentType:false // 파일 업로드 필수
					, success:function(data){
						if(data.result == "success") { // javax.servlet.http ~~is null 99% login 문제 로그인 된상태가 아니란뜻
							location.href="/post/list/view";
						} else {
							alert("글쓰기 실패");
						}
					}
					, error:function(){
						alert("글쓰기 실패");
					}
					
				});
				
				
			});
			
			
			
		});
		
	
	</script>
</body>
</html>