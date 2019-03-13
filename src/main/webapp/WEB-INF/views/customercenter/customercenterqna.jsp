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

.qnatable {
	width: 80%;
	margin-bottom: 50px;
	margin-left: -5%;
	
	/* th간격띄우는 css */
	border-collapse: separate;
  	border-spacing: 0 15px;
}

.qnatable th {
	
}

.qnatable td {
	cursor: pointer;
	color:#e19a40;
	font-size:18px;	
	
}
.qnatable td:hover{
	/* 호버시 밑줄 */
	text-decoration: underline;
}
.butt{
	margin:20px auto;
	height: 150px;
}
.btn-outline-primary{
	width:75%;
	height:100px;
}

.qnatable th, td {
	/* border: 1px solid red; */
	text-align: center;
	height: 45px;
}

#searchkeyword {
	width: 80%;
	margin: 0 auto;
}
#searchFrm{
	display: inline-block;
	float:right;
}
.btn-info{
	width: 16%;
    height: 35px;
    margin-top: -6px;
}

/* 버튼|서브밋 */
#subm{
	background-color:transparent;  
	border:0px transparent solid;
	cursor: pointer;
	color:#e19a40;
	font-size:18px;	
}


/* 모달css */
#inserttitle {
	width: 100%;
}

#insertcontent {
	width: 100%;
	overflow: auto;
	height: 200px;
	resize: none;
}
/* 모달안에 버튼 */
.btn-primary{
	float: right;
	background-color: white;
	color: gray;
	border: 1px solid lightgray;
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
			onclick="logincheck('${memberLoggedIn.memberId}')">
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
			<c:if test="${memberLoggedIn.memberIsAdmin eq 'Y' }">
			<button type="button" class="btn btn-outline-dark" data-toggle="modal"
				data-target="#exampleModalLong">자주 묻는 질문 쓰기</button>
				<div class="modal fade" id="exampleModalLong" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalLongTitle"
				aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLongTitle">공지사항</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<form
							action="${pageContext.request.contextPath}/customercenter/insertQna.do"
							method="get">
							<div class="modal-body">
								<input type="radio" name="catradio" value="2t"/>사용법
								<input type="radio" name="catradio" value="2b"/>구매
								<input type="radio" name="catradio" value="2s"/>판매
								<br /><br />
								<input type="text" id="inserttitle" name="boardtitle"
									placeholder="제목을 입력하세요" /> <br /> <br /> 
									<textarea id="insertcontent" name="boardcontent" placeholder="내용을 입력하세요"></textarea>
							</div>
							<div class="modal-footer">
								<input type="submit" class="btn btn-primary" value="등록">
								<button type="button" class="btn btn-secondary"data-dismiss="modal">닫기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			</c:if>
				
			<form action="${pageContext.request.contextPath}/customercenter/searchKeyword.do" id="searchFrm" class="navbar-search pull-left">
				<input type="text" name="searchkeyword" id="searchkeyword" class="searchkeyword" placeholder="검색" />
				<input type="submit" class="btn btn-info" value="검색"/>
			</form>	
		</div>
		
		<table class="qnatable">
			<tr >
				<td class="butt"><button type="button" id="catbtn1" name="catbtn1" class="btn btn-outline-primary">GetIt 사용법</button></td>
				<td class="butt"><button type="button" id="catbtn2" name="catbtn2" class="btn btn-outline-primary">구매 관련</button></td>
				<td class="butt"><button type="button" id="catbtn3" name="catbtn3" class="btn btn-outline-primary">판매 관련</button></td>
			</tr>
			<c:set var="i" value="0" />
			<c:set var="j" value="3" />
			<c:forEach items="${list}" var="q" varStatus="status">
				<c:if test="${i%j==0}">
					<tr>
				</c:if>
				<form action="${pageContext.request.contextPath}/customercenter/qnamain.do" name="gomain" id="gomain">
					<td><input type="submit" id="subm" value="${q.BOARD_TITLE}"/></td>
					<input type="hidden" name="seq_board_no"value="${q.SEQ_BOARD_NO}" />
				</form>
				<c:if test="${i%j==j-1}">
					</tr>
				</c:if>
				<c:set var="i" value="${i+1}" />
			</c:forEach>
		</table>

	</div>
</div>
<script>
	function logincheck(memberLoggedIn) {
		console.log(memberLoggedIn);
		if (memberLoggedIn == '') {
			location.href = "${pageContext.request.contextPath}/member/memberMoveLogin.do";
		} else {
			location.href = "${pageContext.request.contextPath}/customercenter/ccinquiry.do";
		}
	}
	$("#catbtn1").on('click',function(){
		location.href = "${pageContext.request.contextPath}/customercenter/mainTutorial.do";
	})
	$("#catbtn2").on('click',function(){
		location.href = "${pageContext.request.contextPath}/customercenter/buyTutorial.do";
	})
	$("#catbtn3").on('click',function(){
		location.href = "${pageContext.request.contextPath}/customercenter/sellTutorial.do";
	})

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />