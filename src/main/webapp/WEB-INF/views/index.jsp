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
#favorite{
	width: 80%;
	margin: 0 auto;
}
#fimages{
	display: flex;
	justify-content: space-between;
}
#fimages a{
	text-align: center;
}
#fimages a img{
	width: 120px;
	height: 100px;
	display: block;
}
#favorite a{
	text-decoration: none;
}
.popular{
	font-family: 'Nanum Gothic', sans-serif;
	margin-top: 30px;
}
.popular>h3{
	margin-left: 30px;
}
#sell_ {
    border: 2px solid lightgray;
    height: 180px;
    width:95%;
    margin-left:25px;
    margin-top: 20px;
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
	margin-top: 20px;
	width:100%;
	display: flex;
	justify-content: space-around;
}
#box0>div{
	height: 150px;
	border: 1px solid #dbdbdb;
	width: 22%;
}
#box3 {
	width: 30% !important;
}
.hm-good {
	display: inline-block;
    width: 241px;
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
#infoBox{
	width: 900px;
	text-align: center;
	transform: translate(5%,0%);
}
.productOne{
	width: 250px;
	height: 250px;
	text-align: center;
	display: inline-block;
	margin: 10px 31px;
}
#moreItems{
	float: right;
	margin-right: 100px;
	cursor: pointer;
	font-size: 20px;
}
#moreItems:hover{
	background-color: yellow;
	border-radius: 7px;
	box-shadow: 0px 0px 3px 5px yellow;
}
.productOne:hover{
	border-radius: 5px;
	box-shadow: 3px 3px 5px 7px lightgray;
	cursor: pointer;
}
.pImg{
	margin-top: 5px;
	width: 250px;
	height: 180px;
}

.blinkEle1 , .blinkEle2 , .blinkEle3 , .blinkEle4{
	visibility: hidden;
}

.myblinkEle1 , .myblinkEle2 , .myblinkEle3 , .myblinkEle4{
	visibility: hidden;
}
.badge{
	animation-name: myani1;
    animation-duration: 5s;
    animation-iteration-count: infinite;
    animation-direction: alternate;
    animation-fill-mode: forwards;
}
@Keyframes myani1{
        0%{
            background-color: blue;
        }
        50%{
            background-color: red;
        }
        80%{
            transform: rotateY(360deg);
        }
        100%{
            background-color: blueviolet;
            border-radius: 50%;
        }
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

<div class="popular">
	<h3>
		인기 카테고리
		<span class="badge badge-secondary">HIT</span>
	</h3>
	<div id="favorite">
		<div id= "fimages">
			<a href="${pageContext.request.contextPath }/category?caKey=A&ciKey=03"> 
				<img src="${pageContext.request.contextPath }/resources/images/computer.PNG"/>
				<span>노트북/PC</span>
			</a>
			<a href="${pageContext.request.contextPath }/category?caKey=A&ciKey=01"> 
				<img src="${pageContext.request.contextPath }/resources/images/phone.PNG"/>
				<span>스마트폰</span>
			</a>
			<a href="${pageContext.request.contextPath }/category?caKey=A&ciKey=04">
				<img src="${pageContext.request.contextPath }/resources/images/electronic.PNG" />
				<span>노트북/PC 주변기기</span>
			</a>
			<a href="${pageContext.request.contextPath }/category?caKey=F&ciKey=12">
				<img src="${pageContext.request.contextPath }/resources/images/food.PNG"/>
				<span>분유/이유식/간식</span>
			</a>
			<a href="${pageContext.request.contextPath }/category?caKey=A&ciKey=10">
				<img src="${pageContext.request.contextPath }/resources/images/kitchen.PNG"/>
				<span>생활/주방/미용가전</span>
			</a>
		</div>
	</div>
</div>
<hr />

<div class="popular">
<h3>
	새로 등록된 상품 <span class="badge badge-secondary">New</span>
	<span id="moreItems">더 보기</span>
</h3>
<div class="new-product">
	<c:if test="${not empty cpList }">
		<c:forEach items="${cpList }" var="p" varStatus="vs" end="2">
		<div class="productOne" id="${p.seqProductNo }">
			<div class="pImg">
				<img src="${pageContext.request.contextPath }/resources/upload/thing/${p.productRealImage}" alt="${p.productImage }" height="180px" width="240px" />
			</div>
			<div class="pDesc">
				<span>${p.productName }</span><br />
				<span><fmt:formatNumber value="${p.productPrice}" pattern="#,###"/> 원</span>
			</div>
		</div>
		</c:forEach>
	</c:if>
</div>
</div>
<hr />
<div class="popular">
<h3>
	새로 등록된 경매 상품 <span class="badge badge-secondary">New</span>
</h3>
<jsp:useBean id="now" class="java.util.Date" />
<c:set var="today"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd hh:mm:ss" /></c:set>
 
<c:if test="${empty auctionList }">
	<div>새로 등록된 경매 상품이 없습니다.</div>
</c:if>
<div class="hm-container">
<c:if test="${not empty auctionList }">
	<c:forEach items="${auctionList }" var="a" varStatus="vs">
			<div class="hm-good">
				<a class="gdidx-good-info" href="${pageContext.request.contextPath }/auctionDetail.do?auctionNo=${a.AUCTION_NO}">
					<div class="gdidx-img">
						<img src="${pageContext.request.contextPath }/resources/upload/${a.AUCTION_IMAGE_MAIN}">
						<div class="auctionIng gdidx-on-hold ng-hide blinkEle${vs.count }">경매가 진행중</div>
						<div class="auctionIn gdidx-on-hold ng-hide myblinkEle${vs.count }">내가 경매에 참여중</div>
						<div class="gdidx-labels">
						</div>
					</div>
					<div class="gdidx-name ng-binding">[중고] ${a.AUCTION_TITLE }</div>
					<div class="gdidx-prices-wrapper">
						<div class="gdidx-price ng-binding">
							<div id="bidcheck${vs.count }" class="gdidx-expected-price ng-hide">현재 낙찰 가격</div>
							<span class="resultPrice${vs.count }"></span><%-- <fmt:formatNumber value="${a.AUCTION_PRICE}" pattern="#,###"/> --%>
							<span class="gdidx-price-unit">원</span>
							
						</div>
						<div class="gdidx-original-price ng-binding" ng-show="item.prices.original_price"><fmt:formatNumber value="${a.AUCTION_PRICE}" pattern="#,###"/>원</div>
						<div class="gdidx-original-price ng-binding ng-hide"></div>
					</div></a>
			</div>
			<input type="hidden" id="sdate${vs.count }" value="${a.SDATE }" />
			<input type="hidden" id="edate${vs.count }" value="${a.EDATE }" />

		</c:forEach>
</c:if>
</div>
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
		<a href="${pageContext.request.contextPath}/customercenter/ccnews.do">
			<img src="${pageContext.request.contextPath }/resources/images/sound.PNG" id="sound_" width="120px" height="100px" /></a>
		<div style="text-align: center">
			<a href="${pageContext.request.contextPath}/customercenter/ccnews.do">겟잇 소식</a>
		</div>
	</div>
	<div id="box2" style="text-align: center">
		<a href="${pageContext.request.contextPath}/customercenter/ccqna.do">
			<img src="${pageContext.request.contextPath }/resources/images/sound2.PNG" id="sound_" width="120px" height="100px" /></a>
		<div style="text-align: center">
			<a href="${pageContext.request.contextPath}/customercenter/ccqna.do">자주 묻는 질문</a>
		</div>
	</div>
	<div id="box3">
		<h6 style="text-align: center">고객센터</h6>
		<h5 style="text-align: center">1577-1577</h5>
	    <h6 style="text-align: center"> 평일: 15시30분~21시30분</h6>
		<h6 style="text-align: center">주말, 공휴일 휴무</h6>
	</div>
</div>

<hr>

<script>
/* 현재 시간을 구하는 함수 */
function getTime() {
	today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();
	var hh = today.getHours();
	var MM = today.getMinutes();
	var MM = today.getMinutes();
	var ss = today.getSeconds();

	if(dd<10) { dd='0'+dd } 
	if(mm<10) { mm='0'+mm } 
	if(hh<10) { hh='0'+hh }
	
	today = yyyy + '-' + mm+'-'+dd + " " + hh + ":" + MM;
	return today;
}


// 온로드 됬을때 경매 진행중인지 ? 아니면 내가 경매에 참여중인지 찍어주기 위한 소스코드

	$(function(){
		var mainAuction1 = "${result.check1}";
		var mainAuction2 = "${result.check2}";
		var mainAuction3 = "${result.check3}";
		var mainAuction4 = "${result.check4}";
		
		var resultPrice1 = "${resultPrice.Price1}";
		var resultPrice2 = "${resultPrice.Price2}";
		var resultPrice3 = "${resultPrice.Price3}";
		var resultPrice4 = "${resultPrice.Price4}";
		
		for(var i = 1; i <= 4;i++) {
			var sdate = $("#sdate"+i).prop("value");
			var edate = $("#edate"+i).prop("value");
			today = getTime();			
			
			var result = 0;
			
			if(today>sdate) {
				result++;
			}
			if(today<=edate) {
				result++;
			}
			
			if(result == 2) {
				$(".blinkEle"+i).css("visibility", "visible");
			}
			
		}
		
		$(".resultPrice1").html(addComma(resultPrice1));
		$(".resultPrice2").html(addComma(resultPrice2));
		$(".resultPrice3").html(addComma(resultPrice3));
		$(".resultPrice4").html(addComma(resultPrice4));
		
		
	// 여기서부터는 입찰에 참여하였는지에 대한 출력
	if(mainAuction1 == "Y") {
		$(".myblinkEle1").css("visibility", "visible");
	}
	if(mainAuction2 == "Y") {
		$(".myblinkEle2").css("visibility", "visible");
	}
	if(mainAuction3 == "Y") {
		$(".myblinkEle3").css("visibility", "visible");
	}
	if(mainAuction4 == "Y") {
		$(".myblinkEle4").css("visibility", "visible");
	}
	
	var bidCheck1 = "${resultPrice.bidCheck1}";
	var bidCheck2 = "${resultPrice.bidCheck2}";
	var bidCheck3 = "${resultPrice.bidCheck3}";
	var bidCheck4 = "${resultPrice.bidCheck4}";
	
	if("${resultPrice.bidCheck1}" == "N") {
		$("#bidcheck1").html("기준가");
	}
	if("${resultPrice.bidCheck2}" == "N") {
		$("#bidcheck2").html("기준가");
	}
	if("${resultPrice.bidCheck3}" == "N") {
		$("#bidcheck3").html("기준가");
	}
	if("${resultPrice.bidCheck4}" == "N") {
		$("#bidcheck4").html("기준가");
	}
});
	
function addComma(num) {
	var regexp = /\B(?=(\d{3})+(?!\d))/g;
	return num.toString().replace(regexp, ',');
}
/* 
setInterval(function(){
	for(var i = 1; i <= 4;i++) {
	  $(".blinkEle"+i).toggle();
	}
}, 500); */
	
$("#moreItems").on('click',function(){
	location.href = "${pageContext.request.contextPath}/item/brandNew";
});
$(".productOne").each(function(item, idx){
	$(this).on('click',function(){
		var pId = $(this).attr("id");
		location.href = "${pageContext.request.contextPath}/item/iteminformation/"+pId;
	});
});
</script>
<style>
.auctionIng {
	color: red;
	font-weight: bold;
}

.auctionIn{
	color: #7151FC;
	font-weight: bold;
}
</style>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>