<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<style>
.mp-menu-title {
    color: #666666;
    font-size: 24px;
    line-height: 27px;
}

.mp-menu {
    vertical-align: top;
    display: inline-block;
    width: 144px;
    margin-bottom: 36px;
}

.content-container {
    width: 200px;
    margin-left: 110px;
    padding-top: 48px;
    display: inline-block;
    position: absolute;
}

.mp-menu-items {
    margin-top: 20px;
    border: 1px solid #ececec;
}

.nav-pills a:hover{
    color: #7151FC;
    /* border-bottom: 2px solid #7151FC; */
    
}


</style>
<div class="content-container">
	<div class="mp-menu">
		<div class="mp-menu-title">
			마이 페이지
		</div>
		<div class="mp-menu-items">
			<div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
				<a class="nav-link order" id="v-pills-home-tab" href="${pageContext.request.contextPath}/mypage/order.do" role="tab" aria-controls="v-pills-home" aria-selected="true">판매내역</a>
				<a class="nav-link purchases" id="v-pills-profile-tab" href="${pageContext.request.contextPath}/mypage/purchases.do" role="tab" aria-controls="v-pills-profile" aria-selected="false">구매내역</a>
				<a class="nav-link bookmarks" id="v-pills-messages-tab" href="${pageContext.request.contextPath}/item/basket.do?memberNo=${memberLoggedIn.seqMemberNo}" role="tab" aria-controls="v-pills-messages" aria-selected="false">장바구니</a>
				<a class="nav-link coupons" id="v-pills-settings-tab" href="${pageContext.request.contextPath}/mypage/coupons.do" role="tab" aria-controls="v-pills-settings" aria-selected="false">내 쿠폰</a>
				<%-- <a class="nav-link profileCredit" id="v-pills-settings-tab" href="${pageContext.request.contextPath}/mypage/profile/credit.do" role="tab" aria-controls="v-pills-settings" aria-selected="false">프로모션</a> --%>
				<a class="nav-link profileEdit" id="v-pills-settings-tab" href="${pageContext.request.contextPath}/mypage/profile/edit.do" role="tab" aria-controls="v-pills-settings" aria-selected="false">내 정보</a>
				<%-- <a class="nav-link wishlist" id="v-pills-settings-tab" href="${pageContext.request.contextPath}/mypage/wishlist.do" role="tab" aria-controls="v-pills-settings" aria-selected="false">알림 설정</a> --%>
			</div>
		</div>
	</div>
</div>
<script>
$(function(){

});

</script>
