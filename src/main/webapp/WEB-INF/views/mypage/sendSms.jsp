<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
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
<style>
#emailcertified-container{
	padding-left:8%;
	padding-top:5%;
}
#updatephone{
	padding-left:8%;
}
#check{
margin-bottom: 6px;
}
#button_{
width: 110px;
    padding: 0;
    height: 32px;
    margin-bottom: 6px;
}
</style>
</head>

<body>
	<form action="${pageContext.request.contextPath}/mypage/sendSms.do"name="c">
		<div id="emailcertified-container">
			<label for="memberPhone" style="color:lightgray;">전화번호 : </label>
			<input type="text" name="memberPhone" id="memberPhone"value="${memberPhone}" />
			<input type="hidden" name="memberId" value="${m.memberId}" />
			<!-- <input type="submit" value="인증번호요청" /> -->
			<button   onclick="c();" id="button_" class="btn btn-outline-success">인증번호요청</button>
		</div>
	</form>
	<c:if test="${memberPhone ne null}">
		<form action="${pageContext.request.contextPath}/mypage/updatephone.do" name="updatephone" id="updatephone" >
				<label for="certified" style="color:lightgray;">인증번호 : </label>
				<input type="text"name="certified" id="certified"class="certified"/>
				<input type="hidden" name="memberPhone" id="memberPhone" value="${memberPhone}" />
				<input type="hidden" name="memberId" id="memberId" value="${memberId}" />
				<button class="btn btn-outline-success" id="check" onclick="check();" style=" width:110px; height:30px; padding:0" >확인</button>
				
		</form>
				<div style="float:right;">
				<img src="${pageContext.request.contextPath }/resources/images/Getit_.PNG" width="100px" height="30px">
				</div>
	</c:if>
</body>
<script>
function c(){
	document.c.submit();
}
function check(){
	var certified = $("#certified").val().trim();
	console.log(certified);
	var certifiedNum = ${certified};
	console.log(certifiedNum);
	
	
	var memberPhone = $("#memberPhone").val();
	var memberId = $("#memberId").val();
	var All = {
			memberPhone : $("#memberPhone").val(),
			memberId : $("#memberId").val()
	}
	
	
	if(certified.length == 0){
		alert("인증번호를 입력하세요");
		return false;
	}else if(certified != certifiedNum){
		alert("인증번호가 틀렸습니다. 인증번호를 다시입력해주세요.");
		return false;
	}else{
		alert("인증 완료");
		//document.updatephone.submit();
		
		$.ajax({
			url:"${pageContext.request.contextPath}/mypage/updatephone.do",
			data:All,
			success:function(data){
				opener.parent.location.reload();
				self.close();				
			}
		});
		
		
	}
} 
</script>