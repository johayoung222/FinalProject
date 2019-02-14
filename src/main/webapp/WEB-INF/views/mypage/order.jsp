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
<div class="real-content-container">
	<div class="mp-container">
		<div class="mp-title">
		판매내역
		</div>
		<div class="mp-submenu">
			<a class="mp-submenu-item ${menuSel =='normal'?'active':'' }" href="${pageContext.request.contextPath}/mypage/order?filter=normal">셀잇판매</a>
			<a class="mp-submenu-item ${menuSel =='c2c'?'active':'' }" href="${pageContext.request.contextPath}/mypage/order?filter=c2c">직접판매</a>
			<a class="mp-submenu-item ${menuSel =='temporarily_saved'?'active':'' }" href="${pageContext.request.contextPath}/mypage/order?filter=temporarily_saved">임시저장</a>
		</div>
		<div class="mypage-body">
			<c:if test="${empty list }">
				<div class="mypage-content-absent">${msg }</div>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach items="${list }" var="o">
					
				</c:forEach>
			</c:if>
		</div>
	</div>	
</div>
<script>
/* 온로드 함수 */
$(function(){
	$(".order").css("color" , "#7151FC");
	$(".order").css("font-weight" , "bold");
	$(".order").css("background" , "#f2f2f2");
	$(".active").css("color" , "7151FC");
	$(".active").css("border-bottom" , "2px solid #7151FC");
	
	/* 바로 판매내역으로 이동시켜야 한다. */
	// window.location.href = $(".active").attr("href");
});


$(".mp-submenu a").on("click" , function(){
	$(".active").removeClass("active");
	$(this).addClass("active");
});

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>