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
						이 프로젝트 kh 정보교육원 H반 바로이거조(조원 : 곽경국, 김민성, 최규현, 조하영, 정현빈, 이현규)에서 
						2019년 2월부터 3월까지 한 달간 진행하여 만든 프로젝트입니다.
						만족할만한 결과물은 아니지만 나름 열심히들 임하여 어떻게 저떻게 마무리는 된거같습니다. 끝!
						반 여러분들도 8개월동안 겁나게 고생많으셧습니더. 앞으로 모두 좋은곳에 취직하시길 바라고
						많이 가르쳐주신 김동현 강사님도 감사드리고 건강하시길 바랍니다.
						그럼 진짜 끝!
						안녕히 계세요 :)				 
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