<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle" />
</jsp:include>
<jsp:include page="/WEB-INF/views/common/mypageSide.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypage.css" />
<style>
#right_{
position:absolute;
    top: 300px;
    right: 62px;
}
#promo_{
	right:100px;
	bottom:82px;
}
</style>
<div class="mypage-container">
	<div class="real-content-container" style="margin-left:30%;">
		<div class="mp-container">
			<div class="mp">
			프로모션
			</div>
			<hr style="width:120%;">
			<div class="mypage">
				<div>
					<div class="credit-apply-btn-space" id="right_">
						<img src="${pageContext.request.contextPath }/resources/images/플러스 버튼.PNG" alt="" class="credit-apply-btn-plus-image" />
						<span style="color: #7151FC"><a class="credit-apply-btn-text">프로모션 코드 등록</a></span>
					</div>
				</div>
				<div class="promo-title-image-container">
					<img src="${pageContext.request.contextPath }/resources/images/확성기1.png" alt="" class="promo" style="margin-left:42%;" />
				</div>
				<div class="promo-title-text">
					친구들에게 셀잇을 알려주세요.
				</div>
				<div class="promo-desc">
					프로모션 코드 jptd<!-- 랜덤 6자리 -->를 공유해보세요.<br>
					초대 받은 친구가 처음으로 판매를 완료하면, 축하의 의미로 친구와 고객님 모두에게<br>
					<span>10,000원 할인 쿠폰</span>
					을 드립니다.
				</div>
				<div class="row">
					<div class="col-xs-6 col-xs-offset-3">
						<div class="row">
							<a class="col-xs-4" ng-click="trackButton('facebook_promotion_share')" si-facebook-invite="" url="http://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fwww.withsellit.com%2Finvite%2Fjptd%3Fs%3Dsfb" style="left:148px;">
								
								<div class="promo-share-icon">
									<img src="${pageContext.request.contextPath }/resources/images/페이스북icon.PNG">
								</div>
								<div class="promo-share-desc" >
									페이스북
								</div>
								
							</a>
							<a href="mailto:?body=%EC%85%80%EC%9E%87%20%EC%97%84%EC%B2%AD%20%ED%8E%B8%EB%A6%AC%ED%95%98%EB%84%A4%EC%9A%94%21%20%0A%EC%95%88%EC%93%B0%EB%8A%94%20%EB%AC%BC%EA%B1%B4%EC%9D%80%20%EA%BC%AD%20%EC%85%80%EC%9E%87%EC%9C%BC%EB%A1%9C%20%ED%8C%90%EB%A7%A4%ED%95%B4%EB%B3%B4%EC%84%B8%EC%9A%94.%20%0A%EC%A7%80%EA%B8%88%20%EC%A0%9C%20%ED%94%84%EB%A1%9C%EB%AA%A8%EC%85%98%20%EC%BD%94%EB%93%9C%28jptd%29%EB%A1%9C%20%EB%AC%BC%EA%B1%B4%EC%9D%84%20%ED%8C%90%EB%A7%A4%ED%95%98%EB%A9%B4%2010%2C000%EC%9B%90%20%ED%95%A0%EC%9D%B8%20%EC%BF%A0%ED%8F%B0%EC%9D%84%20%EB%93%9C%EB%A6%B0%EB%8C%80%EC%9A%94%3A%29%0Ahttps%3A%2F%2Fwww.withsellit.com%2Finvite%2Fjptd%3Fs%3Dse&amp;subject=%EC%A7%80%EA%B8%88%20%EC%85%80%EC%9E%87%EC%97%90%20%EB%AC%BC%EA%B1%B4%EC%9D%84%20%ED%8C%90%EB%A7%A4%ED%95%98%EC%8B%9C%EB%A9%B4%2010%2C000%EC%9B%90%20%ED%95%A0%EC%9D%B8%20%EC%BF%A0%ED%8F%B0%EC%9D%84%20%EB%93%9C%EB%A6%BD%EB%8B%88%EB%8B%A4%21" ng-click="trackButton('email_promotion_share')" target="_blank">
								<div class="col-xs-4" id="promo_">
									<div class="promo-share-icon">
										<img src="${pageContext.request.contextPath }/resources/images/이메일icon.PNG">
									</div>
									<div class="promo-share-desc">
										이메일
									</div>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="mypage">
				<div class="credit-title">
					<div class="credit-label">
						보유 크레딧
					</div>
					0원
				</div>
				<div class="credit-list-title">
					크레딧 내역
				</div>
				<div class="credit-list-table" params="{&quot;transactions&quot;:[]}" si-params="">
					<div class="credit-list-row title">
						<div class="row">
							<div class="col-xs-2">
								날짜
							</div>
							<div class="col-xs-8">
								설명
							</div>
							<div class="col-xs-2">
								금액
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="mypage">
				<div class="credit-instruction">
					크레딧은 제품 구매시 사용하실 수 있으며, 셀잇 서비스 내에서만 사용 가능합니다.
				</div>
			</div>
		</div>	
	</div>
</div>
<script>
$(function(){
	$(".profileCredit").css("color" , "#7151FC");
	$(".profileCredit").css("font-weight" , "bold");
	$(".profileCredit").css("background" , "#f2f2f2");
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>