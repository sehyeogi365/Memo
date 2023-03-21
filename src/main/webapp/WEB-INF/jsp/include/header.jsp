<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header class="d-flex align-items-center justify-content-between"><!-- 배경변경 -->
		<h1 class="ml-3">Memo</h1><!-- 적당히 가운데로 -->
		<div class="mr-3">   						<!-- 자바코드였다면 세션 객체를 통해서 getAttribute 메소드를 통해서 값을 얻어옴-->
			${userName } 님 <a href="#">로그아웃</a><!-- jsp 안에서 세션을 간단하게 가져오는법 el태그-->
		</div>
	
	</header>

</body>
</html>