<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Get It :: 아이디/비밀번호 찾기</title>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.js"></script>
<!-- 부트스트랩관련 라이브러리 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
<!-- 사용자작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<style>
.content-container{
	border: 1px solid black;
	width: 100%;
	height: 100%;
}
.find-id-container{
	border: 1px solid red;
}
.find-password-container{
	border: 1px solid blue;
}
</style>
<body>
	<div class="content-container">
		<div class="find-id-container">
			<div class="find-id-text">이메일로 아이디 찾기</div>
			<div class="find-id">
			<form action="">
				<label for="findID">이메일 : </label>
				<input type="email" id="findID" name="findID" placeholder="honggd@naver.com" />
				<input type="submit" value="인증" />
			</form>
			</div>
		</div>
		<div class="find-password-container">
			<div class="find-password-text">전화번호로 비밀번호 재설정</div>
			<div class="find-password">
			<form action="">
				<label for="findPassword">전화번호 : </label>
				<input type="text" id="findPassword" name="findPassword" placeholder="-없이 01012345678" />
				<input type="submit" value="인증" />
			</form>
			</div>
		</div>
	</div>
</body>
</html>