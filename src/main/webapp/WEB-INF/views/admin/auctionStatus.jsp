<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="allMember" name="pageTitle"/>
</jsp:include>

<jsp:include page="/WEB-INF/views/common/adminSide.jsp"></jsp:include>

<style>
.auctionStatus-container{
	position:relative;
	margin-left:180px;
}
</style>
<br />
<section id="auctionStatus-container" class="auctionStatus-container">
<p>경매 상품 현황</p>
<hr />
	<table id="tbl-auctionStatus" class="table table-striped table-hover">
		<tr>
			<th>경매번호</th>
			<th>경매물품</th>
			<th>경매시작가</th>
			<th>경매시작일</th>
			<th>경매끝일</th>
			<th>경매결과</th>
			<th>경매가</th>			
		</tr>
		<c:if test="${empty list }">
		<tr>
			<td colspan="7">경매 물품이 없습니다.</td>
		</tr>
		</c:if>
		
		<c:if test="${not empty list }">
			<c:forEach items="${list }" var="a">
			<tr>				
				<th>${a.SEQ_AUCTION_NO}</th>
				<th>${a.AUCTION_NAME}</th>
				<th>${a.AUCTION_START}</th>
				<th>${a.AUCTION_START_DATE}</th>
				<th>${a.AUCTION_END_DATE}</th>
				<th>${a.AUCTION_RESULT}</th>
				<th>${a.AUCTION_PRICE}</th>							
			</tr>			
			</c:forEach>
		</c:if>
	</table>
	<%
		int totalContent = (int)request.getAttribute("totalContents");
		int numPerPage = (int)request.getAttribute("numPerPage");
		int cPage = (int)request.getAttribute("cPage");
	%>
	<%= com.kh.spring.common.util.Utils.getPageBar(totalContent , cPage , numPerPage , "auctionStatus.do") %>
</section> 

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>