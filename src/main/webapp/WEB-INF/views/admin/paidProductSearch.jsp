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
<%
	String type = (String)request.getAttribute("type");
%>
<style>
.paidProductSearch-container{
	position:relative;
	margin-left:180px;
}
</style>
<br />
<section id="paidProductSearch-container" class="paidProductSearch-container">
<nav class="navbar navbar-light bg-light">
	<p>결제된 상품 리스트</p>
	  <form class="form-inline" action="${pageContext.request.contextPath }/admin/paidProductSearch.do">
		<select class="form-control" name="type">
  			<option value="product_name" <%="product_name".equals(type)?"selected":"" %>>상품명</option>
  			<option value="product_buyer" <%="product_buyer".equals(type)?"selected":"" %>>구매자아이디</option>
  			<option value="product_category" <%="product_category".equals(type)?"selected":"" %> >상품카테고리</option>
		</select>
		&nbsp;&nbsp;
	    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="search" id="search" value="${search }">
	    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
	  </form>
	</nav>
<hr />
	<table id="tbl-paidProduct" class="table table-striped table-hover">
		<tr>
			<th>제품코드</th>
			<th>상품명</th>
			<th>상품가격</th>
			<th>판매량</th>
			<th>구매자아이디</th>
			<th>상품카테고리</th>
			<th>주문번호</th>
		</tr>
		<c:if test="${empty list }">
		<tr>
			<td colspan="7">결제된 상품이 존재하지 않습니다..</td>
		</tr>
		</c:if>
		
		<c:if test="${not empty list }">
			<c:forEach items="${list }" var="p">
			<tr>				
				<th>${p.SEQ_PRODUCT_NO }</th>
				<th>${p.PRODUCT_NAME }</th>
				<th>${p.PRODUCT_IO_PRICE }</th>
				<th>${p.PRODUCT_IO_AMOUNT }</th>
				<th>${p.PRODUCT_BUYER }</th>
				<th>${p.PRODUCT_CATEGORY }</th>
				<th>${p.PRODUCT_ORDER_NO }</th>
			</tr>			
			</c:forEach>
		</c:if>
	</table>
	<%
		String search = (String)request.getAttribute("search");
		int totalContent = (int)request.getAttribute("totalContents");
		int numPerPage = (int)request.getAttribute("numPerPage");
		int cPage = (int)request.getAttribute("cPage");
	%>
	<%= com.kh.spring.common.util.Utils.getPageBar2(totalContent , cPage , numPerPage ,type,search, "paidProductSearch.do") %>
</section> 

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>