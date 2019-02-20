<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param value="" name="pageTitle"/>
</jsp:include>
<table border="1">
	<tr>
		<td>
			<img src="${path}/images/${vo.productUrl}" width="340" height="300" >
		</td>
		<td>
		 	<table border="1" style="height:300px; width:400px;">
		 		<tr align="center">
		 			<td>상품명</td>
		 			<td>${vo.productName}</td>
		 		</tr>
		 		<tr align="center">
		 			<td>가격</td>
		 			<td></td>
		 			<%-- <td><fmt: formatNumber value="${vo.productPrice}" pattern="###,###,###"/></td> --%>
		 		</tr>
		 		<tr align="center">
		 			<td>상품소개</td>
		 			<td>${vo.productDesc}</td>
		 			
		 		</tr>
		 		<tr align="center">
		 			<td colspan="2">
		 				<form name="form1" method="post" action="${path}/item/basket.do">
		 				<input type="hidden" name="productId" value="${vo.productId}">
		 				<select name="amount">
		 					<c:forEach begin="1" end="10" var="i">
		 						<option value="${i}">${i}</option>
		 					</c:forEach>
		 					
		 				</select>&nbsp;개
		 				<input type="submit" value="장바구니에 담기">
		 				</form>
		 				<a href="${path}/item/item.do"></a>
		 			</td>
		 		</tr>
		 	</table>
		</td>
	</tr>

</table>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>