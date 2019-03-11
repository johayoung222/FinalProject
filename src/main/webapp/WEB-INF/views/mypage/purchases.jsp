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
	border:1px solid red;
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
#x{
	color:red;
	font-size:35px;
	display: inline-block;
	position: absolute;
    margin-top: 50px;
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
			구매내역
			</div>
			<hr style="border-bottom:1px solid gray; width:143%;">
			<div class="mypage">
				<c:if test="${empty list }">
					<div class="mypage-content">${msg }</div>
				</c:if>
				<c:if test="${not empty list }">
					<c:forEach items="${list }" var="b">
						<c:if test="${b.AUCTION_CHECK eq 'N'}">
							<div class="main">
						</c:if>
						<c:if test="${b.AUCTION_CHECK eq 'Y'}">
							<div class="main2">
							<span id="x">경매종료</span>
						</c:if>
							${b.AUCTION_TITLE}
							${b.AUCTION_PRICE}
						</div>	
					</c:forEach>
				</c:if>
			</div>
			<%
			int totalContent = (int) request.getAttribute("totalContents");
			int numPerPage = (int) request.getAttribute("numPerPage");
			int cPage = (int) request.getAttribute("cPage");
			%>
			<div class="page">
				<%=com.kh.spring.common.util.Utils.getPageBar(totalContent, cPage, numPerPage, "purchases.do")%>
			</div>	
		</div>	
	</div>
</div>
<script>
$(function(){
	$(".purchases").css("color" , "#7151FC");
	$(".purchases").css("font-weight" , "bold");
	$(".purchases").css("background" , "#f2f2f2");
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>