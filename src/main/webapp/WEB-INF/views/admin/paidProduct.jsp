<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="allMember" name="pageTitle"/>
</jsp:include>
<%
	int flag = (int)request.getAttribute("flag");
%>

<jsp:include page="/WEB-INF/views/common/adminSide.jsp"></jsp:include>

<style>
.paidProduct-container{
	margin-right:15px;
	min-height:600px;
	position:relative;
	margin-left:180px;
	top:-37px;
}
.tbl-paidProduct{
	table-layout:fixed;	
	text-align:center;
}

.img_main{
	width:90px;
	height:50px;
}

</style>
<br />
<section id="paidProduct-container" class="paidProduct-container">
<nav class="navbar navbar-light bg-light">
	<span> 결제된 상품 리스트</span>
	<c:if test="${flag == 0}">
	 <form class="form-inline" id="form-inline" action='${pageContext.request.contextPath }/admin/paidProductSearch.do?cPage="+${cPage}+"&numPerPage="+${numPerPage}'>
		<select class="form-control" id="type" name="type">
  			<option value="product_name" ${type == "product_name"?"selected":""  }>상품명</option>
  			<option value="product_category" ${type == "category_macro"?"selected":""  }>상품카테고리</option>
		</select>
		&nbsp;&nbsp;
	    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="search" id="search" value=${search}>
	    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
	  </form>
	  </c:if>
	  <c:if test="${flag == 1}">
	 <form class="form-inline" id="form-inline" action='${pageContext.request.contextPath }/admin/paidAuctionSearch.do?cPage="+${cPage}+"&numPerPage="+${numPerPage}'>
		<select class="form-control" id="type" name="type">
  			<option value="product_name" ${type == "auction_title"?"selected":""  }>상품명</option>
  			<option value="product_category" ${type == "auction_category_macro"?"selected":""  }>상품카테고리</option>
		</select>
		&nbsp;&nbsp;
	    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="search" id="search" value=${search}>
	    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
	  </form>
	  </c:if>
	</nav>
	<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link active" href="${pageContext.request.contextPath}/admin/paidProduct.do">겟잇/직접</a>
  </li>
  <li class="nav-item">
    <a class="nav-link active" href="${pageContext.request.contextPath}/admin/paidAuction.do">경매</a>
  </li>
</ul>
<c:if test="${flag == 0}">
	<table id="tbl-paidProduct" class="table table-striped table-hover tbl-paidProduct" >
	<tr>
		<th>제품코드</th>
		<th>상품명</th>
		<th>상품가격</th>
		<th>수량</th>
		<th>판매자ID</th>
		<th>이미지</th>
		<th>상품카테고리</th>
		<th>결제일</th>
	</tr>
	<c:if test="${empty list }">
	<tr>
		<td colspan="7">결제된 상품이 존재하지 않습니다..</td>
	</tr>
	</c:if>
		
	<c:if test="${not empty list }">
		<c:forEach items="${list }" var="p">
		<tr>				
			<td>${p.SEQ_PRODUCT_NO }</td>
			<td>${p.PRODUCT_NAME }</td>
			<td>${p.PRODUCT_IO_PRICE }</td>
			<td>${p.PRODUCT_IO_AMOUNT }</td>
			<td>${p.MEMBERID }</td>
			<td><img class="img_main" src="${pageContext.request.contextPath }/resources/upload/${p.PRODUCT_IO_IMAGE }"  /></td>
			<td>${p.CATEGORY_MACRO }</td>
			<td>${p.PRODUCT_IO_DATE }</td>
		</tr>			
		</c:forEach>
	</c:if>
	</table>
</c:if>
<c:if test="${flag == 1}">
<table id="tbl-paidProduct" class="table table-striped table-hover tbl-paidProduct">
	<tr>
		<th>고유번호</th>
		<th>상품명</th>
		<th>시작일</th>
		<th>종료일</th>
		<th>시작가</th>
		<th>메인사진</th>
		<th>판매자아이디</th>
		<th>판매자핸드폰</th>
		<th>대분류</th>
	</tr>
	<c:if test="${empty list }">
	<tr>
		<td colspan="9">결제된 상품이 존재하지 않습니다..</td>
	</tr>
	</c:if>
	
	<c:if test="${not empty list }">
		<c:forEach items="${list }" var="a">
		<tr>				
			<td>${a.AUCTION_NO}</td>
			<td>${a.AUCTION_TITLE}</td>
			<td>${a.SDATE}</td>
			<td>${a.EDATE}</td>
			<td>${a.AUCTION_PRICE}</td>
			<td><img class="auctionRegistImg" src="${pageContext.request.contextPath}/resources/upload/${a.AUCTION_IMAGE_MAIN}"></td>
			<td>${a.AUCTION_MEMBER}</td>
			<td>${a.AUCTION_PHONE}</td>
			<td>${a.AUCTION_CATEGORY_MACRO}</td>
		</tr>			
		</c:forEach>
	</c:if>
	</table>
</c:if>
	
	<div class="result" id="paidProductSearch-result"></div>
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