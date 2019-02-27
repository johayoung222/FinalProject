<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	String memberId = (String)request.getAttribute("memeberId");
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

<div class="alert alert-primary" role="alert">회원 정보</div>
<div class="alert">
	<form id="updateMember">
	<input type="hidden" id="memberNo" />
		<label for="memberId">아이디</label> &nbsp;&nbsp;
		<input class="form-control form-control-sm" id="memberId" type="text" value="${memberId }" readonly> <br />
		
		<label for="memberName">이름</label>&nbsp;&nbsp;
		<input class="form-control form-control-sm" id="memberName" type="text"  readonly> <br />
		
		<label for="gender">성별</label>&nbsp;&nbsp;
		<select class="form-control" name="gender" >
			<option value="M" class="gender" >남자</option>
			<option value="F" class="gender">여자</option>
		</select><br />
		
		<label for="memberAddress">주소</label>&nbsp;&nbsp;
		<input class="form-control form-control-sm" id="memberAddress" type="text" readonly > <br />
		<label for="membermailNo">우편번호</label>&nbsp;&nbsp;
		<input class="form-control form-control-sm" id="membermailNo" type="text"  readonly> <br />
		
		<label for="memberPhone">전화번호</label>&nbsp;&nbsp;
		<input class="form-control form-control-sm" id="memberPhone" type="text"  readonly> <br />
		
		<label for="memberInterest">관심상품</label>&nbsp;&nbsp;
		<input class="form-control form-control-sm" id="memberInterest" type="text"  readonly> <br />
		
		<label for="memberMilege">마일리지</label>&nbsp;&nbsp;
		<input class="form-control form-control-sm" id="memberMilege" type="text"  readonly> <br />
		
		<label for="memberEmail">이메일</label>&nbsp;&nbsp;
		<input class="form-control form-control-sm" id="memberEmail" type="text"  readonly> <br />
		
		<label for="memberIsadmin">관리자여부</label>&nbsp;&nbsp;
		<select class="form-control" name="memberIsadmin" >
			<option value="Y" class="memberIsadmin" >관리자</option>
			<option value="N" class="memberIsadmin">고객</option>
		</select><br />
		
		<label for="memberSnsaccount">SNS연동여부</label>&nbsp;&nbsp;
		<select class="form-control" name="memberSnsaccount" >
			<option value="Y" class="memberSnsaccount" >연동o</option>
			<option value="N" class="memberSnsaccount" >연동x</option>
		</select><br />
		
		<label for="coupon">쿠폰</label>&nbsp;&nbsp;
		<select class="form-control" id="coupon" name="coupon">
		
		</select>&nbsp;&nbsp;
		<input type="button" class="btn btn-outline-dark" id="couponPlus" value="쿠폰지급" /> 

		
		<!-- Button trigger modal -->
		<button type="button" id="couponList" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">쿠폰내역</button><br /><br />
				
		<input type="button" class="btn btn-outline-light" onclick="tab_close();" value="Close" />
		
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">쿠폰 지급 내역</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>	
		      <div class="modal-body">
		        <table class="table table-white" id="table-th">
				  <thead>
				    <tr class="table-primary">
				      <th scope="col">쿠폰명</th>
				      <th scope="col">쿠폰헤택</th>
				      <th scope="col">유효기간</th>
				      <th scope="col">쿠폰상태</th>
				    </tr>
				  </thead>
				  <tbody id="tbody">
				  </tbody>
				</table>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
		
	</form>
</div>

<script>
$(function(){
	var memberId = $("#memberId").val();
	console.log(memberId);
	$.ajax({
		url:"${pageContext.request.contextPath}/admin/memberOne.do",
		data:{memberId:memberId},
		dataType:"json",
		success:function(data){
			console.log(data);
			$("#memberNo").val(data[0].SEQ_MEMBER_NO);
			$("#memberName").val(data[0].MEMBER_NAME);
			$(".gender").val(data[0].GENDER).attr('selected','selected');
			$("#memberAddress").val(data[0].MEMBER_ADDRESS);
			$("#membermailNo").val(data[0].MEMBER_MAIL_NO);
			$("#memberPhone").val(data[0].MEMBER_PHONE);
			$("#memberInterest").val(data[0].MEMBER_INTEREST);
			$("#memberMilege").val(data[0].MEMBER_MILEGE);
			$("#memberEmail").val(data[0].MEMBER_EMAIL);
			$(".memberIsadmin").val(data[0].MEMBER_ISADMIN).attr('selected','selected');
			$(".memberSnsaccount").val(data[0].MEMBER_SNS_ACCOUNT).attr('selected','selected');
			
		},error:function(){
			console.log("ajax요청 실패!!");
		}
	});		
	
	$.ajax({
		url : "${pageContext.request.contextPath}/admin/couponAll.do",
		dataType:"json",
		success:function(data){
			console.log(data);
			var html = "<option value='' disabled selected>쿠폰</option>";
			for(var i in data){
				html += "<option value="+data[i].SEQ_COUPON_NO+">"+data[i].COUPON_NAME+"</option>";
			}
			$("#coupon").append(html);
		},error:function(){
			console.log("ajax요청 실패!!");
		}
	});
});

$("#couponPlus").on('click',function(){
	var memberNo = $("#memberNo").val();
	var couponNo = $("#coupon option:selected").val();

	alert("쿠폰지급 완료!!");
	$.ajax({
		url:"${pageContext.request.contextPath}/admin/couponPlus.do",
		data:{memberNo:memberNo,
			couponNo:couponNo},
		dataType:"json",
		success:function(data){
			console.log(data);
		},error:function(){
			console.log("ajax요청 실패!!!");
		}
	});
});

$("#couponList").on('click',function(){
	var memberNo = $("#memberNo").val();
	 $('#table-th > tbody').empty();
	$.ajax({
		url:"${pageContext.request.contextPath}/admin/couponList.do",
		data:{memberNo:memberNo},
		dataType:"json",
		success : function(data){
			console.log(data);
			var html="";
			if(data==""){
				html +="<tr><td colspan='4'>쿠폰이 없습니다.</td></tr>";
			}else{
				for(var i in data){
					html +="<tr scope='row' class='tableTr'>";
					html +="<input type='hidden' id='seqcouponNo' value="+data[i].SEQ_COUPON_NO+">";
					html += "<td>"+data[i].COUPON_NAME+"</td>";
					if(data[i].COUPON_BENEFITS == 0){
						html += "<td>5%</td>";
					}else if(data[i].COUPON_BENEFITS == 1){
						html += "<td>10%</td>";
					}else if(data[i].COUPON_BENEFITS == 2){
						html += "<td>15%</td>";
					}
					html += "<td>"+data[i].COUPON_EXPIRATION_DATE+"</td>";
					html += "<td>"+data[i].COUPON_STATUS+"</td></tr>";
				}
			}
			$("#tbody").append(html);
			
		},error:function(){
			console.log("ajax 요청 실패!!");
		}
	});
});

function tab_close(){
	opener.parent.location.reload();
	window.close();
}

$(document).on('click','.tableTr',function(){
	var seqcouponNo = $("#seqcouponNo").val();
	var memberNo = $("#memberNo").val();
	if(confirm("정말 삭제 하시겠습니까??")==true){
		
		$.ajax({
			url : "${pageContext.request.contextPath}/admin/deleteCoupon.do",
			data : {seqcouponNo:seqcouponNo,
				memberNo:memberNo},
			dataType:"json",
			success:function(data){
				console.log("쿠폰 삭제성공!");
				location.reload();
			},error:function(){
				console.log("ajax 요청 실패!!");
			}
				
		});
	}else{
		console.log("쿠폰 삭제 실패");
		return;
	}
	
});


</script>