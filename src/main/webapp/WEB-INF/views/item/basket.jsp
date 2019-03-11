<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding|Nanum+Pen+Script" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param value="" name="pageTitle"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/mypageSide.jsp"></jsp:include>
<style>
.productList-container{
	position:relative;
	margin-left:180px;
}
.mp-title>h2{
     font-family: 'Nanum Pen Script', cursive;


}
.buy-container{
	float: right;
/* 	margin-left:125%; */

}
#buyButton{

   float: right;
}

.mp-container{
font-family: 'Nanum Gothic', sans-serif;
}
#basketNo{
dispaly:none;
}
.prada{
	height:1px;
}
form[name="basketDelFrm"]{
width:20px;
height:5px;

}
#gotoItem{
	text-decoration: none;
	font-weight: bolder;
}
#tbl-basket{
	table-layout:fixed;
	text-align:center;
}
#tbl-basket th{
	width:120px;
	height:70px;
	overflow:hidden;
	white-space : nowrap;
	text-overflow: ellipsis;
}




</style>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypage.css" />
<div class="mypage-container">
	<div class="real-content-container">
		<div class="mp-container">
			<div class="mp"  style="font-size:19px; font-weight:bold;"> 
			장바구니
			</div>
			<hr style="border-bottom:1px solid gray; width:143%;">
		<div class="mypage-body1">
		<table id="tbl-basket" class="table table-striped">
		    <tr>    
		     <!--  <th scope="col">장바구니번호</th> -->
		      <th scope="col" style="text-align:center;">물품번호</th>
		      <th scope="col">상품이름</th>
		      <th scope="col">상품정보</th>
		      <th scope="col">상품금액</th>
		      <th scope="col">상품구매</th>
		      <th scope="col">상품취소</th>
		    </tr>
		    <c:if test="${ empty list }">
				<tr>
					<td colspan="6">장바구니에 물품이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty list }">
			<c:forEach items="${list}" var="p">
			<tr>
				<%-- <td id="basketNo">${p.SEQ_BASKET_NO}</td>	 --%>		
				<td class="prada">${p.SEQ_PRODUCT_NO}</td>   
				<td class="prada"><a id="gotoItem" href='${pageContext.request.contextPath}/item/iteminformation/${p.SEQ_PRODUCT_NO}'>${p.PRODUCT_NAME}</a></td>	
				<td class="prada">${p.PRODUCT_DESCRIPTION}</td>		
				<td class="prada">${p.PRODUCT_PRICE}</td>	
				<td class="prada">
				<button onclick="location.href='${pageContext.request.contextPath}/item/perchase/${p.SEQ_PRODUCT_NO}'" class="btn btn-primary">구매</button></td>
				<td class="prada" style="width:50px; height:50px;">
		 <%--  <button type="button" id="deleteBasket" class="btn btn-danger" onclick="deleteBasket('${p.SEQ_BASKET_NO}','${p.SEQ_MEMBER_NO}')">취소</button>  --%>
				
				<form name="basketDelFrm" action="deleteBasket.do" method="post">
				    <input type="hidden" name="no" value="${p.SEQ_BASKET_NO}"/>
				    <input type="hidden" name="memberNo" value="${p.SEQ_MEMBER_NO}"/>
				    <input type="submit"class="btn btn-danger"  value="취소" style="width:50px; height:33px;"/> 
	        	</form> 
				</td>
			</tr>			
			</c:forEach>
			</c:if>
		</table>
		</div>
			<hr/>
			<div class="buy-container">
			 	  <h4>상품구매 금액 합계:<fmt:formatNumber pattern="###,###" value="${sum }" />원</h4>		     
			</div>
	</div>	
</div>
</div>

<script>

function deleteBasket(no,memberNo){
    var frm = document.basketDelFrm;
    frm.no.value = no;
    frm.memerNo.value = memberNo;
    frm.submit();
   

}
</script>



 




<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>