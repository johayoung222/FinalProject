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
.siteStatistics-container{
	width:1300px;
	height:750px;
	position:relative;
	margin-left:180px;
	top:-37px;
}
</style>
<br />
<section id="siteStatistics-container" class="siteStatistics-container">
<p>사이트 통계</p>
<hr />
	<table id="tbl-siteStatistics" class="table table-striped table-hover">
		<tr>
			<th>총 매출액</th>
			<th>사이트 방문자 수</th>
			<th>총 회원</th>
			<th>총 상품 개수</th>
		</tr>
		<c:if test="${empty list }">
		<tr>
			<td colspan="4">데이터가 없습니다.</td>
		</tr>
		</c:if>
		
		<c:if test="${not empty list }">
			<c:forEach items="${list }" var="s">
			<tr>				
				<th>${q.SEQ_QUESTION_NO}</th>
								
			</tr>			
			</c:forEach>
		</c:if>
	</table>
	<%
		int totalContent = (int)request.getAttribute("totalContents");
		int numPerPage = (int)request.getAttribute("numPerPage");
		int cPage = (int)request.getAttribute("cPage");
	%>
	<%= com.kh.spring.common.util.Utils.getPageBar(totalContent , cPage , numPerPage , "siteStatistics.do") %>
</section> 

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>