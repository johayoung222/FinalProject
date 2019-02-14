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
.regist-container{
	position:relative;
	margin-left:180px;
}
</style>
<br />
<section id="regist-container" class="regist-container">
<p>판매 신청 리스트</p>
<hr />
	<table id="tbl-regist" class="table table-striped table-hover">
		<tr>
			<th>고유번호</th>
			<th>상품명</th>
			<th>판매가격</th>
			<th>경매여부</th>
			<th>상품이미지</th>
			<th>상품이미지2</th>
			<th>판매수량</th>
			<th>상품설명</th>
			<th>신청날짜</th>
		</tr>
		<c:if test="${empty list }">
		<tr>
			<td colspan="9">판매 신청이 없습니다.</td>
		</tr>
		</c:if>
		
		<c:if test="${not empty list }">
			<c:forEach items="${list }" var="r">
			<tr>				
				<th>${r.SEQ_REGIST_NO }</th>
				<th>${r.REGIST_NAME }</th>
				<th>${r.REGIST_PRICE }</th>
				<th>${r.REGIST_AUCTION }</th>
				<th>${r.REGIST_IMAGE }</th>
				<th>${r.REGIST_REAL_IMAGE }</th>
				<th>${r.REGIST_AMOUNT }</th>
				<th>${r.REGIST_DESCRIPTION }</th>
				<th>${r.REGIST_DATE }</th>
			</tr>			
			</c:forEach>
		</c:if>
	</table>
	<%
		int totalContent = (int)request.getAttribute("totalContents");
		int numPerPage = (int)request.getAttribute("numPerPage");
		int cPage = (int)request.getAttribute("cPage");
	%>
	<%= com.kh.spring.common.util.Utils.getPageBar(totalContent , cPage , numPerPage , "regist.do") %>
</section> 

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>