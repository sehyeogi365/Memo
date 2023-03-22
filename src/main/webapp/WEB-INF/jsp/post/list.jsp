<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    <!-- date객체쓰기 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메모게시판 - 리스트</title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>

	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		<!-- header footer 재사용 하려면?? -->
		<section class="contents"><!-- 가운데로 오게하기 -->
			<h1 class="text-center">메모리스트 </h1>
			
			<table class="table text-center">
				<thead>
					<tr>
						<th>No.</th>
						<th>제목</th>
						<th>시간</th>
					</tr>
				</thead>
				<tbody>
					<!-- core 라이브러리 활용 -->
					
					<c:forEach var="post" items="${postList }">
					<tr>
						<td>${post.id }</td>
						<td><a href="/post/detail/view?id=${post.id }">${post.title }</a></td><!-- model 값 -->
						<td><fmt:formatDate value="${post.createdAt }" pattern="yyyy-MM-dd HH:mm:ss"/></td><!-- 출력형식 대문자HH 24시간을 의미-->
					</tr>
					</c:forEach>
					
				</tbody>
				
				
			</table>
			
		<div class="d-flex justify-content-end">
			<button type="submit" class="btn btn-primary mt-3" id="writeBtn" onclick="location.href='/post/create/view' ">글쓰기</button>
		</div>	
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	
	<script>
	
	$(document).ready(function(){
		$("#writeBtn").on("click", function(){
			
			
			
			$.ajax({
				type:"post"
				, url : "/post/list/create"
				, data : {""}
				, success:function(data){
					
				}
				, error:function(){
					
				}
				
				
				
			});
				
				
			
			
			
		});
	});
	
	</script>

</body>
</html>