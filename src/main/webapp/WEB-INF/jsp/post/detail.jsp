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
			
			
			<section class="contents">
				<h1 class="text-center mt-3">메모 보기</h1>
				
				
				<div class="create-box my-5">
					<div class="d-flex ">
						
						<label class="col-2 ml-3"><h3>제목 :</h3></label><!-- value 속성 title을 채워라. -->
						<input type="text" id = "titleInput" value="${post.title }" class="form-control col-9 mt-4">
					</div>
				<div class="mt-3">
					<textarea cols="20" rows="10" id = "contentInput" placeholder="내용을 입력해주세요" class="mt-4 form-control">${post.content }</textarea><br>
				</div><!-- 400에러는 파라미터문제 -->
				
				<label for="file">
  					<div class="btn-upload">파일 첨부</div>
				</label>
				<input type="file" name="file" id="file"><br>
				<img src="${post.imagePath}">
				
				<div class="d-flex  justify-content-between">
					
					<div>
						<a href="/post/list/view" class="btn btn-info">목록으로</a>
						<button type ="submit" class="btn btn-danger mt-3">삭제</button>
					</div>

					<button type="submit" class="btn btn-secondary" id="saveBtn">수정</button>
				</div>
				
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>

</body>
</html>