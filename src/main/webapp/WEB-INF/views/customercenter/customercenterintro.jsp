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
    width: 1060px;
    margin-left: 110px;
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
	font-size: 20px;
    line-height: 23px;
    padding-bottom: 20px;
    border-bottom: 2px solid #ececec;
}
.content{
	display: inline-block;
	width:70%;
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
			<div class="sidebar4" id="sidebar">
				<a href="${pageContext.request.contextPath}/customercenter/ccinquiry.do">1:1 문의</a>
			</div>
			<div class="sidebar5" id="sidebar">
				<a href="${pageContext.request.contextPath}/customercenter/ccqna.do">자주 묻는 질문</a>
			</div>
		</div>
		<!-- 콘텐츠 상단 이미지 -->
		<div class="content">
			<div class="headline">
				여기 소개 헤드라인
			</div>
			<img src="${pageContext.request.contextPath }/resources/images/logo-spring.png" class="img-fluid" alt="Responsive image">
			<div class="main">
			여기는 블라블라 하는곳
			</div>	
		</div>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>