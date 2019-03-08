<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Get It :: 아이디/비밀번호 찾기</title>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.js"></script>
<!-- 부트스트랩관련 라이브러리 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
<!-- 사용자작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<style>
.content-container{

	width: 100%;
	height: 100%;
}
.find-id-container{
	height:200px;
}

.find-id-text{
	margin-top:3%;
	margin-left:10%;
	font-size:30px;
	
	color:#7151FC;
}

p{
	margin-left: 22%;
    margin-top: 38px;
}
</style>
<body>
	<div class="content-container">
		<div class="find-id-container">
			<div class="find-id-text">아이디/비밀번호</div><hr style="border:2px solid gray; width:80%; margin-left:10%;">
			<div class="find-id">
				<form action="${pageContext.request.contextPath}/member/findid.do">
					<div id="idarea" style="padding-top:15px;">
						<label for="findID" id="findID_" style="margin-left:18%;">이메일 : </label>
						<input type="email" id="findID" name="memberEmail" placeholder=" abcde@naver.com" value="${memberEmail}" />
						<!-- <input type="button" name="findID2" id="findID2" value="인증" /> -->
						<button class='btn btn-outline-success btn-sm'>인증</button>
					</div>
				</form>
				<c:if test="${countId eq 1}">
					<%-- <form action="${pageContext.request.contextPath}/member/searchId.do"> --%>
						<div style="padding-top:20px;">
							<label for="findID" id="findID_" style="margin-left:15%;">인증번호 : </label>
							<input type="text"name="certified" id="certified"class="certified"/>
							<input type="hidden" name="memberEmail" id="memberEmail" value="${memberEmail}" />
							<button type="button" class='btn btn-outline-success btn-sm' onclick="check();">확인</button>
						</div>
					<!-- </form> -->	
				</c:if>
				<c:if test="${countId eq 0}">
						<p style="color:red;margin-left: 22%;margin-top: 28px;">이메일과 일치하는 회원정보가 없습니다.</p>
				</c:if>
			</div>
		</div>
		<hr style="border:2px solid gray; width:80%; margin-left:10%;">
		<div class="find-password-container">
			<div class="find-pwd">
			<form action="${pageContext.request.contextPath}/member/findpwd.do">
				<div style="padding-top:15px;">
					<label for="findID" id="findID_" style="margin-left:18%;">아이디 : </label>
					<input type="text" id="memberId" name="memberId" placeholder=" admin123"  value="${memberId}"/>
				</div>
				<div style="padding-top:20px; margin-left:3%;">
					<label for="findID" id="findID_" style="margin-left:15.3%;">핸드폰 : </label>
					<input type="text" id="memberPhone" name="memberPhone" placeholder=" -없이01012345678" value="${memberPhone}"/>
					<button class='btn btn-outline-success btn-sm'>확인</button>
				</div>
			</form>
			<c:if test="${count > 0}">
					<div style="padding-top:20px;">
					<label for="findID" id="findID_" style="margin-left:15%;">인증번호 : </label>
					<input type="text"name="certified2" id="certified2"class="certified2"/>
					<button type="button" class='btn btn-outline-success btn-sm' onclick="check2();">확인</button>
					</div>
			</c:if>
			<c:if test="${count <= 0}">
					<div style="margin-left: 15%;margin-top: 35px;color:red;">
						아이디와 이메일이 일치하는 회원 정보가 없습니다.
					</div>
			</c:if>
			</div>
		</div>
	</div>
</body>
<script>
function check(){
	var certified = $("#certified").val().trim();
	console.log(certified);
	var certifiedNum = ${certified};
	console.log(certifiedNum);
	
	
	var All = {
			memberEmail : $("#memberEmail").val()
	}
	
	
	if(certified.length == 0){
		alert("인증번호를 입력하세요");
		return false;
	}else if(certified != certifiedNum){
		alert("인증번호가 틀렸습니다. 인증번호를 다시입력해주세요.");
		return false;
	}else{
		alert("인증 완료");
		$.ajax({
			url:"${pageContext.request.contextPath}/member/searchId.do",
			data:All,
			success:function(data){
				var html="<table>";
				if(data != null){
					html +="<p style='margin-left: 28%;margin-top: 64px;'>"+"회원님의 아이디는 "+data.memberId+" 입니다."+"</p>";
				}
				html+="</table>";
				$(".find-id").html(html);
			}
		});
		
		
	}
}
function check2(){
	var certified = $("#certified2").val().trim();
	console.log(certified);
	var certifiedNum = ${certified};
	console.log(certifiedNum);
	
	
	var memberEmail = $("#memberEmail").val();
	var All = {
			memberEmail : $("#memberEmail").val()
	}
	
	
	if(certified.length == 0){
		alert("인증번호를 입력하세요");
		return false;
	}else if(certified != certifiedNum){
		alert("인증번호가 틀렸습니다. 인증번호를 다시입력해주세요.");
		return false;
	}else{
		alert("인증 완료");
		$.ajax({
			url:"${pageContext.request.contextPath}/member/certified.do",
			data:All,
			success:function(data){
				var	html = "<div style='margin-bottom: 15px;margin-top: 35px;'>";
					html += "<label style='margin-left:21%;'>새 비밀번호 :</label>";
					html += "<input type='text' id='pwd' name='pwd' style='margin-left:3%;' placeholder='비밀번호를 입력하세요'/>";
					html += "<input type='hidden' id='memberId' name='memberId' value='${memberId}'/>";
					html += "</div>";
					html += "<div>";
					html += "<label style='margin-left:13.8%;'>새 비밀번호 확인 :</label>";
					html += "<input type='text' id='repwd' name='repwd' style='margin-left:3%;' placeholder='비밀번호를 다시 입력하세요'/>";
					html += "</div>";
					html += "<button type='button' class='btn btn-outline-success btn-sm' style='margin-left: 46%;margin-top: 15px;' onclick='check3();'>확인</button>";
				$(".find-pwd").html(html);
			}
		});
		
		
	}
}
function check3(){
	var pwd = $("#pwd").val().trim();
	var repwd = $("#repwd").val().trim();
	var All = {
			memberId : $("#memberId").val(),
			pwd : $("#pwd").val()
	}
	
	if(pwd.length == 0){
		alert("비밀번호를 입력해주세요");
		return false;
	}else if(pwd != repwd){
		alert("비밀번호가 맞지않습니다.");
		return false;
	}else{
		$.ajax({
			url:"${pageContext.request.contextPath}/member/updatePwd.do",
			data:All,
			success:function(data){
				var	html = "<div style='margin-left: 3%;margin-top: 52px;'>";
					html += "<p>비밀번호가 변경되었습니다.</p>"
					html += "<p>변경된 비밀번호로 로그인 해주세요 :)</p>"
					html += "</div>";
					//html += "</form>";
				$(".find-pwd").html(html);
			}
		});
	}
}
</script>
</html>