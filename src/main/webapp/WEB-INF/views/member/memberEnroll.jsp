<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="회원등록" name="pageTitle" />
</jsp:include>
<style>
	div#enroll-container{width:400px; margin:0 auto; text-align:center;}
	div#enroll-container input, div#enroll-container select {margin-bottom:10px;}
	
	/* 중복아이디 체크관련 */
	div#memberId-container{
		position: relative;
		padding: 0px;
	}
	div#memberId-container span.guide{
		display: none;
		font-size: 12px;
		position: absolute;
		top: 12px;
		right: 10px;
	}
	div#memberId-container span.ok{
		color:green;
	}
	div#memberId-container span.error{
		color:red;
	}
</style>
<!-- 
Bootstrap 폼태그 작성 시 유의할 것
* input[type=text , password , tel , number], select => .form-control
* input[type=checkbox, radio] => .form-check-input
* label => .form-check-label
* radio/checkbox는 div.form-check , form-check-inline으로 감쌀 것
 -->
<div id="enroll-container">
	<form name="memberEnrollFrm" action="${pageContext.request.contextPath}/member/memberEnrollEnd.do" method="post" onsubmit="return validate();" >
		
		<div id="memberId-container">
			<input type="text" class="form-control" placeholder="아이디 (4글자이상)" name="memberId" id="memberId_" required>
			<!-- 중복체크관련태그 -->
			<span class="guide ok">이 아이디는 사용가능합니다.</span>
			<span class="guide error">이 아이디는 사용할 수 없습니다.</span>
			<input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value="0" />
		</div>
		
		<input type="password" class="form-control" placeholder="비밀번호" name="password" id="password_" required>
		<input type="password" class="form-control" placeholder="비밀번호확인" id="password2" required>
		<input type="text" class="form-control" placeholder="이름" name="memberName" id="memberName" required>
		<input type="number" class="form-control" placeholder="나이" name="age" id="age">
		<input type="email" class="form-control" placeholder="이메일" name="email" id="email" required>
		<input type="tel" class="form-control" placeholder="전화번호 (예:01012345678)" name="phone" id="phone" maxlength="11" required>
		<input type="text" class="form-control" placeholder="주소" name="address" id="address">
		<select class="form-control" name="gender" required>
			<option value="" disabled selected>성별</option>
			<option value="M">남</option>
			<option value="F">여</option>
		</select>
		<div class="form-check-inline form-check">
			취미 : &nbsp; 
			<input type="checkbox" class="form-check-input" name="hobby" id="hobby0" value="운동"><label for="hobby0" class="form-check-label">운동</label>&nbsp;
			<input type="checkbox" class="form-check-input" name="hobby" id="hobby1" value="등산"><label for="hobby1" class="form-check-label">등산</label>&nbsp;
			<input type="checkbox" class="form-check-input" name="hobby" id="hobby2" value="독서"><label for="hobby2" class="form-check-label">독서</label>&nbsp;
			<input type="checkbox" class="form-check-input" name="hobby" id="hobby3" value="게임"><label for="hobby3" class="form-check-label">게임</label>&nbsp;
			<input type="checkbox" class="form-check-input" name="hobby" id="hobby4" value="여행"><label for="hobby4" class="form-check-label">여행</label>&nbsp;
		</div>
		<br />
		<input type="submit" class="btn btn-outline-success" value="가입" >&nbsp;
		<input type="reset" class="btn btn-outline-success" value="취소">
	</form>
</div>
<script>
/**
 * 아이디 최소 4자리
 * 비밀번호 / 비밀번호 체크 일치 여부
 */
 function validate() {
	 var regExp1 = /^[a-z][a-z0-9]{3,11}$/;
     var memberId = document.getElementById("memberId_").value;
     var regExp2 = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,15}$/;
     var password = document.getElementById("password_").value;
     
     if(!regExp1.test(memberId)){
         alert("아이디는 영소문자 / 숫자만 가능하고 , 단 소문자로 시작해야합니다. (4~14자리)");
         return false;
     } else if(!regExp2.test(password)){
         alert("비밀번호는 숫자 / 문자 / 특수문자를 포함한형태여야 합니다. (8~15자리) ");
         return false;
     } else if($("#idDuplicateCheck").val() == 0) {
    	 alert("아이디 중복검사를 해주세요.");
    	 return false;
     }
     
     return true;
}

$("#memberId_").on("keyup" , function(){
	var memberId = $(this).val();
	
	// 아이디작성 4글자 이상 작성한 경우만, 중복여부 검사요청
	if(memberId.trim().length < 4) {
		$(".guide").hide();
		$("#idDuplicateCheck").val(0);
		return;
	}
	
	// ajax요청
	$.ajax({
		url: "${pageContext.request.contextPath}/member/checkDuplicate.do" ,
		method: "get" ,
		data: {memberId: memberId} ,
		//data: "memberId="+memberId, // 직렬화된 형태도 가능하다.
		success: function(data) {
			// console.log(data); // true -> 문자열
			// console.log(JSON.stringify(data)); // 받아온그대로를 보여준다.
			// console.log(JSON.parse(JSON.stringify(data))); // JSON타입을 js객체로 바꿔준다.
			
			if(data.isUsable == true) {
				$(".guide.error").hide();
				$(".guide.ok").show();
				$("#idDuplicateCheck").val(1);				
			} else {
				$(".guide.ok").hide();
				$(".guide.error").show();
				$("#idDuplicateCheck").val(0);								
			}
		
		} ,
		error: function() {
			console.log("ajax요청 에러!");
		}
	});
});

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>