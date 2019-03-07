<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="안녕 스프링!" name="pageTitle" />
</jsp:include>
<c:set scope="application" var="allCategory" value="${categoryList }" />

<style>
.indexphoto {
	width: 100%;
	height: 300px;
}

#favorite {"src/main/webapp/index.jsp"
	padding-left: 90px;
}

#favorite2 {
	margin-left: 50px;
}

#favorite3 {
	margin-left: 50px;
}

#favorite4 {
	margin-left: 50px;
}

#favorite5 {
	margin-left: 50px;
}

#sell_ {
	border: 1px solid gray;
	height: 180px;
}

#sell2 {
	position: relative;
	bottom: 90px;
	right: 80px;
	float: right;
	border: 1px solid gray;
	background: rgb(103, 105, 201);
	color: white;
	width: 300px;
	height: 88px;
	text-align: center;
	padding: 30px;
}

.font_ {
	margin-left: 50px;
}
#box0{
 border:0; 
 padding-top:20px; 
}
#box1 {
	display: inline-block;
	vertical-align: top;
	width: 20%;
	height: 150px;
	border: 1px solid #dbdbdb;
	margin-left: 10px;
}

#box2 {
	display: inline-block;
	vertical-align: top;
	width: 20%;
	height: 150px;
	border: 1px solid #dbdbdb;
	margin-left: 10px;
}

#box3 {
	display: inline-block;
	vertical-align: top;
	width: 25%;
	height: 150px;
	border: 1px solid #dbdbdb;
	margin-left: 10px;
}

#box4 {
	padding-top: 0px;
}
#box5{
	float:right; 
	position:relative; 
	bottom:130px; 
	right:50px;"
}

.font2_ {
	left: 30%;
}

.hm-good {
	display: inline-block;
}

.hm-good {
    width: 271px;
    height: 344px;
    padding: 8px 18px;
}

.gdidx-img img {
    width: 234px;
    height: 234px;
}

.gdidx-name {
    height: 42px;
    line-height: 21px;
    font-size: 14px;
    color: #1f1f1f;
    margin-bottom: 12px;
}

.gdidx-prices-wrapper {
    height: 38px;
    margin-bottom: 20px;
}

.gdidx-good-info {
    display: block;
    height: 364px;
}

a {
    cursor: pointer;
}
a {
    color: inherit;
    text-decoration: none;
}

.gdidx-price {
    color: #1f1f1f;
    font-size: 20px;
    line-height: 22px;
    font-weight: bold;
}

.gdidx-original-price {
    color: #c2c2c2;
    font-size: 14px;
    line-height: 16px;
    margin-top: 2px;
    text-decoration: line-through;
}

</style>
<div id="carouselExampleFade" class="carousel slide carousel-fade"
	data-ride="carousel">
	<div class="carousel-inner">
		<div class="carousel-item active">
			<img class="indexphoto"
				src="${pageContext.request.contextPath }/resources/images/캡처1.PNG"
				alt="First slide">
		</div>
		<div class="carousel-item">
			<img class="indexphoto"
				src="${pageContext.request.contextPath }/resources/images/캡처2.PNG"
				alt="Second slide">
		</div>
		<div class="carousel-item">
			<img class="indexphoto"
				src="${pageContext.request.contextPath }/resources/images/캡처3.PNG"
				alt="Third slide">
		</div>
	</div>
	<a class="carousel-control-prev" href="#carouselExampleFade"
		role="button" data-slide="prev"> <span
		class="carousel-control-prev-icon" aria-hidden="true"></span> <span
		class="sr-only">Previous</span>
	</a> <a class="carousel-control-next" href="#carouselExampleFade"
		role="button" data-slide="next"> <span
		class="carousel-control-next-icon" aria-hidden="true"></span> <span
		class="sr-only">Next</span>
	</a>
</div>


<div style="text-align: center;">
	<div>
		<h3>
			<bold>인기 카테고리</bold>
		</h3>
	</div>
	<div id="favorite">
		<div>
			<a href="${pageContext.request.contextPath}/category/laptopPc"> <img
				src="${pageContext.request.contextPath }/resources/images/computer.PNG"
				id="favorite1" width="120px" height="100px" />
			</a> <a href="${pageContext.request.contextPath}/category/Phone"> <img
				src="${pageContext.request.contextPath }/resources/images/phone.PNG"
				id="favorite2" width="120px" height="100px" />
			</a> <a href="${pageContext.request.contextPath}/category/appliance">
				<img
				src="${pageContext.request.contextPath }/resources/images/electronic.PNG"
				id="favorite3" width="120px" height="100px" />
			</a> <a href="${pageContext.request.contextPath}/category/lifeFood">
				<img
				src="${pageContext.request.contextPath }/resources/images/food.PNG"
				id="favorite4" width="120px" height="100px" />
			</a> <a href="${pageContext.request.contextPath}/category/lifeHousehold">
				<img
				src="${pageContext.request.contextPath }/resources/images/kitchen.PNG"
				id="favorite5" width="120px" height="100px" />
			</a>
			<div>

				<pre><strong>      컴퓨터                 핸드폰                 전자기기                 식품            생활/주방/미용가전</strong>
				</pre>
			</div>
		</div>
	</div>
</div>
<hr />

<h3>
	새로 등록된 상품 <span class="badge badge-secondary">New</span>
</h3>
<br />
<br />
<div id="newThing">
	<script>
	window.onload = function() {
		$.ajax({
    		url: "<%=request.getContextPath()%>/category/laptopPcEnd.do",
			type : "get",
			dataType : "json",
			success : function(data) {
				console.log(data);
				
				var attImage;
				attImage=data[0].registRealImage.split(',');
				
				var attCopy= attImage[1];
				
				for(var i=1; i<data.length; i++){
					attImage=data[i].registRealImage.split(',');
					attCopy= attCopy +","+ attImage[1]; 
					console.log(attCopy);
				}
				
				var realImage=attCopy.split(',');
				console.log(realImage);
				
				var html="";
				for(var i=realImage.length-1; i>=0; i--){
					var newThing = document.getElementById("newThing");
					html = html + "<a href='${pageContext.request.contextPath}/category/laptopPc'> <img "+
					 "src='${pageContext.request.contextPath }/resources/upload/thing/"+realImage[i]+"' "+
					 "id='favorite1' width='120px' height='100px' />";
				}
				newThing.innerHTML = html;				
				
				
			}

			});

			

		}
	</script>

</div>
<br /><br />
<hr />	
<h3>
	새로 등록된 경매 상품 <span class="badge badge-secondary">New</span>
</h3>

<c:if test="${empty auctionList }">
	<div>새로 등록된 경매 상품이 없습니다.</div>
</c:if>
<div class="hm-container">
<c:if test="${not empty auctionList }">
	<c:forEach items="${auctionList }" var="a">
			<div class="hm-good">
				<a class="gdidx-good-info" href="${pageContext.request.contextPath }/auctionDetail.do?auctionNo=${a.AUCTION_NO}">
					<div class="gdidx-img">
						<img src="${pageContext.request.contextPath }/resources/upload/${a.AUCTION_IMAGE_MAIN}">
						<div class="gdidx-on-hold ng-hide blinkEle">다른 사용자가 구매중 , 경매가 진행중</div>
						<div class="gdidx-on-hold ng-hide blinkEle">내가 구매중 , 내가 경매에 참여중</div>
						<div class="gdidx-labels">
						</div>
					</div>
					<div class="gdidx-name ng-binding">${a.AUCTION_TITLE }</div>
					<div class="gdidx-prices-wrapper">
						<div class="gdidx-price ng-binding">
							<fmt:formatNumber value="${a.AUCTION_PRICE}" pattern="#,###"/>
							
							<span class="gdidx-price-unit">원</span>
							<div class="gdidx-expected-price ng-hide">현재 낙찰 가격</div>
						</div>
						<div class="gdidx-original-price ng-binding" ng-show="item.prices.original_price">152,100원</div>
						<div class="gdidx-original-price ng-binding ng-hide"></div>
					</div></a>
			</div>
		</c:forEach>
</c:if>
</div>


<div id="sell_">
	<br> <br>
	<h6 class="font_">이벤트 당첨되었는데 안 쓰는 물건, 자리만 차지하고 있는 쓸모없는 물건...</h6>
	<h3 class="font_">
		<strong>겟잇으로 팔아야 잘 산다!</strong>
	</h3>
	<h4 id="sell2">
		<a href="${pageContext.request.contextPath}/thing/thing.do" id="sell3"><strong>겟잇으로
				물건 판매하기</strong></a>
	</h4>
</div>

<div id="box0">
	<div id="box1" style="text-align: center">
		<a href="#"><img
			src="${pageContext.request.contextPath }/resources/images/sound.PNG"
			id="sound_" width="120px" height="100px" /></a>
		<div style="text-align: center">
			<a href="#">겟잇 소식</a>
		</div>
	</div>
	<div id="box2" style="text-align: center">
		<a href="#"><img
			src="${pageContext.request.contextPath }/resources/images/sound2.PNG"
			id="sound_" width="120px" height="100px" /></a>
		<div style="text-align: center">
			<a href="#">자주 묻는 질문</a>
		</div>
	</div>
	<div id="box3">
		<h6 style="text-align: center">고객센터</h6>
		<h5 style="text-align: center">1833-6479</h5>
		<div id="box4">
			<h6 style="text-align: center">평일: 10시~19시</h6>
			<h6 style="text-align: center">주말, 공휴일 휴무</h6>
		</div>
	</div>
	<div id="box5">
	<img src="${pageContext.request.contextPath }/resources/images/Getit_.PNG" width="200px" height="120px">
	</div>
</div>

<hr>

<script>
setInterval(function(){
	  $(".blinkEle").toggle();
	}, 500);
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>