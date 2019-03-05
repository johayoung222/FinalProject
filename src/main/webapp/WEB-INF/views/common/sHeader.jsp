<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${param.pageTitle }</title>
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>

<!-- 부트스트랩관련 라이브러리 -->
<link href="https://fonts.googleapis.com/css?family=Anton|Do+Hyeon" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
<!-- 사용자작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" />
<!-- google font -->
<link href="https://fonts.googleapis.com/css?family=Gamja+Flower" rel="stylesheet">
<style>
.header-container{
	border-bottom: 1px solid gray;
	width: 100%;
	height: 70px;
	display: flex;
	justify-content: space-between;
	font-family: 'Do Hyeon', sans-serif;
}
.header-right{
	display: flex;
	justify-content: space-between;
}
.header-right div{
	padding-top: 20px;
	font-size: 18px;
	margin-right: 20px;
	color: black;
}
.header-left div{
	width: 80px;
	height: 60px;
	display: inline-block;
}
.moveEnroll{
	width: 250px;
}
#login2_{
	font-family: 'Do Hyeon', sans-serif;
	text-align: center;
	padding-top: 20px;
	font-size: 22px;
	width: 200px;
}
a{
	color: black;
}
</style>
</head>
<div class="header-container">
	<div class="header-left">
		<div class="logo">
			<a href="${pageContext.request.contextPath }">
				<img src="${pageContext.request.contextPath }/resources/images/Getit_.PNG"  width="100%" height="100%"/>
			</a>
		</div>
		<div class="logo-next" id="login2_">${param.pageName==0?"회원가입하기":"로그인하기" }</div>
	</div>
	<div class="header-right">
		<div class="moveEnroll">
			<c:if test="${param.pageName==0 }">
			<a href="${pageContext.request.contextPath }/member/memberMoveLogin.do">회원이신가요? 로그인하러가기</a>
			</c:if>
			<c:if test="${param.pageName==1 }">
			<a href="${pageContext.request.contextPath }/member/memberEnroll.do">회원이 아니신가요? 회원가입하러가기</a>
			</c:if>
		</div>
		<div><a href="${pageContext.request.contextPath }/customercenter/ccintro.do">고객센터</a></div>
	</div>
</div>