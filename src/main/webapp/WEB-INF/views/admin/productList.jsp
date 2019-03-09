<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp">
	<jsp:param value="allMember" name="pageTitle"/>
</jsp:include>

<jsp:include page="/WEB-INF/views/common/adminSide.jsp"></jsp:include>

<style>
.productList-container{

	height:750px;
	position:relative;
	margin-left:180px;
	top:-37px;
}
.tableTr td{
	width:100px;
	height:70px;
	overflow:hidden;
	white-space : nowrap;
	text-overflow: ellipsis;
}
#tbl-productList{
	text-align:center;
}
</style>
<br />
<section id="productList-container" class="productList-container">
<nav class="navbar navbar-light bg-light">
	<span>판매 상품 리스트</span>
	  <form class="form-inline" action='${pageContext.request.contextPath }/admin/productListSearch.do?cPage="+${cPage}+"&numPerPage="+${numPerPage}'>
		<select class="form-control" name="type">
  			<option value="product_name" ${type == "product_name"?"selected":"" }>상품명</option>
  			<option value="product_onsale" ${type == "product_onsale"?"selected":"" }>판매여부</option>
  			<option value="product_manufacturer" ${type == "product_manufacturer"?"selected":"" }>제조사명</option>
  			<option value="category_macro" ${type == "product_macro"?"selected":"" }>대분류코드</option>
		</select>
		&nbsp;&nbsp;
	    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="search" id="search" value=${search}>
	    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
	  </form>
	</nav>
<hr />
	<table id="tbl-productList" class="table table-striped table-hover">
		<tr>
			<th>제품코드</th>
			<th>상품명</th>
			<th>제품단가</th>
			<th>제조사명</th>
			<th>수량</th>
			<th>마일리지</th>
			<th>상품설명</th>
			<th>등록일자</th>
		</tr>
		<c:if test="${empty list }">
		<tr>
			<td colspan="19">상품이 없습니다.</td>
		</tr>
		</c:if>
		
		<c:if test="${not empty list }">
			<c:forEach items="${list }" var="p">
			<tr class="tableTr">				
				<td>${p.SEQ_PRODUCT_NO}</td>
				<td>${p.PRODUCT_NAME}</td>
				<td>${p.PRODUCT_PRICE}</td>
				<td>${p.PRODUCT_MANUFACTURER}</td>
				<td>${p.PRODUCT_STOCK}</td>
				<td>${p.PRODUCT_MILEGE}</td>
				<td>${p.PRODUCT_DESCRIPTION}</td>
				<td>${p.PRODUCT_ENROLL_DATE}</td>
			</tr>			
			</c:forEach>
		</c:if>
	</table>
	<%
		int totalContent = (int)request.getAttribute("totalContents");
		int numPerPage = (int)request.getAttribute("numPerPage");
		int cPage = (int)request.getAttribute("cPage");
		String type = (String)request.getAttribute("type");
		String search = (String)request.getAttribute("search");
		String view = (String)request.getAttribute("view");
	%>
	<%= com.kh.spring.common.util.Utils2.getPageBar(totalContent , cPage , numPerPage,type,search , view) %>
</section> 

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>