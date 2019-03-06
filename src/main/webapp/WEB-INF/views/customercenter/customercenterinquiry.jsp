<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle" />
</jsp:include>
<style>
.content-container {
	padding-left: 110px;
	padding-top: 48px;
}

.sidebar {
	vertical-align: top;
	display: inline-block;
	width: 144px;
	margin-bottom: 36px;
	margin-right: 5%;
}

.sidebar1 {
	color: #666666;
	font-size: 25px;
	font: bolder;
	line-height: 27px;
	border-bottom: 1px solid #ececec;
	padding-bottom: 15px;
}

.sidebar2 {
	border: 1px solid #ececec;
}

.sidebar3 {
	border: 1px solid #ececec;
}

.sidebar4 {
	border: 1px solid #ececec;
}

.sidebar5 {
	border: 1px solid #ececec;
}

.sidebar a {
	display: block;
	padding-left: 15px;
	font-size: 14px;
	color: #1f1f1f;
}

.headline {

	font-size: 20px;
	line-height: 23px;
	padding-bottom: 20px;
	border-bottom: 2px solid #ececec;
	margin-bottom: 2%;
}

.content {
	display: inline-block;
	width: 70%;

}

.quirycontent{
	width:100%;
}

#selone{
	margin-left:24%;
	margin-right:1%;
	width:25%;
	display: inline-block;
	border: 1px solid black;

}
#seltwo{
	width:25%;
	display: inline-block;
	border: 1px solid black;
}
.main{
	margin-left:24%;
	margin-bottom:10px;
	width:51.5%;
	height:200px;
	border: 1px solid black;
	border-radius: 4px;
	resize: none;
}
.btn-outline-primary{
	margin-left:24%;
	width:51.5%;
	margin-bottom:50px;

}
.inquirylist{
	width:80%;
	margin-left:10%;
	margin-bottom:2%;
}
.inquirycontent{
	margin-bottom:5px;
	font-size: 20px;
	font-weight: bold;
}
.answer{
	margin-bottom:15px;
	border-bottom: 2px solid #ececec;
}
</style>

<div class="content-container">
	<div class="sidebar">
		<div class="sidebar1">고객센터</div>
		<div class="sidebar2" id="sidebar">
			<a
				href="${pageContext.request.contextPath}/customercenter/ccintro.do">겟잇
				소개</a>
		</div>
		<div class="sidebar3" id="sidebar">
			<a href="${pageContext.request.contextPath}/customercenter/ccnews.do">겟잇
				소식</a>
		</div>
		<div class="sidebar4" id="sidebar">
			<a
				href="${pageContext.request.contextPath}/customercenter/ccinquiry.do">1:1
				문의</a>
		</div>
		<div class="sidebar5" id="sidebar">
			<a href="${pageContext.request.contextPath}/customercenter/ccqna.do">자주
				묻는 질문</a>
		</div>
	</div>
	<div class="content">

		<div class="headline">1:1 문의다</div>
		<div class="quirycontent">
			<form action="${pageContext.request.contextPath}/customercenter/insertInquiry.do">
				<div class="select">
					<select class="form-control form-control-sm" name="selone"
						id="selone" onchange="doChange(this,'seltwo')">
						<option value="default" selected disabled hidden>문의종류를 선택해주세요.</option>
						<option value="구매">구매</option>
						<option value="판매">판매</option>
						<option value="제품">제품</option>
						<option value="기타">기타</option>
					</select> 
					<select class="form-control form-control-sm" name="seltwo"
						id="seltwo">
						<option value="default" >상세분류를 선택해주세요.</option>
					</select>
				</div>
				<br />
				<div class="quirymain">
					<!-- <input type="text" class="main" /> -->
					<textarea rows="25" cols="15" class="main" name="incontent"></textarea>
				</div>
				<input type="hidden" name="seq_member_no" value="${memberLoggedIn.seqMemberNo}"/>
				<input type="submit" class="btn btn-outline-primary" value="문의하기"/>
			</form>
		</div>
		<div class="inquirylist">
			<c:forEach items="${list}" var="q">
				<fmt:formatDate value="${q.QUESTION_DATE}" pattern="yyyy.MM.dd"/>
				<div class="inquirycontent">
					${q.QUESTION_CONTENT}
				</div>
				<div class="answer">
					<c:if test="${q.QUESTION_ANSWER  == null}">
						답변을 기다리는중 입니다.
					</c:if>
					${q.QUESTION_ANSWER}
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<script>
	function doChange(srcE, targetId) {
		var val = srcE.options[srcE.selectedIndex].value;
		var targetE = document.getElementById(targetId);

		removeAll(targetE);

		if (val == '구매') {
			$("#seltwo").append("<option value='결제'>결제</option>");
			$("#seltwo").append("<option value='환불/취소'>환불/취소</option>");
			$("#seltwo").append("<option value='배송'>배송</option>");
			$("#seltwo").append("<option value='제품문의'>제품문의</option>");
			$("#seltwo").append("<option value='A/S'>A/S</option>");
			$("#seltwo").append("<option value='기타'>기타</option>");
			/* addOption('결제', targetE);
			addOption('환불/취소', targetE);
			addOption('배송', targetE);
			addOption('제품문의', targetE);
			addOption('A/S', targetE);
			addOption('기타', targetE); */

		} else if (val == '판매') {
			$("#seltwo").append("<option value='제품등록'>제품등록</option>");
			$("#seltwo").append("<option value='가격'>가격</option>");
			$("#seltwo").append("<option value='배송'>배송</option>");
			$("#seltwo").append("<option value='결제'>결제</option>");
			$("#seltwo").append("<option value='기타'>기타</option>");
			/* addOption('제품등록', targetE);
			addOption('가격', targetE);
			addOption('배송', targetE);
			addOption('입금', targetE);
			addOption('기타', targetE); */
		} else if (val == '제품') {
			$("#seltwo").append("<option value='가전제품'>가전제품</option>");
			$("#seltwo").append("<option value='의류'>의류</option>");
			$("#seltwo").append("<option value='잡화'>잡화</option>");
			$("#seltwo").append("<option value='기타'>기타</option>");
			/* addOption('가전', targetE);
			addOption('의류', targetE);
			addOption('잡화', targetE);
			addOption('기타', targetE); */
		} else if (val == '기타') {
			$("#seltwo").append("<option value='계정'>계정</option>");
			$("#seltwo").append("<option value='불편사항'>불편사항</option>");
			$("#seltwo").append("<option value='기타'>기타</option>");
			/* addOption('계정', targetE);
			addOption('불편사항', targetE);
			addOption('기타', targetE); */
		}
	}

	function addOption(value, e) {
		var o = new Option(value);
		try {
			e.add(o);
		} catch (ee) {
			e.add(o, null);
		}
	}

	function removeAll(e) {
		for (var i = 0, limit = e.options.length; i < limit - 1; ++i) {
			e.remove(1);
		}
	}

	 function logincheck(memberLoggedIn){
		 console.log(memberLoggedIn);
		 if(memberLoggedIn == ''){
			location.href="${pageContext.request.contextPath}/member/memberMoveLogin.do";
		 }else{
			location.href="${pageContext.request.contextPath}/customercenter/ccinquiry.do";
		 }
	 }
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />