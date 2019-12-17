<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle" />
</jsp:include>
<jsp:include page="/WEB-INF/views/common/mypageSide.jsp"></jsp:include>
<!-- Daum Address API -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypage.css" />
<style>
#address_{
	margin-left:3%;
	
}
#user-addr2{
	margin-left:3%;
}
#info_{
	margin-top: 9%;
    margin-left: 7%;
}
#info2_{
    margin-left: 7%;
}
#info3_{
    margin-left: 7%;
}

/* 인증완료후input&버튼 영역 */
.profedit-form-input {
    margin-bottom: 34px;
    width: 295px;
}
/* 인증하기버튼 */
.btn-outline-success{
	border:1px solid;
	border-radius: 5px;
}
/* 인증완료버튼 */
.btn-success{
	border-radius: 5px;
}
</style>
<!-- 폰 인증 -->
<form action="${pageContext.request.contextPath}/mypage/smscheck.do"
	  			 method="get"
	  			 name="checkSmsCertifiedFrm">
			<!-- <input type="hidden" name="memberPhone" value=""/> -->
			<input type="hidden" name="memberId" value="${memberLoggedIn.memberId}" />
</form>
<form action="${pageContext.request.contextPath}/mypage/emailcheck.do"
	  			 method="get"
	  			 name="checkMailCertifiedFrm">
			<input type="hidden" name="memberId" value="${memberLoggedIn.memberId}" />
</form>
<%-- <form action="${pageContext.request.contextPath}/mypage/updatephone.do" name="updatephone" id="updatephone" >
		<input type="hidden" name="memberPhone" value="" />
		<input type="hidden" name="memberId" value="${memberLoggedIn.memberId}" />
</form> --%>
<input type="hidden" id="memberId" value="${memberLoggedIn.memberId}" />
<div class="mypage-container" >
	<div class="real-content-container" style="margin-left:30%;" >
		<div class="mp-container" >
			<div class="mp">
			<strong style="font-size:20px;">내정보</strong>
			<hr style="width:130%;">
			<!-- 추 후 로그인 시간이 오래 지났을 경우 비밀번호 기입 후 회원정보 수정하도록 만들기 -->
			</div>
			<div class="mypage-profile" >
				<div class="profedit-body-title">기본정보</div>
						<div class="profedit-body">
							<div class="form-group" id="info_">
								<c:if test="${memberLoggedIn.memberPhone eq null}">
									<label for="tel" class="profedit-form-label">전화번호</label>
									<input type="button" class="btn btn-outline-success" name="smsclear" id="smsclear" value="인증하기" onclick="sendSms();">
								</c:if>
								<c:if test="${memberLoggedIn.memberPhone ne null}">
									<label for="tel" class="profedit-form-label">전화번호</label>
									<input type="text" class="form-control profedit-form-input ng-pristine ng-valid" value="${memberLoggedIn.memberPhone}" readonly/>
									<button class="btn btn-success" disabled>인증완료</button>
								</c:if>
							</div>
							<div class="form-group" id="info2_">	 
								<c:if test="${memberLoggedIn.memberEmail eq null}">
									<label for="email" class="profedit-form-label">이메일</label>
									<input type="button" class="btn btn-outline-success" name="mailclear" id="mailclear" value="인증하기" onclick="sendMail();">
								</c:if>
								<c:if test="${memberLoggedIn.memberEmail ne null}">
									<label for="email" class="profedit-form-label">이메일</label>
									<input type="text" class="form-control profedit-form-input ng-pristine ng-valid" value="${memberLoggedIn.memberEmail}" readonly/>
									<button class="btn btn-success" disabled>인증완료</button>
								</c:if>
							</div>
						</div>
			</div>
			<hr style="width:130%;">
			<c:if test="${memberLoggedIn.memberAddress eq null}">
				<form  id="perchaseFrm" name="perchaseFrm">
					<div class="mypage-profile">
						<div class="profedit-body-title" >배송정보</div>
								<div class="profedit-body"id="info3_">
									<label class="profedit-form-label" style="margin: 7px 12px 7px -15px; padding-left: 18px;">주소</label>
									<div class="form-group profedit-addr-wrapper" style="margin-left: 80px;">
										<div class="dropdown" style="width:500px;">
											<input name="addressMail" autocomplete="off" class="form-control profedit-addr-form ng-pristine ng-valid" id="address" ng-model="addressKeyword" placeholder="읍, 면, 동으로 검색해주세요." type="text"">
											<a id="findAddress" class="btn profedit-search-btn profedit-search-btn btn-primary" style="color:white;border-radius:5px;margin-left: -1.5px;">검색</a>
											<input type="button" id="findAddress" value="검색" class="btn profedit-search-btn profedit-search-btn btn-primary"/><br />
										</div>
										<div style="height: 50px;">
											<input name="addressMail2" id="address2" class="form-control profedit-addr-form ng-pristine ng-valid" ng-model="profile.addr1" placeholder="주소검색을 이용해주세요" readonly="readonly" id="address_"">  <br /> <br />							
										</div>
										<div style="width:500px;">
											<input name="addressMail3" id="address3" class="form-control profedit-addr-form ng-pristine ng-valid"  ng-model="profile.addr2" placeholder="상세주소">							
											<button class="btn profedit-success-btn profedit-search-btn btn-primary" onclick="insert();" style="width:85px;border-radius:5px;margin-left: -1.5px;">정보 수정</button>
										</div>
									</div>
								</div>		
					</div>
				</form>
			</c:if>
			
			<c:if test="${memberLoggedIn.memberAddress ne null}">
				<form  id="perchaseFrm" name="perchaseFrm">
					<div class="mypage-profile">
						<div class="profedit-body-title" >배송정보</div>
								<div class="profedit-body"id="info3_">
									<label class="profedit-form-label" style="margin: 7px 12px 7px -15px; padding-left: 18px;">주소</label>
									<div class="form-group profedit-addr-wrapper" style="margin-left: 80px;">
										<div class="dropdown" style="width:500px;">
											<input name="memberMailNo" class="form-control profedit-addr-form ng-pristine ng-valid" id="memberMailNo" type="text"  >
											<input type="button" id="findAddress" value="검색" class="btn profedit-search-btn profedit-search-btn btn-primary" style="color:white;border-radius:5px;margin-left: -1.5px;"/><br />
										</div>
										<div style="height: 50px;">
											<input name="memberAddress" id="memberAddress" class="form-control profedit-addr-form ng-pristine ng-valid" readonly="readonly"   >  <br /> <br />							
										</div>
										<div style="width:500px;">
											<input name="memberAddressDetail" id="memberAddressDetail" class="form-control profedit-addr-form ng-pristine ng-valid"  >							
											<button class="btn profedit-success-btn profedit-search-btn btn-primary" onclick="insert();" style="width:85px;border-radius:5px;margin-left: -1.5px;">정보 수정</button>
										</div>
									</div>
								</div>		
					</div>
				</form>
			</c:if>
			<!-- <hr style="width:130%;">
			<style>
			.info-update{
				text-align: center;
			}
			</style> -->
			<!-- <div class="mypage-profile" id="info4_">
				<div class="info-update">
				</div>
			</div> -->
		</div>
	</div>
</div>
<script>
$(function(){
	$(".profileEdit").css("color" , "#7151FC");
	$(".profileEdit").css("font-weight" , "bold");
	$(".profileEdit").css("background" , "#f2f2f2");
});

function sendSms(){
		var target = "smscheck";
		var popup = open("", target, "left=300px, top=100px, height=150px, width=470px");
		checkSmsCertifiedFrm.target = target;
		checkSmsCertifiedFrm.submit();		
}
function sendMail(){
		var target = "emailcheck";
		var popup = open("", target, "left=300px, top=100px, height=150px, width=470px");
		checkMailCertifiedFrm.target = target;
		checkMailCertifiedFrm.submit();		
}
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
                perchaseFrm.memberAddress.value = extraAddr;
            
            } else {
            	perchaseFrm.memberAddress.value = extraAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            perchaseFrm.memberMailNo.value = data.zonecode;
            perchaseFrm.memberAddress.value = addr;
                        
            perchaseFrm.memberAddressDetail.focus();
        }
    }).open();
});
function insert(){
	var memberId = $("#memberId").val();
	var memberMailNo = $("#memberMailNo").val();
	var memberAddress = $("#memberAddress").val();
	var memberAddressDetail = $("#memberAddressDetail").val();
	console.log(memberMailNo,	memberAddress,	memberAddressDetail);
	$.ajax({
		url:"${pageContext.request.contextPath}/mypage/memberAddressUpdate.do",
		data:{memberId:memberId,
			memberMailNo:memberMailNo,
			memberAddress:memberAddress,
			memberAddressDetail:memberAddressDetail},
		success:function(data){
			console.log(data);
			alert("주소 변경 완료!");
		},error:function(){
			alert("ajax 요청 실패!!");
		}
	});
}

$(function(){
	var memberId = $('#memberId').val();
	console.log(memberId);
	$.ajax({
		url:"${pageContext.request.contextPath}/admin/memberOne.do",
		data:{memberId:memberId},		
		success:function(data){
			console.log(data);
			$("#memberMailNo").val(data[0].MEMBER_MAIL_NO);
			$("#memberAddress").val(data[0].MEMBER_ADDRESS);
			$("#memberAddressDetail").val(data[0].MEMBER_ADDRESSDETAIL);
		},error:function(){
			alert("ajax요청 실패!");
		}
	});
});

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>