<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param value="Get It :: ${product.productName } 상세보기" name="pageTitle"/>
</jsp:include>

<style>
.productInfo-container{
	border: 1px solid black;
}
.productInfo-category{
	border: 1px solid black;
}
.productInfo-header{
	border: 1px solid red;
}
.productInfo-table{
	margin: 0 auto;
}
.productInfo-description{
	border: 1px solid red;
}
</style>

<div class="productInfo-container">
	<div class="productInfo-category">
		<a href="">전자제품</a>
		<img src="" alt="#" />
		<a href="">스마트폰</a>
		<img src="" alt="#" />
	</div>
	
	<div class="productInfo-header">

<table border="1" class="productInfo-table">
	<tr>
		<td>
			<img src="" alt="${product.productName } 이미지" width="340" height="300" >
		</td>
		<td>
		 	<table border="1" style="height:300px; width:400px;">
		 		<tr align="center">
		 			<td>상품명</td>
		 			<td>${product.productName}</td>
		 		</tr>
		 		<tr align="center">
		 			<td>가격</td>
		 			 <td><fmt:formatNumber pattern="###,###" value="${product.productPrice }" />원</td>
		 		</tr>
		 		<tr align="center">
		 			<td>상품소개</td>
		 			<td>${product.productDescription}</td>
		 		</tr>
		 		<tr align="center">
		 			<td colspan="2">
		 				<form name="form1" method="post" action="#">
		 				<select name="amount">
		 				
		 					<option value="1" selected="selected" id="op1" label="1">
		 				</select>&nbsp;개
		 				<input type="submit" value="장바구니에 담기">
		 				</form>
		 			</td>
		 		</tr>
		 	</table>
		</td>
	</tr>
</table><!-- productInfo-table end -->

<div class="productInfo-description">
	<div class="info-text">상품 정보</div>
</div>

	</div><!-- productInfo-header end -->
</div><!-- productInfo-container end -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>