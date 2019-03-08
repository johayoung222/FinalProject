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
#findID_{
	margin-left:10%;
	
	padding:0; 
	
	font-weight:bold;
}
#findID{
	border-radius:5px;
}
#findID2{
	border-radius:5px;
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
						<label for="findID" id="findID_" style="margin-left:13%;">이메일 : </label>
						<input type="email" id="findID" name="memberEmail" placeholder=" abcde@naver.com" value="${memberEmail}" />
						<!-- <input type="button" name="findID2" id="findID2" value="인증" /> -->
						<button>인증</button>
					</div>
				</form>
				<c:if test="${memberEmail ne null}">
					<%-- <form action="${pageContext.request.contextPath}/member/searchId.do"> --%>
						<div style="padding-top:20px;">
						<label for="findID" id="findID_">인증번호 : </label>
						<input type="text"name="certified" id="certified"class="certified"/>
						<input type="hidden" name="memberEmail" id="memberEmail" value="${memberEmail}" />
						<button type="button"onclick="check();">확인</button>
						</div>
					<!-- </form> -->	
				</c:if>
			</div>
		</div>
		<hr style="border:2px solid gray; width:80%; margin-left:10%;">
		<div class="find-password-container">
			<div class="find-pwd">
			<form action="${pageContext.request.contextPath}/member/findpwd.do">
				<div style="padding-top:15px;">
					<label for="findID" id="findID_" style="margin-left:13%;">아이디 : </label>
					<input type="text" id="memberId" name="memberId" placeholder=" admin123"  value="${memberId}"/>
				</div>
				<div style="padding-top:20px; margin-left:3%;">
					<label for="findID" id="findID_">핸드폰 : </label>
					<input type="text" id="memberPhone" name="memberPhone" placeholder=" -없이01012345678" value="${memberPhone}"/>
					<button>확인</button>
				</div>
			</form>
			<c:if test="${count > 0}">
				<form action="">
					<div style="padding-top:20px;">
					<label for="findID" id="findID_">인증번호 : </label>
					<input type="text"name="certified2" id="certified2"class="certified2"/>
					<button type="button"onclick="check2();">확인</button>
					</div>
				</form>
			</c:if>
			<c:if test="${count <= 0}">
					<div style="padding-top:20px;">
						<h3 style="color:red;">아이디와 이메일이 일치하는 정보가 없습니다.</h3>
					</div>
			</c:if>
			</div>
		</div>
	</div>
</body>
<script>
function check(){
	var certified = $("#certified2").val().trim();
	console.log(certified);
	var certifiedNum = ${certified};
	console.log(certifiedNum);
	
	
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
		$.ajax({
			url:"${pageContext.request.contextPath}/member/searchpwd.do",
			data:All,
			success:function(data){
				var html="<table>";
				if(data != null){
					html +="<p>"+"당신의 아이디는 "+data.memberId+" 입니다."+"</p>";
				}else{
					alert("2");
		           	html += "<p>"+"<bold>"+"이메일과 맞는 아이디가 존재하지 않습니다."+"</bold>"+"</p>";
		        }

				html+="</table>";
				$(".find-id2").html(html);
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
				var	html = "<div>";
					html += "<label style='margin-left:13%;'>새 비밀번호 :</label>";
					html += "<input type='text' id='pwd' name='pwd' placeholder='새 비밀번호를 입력하세요'/>";
					html += "<input type='hidden' id='memberId' name='memberId' value='${memberId}'/>";
					html += "</div>";
					html += "<div>";
					html += "<label style='margin-left:13%;'>새 비밀번호 확인 :</label>";
					html += "<input type='text' id='repwd' name='repwd' placeholder='새 비밀번호를 다시 입력하세요'/>";
					html += "<button type='button'onclick='check3();'>확인</button>";
					html += "</div>";
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
				var	html = "<div>";
					html += "<p id='p1'>비밀번호가 변경되었습니다.</p>"
					html += "<p id='p2'>변경된 비밀번호로 로그인 해주세요 :).</p>"
					html += "</div>";
					//html += "</form>";
				$(".find-pwd").html(html);
			}
		});
	}
}
</script>
</html>