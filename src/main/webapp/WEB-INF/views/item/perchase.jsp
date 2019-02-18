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
<!-- Daum Address API -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
IMP.init("imp25216490");

function perchaseProduct(){
	
IMP.request_pay({ // param
    pg: "html5_inicis",
    pay_method: perchaseFrm.payMethod.value,
    merchant_uid: "ORD20180131-0000011",
    name: perchaseFrm.pName.value,
    amount: perchaseFrm.payAmount.value,
    buyer_email: "gildong@gmail.com",
    buyer_name: perchaseFrm.dName,
    buyer_tel: perchaseFrm.dPhone.value,
    buyer_addr: perchaseFrm.dAddress.value,
    buyer_postcode: perchaseFrm.dfAddress.value
}, function (rsp) { // callback
    if (rsp.success) {
        // 결제 성공 시 로직,
    } else {
        // 결제 실패 시 로직,
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
