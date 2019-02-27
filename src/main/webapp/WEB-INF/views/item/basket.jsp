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

</style>
<jsp:include page="/WEB-INF/views/common/basketside.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypage.css" />
<div class="mypage-container">
	<div class="real-content-container">
		<div class="mp-container">
		 <div class="mp-title">
			<h2>장바구니에 담긴 물품을 구매해 보세요!</h2>
			 </div>
			<div class="mypage-body">
		<table class="table table-striped">
    <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">상품정보</th>
      <th scope="col">수량</th>
      <th scope="col">상품금액</th>
      <th scope="col">선택</th>
    </tr>
  </thead>
  <tbody>
    <c:if test="${empty list }">
		<tr>
			<td colspan="5">장바구니에 물품이 없습니다.</td>
		</tr>
	</c:if>
		
		<c:if test="${not empty list }">
			<c:forEach items="${list }" var="b">
			<tr>				
				<th>${b.SEQ_BASKET_NO}</th>				
			</tr>			
			</c:forEach>
		</c:if>
  
  </tbody>
</table>
	<%-- <div class="result" id="allMemberSearch-result"></div>
	<%
		int totalContent = (int)request.getAttribute("totalContents");
		int numPerPage = (int)request.getAttribute("numPerPage");
		int cPage = (int)request.getAttribute("cPage");
	%>
	<%= com.kh.spring.common.util.Utils.getPageBar(totalContent , cPage , numPerPage , "basketList.do") %> --%>
				
		      <div class="buy-container">
		 	 	<h4>상품구매 금액 합계:</h4>
		 	 	<br />
		      <button type="button" id="buyButton" class="btn btn-primary btn-lg">구매하기</button>
		   </div>
		  </div>
		</div>	
	</div>
</div>
<script>










</script>



 




<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>