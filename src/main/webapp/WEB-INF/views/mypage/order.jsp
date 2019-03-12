<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle" />
</jsp:include>
<style>
.mypage{
	width:143%;
}
.main{
	display: inline-block;
	width:23.5%;
	height:150px;
	margin-right: 1%;
	text-align: center;
}
.main1{
	display: inline-block;
	width:23.5%;
	height:150px;
	margin-right: 1%;
	text-align: center;
}
.main2{
	display: inline-block;
	width:23.5%;
	height:150px;
	margin-right: 1%;
	text-align: center;
	background-color:lightgray;

}
.lImg{
	display: inline-block;
}
#x{
	color:white;
	font-size:35px;
	display: inline-block;
	position: absolute;
    margin-top: 50px;
    margin-left: 11px;
}
.page{
	margin-left: 41%;
    margin-top: 17px;
}

</style>
<jsp:include page="/WEB-INF/views/common/mypageSide.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypage.css" />
<div class="mypage-container">
	<div class="real-content-container">
		<div class="mp-container">
			<div class="mp" style="font-size:19px; font-weight:bold;">
			판매내역
			</div>
			<div class="mp" style="padding-top:10px;">
				<a class="mp-submenu-item ${menuSel =='normal'?'active':'' }" href="${pageContext.request.contextPath}/mypage/order?filter=normal">셀잇판매</a>
				<a class="mp-submenu-item ${menuSel =='c2c'?'active':'' }" href="${pageContext.request.contextPath}/mypage/order?filter=c2c">직접판매</a>
				<a class="mp-submenu-item ${menuSel =='auction'?'active':'' }" href="${pageContext.request.contextPath}/mypage/order?filter=auction">경매판매</a>
			</div>
			<hr style="border-bottom:1px solid gray; width:143%;">
				<div class="mypage">
					<c:if test="${empty list }">
						<div class="mypage-content">${msg }</div>
					</c:if>
					<c:if test="${not empty list }">
				<c:if test="${menuSel ne 'auction'}">
						<c:forEach items="${list }" var="l" varStatus="vs">
							<c:if test="${l.PRODUCT_ONSALE eq 'Y '}">
								<div class="main" id="${l.SEQ_PRODUCT_NO}">					
							</c:if>
							<c:if test="${l.PRODUCT_ONSALE eq 'N '}">
								<div class="main2" id="${l.SEQ_PRODUCT_NO}">
								<span id="x">판매완료</span>					
							</c:if>
									<div class="lImg">
										<img src="${pageContext.request.contextPath }/resources/upload/thing/${fn:split(l.PRODUCT_REAL_IMAGE,',')[0]}" alt="${l.PRODUCT_IMAGE}" height="80px" width="160px" style="background:gray;"/>
									</div>
									<div class="lDesc">
										<span>${l.PRODUCT_NAME }</span><br />
										<span>${l.PRODUCT_PRICE } 원</span> <br />
										<span><fmt:formatDate value="${l.PRODUCT_ENROLL_DATE}" pattern="yyyy.MM.dd" /></span> <br />
									</div>
								</div>
						</c:forEach>
					</c:if>
					<c:if test="${menuSel eq 'auction'}">
						<c:forEach items="${list }" var="l" varStatus="vs">
							<c:if test="${l.AUCTION_CHECK eq 'N'}">
								<div class="main1" id="${l.AUCTION_NO}">					
							</c:if>
							<c:if test="${l.AUCTION_CHECK eq 'Y'}">
								<div class="main2" id="${l.AUCTION_NO}">
								<span id="x">경매완료</span>					
							</c:if>
									<div class="lImg">
										<img src="${pageContext.request.contextPath }/resources/upload/${l.AUCTION_IMAGE_MAIN}" alt="${l.AUCTION_IMAGE_MAIN}" height="80px" width="160px"/>
									</div>
									<div class="lDesc">
										<span>${l.AUCTION_TITLE }</span><br />
										<span>${l.AUCTION_PRICE } 원</span> <br />
										<span>${l.EDATE}</span> <br />
									</div>
								</div>
						</c:forEach>
					</c:if>
				</div>
			</c:if>
			
		<%
			int totalContent = (int) request.getAttribute("totalContents");
			int numPerPage = (int) request.getAttribute("numPerPage");
			int cPage = (int) request.getAttribute("cPage");
			String loce = (String)request.getAttribute("loce");
		%>
		<c:if test="${list ne null}">
		<div class="page">
			<%=com.kh.spring.common.util.Utils.getPageBar(totalContent, cPage, numPerPage, loce)%>
		</div>	
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


$(".main").each(function(item, idx){
	$(this).on('click',function(){
		var pId = $(this).attr("id");
		location.href = "${pageContext.request.contextPath}/item/iteminformation/"+pId;
	});
});
$(".main1").each(function(item, idx){
	$(this).on('click',function(){
		var pId = $(this).attr("id");
		location.href = "${pageContext.request.contextPath}/auctionDetail.do?auctionNo="+pId;
	});
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>