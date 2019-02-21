<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
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
	int registNo = (int)request.getAttribute("registNo");
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
#exampleFormControlTextarea1{
	width:300px;
}
.form-control:disabled, .form-control[readonly]{
	background-color : #ffffff;
}
</style>

<div class="alert alert-primary" role="alert">판매 신청 리스트</div>
<div class="alert">
	<form action="${pageContext.request.contextPath }/admin/insertP.do" onsubmit="return categoryCheck();">
		<select id="categoryMa" class="form-control form-control-sm">
			<option value="" disabled selected>대분류</option>
		</select>
		&nbsp;&nbsp;&nbsp;
		<select id="categoryMi" class="form-control form-control-sm">
		</select> <br />
		
		<label for="registNo">고유번호</label> &nbsp;&nbsp;
		<input class="form-control form-control-sm" id="registNo" type="text" value="${registNo }" readonly> <br />
		
		<label for="registNo">상품명</label>&nbsp;&nbsp;
		<input class="form-control form-control-sm" id="registName" type="text" readonly> <br />
		
		<label for="registNo">상품가격</label>&nbsp;&nbsp;
		<input class="form-control form-control-sm" id="registPrice" type="text" readonly> <br />
		
		<label for="registNo">판매수량</label>&nbsp;&nbsp;
		<input class="form-control form-control-sm" id="registAmount" type="text" readonly> <br />
		
		<label for="registNo">신청날짜</label>&nbsp;&nbsp;
		<input class="form-control form-control-sm" id="registDate" type="text" readonly> <br /><br />
		
		<div class="form-group">
		    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" readonly></textarea>
		</div><br />
		<input type="hidden" id="registImage" value="" />
		<input type="hidden" id="registRealImage" value=""/>
		<input type="submit" value="신청YES" />
		<input type="reset" value="신청NO" onclick="window.close()" />
	</form>
</div>
<script>
$(function(){
	var registNo = $("#registNo").val();
	console.log(registNo);
	$.ajax({
		url: "${pageContext.request.contextPath}/admin/registOne.do",
		data:{registNo:registNo},
		dataType : "json",
		type:"get",
		success : function(data){
			console.log(data);
			//$("#registName").val(data[0].name);
			//$("#registPrice").val(data[0].price);
			//$("#registAmount").val(data[0].amount);
			//$("#registDate").val(data[0].date);
			//$("#exampleFormControlTextarea1").html(data[0].description);
		},error:function(){
			console.log("ajax요청 실패");
		}
	});
	
	/* $.ajax({
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
	}); */
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
		dateType : "json",
		success :function(data){
			$('#categoryMi').children("option").remove();
			var html ="<option value='' disabled selected>소분류</option>";
			for(var i in data){
			html += "<option class='cMi' value="+data[i].categoryMacro+">"+data[i].categoryName+"</option>";
			}
			$("#categoryMi").append(html);
		},error : function(){
			console.log("ajax 요청 실패!!");
		}
	});	
	
});

function categoryCheck(){
	var cMa = $("#categoryMa option:selected").val();
	console.log(cMa);
	var cMi = $("#categoryMi option:selected").val();
	console.log(cMi);
	
	if(cMa == ""){
		alert("대분류를 선택해 주세요.");
		return false;
	}else if(cMi == ""){
		alert("소분류를 선택해 주세요.");
		return false;
	}
	alert("판매신청OK 판매리스트로 이동!");
	window.close();	
	return true;
}



</script>
