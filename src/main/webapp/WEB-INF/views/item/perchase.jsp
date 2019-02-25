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
	
/* 	BootPay.request({
		price: perchaseFrm.payAmount.value, //실제 결제되는 가격
		application_id: "5c6beb72b6d49c7cd4505f60",
		name: perchaseFrm.pName.value, //결제창에서 보여질 이름
		pg: 'inicis',
		method: perchaseFrm.payMethod.value, //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
		show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
		items: [
			{
				item_name: perchaseFrm.pName.value, //상품명
				qty: 1, //수량
				unique: '123', //해당 상품을 구분짓는 primary key
				price: perchaseFrm.payAmount.value, //상품 단가
			}
		],
		user_info: {
			username: perchaseFrm.dName.value,
			email: perchaseFrm.dEmail.value,
			addr: perchaseFrm.dAddress.value,
			phone: perchaseFrm.dPhone.value
		},
		order_id: 'order'+new Date().getTime(), //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
		params: {callback1: '1', callback2: '2'},
		account_expire_at: '2019-03-15', // 가상계좌 입금기간 제한 ( yyyy-mm-dd 포멧으로 입력해주세요. 가상계좌만 적용됩니다. )
		extra: {
	        vbank_result: 1, // 가상계좌 사용시 사용, 가상계좌 결과창을 볼지(1), 말지(0), 미설정시 봄(1)
	        quota: '0,2,3' // 결제금액이 5만원 이상시 할부개월 허용범위를 설정할 수 있음, [0(일시불), 2개월, 3개월] 허용, 미설정시 12개월까지 허용
		}
	}).error(function (data) {
		//결제 진행시 에러가 발생하면 수행됩니다.
		console.log("error",data);
	}).cancel(function (data) {
		//결제가 취소되면 수행됩니다.
		console.log("cancel",data);
	}).ready(function (data) {
		// 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
		console.log("ready",data);
	}).confirm(function (data) {
		//결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다.
		//주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.
		console.log("confirm",data);
		if (true) { // 재고 수량 관리 로직 혹은 다른 처리
			this.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
		} else {
			this.removePaymentWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
		}
	}).close(function (data) {
	    // 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
	    console.log("close",data);
	}).done(function (data) {
		//결제가 정상적으로 완료되면 수행됩니다
		//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
		console.log("done",data);
	}); */
	
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
                "merchantUid" : rsp.merchant_uid
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
            
            alert(msg);
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
	border: 1px solid black;
	height: 750px;
}
.perchase-container{
	border: 1px solid black;
	width: 1000px;
	height: 100%;
	margin: 0 auto;
	display: flex;
	justify-content: space-between;
	margin-top: 50px;
}
.deliverInfo-container{
	border: 1px solid black;
	height: 100%;
	width: 59%;
}
.payment-container{
	border: 1px solid black;
	height: 90%;
	width: 39%;
}
.order-text{
	border: 1px solid black;
	height: 100px;
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
</style>
		
<div class="content-container">
	<form action="" name="perchaseFrm">
	<div class="perchase-container">
		<div class="deliverInfo-container">
			<div class="order-text"><span>주문하기</span></div>
			<div class="deliverInfo">
				<div class="deliver-text"><span>배송정보</span></div>
				<div class="deliver-name">
					<label for="dName">이름</label><br />
					<input type="text" id="dName" name="dName" />
				</div>
				<div class="deliver-phone">
					<label for="dPhone">전화번호</label>
					<input type="text" id="dPhone" name="dPhone" />
				</div>
				<div class="deliver-email">
					<label for="dEmail">이메일</label>
					<input type="email" id="dEmail" name="dEmail" />
				</div>
				<div class="deliver-address">
					<label for="dfAddress">우편번호</label>
					<input type="text" id="dfAddress" name="dfAddress" />
					<input type="button" id="findAddress" value="검색"/><br />
					<label for="dAddress">주소</label>
					<input type="text" id="dAddress" name="dAddress" />
					<label for="dAddressInfo">상세 주소</label>
					<input type="text" id="dAddressInfo" name="dAddressInfo" />
				</div>
				<hr />
				<div class="perchase-method">
					<div class="perchase-text"><span>결제 수단</span></div>
					<div class="perchase-box">
						<button id="payCard" type="button">신용카드</button>
						<button id="payVbank" type="button">무통장입금</button>
						<input type="hidden" name="payMethod"/>
					</div>
				</div>
			</div>
		</div>
		<div class="payment-container">
			<div class="productInfo-container">
				<div class="product-text"><span>결제상품</span></div>
				<div class="productInfo"><input type="text" name="pName" value="${product.productName }" disabled/></div>
			</div>
			<hr />
			<div class="payment-price">
				<span>상품금액</span>
				<span>${product.productPrice }원</span>
			</div>
			<div class="payment-coupon">
				<span>쿠폰 사용</span>
				<span>사용 가능한 쿠폰이 없습니다.</span>
			</div>
			<div class="payment-point">
				<span>겟잇 포인트</span>
				-<input type="number" name="payPoint" id="payPoint"/>
				<label for="payPoint">원</label>
			</div>
			<div class="member-point">
				<span>보유 포인트</span>
				<span>0원</span>
				<button>전액 사용</button>
			</div>
			<div class="payment-deliverPay">
				<span>배송료</span>
				<span>0원</span>
			</div>
			<hr />
			<div class="payment-result">
				<span>결제하실 금액</span>
				<input type="number" name="payAmount" disabled value="${product.productPrice }" id="payAmount"/>원<br />
				<button type="button" onclick="perchaseProduct();">결제하기</button>
			</div>
		</div>
	</div>
	</form>
</div>

<script>
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
	perchaseFrm.payMethod.value = "card";
});

$("#payVbank").on('click',function(){
	perchaseFrm.payMethod.value = "vbank";
});
</script>
