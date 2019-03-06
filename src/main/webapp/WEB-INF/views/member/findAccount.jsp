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

	width: 100%;
	height: 100%;
}
.find-id-container{
	height:200px;
}

.find-id-text{
	margin-top:3%;
	margin-left:10%;
	font-size:30px;
	
	color:#7151FC;
}
#findID_{
	margin-left:10%;
	
	padding:0; 
	
	font-weight:bold;
}
#findID{
	border-radius:5px;
}
#findID2{
	border-radius:5px;
}
</style>
<body>
	<div class="content-container">
		<div class="find-id-container">
			<div class="find-id-text">아이디/비밀번호</div><hr style="border:2px solid gray; width:80%; margin-left:10%;">
			<div class="find-id">
			<form action="">
				<div style="padding-top:15px;">
				<label for="findID" id="findID_" style="margin-left:13%;">이메일 : </label>
				<input type="email" id="findID" name="findID" placeholder=" abcde@naver.com" />
				<input type="submit" id="findID2" value="인증" />
				</div>
				<div style="padding-top:20px;">
				<label for="findID" id="findID_">인증번호 : </label>
				<input type="email" id="findID" name="findID"	 />
				<input type="submit" id="findID2" value="확인" />
				</div>
				
			</form>
			</div>
		</div>
		<hr style="border:2px solid gray; width:80%; margin-left:10%;">
		<div class="find-password-container">
			<div class="find-id">
			<form action="">
				<div style="padding-top:15px;">
				<label for="findID" id="findID_" style="margin-left:13%;">아이디 : </label>
				<input type="email" id="findID" name="findID" placeholder=" admin123" />
				</div>
				<div style="padding-top:20px; margin-left:3%;">
				<label for="findID" id="findID_">핸드폰 : </label>
				<input type="email" id="findID" name="findID" placeholder=" -없이01012345678"	 />
				<input type="submit" id="findID2" value="인증" />
				</div>
				<div style="padding-top:20px;">
				<label for="findID" id="findID_">인증번호 : </label>
				<input type="email" id="findID" name="findID"	 />
				<input type="submit" id="findID2" value="확인" />
				</div>
			</form>
			</div>
		</div>
	</div>
</body>
</html>