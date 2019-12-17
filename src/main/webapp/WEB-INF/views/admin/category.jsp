<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.Date"%>
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
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<!-- Include Date Range Picker -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/daterangepicker.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/write.css" />
<%-- <script src="${pageContext.request.contextPath }/resources/js/popper.min.js"></script> --%>

<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/datepicker/moment.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/datepicker/daterangepicker.js"></script>
<script type="text/javascript" charset="UTF-8" src="${pageContext.request.contextPath }/resources/dist/summernote.js"></script>
<script src="${pageContext.request.contextPath }/resources/dist/lang/summernote-ko-KR.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.2/umd/popper.min.js"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/dist/summernote.css" />
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
#registAdminDescription{
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

<div class="alert alert-primary" role="alert">판매 신청 리스트</div>
<div class="alert">
	<form id="inProduct">
		<label for="registNo">기존 분류</label>&nbsp;&nbsp;
		<input class="form-control form-control-sm" id="exCategoryMacro" type="text" readonly>
		<input class="form-control form-control-sm" id="exCategoryMicro" type="text" readonly> <br />
		
		<label for="registNo">선택 분류</label>&nbsp;&nbsp;
		<select id="categoryMa" class="form-control form-control-sm">
			<option value="" disabled selected>대분류</option>
		</select>
		<select id="categoryMi" class="form-control form-control-sm">
		</select> <br />
		
		<input class="form-control form-control-sm" id="registNo" type="hidden" value="${registNo }" readonly> <br />
		
		<label for="registNo">상품명</label>&nbsp;&nbsp;
		<input class="form-control form-control-sm" id="registName" type="text" readonly> <br />
		
		<label for="registNo" >제조사</label>&nbsp;&nbsp;
		<input class="form-control form-control-sm" id="registManufacturer" type="text" placeholder="입력하세요"> <br />
		
		<label for="registNo">상품가격</label>&nbsp;&nbsp;
		<input class="form-control form-control-sm" id="registPrice" type="text" readonly> <br />
		
		<label for="registNo">판매수량</label>&nbsp;&nbsp;
		<input class="form-control form-control-sm" id="registAmount" type="text" readonly> <br />
		
		<label for="registNo">신청날짜</label>&nbsp;&nbsp;
		<input class="form-control form-control-sm" id="dateRange" name="dateRange" type="text" readonly> <br /><br />
		
		
		<label for="main_img">메인 이미지</label>&nbsp;&nbsp;
		<img class="main_img" src="" /><br /><br />
		
		<label for="exampleFormControlTextarea1">사용자 상세설명</label>
		<div class="form-group">
		    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" readonly></textarea>
		</div>
		
		<label for="registAdminDescription">관리자 상세설명</label>
		<div class="form-group">
		    <textarea class="form-control" id="registAdminDescription" rows="3" ></textarea>
		</div><br />
		<input type="hidden" id="registImage" value="" />
		<input type="hidden" id="registRealImage" value=""/>
		<input type="button" class="btn btn-primary" id="btn" value="신청YES"  />
		<input type="button" class="btn btn-danger" value="신청NO" id="btnn" />
		<input type="reset" class="btn btn-secondary" value="닫기" onclick="window.close()" />
	</form>
</div>
<script>

var dateFlag = 0;	// 초기값으로 dateFlag값이 1이 될 경우에
var dateFlagMsg = "";

$(function(){
	
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
	
	$("#categoryMi").on("change",function(){
		var micro = $(this).val();
		console.log("change 시 micro :"+micro);
	});
	
	
	var registNo = $("#registNo").val();
	$.ajax({
		url: "${pageContext.request.contextPath}/admin/registOne.do",
		data:{registNo:registNo},
		dataType : "json",
		type:"get",
		success : function(data){
			$("#registName").val(data[0].REGIST_NAME);
			$("#registPrice").val(data[0].REGIST_PRICE);
			$("#registAmount").val(data[0].REGIST_AMOUNT);
			$("#dateRange").val(data[0].dateRange);
			$("#exampleFormControlTextarea1").html(data[0].REGIST_DESCRIPTION);
			$("#exCategoryMacro").val(data[0].EXCATEGORYMACRO);
			$("#exCategoryMicro").val(data[0].EXCATEGORYMICRO);
			//$('#exCategoryMacro option[value="'+ $.trim(data[0].CATEGORY_MACRO) +'"]').attr('selected','selected');
			//$('#categoryMi option[value="'+ $.trim(data[0].CATEGORY_MICRO) +'"]').attr('selected','selected');
			var image = data[0].REGIST_REAL_IMAGE.split(',');
			$(".main_img").attr("src","${pageContext.request.contextPath}/resources/upload/thing/"+image[0]);
		},error:function(){
			console.log("ajax요청 실패");
		}
	});
	

	//daterangepicker 적용부분
	$('input[name="dateRange"]').daterangepicker({		
	   "singleDatePicker": true,
		locale : {
		format : 'YYYY-MM-DD HH:mm:ss',
		language : 'ko',
		cancelLabel : 'clear'
	}
	
	});
	$('nput[name="dateRange"]').on('apply.daterangepicker', function(ev, picker) {
	console.log(picker.startDate.format('YYYY-MM-DD H:mm A'));
		
	var startD = new Date(picker.startDate.format('YYYY-MM-DD H:mm A'));
	var endD = new Date(picker.endDate.format('YYYY-MM-DD H:mm A'));
	var todayD = new Date("${today}");
		
	// 경매기간 7일 split으로 잘라서 일 단위 계산
	var endDateArray = picker.startDate.format('YYYY-MM-DD H:mm A').substr(0,10).split("-");
	var todayDateArray = "${today}".split("-");
	// alert("오늘날짜 일 : "+todayDateArray[2]+" 끝나는 날짜 일 : "+endDateArray[2]);
	// alert("밀리세컨드 startDay = "+startD.getTime());
	// alert("picker.start typeof"+typeof(picker.startDate));
	var test = new Date(startD.getTime() + (1000*60*60*24*3)).toJSON();
	// alert("test = "+test);
		
	if(startD < todayD) {
		dateFlagMsg = "신청날자는  현재 날짜 이후여야 합니다.";
		// var dateFlag = 0;
		$(this).val("날짜를 다시 선택해주세요.").css("color" , "red");
		alert(dateFlagMsg);
	} else {
		dateFlag = 1;
		// alert(todayD);
		// console.log("pickD = "+typeof(${today}));
		
		// 시간 , AM / PM 자르기
		var temp = picker.startDate.format('YYYY-MM-DD H:mm A').substr(11,7);
		
		$(this).val(picker.startDate.format('YYYY-MM-DD H:mm A')+ ' ~ '+ test.substr(0,10) + " " + temp).css("color" , "black");;			
	}
	});
	
	
	
	$('nput[name="dateRange"]').on('cancel.daterangepicker',
		function(ev, picker) {
			$(this).val('');
		});
	
		
		
	});



$("#btn").on('click',function(){
	var cMa = $("#categoryMa option:selected").val();
	var cMi = $("#categoryMi option:selected").val();
	var registManufacturer = $("#registManufacturer").val();
	var registNo = $("#registNo").val();
	var registAdminDescription = $("#registAdminDescription").val();
	var dateRange = $("#dateRange").val();
	console.log(registAdminDescription);
		
	if((cMa == "") || (cMi == "")){
		alert("대소분류를 선택하세요.");
	}else if(registManufacturer==""){
		alert("제조사를 작성해 주세요.");
	}else if(registAdminDescription==""){
		alert("관리자 상세설명을 작성하세요");
	}else if(dateRange==""){
		alert("신청 날짜를 선택해 주세요.");
	}else{
		$.ajax({
			url : "${pageContext.request.contextPath}/admin/inProduct.do",
			data : {registNo:registNo,
				cMa:cMa,
				cMi:cMi,
				registManufacturer:registManufacturer,
				registAdminDescription:registAdminDescription,
				dateRange:dateRange},
			type : "GET",
			dataType : "json",
			success :function(data){
				opener.parent.location.reload();
				window.close();
			},error : function(){
				console.log("ajax 요청 실패!!");
			}
		});
		alert("판매신청OK 판매리스트로 이동!");
	}
});
$("#btnn").on('click',function(){
	var registNo = $("#registNo").val();
	if(confirm("정말 판매신청을 취소 하시겠습니까??")==true){
		$.ajax({
			url:"${pageContext.request.contextPath}/admin/registAuction.do",
			data:{registNo:registNo},
			dataType:"json",
			success:function(data){
				console.log(data);
				alert("판매신청 취소 성공!!");
				opener.parent.location.reload();
				window.close();
			},error:function(){
				console.log("ajax 요청 실패!!");
			}
		})

	}
	
});

</script>
