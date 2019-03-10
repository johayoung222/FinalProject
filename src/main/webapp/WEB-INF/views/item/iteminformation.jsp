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
#bask{
	border: 1px solid #7151FC;
	background:white;
	color:#7151FC;
	width:150px;
	height:50px;
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
margin-left:30px;
margin-bottom:25px; 
border:3px solid #7151FC; 
border-radius:50px;
}
#fon{
	font-size:15px;
	color:lightgray;
	
}
.content-container{
	height: 100%;
}
.productOne{
	width: 250px;
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
	border: 1px solid black;
	width: 250px;
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
				<img src="${pageContext.request.contextPath }/resources/upload/thing/${product.productRealImage}" alt="${product.productImage }" width="100%" height="80%" >
			</td>
			<td>
				<img src="${pageContext.request.contextPath }/resources/images/Getit_.PNG" id="float1">
				<font id="fon">겟잇</font>
				<font>1등 중고거래 컨시어지 서비스</font>
			 	<table border="0" style="height:300px; width:400px;">
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

<div>
	<h2>이미지 슬라이드</h2>
</div>
<div class="productInfo-content">
	<div class="info-text">
	</div>
	<hr>
	<div class="info-delivery" style="margin-left:13%;">
		<span style="font-size:20px; font-weight:bold; color:gray">배송정보</span><br />
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

<div class="naver-test">
	
</div>
<script>
$(function(){
	var productName = "${product.productName}";
	$.ajax({
		url: "https://openapi.naver.com/v1/search/blog.json",
		type: "get",
		headers: {"Access-Control-Allow-Headers":"Origin,Accept,X-Requested-With,Content-Type,Access-Control-Request-Method,Access-Control-Request-Headers,Authorization",
				"Access-Control-Max-Age":"3600",
				"Access-Control-Allow-Origin":"*",
				"Content-Type":"plain/text",
				"X-Naver-Client-Id":"iRxnV_fRI0U3FGNoPOlk",
				"X-Naver-Client-Secret":"mdUA9AjMzx"},
		contentType: "plain/text; charset=UTF-8",
		data: {"query":productName, "sort":"sim"},
		success: function(data){
			console.log(data);
		},
		error: function(){
			console.log("ajax 요청 에러!");
		}
	});
});
</script>



<div class="product-recommend" style="margin-left:5%; border:0;"><p id="fontt">이런 상품은 어때요?</p>
	<div class="product-container">
		<c:if test="${not empty cpList }">
		<c:forEach items="${cpList }" var="p" varStatus="vs" end="2">
		<div class="productOne" id="${p.seqProductNo }">
			<div class="pImg">
				<img src="${pageContext.request.contextPath }/resources/upload/thing/${p.productRealImage}" alt="${p.productImage }" width="240px" height="180px" />
			</div>
			<div class="pDesc">
				<span>${p.productName }</span><br />
				<span>${p.productPrice } 원</span>
			</div>
		</div>
		<c:if test="${vs.count%3 == 0 }"></c:if>
		</c:forEach>
	</c:if>
	</div>
</div>
	


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>