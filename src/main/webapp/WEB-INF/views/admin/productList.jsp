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
.productList-container{
	position:relative;
	margin-left:180px;
}
</style>
<br />
<section id="productList-container" class="productList-container">
<p>상품 리스트</p>
<hr />
	<table id="tbl-productList" class="table table-striped table-hover">
		<tr>
			<th>제품코드</th>
			<th>상품명</th>
			<th>제품단가</th>
			<th>경매여부</th>
			<th>판매여부</th>
			<th>제조사명</th>
			<th>제품재고수량</th>
			<th>상품이미지</th>
			<th>상품이미지2</th>
			<th>마일리지</th>
			<th>상품설명</th>
			<th>이벤트여부</th>
			<th>판매등록일자</th>
			<th>추천상품여부</th>
			<th>중고여부</th>
			<th>소분류코드</th>
			<th>대분류코드</th>
			<th>판매자번호</th>
			<th>경매번호</th>
		</tr>
		<c:if test="${empty list }">
		<tr>
			<td colspan="19">상품이 없습니다.</td>
		</tr>
		</c:if>
		
		<c:if test="${not empty list }">
			<c:forEach items="${list }" var="p">
			<tr>				
				<th>${p.SEQ_PRODUCT_NO}</th>
				<th>${p.PRODUCT_NAME}</th>
				<th>${p.PRODUCT_PRICE}</th>
				<th>${p.PRODUCT_AUCTION}</th>
				<th>${p.PRODUCT_ONSALE}</th>
				<th>${p.PRODUCT_MANUFACTURER}</th>
				<th>${p.PRODUCT_STOCK}</th>
				<th>${p.PRODUCT_IMAGE}</th>
				<th>${p.PRODUCT_REAL_IMAGE}</th>
				<th>${p.PRODUCT_MILEGE}</th>
				<th>${p.PRODUCT_DESCRIPTION}</th>
				<th>${p.PRODUCT_EVENT}</th>
				<th>${p.PRODUCT_ENROLL_DATE}</th>
				<th>${p.PRODUCT_RECOMMEND}</th>
				<th>${p.PRODUCT_KINDS}</th>
				<th>${p.CATEGORY_MICRO}</th>
				<th>${p.CATEGORY_MACRO}</th>
				<th>${p.SELLER_NO}</th>
				<th>${p.SEQ_AUCTION_NO}</th>				
			</tr>			
			</c:forEach>
		</c:if>
	</table>
	<%
		int totalContent = (int)request.getAttribute("totalContents");
		int numPerPage = (int)request.getAttribute("numPerPage");
		int cPage = (int)request.getAttribute("cPage");
	%>
	<%= com.kh.spring.common.util.Utils.getPageBar(totalContent , cPage , numPerPage , "productList.do") %>
</section> 

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>