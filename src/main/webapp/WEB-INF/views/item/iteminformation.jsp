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
}

#pur:hover{
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
	
}
#insertBasket:hover{
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
form {
    display: inline-block;
   
}
</style>


<div class="productInfo-container">
	<div class="productInfo-category">
		<a href="">전자제품</a>
		<img src="" alt="#" />
		<a href="">스마트폰</a>
		<img src="" alt="#" />
	</div>
	
<div class="productInfo-header">

	<table border="0">
		<tr>
			<td>
				<img src="${pageContext.request.contextPath }/resources/images/galaxy10.PNG" alt="${product.productName } 이미지" width="100%" height="80%" >
			</td>
			<td>
				<img src="${pageContext.request.contextPath }/resources/images/Getit2.PNG" id="float1">
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
			 			
                <%--         	
               <form action="${pageContext.request.contextPath }/item/insertbasket.do" method="post" onsubmit="">
                    <input type="hidden" name="seqMemberNo" id="seqMemberNo" value="${memberLoggedIn.getSeqMemberNo()}"/>
	                <input type="hidden" name="seqProductNo" id="seqProductNo" value="${product.seqProductNo}"/>
	                <input type="submit" id="insertBasket" value="장바구니"/>
                </form> --%>
                
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
<style>

.productInfo-content>div{
	margin-bottom: 20px;
}

#askList{
	height:200px;
	color:gray;
}
.product-ask{
	border: 1px solid black;
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
</style>
<div class="productInfo-content">

	<div class="info-text">
<img src="${pageContext.request.contextPath }/resources/images/items.PNG" style="width:80%; margin-left:10%;"/>
	</div>
	<hr>
		<table border="0" id="info_" style="font-weight:bold; color:gray;">
			<tr>
				<td style="padding-right:100px; ">상품상태</td>
				<td>사용</td>
			</tr>
				<tr>
				<td>작동상태</td>
				<td>생활기스</td>
			</tr>
				<tr>
				<td>찍힘 또는 깨짐</td>
				<td>없음</td>
			</tr>
				<tr>
				<td>구성품</td>
				<td>제품박스</td>
			</tr>
				<tr>
				<td>구매일</td>
				<td>2019년2월11일</td>
			</tr>
				<tr>
				<td>구매경로</td>
				<td>국내 정식 발매 제품</td>
			</tr>
				<tr>
				<td>추가정보</td>
				<td><pre style="color:gray; font-weight:bold;">*젠더 미포함 입니다.
*전반적으로 사용감이 다소 있지만, 기능은 정상 작동 합니다.</pre></td>
			</tr>
			
		</table>
		<hr style="border:2px solid gray; width:80%; margin-left:10%;">
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
		<div class="ask-comment">
			<textarea rows="3" cols="80" id="askContent"></textarea>
			<button onclick="itemAsk();">작성</button>
		</div>
		<hr style="border:2px solid gray;">
		<div class="ask-content" id="askList" >
			<span >문의하신 내역이 없습니다.</span>
		</div>
		<hr style="border:2px solid gray;">
	</div>
	
<script>
function ask(){
	$(".ask-comment").show();
}
	
function itemAsk(){
	
	if($("#askContent").val().trim().length == 0){
		alert("내용을 입력해주세요.");
		return;
	}
<<<<<<< HEAD
	function itemAsk(){
		
		if($("#askContent").val().trim().length == 0){
			alert("내용을 입력해주세요.");
			return;
		}
		
		var asker = ${member.seqMemberNo}; 
		var param = {"askContent":$("#askContent").val(),
					"asker":asker,
					"productNo":${product.seqProductNo}};
		
		$.ajax({
			url: "${pageContext.request.contextPath}/item/ask",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			dataType: "json",
			data: param,
			type: "post",
			success: function(data){
				console.log(data);
				
				if(data.length > 0){
				var html = "<span>"+data+"</span>";
				$("#askContent").val("");
				
				$("#askList").html(html);
				}
			},
			error: function(){
				console.log("ajax요청 에러!");
=======
	
	var asker = ${member.seqMemberNo};
	var param = {"askContent":$("#askContent").val(),
				"asker":asker,
				"productNo":${product.seqProductNo}};
	
	$.ajax({
		url: "${pageContext.request.contextPath}/item/ask",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		dataType: "json",
		data: param,
		type: "post",
		success: function(data){
			console.log(data);
			
			if(data != null){
			var html = "<span id='askLeft'>"+data.askContent+"</span><span id='askRight'> 작성자 :"+data.asker+"</span>";
			$("#askContent").val("");
			
			$("#askList").html(html).css("text-align","left");
>>>>>>> 079d7d328e9f5c2bea1e46b710f3600522c4afbf
			}
		},
		error: function(){
			console.log("ajax요청 에러!");
		}
	});
}

		
	
	</script>
	<script>

	
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

	<div class="product-recommend" style="margin-left:5%; border:0;"><p id="fontt">이런 상품은 어때요?</p>
	<div>
	<table class="table table-bordered" id="item1" style="float:left; width:20%;" >
		<tr>
			<th colspan="2">
			회원 아이디 및 이미지
			</th>
		</tr>
		<tr>
			<th colspan="2">
			<img src="${pageContext.request.contextPath }/resources/images/computer.PNG" id="favorite1" width="175px" height="100px"/>
			</th>
		</tr>
		<tr>
			<th colspan="2">
			<a href="${pageContext.request.contextPath }/item/iteminformation.do">[새상품]애플 데스크탑</a>	
			</th>
		</tr>
		<tr>
			<th colspan="2">
			890,000원
			</th>
		</tr>
		<tr>
			<td colspan="1" class="font_"><a href="${pageContext.request.contextPath }/item/basket.do"><img src="${pageContext.request.contextPath }/resources/images/basket.PNG" width="20px" height="20px"/>장바구니</a></td>
			<td colspan="1" class="font_"><a href="#"><i class="glyphicon glyphicon-thumbs-up"></i>찜하기</a></td>
		</tr>
		
	</table>
	<table class="table table-bordered" id="item1" style="float:left; width:20%;" >
		<tr>
			<th colspan="2">
			회원 아이디 및 이미지
			</th>
		</tr>
		<tr>
			<th colspan="2">
			<img src="${pageContext.request.contextPath }/resources/images/computer.PNG" id="favorite1" width="175px" height="100px"/>
			</th>
		</tr>
		<tr>
			<th colspan="2">
			<a href="${pageContext.request.contextPath }/item/iteminformation.do">[새상품]애플 데스크탑</a>	
			</th>
		</tr>
		<tr>
			<th colspan="2">
			890,000원
			</th>
		</tr>
		<tr>
			<td colspan="1" class="font_"><a href="${pageContext.request.contextPath }/item/basket.do"><img src="${pageContext.request.contextPath }/resources/images/basket.PNG" width="20px" height="20px"/>장바구니</a></td>
			<td colspan="1" class="font_"><a href="#"><i class="glyphicon glyphicon-thumbs-up"></i>찜하기</a></td>
		</tr>
		
	</table>
	<table class="table table-bordered" id="item1" style="float:left; width:20%;" >
		<tr>
			<th colspan="2">
			회원 아이디 및 이미지
			</th>
		</tr>
		<tr>
			<th colspan="2">
			<img src="${pageContext.request.contextPath }/resources/images/computer.PNG" id="favorite1" width="175px" height="100px"/>
			</th>
		</tr>
		<tr>
			<th colspan="2">
			<a href="${pageContext.request.contextPath }/item/iteminformation.do">[새상품]애플 데스크탑</a>	
			</th>
		</tr>
		<tr>
			<th colspan="2">
			890,000원
			</th>
		</tr>
		<tr>
			<td colspan="1" class="font_"><a href="${pageContext.request.contextPath }/item/basket.do"><img src="${pageContext.request.contextPath }/resources/images/basket.PNG" width="20px" height="20px"/>장바구니</a></td>
			<td colspan="1" class="font_"><a href="#"><i class="glyphicon glyphicon-thumbs-up"></i>찜하기</a></td>
		</tr>
		
	</table>
	<table class="table table-bordered" id="item1" style="float:left; width:20%;" >
		<tr>
			<th colspan="2">
			회원 아이디 및 이미지
			</th>
		</tr>
		<tr>
			<th colspan="2">
			<img src="${pageContext.request.contextPath }/resources/images/computer.PNG" id="favorite1" width="175px" height="100px"/>
			</th>
		</tr>
		<tr>
			<th colspan="2">
			<a href="${pageContext.request.contextPath }/item/iteminformation.do">[새상품]애플 데스크탑</a>	
			</th>
		</tr>
		<tr>
			<th colspan="2">
			890,000원
			</th>
		</tr>
		<tr>
			<td colspan="1" class="font_"><a href="${pageContext.request.contextPath }/item/basket.do"><img src="${pageContext.request.contextPath }/resources/images/basket.PNG" width="20px" height="20px"/>장바구니</a></td>
			<td colspan="1" class="font_"><a href="#"><i class="glyphicon glyphicon-thumbs-up"></i>찜하기</a></td>
		</tr>
		
	</table>
	
   </div>	
  </div>
</div>	
	


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>