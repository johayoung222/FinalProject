<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Get It :: 관심상품 선택</title>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.js"></script>
<style>
.interest-text{
	text-align: center;
	font-size: 20px;
}
.interest-content{
	margin-top: 20px;
	text-align: center;
}
.interest-content [type=button], .interest-content [type=submit]{
	margin-top: 20px;
	border: none;
	width: 100px;
	height: 30px;
	margin-bottom: 20px;
	border-radius: 5px;
}
.interest-container{
	border-radius: 5px;
	background-color: #8cb8ff;
}
</style>
</head>
<body>
<div class="interest-container">
	<div class="interest-text">
		<span>관심 카테고리를 선택해주세요.</span>
	</div>
	<div class="interest-content">
		<c:if test="${param.memberNo == null }">
		<form action="javascript:interestEnd()" name="interestFrm">
		</c:if>
		<c:if test="${param.memberNo != null }">
		<form action="javascript:difInterestEnd()" name="interestFrm">
		<input type="hidden" name="cMemberNo" value="${param.memberNo}" />
		</c:if>
		
		<c:forEach items="${category }" var="c" varStatus="vs">
			<c:if test="${vs.count%3==0 }">
				<input type="checkbox" name="categoryMacro" value="${c.CATEGORY_MACRO }" />
				<label for="${c.CATEGORY_NAME }">${c.CATEGORY_NAME }</label><br />
			</c:if>
			<c:if test="${vs.count%3!=0 }">
				<input type="checkbox" name="categoryMacro" value="${c.CATEGORY_MACRO }" />
				<label for="${c.CATEGORY_NAME }">${c.CATEGORY_NAME }</label>
			</c:if>
		</c:forEach>
		 
		<br />
		<input type="submit" value="선택 완료" />
		<c:if test="${param.memberNo == null }">
			<button type="button" onclick="choiceSkip()">건너뛰기</button>
		</c:if>
		<c:if test="${param.memberNo != null }">
			<button type="button" onclick="itrSkip()">건너뛰기</button>
		</c:if>
		</form>
	</div>
</div>

<script>
function interestEnd(){
	var category = $("[name='categoryMacro']");
	var interest = "";
	category.each(function(idx, item){
		if($(item).prop("checked") == true){
			interest += $(item).val();
		}
	});

	
	opener.memberEnrollFrm.memberInterest.value = interest;
	opener.memberEnrollFrm.submit();
	self.close();
}

function choiceSkip(){
	opener.memberEnrollFrm.submit();
	self.close();
}

function itrSkip(){
	opener.location.href = "${pageContext.request.contextPath}";
	self.close();
}

function difInterestEnd(){
	var category = $("[name='categoryMacro']");
	var interest = "";
	category.each(function(idx, item){
		if($(item).prop("checked") == true){
			interest += $(item).val();
			console.log("interest : ",interest);
		}
	});

	
	$.ajax({
		url: "${pageContext.request.contextPath}/member/memberItrUpdate?memberNo="+interestFrm.cMemberNo.value+"&interest="+interest,
		type: "get",
		success: function(data){
			console.log(data);
			if(data == 1){
				alert("관심 상품이 등록되었습니다.");
				//opener.location.href = "${pageContext.request.contextPath}";
				//self.close();
				window.opener.location.reload();
				window.close();
			}
		},
		error: function(){
			console.log("ajax 요청 에러!");
		}
	});
}
</script>
</body>
</html>

