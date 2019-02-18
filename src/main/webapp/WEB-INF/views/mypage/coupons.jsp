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
<div class="mypage-container">
	<div class="real-content-container">
		<div class="mp-container">
			<div class="mp-title">
			내 쿠폰
			</div>
			<div class="mypage-body">
				<div class="credit-list-table">
					<c:if test="${empty list }">
						<div class="credit-list-empty">${msg }</div>
					</c:if>
					<c:if test="${not empty list }">
						<c:forEach items="${list }" var="o">
							
						</c:forEach>
					</c:if>
				</div>
			</div>
			<div class="mypage-body">
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