<%@ page language="java" contentType="text/html; charset=UTF-8"
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
		<c:if test = "${ not empty userId }"><!-- 특정조건을 만족할때만 보여줘라. 언제? 로그인 되었을때 -->
							<!--안 비어있다면? -->
		<div class="mr-3">   						<!-- 자바코드였다면 세션 객체를 통해서 getAttribute 메소드를 통해서 값을 얻어옴-->
			${userName } 님 <a href="/user/signout">로그아웃</a><!-- jsp 안에서 세션을 간단하게 가져오는법 el태그-->
		</div><!-- 로그인 안되어있을땐 보여지면 안됨 이런 화면구성도 필요 --><!-- logout 버튼을 누르자 이름 사라짐 -->
		</c:if>
	</header>

</body>
</html>