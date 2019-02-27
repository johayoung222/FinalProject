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
	width:1300px;
	position:relative;
	margin-left:180px;
	top:-37px;
	
}
#tbl-regist{
	table-layout: fixed;
}
.tbl-tr th{
	width:100px;
}
.tableTr td{
	width:100px;
	height:70px;
	overflow:hidden;
	white-space : nowrap;
	text-overflow: ellipsis;
}
</style>
<br />
<section id="regist-container" class="regist-container">
<p>판매 신청 리스트</p>
<hr />
	<table id="tbl-regist" class="table table-striped table-hover">
		<tr class="tbl-tr">
			<th>고유번호</th>
			<th>상품명</th>
			<th>판매가격</th>
			<th>상품이미지</th>
			<th>상품이미지</th>
			<th>판매수량</th>
			<th>상품설명</th>
			<th>신청날짜</th>
		</tr>
	</table>
</section> 

<script>
$(function(){
	$.ajax({
		url : "${pageContext.request.contextPath}/admin/regist.do",
		dataType : "json",
		success : function(data){
			console.log(data);
			var html ="";
			for(var i in data){
				html += "<tr class='tableTr'>";
				html += "<td>"+data[i].SEQ_REGIST_NO+"</td>";
				html += "<td>"+data[i].REGIST_NAME+"</td>";
				html += "<td>"+data[i].REGIST_PRICE+"</td>";
				html += "<td>"+data[i].REGIST_IMAGE+"</td>";
				html += "<td>"+data[i].REGIST_REAL_IMAGE+"</td>";
				html += "<td>"+data[i].REGIST_AMOUNT+"</td>";
				html += "<td>"+data[i].REGIST_DESCRIPTION+"</td>";
				html += "<td>"+data[i].registDate+"</td></tr>";
			}
			$("#tbl-regist").append(html);
		},error : function(){
			console.log("ajax 요청 실패!!");
		}
	}); 
});

$(document).on('click','.tableTr',function(){
	//$("#tbl-regist").css("display","none");
	var registNo = $(this).children("td:first").text();
	var win = window.open("${pageContext.request.contextPath}/admin/category.do?registNo="+registNo, "대/소분류 선택", "width=400,height=500,location=no,status=no,top=150,left=600");
});

</script> 

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>