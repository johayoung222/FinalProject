<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<!-- 부트스트랩관련 라이브러리 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
	integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm"
	crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<style>
.nav-pills .nav-link.active, .nav-pills .show>.nav-link {
    color: #fff;
    background-color: #343a40;
}
.row, .nav-link{
	padding : 10px;
}
.row{
	position:absolute;
	
}
div.col-2.5 a:hover{
	color: #fff;
    background-color: #343a40;
}
#container2{
	width:14%;
}
.nav-link{
	color:black;
	font-family: 'Nanum Gothic', sans-serif;
}
</style>

<br />
<div id="container2">
  <div class="col-2.5">
    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
      <p class="nav-link">관리자 페이지</p>
      <a class="nav-link" href="${pageContext.request.contextPath}/admin/allMember.do" title="회원리스트조회">회원 리스트조회</a>
      <a class="nav-link" id="v-pills-paidProduct-tab"  href="${pageContext.request.contextPath}/admin/paidProduct.do" role="tab" aria-controls="v-pills-paidProduct" aria-selected="false" title="결제된 상품 리스트">결제된 상품 리스트</a>
      <a class="nav-link" id="v-pills-sellPutin-tab"  href="${pageContext.request.contextPath}/admin/registList.do" role="tab" aria-controls="v-pills-sellPutin" aria-selected="false" title="판매 신청 리스트">판매 신청 리스트</a>
      <a class="nav-link" id="v-pills-productList-tab"  href="${pageContext.request.contextPath}/admin/productList.do" role="tab" aria-controls="v-pills-productList" aria-selected="false" title="상품 리스트">상품 리스트</a>
      <a class="nav-link" id="v-pills-QA-tab"  href="${pageContext.request.contextPath}/admin/questionAnswer.do" role="tab" aria-controls="v-pills-QA" aria-selected="false" title="1:1질문 답변">1:1질문 답변</a>
      <a class="nav-link" id="v-pills-acutionStatus-tab"  href="${pageContext.request.contextPath}/admin/acutionStatus.do" role="tab" aria-controls="v-pills-acutionStatus" aria-selected="false" title="경매 상품 현황">경매 상품 현황</a>
      <a class="nav-link" id="v-pills-declarationList-tab"  href="${pageContext.request.contextPath}/admin/reportList.do" role="tab" aria-controls="v-pills-declarationList" aria-selected="false" title="신고접수 리스트">신고접수 리스트</a>
      <a class="nav-link" id="v-pills-site-tab"  href="${pageContext.request.contextPath}/admin/siteStatistics.do" role="tab" aria-controls="v-pills-site" aria-selected="false" title="사이트 통계">사이트 통계</a>
    </div>
  </div> 
</div>



