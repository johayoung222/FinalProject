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
.reportList-container{
	
	height:750px;
	position:relative;
	margin-left:180px;
	top:-37px;
}
</style>
<br />
<section id="reportList-container" class="reportList-container">
<p>신고 접수 리스트</p>
<hr />
	<table id="tbl-reportList" class="table table-striped table-hover">
		<tr>
			<th>신고번호</th>
			<th>신고내용</th>
			<th>신고종류</th>
			<th>신고회원</th>
			<th>회원코드</th>
		</tr>
		<c:if test="${empty list }">
		<tr>
			<td colspan="5">신고된 사항이 없습니다.</td>
		</tr>
		</c:if>
		
		<c:if test="${not empty list }">
			<c:forEach items="${list }" var="r">
			<tr>				
				<th>${r.SEQ_REPORT_NO}</th>
				<th>${r.REPORT_CONTENT}</th>
				<th>${r.REPORT_CATEGOR}</th>
				<th>${r.REPORT_TARGET}</th>
				<th>${r.SEQ_MEMBER_NO}</th>
			</tr>			
			</c:forEach>
		</c:if>
	</table>
	<%
		int totalContent = (int)request.getAttribute("totalContents");
		int numPerPage = (int)request.getAttribute("numPerPage");
		int cPage = (int)request.getAttribute("cPage");
	%>
	<%= com.kh.spring.common.util.Utils.getPageBar(totalContent , cPage , numPerPage , "reportList.do") %>
</section> 

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>