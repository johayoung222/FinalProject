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

</head>

<body>
	<div id="emailcertified-container">
		<label for="certified">인증번호 : </label>
		<input type="text"name="certified" id="certified"class="certified"/>
		<input type="button" value="확인" id="check"  onclick="check();"/>
	</div>
	<form action="${pageContext.request.contextPath}/mypage/updatephone.do" name="updatephone" id="updatephone" >
		<input type="hidden" name="memberPhone" id="memberPhone"value="${memberPhone}" />
		<input type="hidden" name="memberId" value="${memberId}" />
	</form>
</body>
<script>
function check(){
	var certified = $("#certified").val().trim();
	console.log(certified);
	var certifiedNum = ${certified};
	console.log(certifiedNum);
	var memberPhone = $("#memberPhone").val();

	
	
	if(certified.length == 0){
		alert("인증번호를 입력하세요");
		return false;
	}else if(certified != certifiedNum){
		alert("인증번호가 틀렸습니다. 인증번호를 다시입력해주세요.");
		return false;
	}else{
		alert("인증 완료");
		opener.$('#updatephone').submit();
		opener.document.getElementById("result").value = "1";
		opener.document.getElementById("smsclear").value = "인증완료";
		opener.document.getElementById("memberPhone").readOnly = "true";
		opener.document.getElementById("smsclear").disabled="true";
		
		
		//opener.parent.location.reload();
		self.close();
	}
} 
</script>