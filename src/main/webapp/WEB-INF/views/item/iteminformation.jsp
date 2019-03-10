<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param value="Get It :: ${product.productName } 상세보기" name="pageTitle"/>
</jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding" rel="stylesheet">
<style>

.productInfo-header>table{
	margin: 0 auto;
}
.productInfo-category{
	margin-left:15%;
	margin-bottom:30px;
	margin-top:30px;
}
.itemsell{
	font-size:15px;
	font-weight:bold;
	color:lightgray;
}
#itempro{
	font-size:30px;
	font-weight:bold;
	
}
#pur{
	border:1px solid white;
	background:#7151FC;
	color:white;
	width:150px;
	height:50px;
	font-weight:bold;
}

#pur:hover{
    font-weight:bold;
	border:1px solid white;
	background:indigo;
	color:white;
	width:150px;
	height:50px;
}

#insertBasket{
    font-family: 'Nanum Gothic', sans-serif;
    border:0px;
	background:red;
	color:white;
	width:150px;
	height:50px;
	font-weight:bold;
}
#insertBasket:hover{
   font-weight:bold;
    font-family: 'Nanum Gothic', sans-serif;
    border:0px;
	background: orange;
	color:white;
	width:150px;
	height:50px;
	
}
#float1{
width:50px;
height:50px; 
border:3px solid #7151FC; 
border-radius:50px;
}
.content-container{
	height: 100%;
}
.productOne{
	width: 220px;
	height: 250px;
	text-align: center;
	display: inline-block;
	margin: 10px 31px;
}
.productOne:hover{
	border-radius: 5px;
	box-shadow: 3px 3px 5px 7px lightgray;
	cursor: pointer;
}
.productInfo-content>div{
	margin-bottom: 20px;
}

#askList{
	height:200px;
	color:gray;
}
.product-ask{
	width: 800px;
	margin-left: 10%;
}
.ask-content{
	border: 1px solid black;
	text-align: center;
}
.ask-comment{
	height: 100px;
	text-align: center;
	display: none;
	margin-top: 30px;
}

#info_{
	margin-left:13%;
}
#ask_{
	float:right;
	border:1px solid white;
	color:white;
	background-color:#7151FC;
	width:150px;
	height:50px;
}
.table-bordered{
	margin-left:2%;
}
#fontt	{
font-weight:bold;
font-size:20px;
}
#askLeft{
	float: left;
}
#askRight{
	float: right;
}
.productInfo-table tr td:first-of-type {
	width: 250px;
}
.productInfo-table tr td:not(:first-of-type) {
	text-align: center;
}
.productInfo-table-text{
	width: 400px;
	height: 250px;
}
.productInfo-table-text tr td:first-child{
	width: 150px; 
}
</style>
<c:forEach items="${allCategory }" var="ct">
	<c:if test="${ct.CATEGORY_MACRO == product.categoryMacro }">
		<c:set var="nowCategory" value="${ct.CATEGORY_MACRO_NAME }" />
		<c:if test="${ct.CATEGORY_MICRO == product.categoryMicro }">
			<c:set var="nowCategory2" value="${ct.CATEGORY_MICRO_NAME }" />
		</c:if>
	</c:if>
</c:forEach>

<div class="productInfo-container">
	<div class="productInfo-category">
		<span>${nowCategory }</span>-
		<span>${nowCategory2 }</span>
	</div>
</div>
	
<div class="productInfo-header">
	<table border="0" class="productInfo-table">
		<tr>
			<td>
				<img src="${pageContext.request.contextPath }/resources/upload/thing/${product.productRealImage}" alt="${product.productImage }" width="100%" height="200px" >
			</td>
			<td>
				<img src="${pageContext.request.contextPath }/resources/images/Getit_.PNG" id="float1">
				<font>1등 중고거래 컨시어지 서비스</font>
			 	<table border="0" class="productInfo-table-text">
			 		<tr align="center">
			 			<td class="itemsell">판매자</td>
			 			<td>${member.memberName }</td>
			 		</tr>
			 		<tr align="center">
			 			<td class="itemsell">상품명</td>
			 			<td id="itempro">${product.productName}</td>
			 		</tr>
			 		<tr align="center">
			 			<td class="itemsell">가격</td>
			 			 <td><fmt:formatNumber pattern="###,###" value="${product.productPrice }" />원</td>
			 		</tr>
			 		<tr align="center">
			 			<td class="itemsell">상품소개</td>
			 			<td>${product.productDescription}</td>
			 		</tr>
			 		<tr align="center">
			 			<td class="itemsell">수량</td>
			 			<td>1</td>
			 		</tr>
			 		<tr align="center" >
			 			<td colspan="2">
	                	    <input type="hidden" name="seqMemberNo" id="seqMemberNo" value="${memberLoggedIn.getSeqMemberNo()}"/>
		                    <input type="hidden" name="seqProductNo" id="seqProductNo" value="${product.seqProductNo}"/>
		                    <input type="button" id="insertBasket" value="장바구니" onclick="insertBasket();"/>
				 		    <button onclick="location.href='${pageContext.request.contextPath}/item/perchase/${product.seqProductNo }'" id="pur">구매하기</button>
			 			</td>
			 		</tr>
			 	</table>
			</td>
		</tr>
	</table>
</div><!-- productInfo-header end -->
<style>
.info-text{
	padding-left: 100px;
}
.info-text>span{
	font-size: 20px;
	font-weight: bold;
	margin-left: 20px;
}
.pDesc{
	margin-top: 20px;
}
</style>
<div class="productInfo-content">
	<c:if test="${product.productAdminDescription != null}">
	<div class="info-text">
		<span>상품 상세 설명</span>
		<div class="pDesc">
			<pre>${product.productAdminDescription }</pre>
		</div>
	</div>
	</c:if>
	<hr>
	<div class="info-delivery" style="margin-left:13%;">
		<span style="font-size:20px; font-weight:bold;">배송정보</span><br />
		<br>
		<span>1. 판매자가 제품을 발송하면 택배사, 송장번호를 안내해드립니다.</span><br />
		<span>2. 결제 후 3일내 판매자가 제품을 발송하지 않으면 거래가 자동 취소됩니다.</span>
	</div>
	
	<div class="product-ask">
		<div class="ask-header" style="font-weight:bold;font-size:20px;">
			<span style="margin-left:3%;">상품문의</span>
			<button onclick="ask();" id="ask_">문의하기</button>
		</div>
		<br />
		<hr style="border:2px solid gray;">
	</div>
	
<script>
function ask(){
	location.href = "${pageContext.request.contextPath}/customercenter/ccinquiry.do";
}
	
function insertBasket(){
	var seqMemberNo = $('input[name=seqMemberNo]').val();
	var seqProductNo = $('input[name=seqProductNo]').val();
	 
 	$.ajax({
		url: "${pageContext.request.contextPath}/item/checkBasket.do" ,
		method: "post" ,
		data: {seqMemberNo: seqMemberNo, seqProductNo:seqProductNo},
		success: function(data) {
			
			if(data.basketisUsable == true) {
				alert("장바구니에 담겼습니다!");			
			}else{
				alert("장바구니에 이미 있어요!!");
			} 
		} ,
		error: function() {
			console.log("ajax요청 에러!");
		}
	});
}
</script>
<style>
.naver-search{
	padding-left: 100px;
}
.naver-search>span{
	font-size: 20px;
	margin-left: 20px;
	font-weight: bold;
}
.search-result{
	width: 500px;
	margin-top: 20px;
}
.search-result a{
	text-decoration: none;
}
</style>
<div class="naver-search">
	<span>상품 관련 리뷰</span>
	<div class="search-result"></div>
</div>
<script>
$(function(){
	var productName = "${product.productName}";
	$.ajax({
		url: "${pageContext.request.contextPath}/itme/moreInfo",
		type: "get",
		data: "searchKeyword="+productName,
		success: function(data){
			var result = JSON.parse(data).items;
			
			var html = "";
			for(var i=0; i<result.length; i++){
				html+= "<a href='"+result[i].link+"' target='_blank'><span>▶"+result[i].title+"</span></a><br>";
			}
			
			$(".search-result").append(html);
			
			
		},
		error: function(){
			console.log("ajax 요청 에러!");
		}
	});
});
</script>

<hr />

<c:if test="${not empty cpList }">
	<div class="product-recommend" style="margin-left:100px; border:0;"><p id="fontt">이런 상품은 어때요?</p>
		<div class="product-container">
			<c:forEach items="${cpList }" var="p" varStatus="vs" end="2">
			<div class="productOne" id="${p.seqProductNo }">
				<div class="pImg">
					<img src="${pageContext.request.contextPath }/resources/upload/thing/${p.productRealImage}" alt="${p.productImage }" width="220px" height="180px" />
				</div>
				<div class="pDesc">
					<span>${p.productName }</span><br />
					<span>${p.productPrice } 원</span>
				</div>
			</div>
			<c:if test="${vs.count%3 == 0 }"></c:if>
			</c:forEach>
		</div>
	</div>
</c:if>

<form id="myform">
    URL입력:  <input type="text" id="url" value="https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&oquery=%EB%84%A4%EC%9D%B4%EB%B2%84+%EA%B0%9C%EB%B0%9C%EC%9E%90%EC%84%BC%ED%84%B0&ie=utf8&query=%EB%84%A4%EC%9D%B4%EB%B2%84+%EA%B0%9C%EB%B0%9C%EC%9E%90%EC%84%BC%ED%84%B0"><br/>
    Title입력:  <input type="text" id="title" value="네이버개발자센터 검색결과"><br/>
  </form>
  <input type="button" value="네이버공유하기" onclick="share()"/>
  <script>
  $(".productOne").each(function(item, idx){
		$(this).on('click',function(){
			var pId = $(this).attr("id");
			location.href = "${pageContext.request.contextPath}/item/iteminformation/"+pId;
		});
	});
  
    function share() {
      var url = encodeURI(encodeURIComponent(myform.url.value));
      var title = encodeURI(myform.title.value);
      var shareURL = "https://share.naver.com/web/shareView.nhn?url=" + url + "&title=" + title;
      document.location = shareURL;
    }
  </script>
	


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>