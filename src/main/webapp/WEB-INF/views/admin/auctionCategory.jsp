<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />

<script src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.js"></script>
<!-- 부트스트랩관련 라이브러리 -->
<link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
    integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
    crossorigin="anonymous">
<script
    src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
    integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm"
    crossorigin="anonymous"></script>
<%
	int auctionRegistNo = (int)request.getAttribute("auctionRegistNo");
	System.out.println(auctionRegistNo);
%>
<style>
.form-control{
	width:140px;
	display:inline-block;	
	margin : 5px auto;
}

.alert{
	text-align: center;
	margin :0;
}
#auctionDetail{
	width:300px;
}
.form-control:disabled, .form-control[readonly]{
	background-color : #ffffff;
}
.main_img{
	width:400px;
	height:400px;
}
</style>

<div class="alert alert-primary" role="alert">경매 신청 리스트</div>
<div class="alert">
	<form id="inAuction">
		<select id="categoryMa" class="form-control form-control-sm">
			<option value="" disabled selected>대분류</option>
		</select>
		&nbsp;&nbsp;&nbsp;
		<select id="categoryMi" class="form-control form-control-sm">
		</select> <br />
		
		
		<input class="form-control form-control-sm" id="auctionRegistNo" type="hidden" value="${auctionRegistNo }" readonly> <br />
		
		<label for="auctionTitle">상품명</label>&nbsp;&nbsp;
		<input class="form-control form-control-sm" id="auctionTitle" type="text" readonly> <br />
		
		<label for="sdate">시작일</label>&nbsp;&nbsp;
		<input class="form-control form-control-sm" id="sdate" type="text" readonly> <br />
		
		<label for="edate">종료일</label>&nbsp;&nbsp;
		<input class="form-control form-control-sm" id="edate" type="text" readonly> <br />
		
		<label for="auctionPrice">시작가</label>&nbsp;&nbsp;
		<input class="form-control form-control-sm" id="auctionPrice" type="text" readonly> <br />
		<br />
		<label for="main_img">메인 이미지</label>&nbsp;&nbsp;
		<img class="main_img" src="" /><br /><br />
		
		<label for="auctionDetail">상품 설명</label>&nbsp;&nbsp;
		<div class="form-group">
		    <textarea class="form-control" id="auctionDetail" rows="3" readonly></textarea>
		</div><br />
		
		<input type="button" class="btn btn-primary" id="btn" value="신청YES"  />
		<input type="button" class="btn btn-danger" value="신청NO" id="btnn" />
		<input type="reset" class="btn btn-secondary" value="닫기" onclick="window.close()" />
	</form>
</div>
<script>

$(function(){
	var auctionRegistNo = $("#auctionRegistNo").val();
	console.log(auctionRegistNo);
	$.ajax({
		url: "${pageContext.request.contextPath}/admin/auctionRegistOne.do",
		data:{auctionRegistNo:auctionRegistNo},
		dataType : "json",
		type:"get",
		success : function(data){
			console.log(data);
			$("#auctionTitle").val(data[0].AUCTION_TITLE);
			$("#sdate").val(data[0].SDATE);
			$("#edate").val(data[0].EDATE);
			$("#auctionPrice").val(data[0].AUCTION_PRICE);
			$("#auctionDetail").html(data[0].AUCTIONDETAIL);
			$(".main_img").attr("src","${pageContext.request.contextPath}/resources/upload/"+data[0].AUCTION_IMAGE_MAIN);
		},error:function(){
			console.log("ajax요청 실패");
		}
	});
	
	$.ajax({
		url : "${pageContext.request.contextPath}/admin/categoryMa.do",
		dataType : "json",
		success : function(data){
			var html ="";
			for(var i in data){
			html += "<option class='cMa' value="+data[i].categoryMacro+">"+data[i].categoryName+"</option>";
			}
			$("#categoryMa").append(html);
		},error : function(){
			console.log("ajax 요청 실패!!");
		}
	}); 
});

$("#categoryMa").on("change",function(){
	var macro = $(this).val();
	console.log("change 시 :"+macro);
	var none = "";
	$("#categoryMi").append(none);
	$.ajax({
		url : "${pageContext.request.contextPath}/admin/categoryMi.do",
		data : {macro:macro},
		type : "get",
		dataType : "json",
		success :function(data){
			$('#categoryMi').children("option").remove();
			var html ="<option value='' disabled selected>소분류</option>";
			for(var i in data){
			html += "<option class='cMi' value="+data[i].categoryMicro+">"+data[i].categoryName+"</option>";
			}
			$("#categoryMi").append(html);
		},error : function(){
			console.log("ajax 요청 실패!!");
		}
	});	
	
});

$("#btn").on('click',function(){
	var cMa = $("#categoryMa option:selected").val();
	var cMi = $("#categoryMi option:selected").val();
	var auctionRegistNo = $("#auctionRegistNo").val();
	console.log(cMa+","+cMi+","+auctionRegistNo);
	
	if((cMa == "") || (cMi == "")){
		alert("대소분류를 선택하세요.");
	}else{
	$.ajax({
		url : "${pageContext.request.contextPath}/admin/inAuction.do",
		data : {auctionRegistNo:auctionRegistNo,
			cMa:cMa,
			cMi:cMi},
		type : "GET",
		dataType : "json",
		success :function(data){
			opener.parent.location.reload();
			window.close();
		},error : function(){
			console.log("ajax 요청 실패!!");
		}
	});
	}
});

$("#btnn").on('click',function(){
	var auctionRegistNo = $("#auctionRegistNo").val();
	if(confirm("정말 경매신청을 취소 하시겠습니까??")==true){
		$.ajax({
			url:"${pageContext.request.contextPath}/admin/auctionCencel.do",
			data:{auctionRegistNo:auctionRegistNo},
			dataType:"json",
			success:function(data){
				console.log(data);
				alert("경매신청 취소 성공!!");
				opener.parent.location.reload();
				window.close();
			},error:function(){
				console.log("ajax 요청 실패!!");
			}
		})

	}
	
});


</script>
