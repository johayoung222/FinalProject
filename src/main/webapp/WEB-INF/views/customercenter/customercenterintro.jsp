<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
</jsp:include>
<style>
.content-container {
    padding-left: 110px;
	padding-top: 48px;
}
.sidebar{
    vertical-align: top;
    display: inline-block;
    width: 144px;
    margin-bottom: 36px;
    margin-right: 5%;
}
.sidebar1{
	color: #666666;
    font-size: 25px;
    font:bolder;
    line-height: 27px;
    border-bottom: 1px solid #ececec;
    padding-bottom: 15px;
}
.sidebar2{
	border: 1px solid #ececec;
}
.sidebar3{
	border: 1px solid #ececec;
}
.sidebar4{
    border: 1px solid #ececec;
}
.sidebar5{
    border: 1px solid #ececec;
}
.sidebar a{
	display: block;
	padding-left: 15px;
    font-size: 14px;
    color: #1f1f1f;
}
.headline{
	width:100%;
	font-size: 20px;
    line-height: 23px;
    padding-bottom: 20px;
    border-bottom: 2px solid #ececec;
    margin-bottom: 2%;
}
.content{
	display: inline-block;
	width:70%;
}
.main{
	width: 80%;
    margin-bottom: 50px;
    margin-left: 10%;
}
.img-fluid{
	width:100%;
	height:350px;
}

</style>
	<div class="content-container">	
		<div class="sidebar">
			<div class="sidebar1">
				고객센터
			</div>
			<div class="sidebar2" id="sidebar">
				<a href="${pageContext.request.contextPath}/customercenter/ccintro.do">겟잇 소개</a>
			</div>
			<div class="sidebar3" id="sidebar">
				<a href="${pageContext.request.contextPath}/customercenter/ccnews.do">겟잇 소식</a>
			</div>
			<div class="sidebar4" id="sidebar" onclick="logincheck('${memberLoggedIn.memberId}')">
				<a href="#">1:1 문의</a>
			</div>
			<div class="sidebar5" id="sidebar">
				<a href="${pageContext.request.contextPath}/customercenter/ccqna.do">자주 묻는 질문</a>
			</div>
		</div>
		<!-- 콘텐츠 상단 이미지 -->
		<div class="content">
			<div class="headline">
				<strong>겟잇 소개</strong>
			</div>
			<div class="main">
				<img src="${pageContext.request.contextPath }/resources/images/intro.PNG" class="img-fluid" alt="Responsive image">
					<div class="main2">
						<h2 style="text-align:center"><strong>새로운 중고거래를 경험해보세요.</strong></h2>
						이 프로젝트 2019년 2월부터 3월까지 한 달간의 작업으로 진행 되었습니다.
						팀명은 바로 이거조 이며, 팀원으로는 팀장 : 국경갓!!! 팀원 : 갓하영, 갓규현,
						갓민성, 갓현빈, 갓현규 6명으로 구성 되어있지만 원래는 7명이 었습니다. 
						1명은 조영빈으로서 조기취직으로 쓰레기같이 나갔습니다. 
					</div>
			</div>	
		</div>
	</div>
<script>
 function logincheck(memberLoggedIn){
	 console.log(memberLoggedIn);
	 if(memberLoggedIn == ''){
		location.href="${pageContext.request.contextPath}/member/memberMoveLogin.do";
	 }else{
		location.href="${pageContext.request.contextPath}/customercenter/ccinquiry.do";
	 }
 }
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>