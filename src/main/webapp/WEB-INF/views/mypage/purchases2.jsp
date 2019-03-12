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
	color:white;
	font-size:35px;
	display: inline-block;
	position: absolute;
    margin-top: 50px;
    margin-left: -70px;
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
			<div class="mp" style="padding-top:10px;width:300px;height:40px;">
					<a class="mp-submenu-item ${v == 1?'active':'' }" href="${pageContext.request.contextPath}/mypage/purchases.do">겟잇판매</a>
					<a class="mp-submenu-item ${v == 2?'active':'' }" href="${pageContext.request.contextPath}/mypage/purchases2.do">경매판매</a>
			</div>
			<hr style="border-bottom:1px solid gray; width:143%;">
			<div class="mypage">
				<c:if test="${empty list }">
					<div class="mypage-content">${msg }</div>
				</c:if>
				<c:if test="${not empty list }">
					<c:forEach items="${list }" var="b">
						<div class="main2">
							<span id="x">경매완료</span>
							<div class="lImg">
									<img src="${pageContext.request.contextPath }/resources/upload/${b.AUCTION_IMAGE_MAIN}" alt="${b.AUCTION_IMAGE_MAIN}" height="80px" width="160px"/>
								</div>
								<div class="lDesc">
									<span>${b.AUCTION_TITLE }</span><br />
									<span>${b.AUCTION_PRICE } 원</span> <br />
									<span><fmt:formatDate value="${b.EDATE}" pattern="yyyy.MM.dd" /></span> <br />
								</div>
						</div>	
					</c:forEach>
				</c:if>
			</div>
			<%
				int totalContent = (int) request.getAttribute("totalContents");
				int numPerPage = (int) request.getAttribute("numPerPage");
				int cPage = (int) request.getAttribute("cPage");
			%>
			<c:if test="${list ne null}">
				<div class="page">
					<%=com.kh.spring.common.util.Utils.getPageBar(totalContent, cPage, numPerPage, "purchases2.do")%>
				</div>	
			</c:if>
		</div>	
	</div>
</div>
<script>
$(function(){
	$(".purchases").css("color" , "#7151FC");
	$(".purchases").css("font-weight" , "bold");
	$(".purchases").css("background" , "#f2f2f2");
	$(".active").css("color" , "7151FC");
	$(".active").css("border-bottom" , "2px solid #7151FC");
});

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>