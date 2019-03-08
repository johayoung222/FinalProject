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
	margin-left: 110px;
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


.searchkeyword {
	margin: 0 auto;
	width: 80%;
}
#searchFrm{
	display: inline-block;
	float:right;
}
.qnaall{
	width:80%;
	margin-left:10%;
	margin-bottom:10px;
	border-bottom:1px solid blue;
	height: 70px;
}
.qnatitle{
	font-size:20px;
	/* margin-bottom:10px; */
	font-weight: bold;
}
#subm{	
	background-color:transparent;  
	border:0px transparent solid;
	cursor: pointer;
	color:#e19a40;
	font-size:20px;
	margin-bottom:10px;
	font-weight: bold;
}
.qnatitle:hover{
	cursor: pointer;
	text-decoration: underline;
}
.qnacontent{
	overflow: hidden;
	height: 23px;
}
#space{
	margin-left: 1%;
}
#gomain{
	text-align:left;
}
.btn-info{
	width: 16%;
    height: 35px;
    margin-top: -6px;
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
		<div class="sidebar4" id="sidebar"
			onclick="hh('${memberLoggedIn.memberId}')">
			<a href="#">1:1 문의</a>
		</div>
		<div class="sidebar5" id="sidebar">
			<a href="${pageContext.request.contextPath}/customercenter/ccqna.do">자주
				묻는 질문</a>
		</div>
	</div>
	<div class="content">
		<div class="headline">
			자주 묻는 질문
			<form action="${pageContext.request.contextPath}/customercenter/searchKeyword.do" id="searchFrm">
				<input type="text" class="searchkeyword" name="searchkeyword" id="searchkeyword" value="${searchkeyword}" placeholder="검색"/>						 
				<input type="submit" class="btn btn-info" value="검색" />
			</form>
			
		</div>
			<c:forEach items="${list}" var="s" varStatus="vs" >
			<div class="qnaall">
				<div class="qnatitle">
					<form action="${pageContext.request.contextPath}/customercenter/qnamain.do" name="gomain" id="gomain">
					<input type="submit"id="subm" value="${s.BOARD_TITLE}" />
						<input type="hidden" name="seq_board_no" value="${s.SEQ_BOARD_NO}" />
					</form>
				</div>
				<div class="qnacontent">
					<div id="space">
						${s.BOARD_CONTENT}
					</div>
				</div>
			</div>
			</c:forEach>
		<br /> <br />
		<%
			int totalContent = (int) request.getAttribute("totalContents");
			int numPerPage = (int) request.getAttribute("numPerPage");
			int cPage = (int) request.getAttribute("cPage");
		%>
		<div class="page">
			<%=com.kh.spring.common.util.Utils.getPageBar(totalContent, cPage, numPerPage, "searchKeyword.do")%>
		</div>

	</div>
	
</div>
<script>
	function hh(memberLoggedIn) {
		console.log(memberLoggedIn);
		if (memberLoggedIn == '') {
			location.href = "${pageContext.request.contextPath}/member/memberMoveLogin.do";
		} else {
			location.href = "${pageContext.request.contextPath}/customercenter/ccinquiry.do";
		}
	}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />