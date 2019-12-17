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
<!-- Daum Address API -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<%
	String memberId = (String)request.getAttribute("memeberId");
%>
<style>
.form-control{
	width:140px;
	height:38px;
	display:inline-block;	
	margin : 5px auto;
}
.membermailNo{
	width:80px;
}
.memberAddress{
	width:200px;
}
.memberEmail{
	width:160;
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
		<input class="form-control form-control-sm" id="memberName" type="text"> <br />
		
		<label for="gender">성별</label>&nbsp;&nbsp;
		<select class="form-control" name="gender" >
			<option value="M" class="gender" >남자</option>
			<option value="F" class="gender">여자</option>
		</select><br />
		
		<label for="memberBirth">생년월일</label>&nbsp;&nbsp;
		<input class="form-control form-control-sm" id="memberBirth" type="text" pattern="^[0-9]{6}$" title="생년원일 6자리 입력해주세요."><br />
				
		<label for="membermailNo">우편번호</label>&nbsp;&nbsp;
		<input class="form-control form-control-sm membermailNo" id="membermailNo" type="text"  readonly> &nbsp;&nbsp;
		<input type="button" id="findAddress" value="검색" class="btn btn-info"/><br />
		<label for="memberAddress">주소</label>&nbsp;&nbsp;
		<input class="form-control form-control-sm memberAddress" id="memberAddress" type="text" readonly > <br />
		<label for="memberAddressDetail">상세주소</label>&nbsp;&nbsp;
		<input class="form-control form-control-sm" id="memberAddressDetail" type="text" > <br />
		
		<label for="memberPhone">전화번호</label>&nbsp;&nbsp;
		<input class="form-control form-control-sm" id="memberPhone" type="text"  > <br />
		
		<label for="memberInterest">관심상품</label>&nbsp;&nbsp;
		<input class="form-control form-control-sm" id="memberInterest" type="text"  readonly>&nbsp;
		<input type="button" class="btn btn-primary" id="InterestUpdate" value="등록" />&nbsp;
		<input type="button" class="btn btn-danger" id="InterestDelete" value="삭제" /> <br />
		
		<label for="memberMileage">마일리지</label>&nbsp;&nbsp;
		<input class="form-control form-control-sm" id="memberMileage" type="text" onkeyup="inputNumberFormat(this)"  > <br />
		
		<label for="memberEmail">이메일</label>&nbsp;&nbsp;
		<input class="form-control form-control-sm memberEmail" id="memberEmail" type="text"  > <br />
		
		<label for="memberIsadmin">관리자여부</label>&nbsp;&nbsp;
		<select class="form-control" id="memberIsadmin" name="memberIsadmin" >
			<option value="Y" class="memberIsadmin" >관리자</option>
			<option value="N" class="memberIsadmin">고객</option>
		</select>&nbsp;&nbsp;
		<button type="button" id="isadmin" class="btn btn-primary" >권한</button><br />
		
		<label for="memberSnsaccount">SNS연동여부</label>&nbsp;&nbsp;
		<select class="form-control" id="memberSnsaccount" name="memberSnsaccount" >
			<option value="y" class="memberSnsaccount" >연동o</option>
			<option value="n" class="memberSnsaccount" >연동x</option>
		</select><br />
		
		<label for="coupon">쿠폰</label>&nbsp;&nbsp;
		<select class="form-control" id="coupon" name="coupon">
		
		</select>&nbsp;&nbsp;
		<input type="button" class="btn btn-outline-dark" id="couponPlus" value="쿠폰지급" /> &nbsp;

		
		<!-- Button trigger modal -->
		<button type="button" id="couponList" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">쿠폰내역</button><br /><br />
				
		<input type="button" class="btn btn-outline-light" onclick="tab_save();" value="Save" /> &nbsp;&nbsp;
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


//마일리지 3자리 콤마(,)찍기
function inputNumberFormat(obj) {
   obj.value = comma(uncomma(obj.value));
}

function comma(str) {
   str = String(str);
   return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

function uncomma(str) {
   str = String(str);
   return str.replace(/[^\d]+/g, '');
}


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
			$('#gender option[value="'+ $.trim(data[0].GENDER) +'"]').attr('selected','selected');
			$("#memberBirth").val(data[0].MEMBER_BIRTH);
			$("#memberAddress").val(data[0].MEMBER_ADDRESS);
			$("#membermailNo").val(data[0].MEMBER_MAIL_NO);
			$("#memberAddressDetail").val(data[0].MEMBER_ADDRESSDETAIL);
			$("#memberPhone").val(data[0].MEMBER_PHONE);
			$("#memberInterest").val(data[0].MEMBER_INTEREST);
			$("#memberMileage").val(data[0].MEMBER_MILEAGE);
			$("#memberEmail").val(data[0].MEMBER_EMAIL);
			$('#memberIsadmin option[value="'+ $.trim(data[0].MEMBER_ISADMIN) +'"]').attr('selected','selected');
			if(data[0].MEMBER_SNS_ACCOUNT == null){
				$('#memberSnsaccount option[value="n"]').attr('selected','selected');
			}else{
				$('#memberSnsaccount option[value="'+ $.trim(data[0].MEMBER_SNS_ACCOUNT) +'"]').attr('selected','selected');			
			}
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
	
	$.ajax({
		url:"${pageContext.request.contextPath}/admin/couponAutoDelete",
		dataType:"json",
		success:function(data){
			console.log("유효기간 쿠폰 삭제!!");
		},error:function(){
			alert("ajax 요청 처리 실패!!");
		}
		
	});
	
});

$("#InterestUpdate").on('click',function(){
	var memberNo = $("#memberNo").val();
	var url = "${pageContext.request.contextPath}/member/memberInterest.do?memberNo=";
	var urlReal = url + memberNo;
	console.log("urlReal : ",urlReal)
	window.open(urlReal,'_blank', 'width=500,height=230,left=200,top=200')
});

$("#InterestDelete").on('click',function(){
	var memberNo = $("#memberNo").val();
	console.log(memberNo);
	$.ajax({
		url:"${pageContext.request.contextPath}/admin/interestDelete.do",
		data:{memberNo : memberNo},
		dataType:"json",
		success:function(data){
			if(data == 1){
				alert("관심상품 삭제!");
				location.reload();
				opener.parent.location="${pageContext.request.contextPath}/admin/allMember.do";
			}
		},error:function(){
			alert("ajax요청 실패!");
		}
	});
	
});

$("#isadmin").on('click',function(){
	//console.log("관리자 부여!");
	var isAdmin = $("#memberIsadmin option:selected").val();
	console.log("isAdmin : ",isAdmin);
	var memberId = $("#memberId").val();
	if(confirm("정말 권한을 부여 하시겠습니까??")==true){
	$.ajax({
		url:"${pageContext.request.contextPath}/admin/updateisAdmin.do",
		data:{memberId:memberId,
			isAdmin:isAdmin},
		dataType:'json',
		success:function(data){
			console.log("sucess후 data:",data)
			console.log("sucess후 data[0]:",data[0])
			if(data[0] == 'Y'){
				alert("관리자 권한 부여 성공!!");
			}else if(data[0] == 'N'){
				alert("고객으로 전환 성공!!");
			}						
		},error:function(){
			console.log("ajax요청 실패!!");
		}
	}); 
	}else{
		alert("관리자 권한 부여 실패!!")
	}
	
});

$("#couponPlus").on('click',function(){
	var memberNo = $("#memberNo").val();
	var couponNo = $("#coupon option:selected").val();
	//console.log("couponNo : ",couponNo)
	if(couponNo == ""){
		alert("쿠폰을 선택해 주세요");
	}else{
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
	}
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
					var date = new Date(data[i].ENDDAY);		
					var str = date.toJSON();	
					html += "<td>"+str.substring(0,10)+"</td>";
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

function tab_save(){
	var seqMemberNo = $("#memberNo").val();
	var memberName = $("#memberName").val();
	var gender = $("select[name=gender]").val();
	var memberMailNo = $("#membermailNo").val();
	var memberAddress = $("#memberAddress").val();
	var memberAddressDetail = $("#memberAddressDetail").val();
	var memberPhone = $("#memberPhone").val();
	var memberMileage = uncomma($("#memberMileage").val());
	var memberEmail = $("#memberEmail").val();
	var memberBirth = $("#memberBirth").val();
	
	console.log(seqMemberNo, memberName, gender, memberMailNo, memberAddress, memberAddressDetail, memberPhone, memberMileage, memberEmail,memberBirth)
	$.ajax({
		url : "${pageContext.request.contextPath}/admin/memberUpdate.do",
		data : {seqMemberNo:seqMemberNo,
			memberName:memberName,
			gender:gender,
			memberMailNo:memberMailNo,
			memberAddress:memberAddress,
			memberAddressDetail:memberAddressDetail,
			memberPhone:memberPhone,
			memberMileage:memberMileage,
			memberEmail:memberEmail,
			memberBirth:memberBirth},
		dataType:"json",
		success:function(data){
			alert("회원정보 변경 완료!!");
			opener.parent.location.reload();
			window.close();
		},error:function(){
			console.log("ajax 요청 실패!!");
		}
			 
	});
	
	
	
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

$("#findAddress").on('click',function(){
	new daum.Postcode({
        oncomplete: function(data) {
        	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                updateMember.memberAddress.value = extraAddr;
            
            } else {
            	updateMember.memberAddress.value = extraAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            updateMember.membermailNo.value = data.zonecode;
            updateMember.memberAddress.value = addr;
                        
            updateMember.memberAddressDetail.focus();
        }
    }).open();
});



</script>