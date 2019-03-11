<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Get It :: 구매하기" name="pageTitle"/>
</jsp:include>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- bootpay -->
<script src="https://cdn.bootpay.co.kr/js/bootpay-2.0.20.min.js" type="application/javascript"></script>
<!-- Daum Address API -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>

function perchaseProduct(){
var couponL = $("#couponList option:selected").val();
var dName = perchaseFrm.dName.value;
var dPhone = perchaseFrm.dPhone.value;
var dEmail = perchaseFrm.dEmail.value;
var dAddress = perchaseFrm.dAddress.value;
var dfAddress = perchaseFrm.dfAddress.value;
var pName = perchaseFrm.pName.value;
var payAmount = perchaseFrm.payAmount.value;
var pay_method = perchaseFrm.payMethod.value;
var dAddressInfo = perchaseFrm.dAddressInfo.value;
var seqMemberNo = perchaseFrm.seqMemberNo.value;
var seqProductNo = "${product.seqProductNo}";

console.log(dName, dPhone, dEmail, dAddress, dfAddress, pName, payAmount, pay_method);

if(pay_method == ""){
	alert("결제 수단을 선택해 주세요.");
	return;
}
if(dName == ""){
	alert("이름을 입력해 주세요.");
	return;
}
if(dPhone == ""){
	alert("연락받을 번호를 입력해 주세요.");
	return;
}
if(dAddress == ""){
	alert("배송 받을 주소를 입력해주세요.");
	return;
}
if(dfAddress == ""){
	alert("우편번호를 입력해주세요.");
	return;
}
if(dAddressInfo.trim() == ""){
	alert("상세주소를 입력해주세요.");
	return;
}
if(pName == "" || payAmount == ""){
	alert("주문 정보가 올바르지 않습니다.");
	return;
}

IMP.init("imp25216490");
	
IMP.request_pay({ // param
    pg: "html5_inicis",
    pay_method: perchaseFrm.payMethod.value,
    merchant_uid: "ORD"+ new Date().getTime(),
    name: perchaseFrm.pName.value,
    amount: perchaseFrm.payAmount.value,
    buyer_name: perchaseFrm.dName.value,
    buyer_email : perchaseFrm.dEmail.value,
    buyer_tel: perchaseFrm.dPhone.value,
    buyer_addr: perchaseFrm.dAddress.value,
    buyer_postcode: perchaseFrm.dfAddress.value
}, function (rsp) { // callback
        if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
        // jQuery로 HTTP 요청
        var param = {
                "impUid" : rsp.imp_uid,
                "merchantUid" : rsp.merchant_uid,
                "orderMethod": perchaseFrm.payMethod.value,
                "orderPrice": perchaseFrm.payAmount.value,
                "orderResult": "Y",
                "seqMemberNo": seqMemberNo,
                "orderAmount": 1,
                "orderCoupon": couponL,
                "seqProductNo": seqProductNo
            };
        var jParam = JSON.stringify(param);
        $.ajax({
            url: "${pageContext.request.contextPath}/item/perchase/complete", // 가맹점 서버
            method: "POST",
            headers: { "Content-Type": "application/json" },
            data: jParam
        }).done(function (data) {
        	var msg = '결제가 완료되었습니다.';
            msg += '고유ID : ' + rsp.imp_uid;
            msg += '상점 거래ID : ' + rsp.merchant_uid;
            msg += '결제 금액 : ' + rsp.paid_amount;
            msg += '카드 승인번호 : ' + rsp.apply_num;
            
            alert("결제가 완료되었습니다.");
            console.log(data);
            location.href = "${pageContext.request.contextPath}/mypage/order";
        })
    } else {
        // 결제 실패 시 로직,
        console.log(rsp.imp_uid, rsp.merchant_uid);
        alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
    }
});
}

</script>
		
<style>
.content-container{
	height: 750px;
}
.perchase-container{
	width: 1000px;
	height: 100%;
	margin: 0 auto;
	display: flex;
	justify-content: space-between;
	margin-top: 50px;
}
.deliverInfo-container{
	height: 100%;
	width: 59%;
}
.payment-container{
	height: 90%;
	width: 39%;
}
.payment-container>div{
	margin-bottom: 20px;
	font-size: 15px;
}
.order-text{
	height: 100px;
}
.deliver-text{
	font-size: 20px;
	margin-bottom: 20px;
}
.order-text span{
	margin-left: 30px;
	line-height: 80px;
	font-size: 30px;
	
}
#payAmount{
	border: none;
	text-align: right;
	background-color: white;
	color: red;
}
.text-success{
	font-size: 16px;
	font-style: oblique;
}
#payPoint{
	width: 100px;
}
.payment-result [type=button]{
	margin-left: 250px;
}
#dfAddress{
	width: 200px;
	display: inline-block;
}
#couponList{
	width:200px;
	display:inline-block;
}
.couponbtn{
	display:inline-block;
}
.rate{
	visibility:hidden;
}
</style>
		
<div class="content-container">
	<form action="" name="perchaseFrm">
	<div class="perchase-container shadow-lg p-3 mb-5 bg-white rounded">
		<div class="deliverInfo-container shadow-none p-3 mb-5 bg-light rounded">
			<div class="order-text"><span>주문하기</span></div>
			<div class="deliverInfo">
				<div class="deliver-text"><span>배송정보</span></div>
				<div class="deliver-name">
					<label for="dName" class="text-success font-weight-bold">이름:</label><br />
					<input type="text" id="dName" name="dName" class="form-control" value="${member.memberName }"/>
				</div>
				<div class="deliver-phone">
					<label for="dPhone" class="text-success font-weight-bold">전화번호:</label>
					<input type="text" id="dPhone" name="dPhone" class="form-control" value="${member.memberPhone }"/>
				</div>
				<div class="deliver-email">
					<label for="dEmail" class="text-success font-weight-bold">이메일:</label>
					<input type="email" id="dEmail" name="dEmail" class="form-control" value="${member.memberEmail }"/>
				</div>
				<div class="deliver-address">
					<label for="dfAddress" class="text-success font-weight-bold">우편번호:</label><br />
					<input type="text" id="dfAddress" class="form-control" name="dfAddress" />
					<input type="button" id="findAddress" value="검색" class="btn btn-outline-info"/><br />
					<label for="dAddress" class="text-success font-weight-bold">주소:</label>
					<input type="text" id="dAddress" class="form-control" name="dAddress" />
					<label for="dAddressInfo" class="text-success font-weight-bold">상세 주소:</label>
					<input type="text" id="dAddressInfo" class="form-control" name="dAddressInfo" />
				</div>
				<hr />
				<div class="perchase-method">
					<div class="perchase-text"><span class="text-success font-weight-bold">결제 수단</span></div>
					<div class="perchase-box">
						<button id="payCard" type="button" class="btn btn-outline-info">신용카드</button>
						<button id="payVbank" type="button" class="btn btn-outline-info">무통장입금</button>
						<input type="hidden" name="payMethod"/>
						<input type="hidden" name="seqMemberNo" value="${member.seqMemberNo }" />
					</div>
				</div>
			</div>
		</div>
		<div class="payment-container shadow-none p-3 mb-5 bg-light rounded">
			<div class="productInfo-container">
				<div class="product-text"><span>결제상품</span></div>
				<div class="productInfo">
					<input type="hidden" name="pName" value="${product.productName }"/>
					<img src="" alt="제품이미지" />
					<span class="font-weight-bold">${product.productName }</span>
				</div>
			</div>
			<hr />
			<div class="payment-price clearfix">
				<span class="float-left">상품금액</span>
				<span class="float-right">${product.productPrice }원</span>
			</div>
			<div class="payment-price rate">
				<span class="float-left">할인률</span>
				<span class="float-right price-rate"></span>
			</div>
			<br /><br />
			<div class="payment-coupon">
				<span>쿠폰 사용</span><br />
				<select id="couponList" class="form-control form-control-sm">
					<option value="" disabled selected>쿠폰</option>
				</select>
				<button type="button" onclick="couponBtn();" class="couponbtn btn btn-outline-info">적용</button>
				<button type="button" onclick="couponBtnn();" class="couponbtn btn btn-outline-info">미적용</button>
				<br />
				
			
			<hr />
			<div class="payment-result">
				<span>결제하실 금액</span>
				<input type="number" name="payAmount" disabled value="${product.productPrice }" id="payAmount"/>원<br /><br />
				<button type="button" onclick="perchaseProduct();" class="btn btn-outline-info">결제하기</button>
			</div>
		</div>
	</div>
	</form>
</div>

<script>
$(function(){
	var buyerNo = ${member.seqMemberNo };
	//console.log(buyerNo);
	
	$.ajax({
		url : "${pageContext.request.contextPath}/item/couponList.do",
		dataType : "json",
		data:{buyerNo:buyerNo},
		success : function(data){
			var html ="";
			for(var i in data){
			html += "<option name='couponL' id='couponL' class='couponL' value="+data[i].COUPON_RATE+">"+data[i].COUPON_NAME+"</option>";
			}
			$("#couponList").append(html);
		},error : function(){
			console.log("ajax 요청 실패!!");
		}
	}); 
});

function couponBtn(){
	var rate = $("#couponList option:selected").val();
	var payAmount = ${product.productPrice };
	$("#payAmount").val(Math.floor(payAmount-(payAmount*rate)));
	$(".rate").css("visibility","visible");
	$(".price-rate").text("-"+Math.floor(payAmount*rate)+"원");
	//console.log(rate);
	
}

function couponBtnn(){
	$("#payAmount").val(${product.productPrice });
	$(".rate").css("visibility","hidden");
	$(".price-rate").text("");
}

$("#findAddress").on('click',function(){
	new daum.Postcode({
        oncomplete: function(data) {
        	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                perchaseFrm.dAddress.value = extraAddr;
            
            } else {
                perchaseFrm.dAddress.value = extraAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            perchaseFrm.dfAddress.value = data.zonecode;
            perchaseFrm.dAddress.value = addr;
            
            perchaseFrm.dAddressInfo.focus();
        }
    }).open();
});

$("#payCard").on('click',function(){
	$(this).addClass("active").next().removeClass("active");
	perchaseFrm.payMethod.value = "card";
});

$("#payVbank").on('click',function(){
	$(this).addClass("active").prev().removeClass("active");
	perchaseFrm.payMethod.value = "vbank";
});
</script>
