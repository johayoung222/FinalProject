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

</style>
<div class="mypage-container">
	<div class="real-content-container">
		<div class="mp-container" style="margin-left:100px;">
			<div class="mp">
			<strong style="font-size:20px;">
			알림 설정
			</strong>
			</div>
			<hr style="width:130%;">
			<div class="mypage-profile">
				<div class="wish-body-title">
					앱 알림
				</div>
					<div class="wish-body-content">
						<div class="wish-checkbox-wrapper ng-binding ng-scope" ng-repeat="item in appPreferencesList">
							거래와 관련된 알림이 있을 때
							<input class="wish-form-checkbox ng-pristine ng-valid" ng-change="updatePreferences()" ng-false-value="no" ng-model="preferences[item.key]" ng-true-value="yes" type="checkbox">
						</div>
						<div class="wish-checkbox-wrapper ng-binding ng-scope" ng-repeat="item in appPreferencesList">
							팔로우한 관심사에 상품이 등록되었을 때
							<input class="wish-form-checkbox ng-pristine ng-valid" ng-change="updatePreferences()" ng-false-value="no" ng-model="preferences[item.key]" ng-true-value="yes" type="checkbox">
						</div>
						<div class="wish-checkbox-wrapper ng-binding ng-scope" ng-repeat="item in appPreferencesList">
							쿠폰 또는 혜택이 있을 때
							<input class="wish-form-checkbox ng-pristine ng-valid" ng-change="updatePreferences()" ng-false-value="no" ng-model="preferences[item.key]" ng-true-value="yes" type="checkbox">
						</div>
						<div class="wish-checkbox-wrapper ng-binding ng-scope" ng-repeat="item in appPreferencesList">
							추천 상품이 있을 때
							<input class="wish-form-checkbox ng-pristine ng-valid" ng-change="updatePreferences()" ng-false-value="no" ng-model="preferences[item.key]" ng-true-value="yes" type="checkbox">
						</div>
						<div class="wish-checkbox-wrapper ng-binding ng-scope" ng-repeat="item in appPreferencesList">
							이벤트가 있을 때
							<input class="wish-form-checkbox ng-pristine ng-valid" ng-change="updatePreferences()" ng-false-value="no" ng-model="preferences[item.key]" ng-true-value="yes" type="checkbox">
						</div>
						<div class="wish-checkbox-wrapper ng-binding ng-scope" ng-repeat="item in appPreferencesList">
							알림설정한 상품이 등록되었을 때
							<input class="wish-form-checkbox ng-pristine ng-valid" ng-change="updatePreferences()" ng-false-value="no" ng-model="preferences[item.key]" ng-true-value="yes" type="checkbox">
						</div>
						<div ng-controller="WishlistCtrl" class="ng-scope">
							<div class="wish-items-wrapper" ng-show="products.length == 0"><div class="wish-no-item-wrapper">
								<div class="wish-no-item-title">
								<c:if test="${empty list }">
									${msg }
								</c:if>
								<c:if test="${not empty list }">
									<c:forEach items="${list }" var="o">
										
									</c:forEach>
								</c:if>
								</div>
								제품 상세 페이지에서 알림 받기를 클릭하시면 추후 동일한 제품이 등록될 때 셀잇 앱 알림을 보내드립니다.
							</div>
						</div>
						<hr style="width: 110%;">
					</div>
				</div>
			</div>
			<div class="mypage-profile">
				<div class="wish-body-title">
					이메일
				</div>
				<div class="wish-body-content">
					<div class="wish-checkbox-wrapper ng-binding ng-scope" ng-repeat="item in emailPreferencesList">
						팔로우한 관심사에 상품이 등록되었을 때
						<input class="wish-form-checkbox ng-pristine ng-valid" ng-change="updatePreferences()" ng-false-value="no" ng-model="preferences[item.key]" ng-true-value="yes" type="checkbox">
					</div>
					<div class="wish-checkbox-wrapper ng-binding ng-scope" ng-repeat="item in emailPreferencesList">
						알림설정한 상품이 등록되었을 때
						<input class="wish-form-checkbox ng-pristine ng-valid" ng-change="updatePreferences()" ng-false-value="no" ng-model="preferences[item.key]" ng-true-value="yes" type="checkbox">
					</div>
					<div class="wish-checkbox-wrapper ng-binding ng-scope" ng-repeat="item in emailPreferencesList">
						쿠폰 또는 혜택이 있을 때
						<input class="wish-form-checkbox ng-pristine ng-valid" ng-change="updatePreferences()" ng-false-value="no" ng-model="preferences[item.key]" ng-true-value="yes" type="checkbox">
					</div>
				</div>
			</div>
		</div>	
	</div>
</div>
<script>
$(function(){
	$(".wishlist").css("color" , "#7151FC");
	$(".wishlist").css("font-weight" , "bold");
	$(".wishlist").css("background" , "#f2f2f2");
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>