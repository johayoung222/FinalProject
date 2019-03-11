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
#tbl-allMember{
	table-layout:fixed;
	text-align:center;
}
#tbl-allMember th{
	width:175px;
}

</style>
<div class="mypage-container">
	<div class="real-content-container">
		<div class="mp-container">
			<div class="mp"  style="font-size:19px; font-weight:bold;"> 
			내 쿠폰
			</div>
			<hr style="border-bottom:1px solid gray; width:143%;">
			<div class="mypage">
				<div class="credit-list-table">
					<c:if test="${empty list }">
						<div class="credit-list-empty">${msg }</div>
					</c:if>
					<c:if test="${not empty list }">
					<table id="tbl-allMember" class="table table-striped table-hover" >
						<tr>
							<th>쿠폰명</th>
							<th>유효기간</th>
							<th>할인률</th>
							<th>사용여부</th>
						</tr>
						<c:forEach items="${list }" var="o">
							<tr class="tbl">
								<td>${o.COUPON_NAME }</td>
								<td>${o.USER_DATE }</td>
								<td>${o.COUPON_RATE }%</td>
								<td>${o.COUPON_STATUS }</td>
							</tr>
						</c:forEach>
						</table>
					</c:if>
				</div>
			</div>
			<div class="mypage">
				<div class="credit-instruction">
					- 이미 사용하였거나 유효기간이 만료된 쿠폰은 3개월 후 자동 삭제됩니다. <br>
					- 쿠폰은 중복사용할 수 없습니다. 1회 결제시 1개의 쿠폰만 사용 가능합니다. <br>
					- 모든 쿠폰은 셀잇 검증 상품에만 사용 가능합니다. (상품권 제외)
				</div>
			</div>
		</div>	
	</div>
</div>
<script>
$(function(){
	$(".coupons").css("color" , "#7151FC");
	$(".coupons").css("font-weight" , "bold");
	$(".coupons").css("background" , "#f2f2f2");
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>