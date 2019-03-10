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
.auctionList-container{
	height:750px;
	position:relative;
	margin-left:180px;
	top:-37px;
}
#tbl-auctionList{
	text-align:center;
}
.tbl-tr th{
	width:100px;
}
.tableTr td{
	width:100px;
	height:70px;
	overflow:hidden;
	white-space : nowrap;
	text-overflow: ellipsis;
}
.auctionRegistImg{
	width:70px;
	height:50px;
}

</style>
<br />
<section id="auctionList-container" class="auctionList-container">
<nav class="navbar navbar-light bg-light">
	<span>경매 상품 리스트</span>
	  <form class="form-inline" action='${pageContext.request.contextPath }/admin/auctionListSearch.do?cPage="+${cPage}+"&numPerPage="+${numPerPage}'>
		<select class="form-control" name="type">
  			<option value="auction_title" ${type == "auction_title"?"selected":"" }>상품명</option>
  			<option value="auction_member" ${type == "auction_member"?"selected":"" }>아이디</option>
  			<option value="auction_category_macro" ${type == "auction_category_macro"?"selected":"" }>대분류코드</option>
		</select>
		&nbsp;&nbsp;
	    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="search" id="search" value=${search}>
	    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
	  </form>
	</nav>
<hr />
	<table id="tbl-auctionList" class="table table-striped table-hover">
		<tr class="tbl-tr">
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
			<td colspan="8">상품이 없습니다.</td>
		</tr>
		</c:if>
		
		<c:if test="${not empty list }">
			<c:forEach items="${list }" var="a">
			<tr class="tableTr">				
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