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
			<th>상품이미지</th>
			<th>상품이미지2</th>
			<th>판매수량</th>
			<th>상품설명</th>
			<th>신청날짜</th>
			<th></th>
		</tr>
		<c:if test="${empty list }">
		<tr>
			<td colspan="9">판매 신청이 없습니다.</td>
		</tr>
		</c:if>
		
		<c:if test="${not empty list }">
			<c:forEach items="${list }" var="r">
			<tr class="tableTr">				
				<td id="registNo">${r.SEQ_REGIST_NO }</td>
				<td>${r.REGIST_NAME }</td>
				<td>${r.REGIST_PRICE }</td>
				<td>${r.REGIST_IMAGE }</td>
				<td>${r.REGIST_REAL_IMAGE }</td>
				<td>${r.REGIST_AMOUNT }</td>
				<td>${r.REGIST_DESCRIPTION }</td>
				<td>${r.REGIST_DATE }</td>
			</tr>
			<div class="result" id="regist-result"></div>
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
<script>
$(".tableTr").on("click",function(){
	//$("#tbl-regist").css("display","none");
	var registNo = $(this).children("td:first").text();
	var win = window.open("${pageContext.request.contextPath}/admin/category.do?registNo="+registNo, "대/소분류 선택", "width=400,height=500,location=no,status=no,top=150,left=600");

});
</script> 

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>