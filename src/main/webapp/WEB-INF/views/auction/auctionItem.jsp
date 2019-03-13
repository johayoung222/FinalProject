<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Get It :: 중고거래의 중심" name="pageTitle" />
</jsp:include>

	<c:if test="${brandNew != null }">
		<h2>새로 등록된 상품 리스트</h2>
	</c:if>
<style>
.indexphoto {
	width: 100%;
	height: 300px;
}

#favorite {
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
 width:100%;
}
#box1 {
	display: inline-block;
	vertical-align: top;
    width: 22%;

	height: 150px;
	border: 1px solid #dbdbdb;

}

#box2 {
	display: inline-block;
	vertical-align: top;
	width: 22%;
	height: 150px;
	border: 1px solid #dbdbdb;
	margin-left: 10px;
}

#box3 {
	display: inline-block;
	vertical-align: top;
	width: 20%;
	height: 150px;
	border: 1px solid #dbdbdb;
	margin-left: 10px;
}

#box4 {
	display: inline-block;
	padding-top: 0px;
}

.font2_ {
	left: 30%;
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
.moreItems{
	float: right;
	margin-right: 100px;
	cursor: pointer;
	font-size: 20px;
}
.productOne:hover{
	border-radius: 5px;
	box-shadow: 3px 3px 5px 7px lightgray;
	cursor: pointer;
}
.pImg{
	width: 200px;
	height: 180px;
}

.blinkEle1 , .blinkEle2 , .blinkEle3 , .blinkEle4 ,
.blinkEle5 , .blinkEle6 , .blinkEle7 , .blinkEle8 ,
.blinkEle9 , .blinkEle10 , .blinkEle11 , .blinkEle12 ,
.blinkEle13 , .blinkEle14 , .blinkEle15 , .blinkEle16 ,
.blinkEle17 , .blinkEle18 , .blinkEle19 , .blinkEle20{
	visibility: hidden;
}

.myblinkEle1 , .myblinkEle2 , .myblinkEle3 , .myblinkEle4 ,
.myblinkEle5 , .myblinkEle6 , .myblinkEle7 , .myblinkEle8 ,
.myblinkEle9 , .myblinkEle10 , .myblinkEle11 , .myblinkEle12 ,
.myblinkEle13 , .myblinkEle14 , .myblinkEle15 , .myblinkEle16 ,
.myblinkEle17 , .myblinkEle18 , .myblinkEle19 , .myblinkEle20{
	visibility: hidden;
}
</style>	
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
	if(ss<10) { ss='0'+ss }
	
	today = yyyy + '-' + mm+'-'+dd + " " + hh + ":" + MM + ":" + ss;
	return today;
}


// 온로드 됬을때 경매 진행중인지 ? 아니면 내가 경매에 참여중인지 찍어주기 위한 소스코드

	$(function(){
		var mainAuction1 = "${result.check1}";
		var mainAuction2 = "${result.check2}";
		var mainAuction3 = "${result.check3}";
		var mainAuction4 = "${result.check4}";
		var mainAuction5 = "${result.check5}";
		var mainAuction6 = "${result.check6}";
		var mainAuction7 = "${result.check7}";
		var mainAuction8 = "${result.check8}";
		var mainAuction9 = "${result.check9}";
		var mainAuction10 = "${result.check10}";
		var mainAuction11 = "${result.check11}";
		var mainAuction12 = "${result.check12}";
		var mainAuction13 = "${result.check13}";
		var mainAuction14 = "${result.check14}";
		var mainAuction15 = "${result.check15}";
		var mainAuction16 = "${result.check16}";
		var mainAuction17 = "${result.check17}";
		var mainAuction18 = "${result.check18}";
		var mainAuction19 = "${result.check19}";
		var mainAuction20 = "${result.check20}";
		
		var resultPrice1 = "${resultPrice.Price1}";
		var resultPrice2 = "${resultPrice.Price2}";
		var resultPrice3 = "${resultPrice.Price3}";
		var resultPrice4 = "${resultPrice.Price4}";
		var resultPrice5 = "${resultPrice.Price5}";
		var resultPrice6 = "${resultPrice.Price6}";
		var resultPrice7 = "${resultPrice.Price7}";
		var resultPrice8 = "${resultPrice.Price8}";
		var resultPrice9 = "${resultPrice.Price9}";
		var resultPrice10 = "${resultPrice.Price10}";
		var resultPrice11 = "${resultPrice.Price11}";
		var resultPrice12 = "${resultPrice.Price12}";
		var resultPrice13 = "${resultPrice.Price13}";
		var resultPrice14 = "${resultPrice.Price14}";
		var resultPrice15 = "${resultPrice.Price15}";
		var resultPrice16 = "${resultPrice.Price16}";
		var resultPrice17 = "${resultPrice.Price17}";
		var resultPrice18 = "${resultPrice.Price18}";
		var resultPrice19 = "${resultPrice.Price19}";
		var resultPrice20 = "${resultPrice.Price20}";
		
		for(var i = 1; i <= 4;i++) {
			var sdate = $("#sdate"+i).prop("value");
			var edate = $("#edate"+i).prop("value");
			today = getTime();			
			
			var result = 0;
			
			if(today>sdate) {
				result++;
			}
			if(today<edate) {
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
		$(".resultPrice5").html(addComma(resultPrice5));
		$(".resultPrice6").html(addComma(resultPrice6));
		$(".resultPrice7").html(addComma(resultPrice7));
		$(".resultPrice8").html(addComma(resultPrice8));
		$(".resultPrice9").html(addComma(resultPrice9));
		$(".resultPrice10").html(addComma(resultPrice10));
		$(".resultPrice11").html(addComma(resultPrice11));
		$(".resultPrice12").html(addComma(resultPrice12));
		$(".resultPrice13").html(addComma(resultPrice13));
		$(".resultPrice14").html(addComma(resultPrice14));
		$(".resultPrice15").html(addComma(resultPrice15));
		$(".resultPrice16").html(addComma(resultPrice16));
		$(".resultPrice17").html(addComma(resultPrice17));
		$(".resultPrice18").html(addComma(resultPrice18));
		$(".resultPrice19").html(addComma(resultPrice19));
		$(".resultPrice20").html(addComma(resultPrice20));
		
		
	// 여기서부터는 입찰에 참여하였는지에 대한 출력
	if(mainAuction1 == "Y") {$(".myblinkEle1").css("visibility", "visible");}
	if(mainAuction2 == "Y") {$(".myblinkEle2").css("visibility", "visible");}
	if(mainAuction3 == "Y") {$(".myblinkEle3").css("visibility", "visible");}
	if(mainAuction4 == "Y") {$(".myblinkEle4").css("visibility", "visible");}
	if(mainAuction4 == "Y") {$(".myblinkEle5").css("visibility", "visible");}
	if(mainAuction4 == "Y") {$(".myblinkEle6").css("visibility", "visible");}
	if(mainAuction4 == "Y") {$(".myblinkEle7").css("visibility", "visible");}
	if(mainAuction4 == "Y") {$(".myblinkEle8").css("visibility", "visible");}
	if(mainAuction4 == "Y") {$(".myblinkEle9").css("visibility", "visible");}
	if(mainAuction4 == "Y") {$(".myblinkEle10").css("visibility", "visible");}
	if(mainAuction4 == "Y") {$(".myblinkEle11").css("visibility", "visible");}
	if(mainAuction4 == "Y") {$(".myblinkEle12").css("visibility", "visible");}
	if(mainAuction4 == "Y") {$(".myblinkEle13").css("visibility", "visible");}
	if(mainAuction4 == "Y") {$(".myblinkEle14").css("visibility", "visible");}
	if(mainAuction4 == "Y") {$(".myblinkEle15").css("visibility", "visible");}
	if(mainAuction4 == "Y") {$(".myblinkEle16").css("visibility", "visible");}
	if(mainAuction4 == "Y") {$(".myblinkEle17").css("visibility", "visible");}
	if(mainAuction4 == "Y") {$(".myblinkEle18").css("visibility", "visible");}
	if(mainAuction4 == "Y") {$(".myblinkEle19").css("visibility", "visible");}
	if(mainAuction4 == "Y") {$(".myblinkEle20").css("visibility", "visible");}
	
	var bidCheck1 = "${resultPrice.bidCheck1}";
	var bidCheck2 = "${resultPrice.bidCheck2}";
	var bidCheck3 = "${resultPrice.bidCheck3}";
	var bidCheck4 = "${resultPrice.bidCheck4}";
	var bidCheck5 = "${resultPrice.bidCheck5}";
	var bidCheck6 = "${resultPrice.bidCheck6}";
	var bidCheck7 = "${resultPrice.bidCheck7}";
	var bidCheck8 = "${resultPrice.bidCheck8}";
	var bidCheck9 = "${resultPrice.bidCheck9}";
	var bidCheck10 = "${resultPrice.bidCheck10}";
	var bidCheck11 = "${resultPrice.bidCheck11}";
	var bidCheck12 = "${resultPrice.bidCheck12}";
	var bidCheck13 = "${resultPrice.bidCheck13}";
	var bidCheck14 = "${resultPrice.bidCheck14}";
	var bidCheck15 = "${resultPrice.bidCheck15}";
	var bidCheck16 = "${resultPrice.bidCheck16}";
	var bidCheck17 = "${resultPrice.bidCheck17}";
	var bidCheck18 = "${resultPrice.bidCheck18}";
	var bidCheck19 = "${resultPrice.bidCheck19}";
	var bidCheck20 = "${resultPrice.bidCheck20}";
	
	if("${resultPrice.bidCheck1}" == "N") {$("#bidcheck1").html("기준가");}
	if("${resultPrice.bidCheck2}" == "N") {$("#bidcheck2").html("기준가");}
	if("${resultPrice.bidCheck3}" == "N") {$("#bidcheck3").html("기준가");}
	if("${resultPrice.bidCheck4}" == "N") {$("#bidcheck4").html("기준가");}
	if("${resultPrice.bidCheck5}" == "N") {$("#bidcheck5").html("기준가");}
	if("${resultPrice.bidCheck6}" == "N") {$("#bidcheck6").html("기준가");}
	if("${resultPrice.bidCheck7}" == "N") {$("#bidcheck7").html("기준가");}
	if("${resultPrice.bidCheck8}" == "N") {$("#bidcheck8").html("기준가");}
	if("${resultPrice.bidCheck9}" == "N") {$("#bidcheck9").html("기준가");}
	if("${resultPrice.bidCheck10}" == "N") {$("#bidcheck10").html("기준가");}
	if("${resultPrice.bidCheck11}" == "N") {$("#bidcheck11").html("기준가");}
	if("${resultPrice.bidCheck12}" == "N") {$("#bidcheck12").html("기준가");}
	if("${resultPrice.bidCheck13}" == "N") {$("#bidcheck13").html("기준가");}
	if("${resultPrice.bidCheck14}" == "N") {$("#bidcheck14").html("기준가");}
	if("${resultPrice.bidCheck15}" == "N") {$("#bidcheck15").html("기준가");}
	if("${resultPrice.bidCheck16}" == "N") {$("#bidcheck16").html("기준가");}
	if("${resultPrice.bidCheck17}" == "N") {$("#bidcheck17").html("기준가");}
	if("${resultPrice.bidCheck18}" == "N") {$("#bidcheck18").html("기준가");}
	if("${resultPrice.bidCheck19}" == "N") {$("#bidcheck19").html("기준가");}
	if("${resultPrice.bidCheck20}" == "N") {$("#bidcheck20").html("기준가");}

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