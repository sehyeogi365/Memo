<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    <!-- date객체쓰기 -->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
			
			
			<section class="contents d-flex justify-content-center">
				
				
				
				<div class="detail-box my-5">
				
					<h1 class="text-center mt-3">메모 보기</h1><br>
					
					<div class="d-flex">
						
						<label class="col-2 ml-3"><h3>제목 :</h3></label><!-- value 속성 title을 채워라. -->
						<input type="text" id = "titleInput" value="${post.title }" class="form-control col-9 mt-4">
					</div>
				<div class="mt-3">
					<textarea cols="20" rows="10" id = "contentInput" placeholder="내용을 입력해주세요" class="mt-4 form-control">${post.content }</textarea><br>
				</div><!-- 400에러는 파라미터문제 -->
				
				<label for="file">
  					<div class="btn-upload"></div>
				</label>
				<input type="file" name="file" id="file"><br>
				<img width = "650px" src="${post.imagePath}">
				
				<div class="d-flex  justify-content-between mx-2 mb-2">
					
					<div>
						<a href="/post/list/view" class="btn btn-info mt-3">목록으로</a>
						<button type ="button" class="btn btn-danger mt-3" data-post-id="${post.id }" id="deleteBtn">삭제</button><!-- 여기도 마찬가지 심어주기 data속성 -->
					</div>
												<!-- model에서 불러온값 -->
					<button type="button" data-post-id="${post.id }" class="btn btn-secondary" id="modifyBtn">수정</button>
				</div>
				
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	
	
	<script>
		$(document).ready(function(){
			
			
			$("#deleteBtn").on("click", function(){
				
				let postId = $(this).data("post-id");//대문자 들어가면 절대 안됨.
				
				$.ajax({
					type:"get"
					, url:"/post/delete"
					, data{"postId": postId}
					, success:function(data){
						if(data.result == "success") {
							location.href="/post/list/view";
						} else {
							alert("삭제 실패");
						}
						
						
					}
					, error:function(){
						
						alert("삭제 에러");
					}
					
				});
				
				
			});
			
			
			
			$("#modifyBtn").on("click", function(){
				
				let postId = $(this).data("post-id");
				
				let title = $("#titleInput").val();
				let content = $("#contentInput").val();
				
				
				if(title == ""){
					
					alert("제목을 입력하세요");
					return ;
				}
				
				if(content ==""){
					alert("내용을 입력하세요");
					return ;
				}
				
				$.ajax({
					type :"post"
					, url:"/post/update"
					, data:{"postId":postId, "title":title, "content":content}
					, success :function(){
						
						if(data.result == "success") {
							location.reload();
						} else {
							alert("수정실패");
						}
						
					}
					, error: function(){
						alert("수정에러");
					}//근데 이렇게 하니 alert는 안뜬다. 목록으로 가보니 수정되있는게 확인됨.
					
				});
				
				
				
			});
				
			
			
		});
	
	
	</script>
	
	
</body>
</html>