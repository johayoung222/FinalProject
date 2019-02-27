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

#news {
	border-bottom: 1px solid #ececec;
	height: 50px;
	width: 90%;
	margin: 0 auto;
	cursor: pointer;
}

.newscontent {
	margin: 0 auto;
	border-bottom: 1px solid #ececec;
	background: #e9e9e9;
	width: 90%;
}

.title {
	margin-top: 10px;
	font-weight: bold;
}

.date {
	font-size: 10px;
	display: inline-block;
}

/* 모달안에 버튼 */
.btn-primary{
	float: right;
	background-color: white;
	color: gray;
	border: 1px solid lightgray;
}
/* 공지사항 작성버튼	 */		
.btn-outline-dark{
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
	top:-40px;
	left:-70px;
}
/* 삭제버튼 */
.btn-outline-danger{
	display: inline;
	float: right;
	position: relative;
	top: -40px;
    left: 50px;	
}

#inserttitle {
	width: 100%;
}

#insertcontent {
	width: 100%;
	overflow: auto;
	height: 200px;
	resize: none;
}

.mb-3 {
	width: 80%;
	margin: 0 auto;
}
</style>

<script>
	//부트스트랩 파일변경시 파일명 보이기
	$(function() {
		$("[name=upFile]").on('change', function() {
			//var fileName = $(this).val();
			console.log($(this));
			var fileName = $(this).prop("files")[0].name;
			$(this).next(".custom-file-label").html(fileName);
		});
	});
	function deleteok(){
		if(confirm("정말 삭제하시겠습니까?")){
			return true;
		}else{
			return false;
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
		<div class="sidebar4" id="sidebar" onclick="logincheck('${memberLoggedIn.memberId}')">
			<a href="#">1:1 문의</a>
		</div>
		<div class="sidebar5" id="sidebar">
			<a href="${pageContext.request.contextPath}/customercenter/ccqna.do">자주 묻는 질문</a>
		</div>
	</div>
	<div class="content">
		<div class="headline">
			겟잇 공지사항


			<%-- <c:if test="${memberLoggedIn.memberIsAdmin != null }">
			</c:if> --%>
			<button type="button" class="btn btn-outline-dark" data-toggle="modal"
				data-target="#exampleModalLong">공지사항 쓰기</button>

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
							action="${pageContext.request.contextPath}/customercenter/insertNews.do"
							method="get">

							<div class="modal-body">
								<input type="text" id="inserttitle" name="boardtitle"
									placeholder="제목을 입력하세요" /> <br /> <br /> 
									<textarea id="insertcontent" name="boardcontent" placeholder="내용을 입력하세요"></textarea>
							</div>
							<div class="modal-footer">
								<input type="submit" class="btn btn-primary" value="등록">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">닫기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>


		<c:forEach items="${list}" var="b">
			<div class="news1" id="news" data-toggle="collapse"
				data-target="#${b.SEQ_BOARD_NO}" aria-expanded="false"
				aria-controls="collapseExample">
				<div class="title ng-binding">${b.BOARD_TITLE}</div>
				<div class="date  ng-binding">
					<fmt:formatDate value="${b.BOARD_DATE}" pattern="yyyy.MM.dd" />
				</div>
				
				
				<%-- <c:if test="${memberLoggedIn.memberIsAdmin != null }"> --%>
				<div class="ng-binding">
					<button type="button" id="update" class="btn btn-outline-primary"
						data-toggle="modal"
						data-target="#exampleModalLong${b.SEQ_BOARD_NO}">수정</button>
					
					<!-- 수정폼 -->
					<div class="modal fade" id="exampleModalLong${b.SEQ_BOARD_NO}"
						tabindex="-1" role="dialog"
						aria-labelledby="exampleModalLongTitle" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLongTitle">공지사항 수정</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<form
									action="${pageContext.request.contextPath}/customercenter/updateNews.do"
									method="get">

									<div class="modal-body">
										<input type="hidden" name="seq_board_no"value="${b.SEQ_BOARD_NO}" /> 
										<input type="text" id="inserttitle" name="boardtitle" value="${b.BOARD_TITLE}" />
										<br /> <br /> 
										<textarea id="insertcontent"name="boardcontent" >${b.BOARD_CONTENT}</textarea>
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
					<!-- 삭제버튼/폼 -->
					<form name="NewsDelFrm" action="${pageContext.request.contextPath}/customercenter/deleteNews.do" method="post">
						<!-- <input type="submit" id="delete" class="btn btn-primary3" value="삭제"> -->
						<input type="submit" class="btn btn-outline-danger" value="삭제" onclick="return deleteok();">
						<input type="hidden" name="seq_board_no"value="${b.SEQ_BOARD_NO}" /> 
					</form>

				</div>
			<div class="collapse" id="${b.SEQ_BOARD_NO}">
				<div class="newscontent">${b.BOARD_CONTENT}</div>
			</div>

		</c:forEach>
		<br /> <br />
		<%
			int totalContent = (int) request.getAttribute("totalContents");
			int numPerPage = (int) request.getAttribute("numPerPage");
			int cPage = (int) request.getAttribute("cPage");
		%>
		<div class="page">
			<%=com.kh.spring.common.util.Utils.getPageBar(totalContent, cPage, numPerPage, "ccnews.do")%>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />