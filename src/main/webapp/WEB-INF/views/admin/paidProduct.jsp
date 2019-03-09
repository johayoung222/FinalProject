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
.paidProduct-container{
	min-height:600px;
	position:relative;
	margin-left:180px;
	top:-37px;
}
#tbl-paidProduct{
	text-align:center;
}
</style>
<br />
<section id="paidProduct-container" class="paidProduct-container">
<nav class="navbar navbar-light bg-light">
	<span>결제된 상품 리스트</span>
	  <form class="form-inline" id="form-inline" action='${pageContext.request.contextPath }/admin/paidProductSearch.do?cPage="+${cPage}+"&numPerPage="+${numPerPage}'>
		<select class="form-control" id="type" name="type">
  			<option value="product_name" ${type == "product_name"?"selected":""  }>상품명</option>
  			<option value="product_buyer" ${type == "product_buyer"?"selected":""  }>구매자아이디</option>
  			<option value="product_category" ${type == "product_category"?"selected":""  }>상품카테고리</option>
		</select>
		&nbsp;&nbsp;
	    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="search" id="search" value=${search}>
	    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
	  </form>
	</nav>
<hr />
	<table id="tbl-paidProduct" class="table table-striped table-hover">
		<tr>
			<th>제품코드</th>
			<th>상품명</th>
			<th>상품가격</th>
			<th>판매량</th>
			<th>구매자번호</th>
			<th>이미지</th>
			<th>상품카테고리</th>
		</tr>
		<c:if test="${empty list }">
		<tr>
			<td colspan="7">결제된 상품이 존재하지 않습니다..</td>
		</tr>
		</c:if>
		
		<c:if test="${not empty list }">
			<c:forEach items="${list }" var="p">
			<tr>				
				<td>${p.SEQ_PRODUCT_NO }</td>
				<td>${p.PRODUCT_NAME }</td>
				<td>${p.PRODUCT_IO_PRICE }</td>
				<td>${p.PRODUCT_IO_AMOUNT }</td>
				<td>${p.SEQ_MEMBER_NO }</td>
				<td><img class="" src="${pageContext.request.contextPath }/resources/upload/${p.PRODUCT_IO_IMAGE }"  /></td>
				<td>${p.CATEGORY_MACRO }</td>
			</tr>			
			</c:forEach>
		</c:if>
	</table>
	<div class="result" id="paidProductSearch-result"></div>
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
<script>

//$("#form-inline .btn-send").on("click",function(){
	//$("#tbl-paidProduct").css("display","none");
	
	
	
	/*
	$.ajax({
		url:"${pageContext.request.contextPath}/admin/paidProductSearch.do",
		data:$("#form-inline").serialize(),
		dataType:"json",
		type:"get",
		success : function(data){
			 console.log(data);
             var html = "<table class=table>";
             html+="<tr><th>제품코드</th><th>상품명</th><th>매출액</th><th>판매량</th><th>구매자아이디</th><th>상품카테고리</th><th>주문번호</th></tr>";
             for(var i in data){
                 html += "<tr><td>"+data[i].productNo+"</td>";
                 html += "<td>"+data[i].productName+"</td>";
                 html += "<td>"+data[i].productIoPrice+"</td>";
                 html += "<td>"+data[i].productIoAmount+"</td>";
                 html += "<td>"+data[i].productBuyer+"</td>";
                 html += "<td>"+data[i].productCategory+"</td>";
                 html += "<td>"+data[i].productOrderNo+"</td></tr>";
             }
             html+="</table>";
             $("#paidProductSearch-result").html(html);
		},error:function(){
			console.log("ajax요청 오류!!");
		}
		
	});
	*/

//});
</script> 

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>