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
.auctionRegist-container{
	width:1300px;
	height:750px;
	position:relative;
	margin-left:180px;
	top:-37px;
	
}
#tbl-auctionRegist{
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
<section id="auctionRegist-container" class="auctionRegist-container">
<p>경매 신청 리스트</p>
<hr />
	<table id="tbl-auctionRegist" class="table table-striped table-hover">
		<tr class="tbl-tr">
			<th>고유번호</th>
			<th>상품명</th>
			<th>시작일</th>
			<th>종료일</th>
			<th>시작가</th>
			<th>상품설명</th>
			<th>판매자아이디</th>
		</tr>
	</table>
</section> 

<script>
$(function(){
	$.ajax({
		url : "${pageContext.request.contextPath}/admin/auctionRegistList.do",
		dataType : "json",
		success : function(data){
			console.log(data);
			var html ="";
			for(var i in data){
				html += "<tr class='tableTr'>";
				html += "<td>"+data[i].AUCTION_REGIST_NO+"</td>";
				html += "<td>"+data[i].AUCTION_TITLE+"</td>";
				html += "<td>"+data[i].SDATE+"</td>";
				html += "<td>"+data[i].EDATE+"</td>";
				html += "<td>"+data[i].AUCTION_PRICE+"</td>";
				html += "<td>"+data[i].AUCTIONDETAIL+"</td>";
				html += "<td>"+data[i].AUCTION_MEMBER+"</td></tr>";
			}
			$("#tbl-auctionRegist").append(html);
		},error : function(){
			console.log("ajax 요청 실패!!");
		}
	}); 
});

$(document).on('click','.tableTr',function(){
	//$("#tbl-regist").css("display","none");
	var auctionRegistNo = $(this).children("td:first").text();
	console.log(auctionRegistNo);
	var win = window.open("${pageContext.request.contextPath}/admin/auctionCategory.do?auctionRegistNo="+auctionRegistNo, "대/소분류 선택", "width=400,height=500,location=no,status=no,top=150,left=600");
});

</script> 

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>