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
.main{
	width:80%;
	margin-left: 10%;
}

.searchkeyword {
	width: 80%;
	margin: 0 auto;
}
#searchFrm{
	display: inline-block;
	float:right;
}
.maintitle{
	width:100%;
	border-bottom: 1.5px solid #ececec;
	margin-bottom:5px;
	height: 50px;
	font-size: 25px;
	font-weight: bold;
}
.maincontent{
	width:100%;
	height: 250px;
	margin-bottom: 50px;
}


/* 모달css */
#inserttitle {
	width: 100%;
	font-size: 18px;
}

#insertcontent {
	width: 100%;
	overflow: auto;
	height: 200px;
	resize: none;
	font-size: 15px;
	font-weight: normal;
}
/* 모달안에 버튼 */
.btn-primary{
	float: right;
	background-color: white;
	color: gray;
	border: 1px solid lightgray;
}

/* 수정버튼 */
.btn-outline-primary{
	display: inline;
	float: right;
	position: relative;
	top:-32px;
	left:-70px;
}
/* 삭제버튼 */
.btn-outline-danger{
	display: inline;
	float: right;
	position: relative;
	top: -32px;
    left: 45px;	
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
			자주 묻는 질문<form action="${pageContext.request.contextPath}/customercenter/searchKeyword.do" id="searchFrm">
						<input type="text" class="searchkeyword" name="searchkeyword"id="searchkeyword" placeholder="검색"/>
						<input type="submit" class="btn btn-info" value="검색" />
					</form>
		</div>
		<div class="main">
			<div class="maintitle">
				${board.boardtitle}
				
				<c:if test="${memberLoggedIn.memberIsAdmin eq 'Y'}">
				<div class="ng-binding">
					<button type="button" id="update" class="btn btn-outline-primary"
						data-toggle="modal"
						data-target="#exampleModalLong${board.seq_board_no}">수정</button>
					<!-- 수정폼 -->
					<div class="modal fade" id="exampleModalLong${board.seq_board_no}"
						tabindex="-1" role="dialog"
						aria-labelledby="exampleModalLongTitle" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLongTitle">자주 묻는 질문 수정</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<form
									action="${pageContext.request.contextPath}/customercenter/updateQna.do"
									method="get">

									<div class="modal-body">
										<input type="hidden" name="seq_board_no" value="${seq_board_no}" /> 
										<input type="text" id="inserttitle" name="boardtitle" value="${board.boardtitle}" />
										<br /> <br /> 
										<textarea id="insertcontent"name="boardcontent" >${board.boardcontent}</textarea>
									</div>

									<div class="modal-footer">
										<input type="submit" class="btn btn-primary" value="수정">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">닫기</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				
				<form name="NewsDelFrm" action="${pageContext.request.contextPath}/customercenter/deleteQna.do" method="post">
					<!-- <input type="submit" id="delete" class="btn btn-primary3" value="삭제"> -->
					<input type="submit" class="btn btn-outline-danger" value="삭제" onclick="return deleteok();">
					<input type="hidden" name="seq_board_no"value="${seq_board_no}" /> 
				</form>
				</c:if>
			</div>
			<div class="maincontent">
				${board.boardcontent}
			</div>
		</div>
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
	function deleteok(){
		if(confirm("정말 삭제하시겠습니까?")){
			return true;
		}else{
			return false;
		}
	}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />