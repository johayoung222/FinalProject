<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Get It :: 중고거래의 중심" name="pageTitle" />
</jsp:include>
<style>
.content-container{
	border: 1px solid black;
	height: 100%;
}
.product-container{
	display: flex;
	justify-content: space-around;
}
.productOne{
	width: 250px;
	height: 250px;
	text-align: center;
}
.productOne:hover{
	border-radius: 5px;
	box-shadow: 3px 3px 5px 7px lightgray;
	cursor: pointer;
}
</style>
<c:forEach items="${allCategory }" var="ct">
	<c:if test="${ct.CATEGORY_MACRO == aiKey.caKey }">
		<c:set var="nowCategory" value="${ct.CATEGORY_MACRO_NAME }" />
		<c:if test="${ct.CATEGORY_MICRO == aiKey.ciKey }">
			<c:set var="nowCategory2" value="${ct.CATEGORY_MICRO_NAME }" />
		</c:if>
	</c:if>
</c:forEach>

<div class="content-container">
	<div class="category-box">
		<span>${nowCategory }</span>-
		<span>${nowCategory2 }</span>
	</div>
	<c:if test="${empty cpList }">
	<div>새로 등록된 경매 상품이 없습니다.</div>
	</c:if>
	
	<div class="product-container">
		<c:if test="${not empty cpList }">
		<c:forEach items="${cpList }" var="p">
		<div class="productOne" id="${p.seqProductNo }">
			<div class="pImg">
				<img src="${pageContext.request.contextPath }/resources/images/phone.PNG" width="240px" height="180px" />
			</div>
			<div class="pDesc">
				<span>${p.productName }</span><br />
				<span>${p.productPrice } 원</span>
			</div>
		</div>
		</c:forEach>
	</c:if>
	</div>
</div>
<script>
$(".productOne").each(function(item, idx){
	$(this).on('click',function(){
		var pId = $(this).attr("id");
		location.href = "${pageContext.request.contextPath}/item/iteminformation/"+pId;
	});
});
</script>





<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>