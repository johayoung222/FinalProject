<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="allMember" name="pageTitle"/>
</jsp:include>

<jsp:include page="/WEB-INF/views/common/adminSide.jsp"></jsp:include>

<style>
.questionAnswer-container{
	margin-right:15px;
	height:750px;
	position:relative;
	margin-left:180px;
	top:-37px;
}
#insertcontent{
	width: 100%;
	overflow: auto;
	height: 200px;
	resize: none;
}
#tbl-questionAnswer{
	table-layout: fixed;
	text-align:center;
}
.tbl-tr th{
	width:100px;
}
.tableTr td{
	width:100px;
	height:70px;
	overflow:hidden;
	white-space : nowrap;
	text-overflow: ellipsis;
}
</style>
<br />
<section id="questionAnswer-container" class="questionAnswer-container">
<p>1:1 질문 답변</p>
<br />
<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link active" href="${pageContext.request.contextPath}/admin/questionAnswer.do">답변 대기</a>
  </li>
  <li class="nav-item">
    <a class="nav-link active" href="${pageContext.request.contextPath}/admin/questionAnswerY.do">답변 완료</a>
  </li>
</ul>
<br />
	<table id="tbl-questionAnswer" class="table table-striped table-hover">
		<tr class="tbl-tr">
			<th>고유번호</th>
			<th>문의시간</th>
			<th>문의내용</th>
			<th>문의종류</th>
			<th>상세분류</th>
			<th>회원코드</th>
			<th>답변여부</th>
			<th>답변</th>			
		</tr>
		<c:if test="${empty list }">
		<tr>
			<td colspan="7">질문이 없습니다.</td>
		</tr>
		</c:if>
		
		<c:if test="${not empty list }">
			<c:forEach items="${list }" var="q">
			<tr class="tableTr">				
				<td>${q.SEQ_QUESTION_NO}</td>
				<td><fmt:formatDate value="${q.QUESTION_DATE}" pattern="yyyy년MM월dd일 hh:mm"/></td>
				<td>${q.QUESTION_LKINDS}</td>
				<td>${q.QUESTION_MKINDS}</td>
				<td>${q.QUESTION_CONTENT}</td>
				<td>${q.SEQ_MEMBER_NO}</td>
				<td>${q.QUESTION_RESULT eq 'N '?"답변 대기":"답변 완료"}</td>
				<td>
					<c:if test="${q.QUESTION_RESULT eq 'N '}">
						<button type="button" class="btn btn-outline-dark" data-toggle="modal"
						data-target="#exampleModalLong${q.SEQ_QUESTION_NO}">답변등록</button>
					</c:if>
					<c:if test="${q.QUESTION_RESULT eq 'Y '}">
						<button type="button" class="btn btn-outline-dark" data-toggle="modal"
						data-target="#exampleModalLong1${q.SEQ_QUESTION_NO}">답변수정</button>
					</c:if>
				</td>						
			</tr>
			
			<!-- N일시 답변하기 -->
			<div class="modal fade" id="exampleModalLong${q.SEQ_QUESTION_NO}" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalLongTitle"
				aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLongTitle">1:1문의 답변</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<form
							action="${pageContext.request.contextPath}/customercenter/insertAnswer.do"
							method="get">

							<div class="modal-body">
								사용자 질문 내용
								<textarea readonly="readonly" id="insertcontent">${q.QUESTION_CONTENT}</textarea>
								 <br /> <br /> 
								관리자 답변 내용
								<textarea id="insertcontent" name="question_answer" placeholder="답변을 입력하세요"></textarea>
							</div>
							<div class="modal-footer">
								<input type="submit" class="btn btn-primary" value="등록">
								<input type="hidden" name="seq_member_no" value="${q.SEQ_MEMBER_NO}"/>
								<input type="hidden" name="seq_question_no" value="${q.SEQ_QUESTION_NO}" />
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">닫기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			
			<!-- Y일시 답변 수정 -->
			<div class="modal fade" id="exampleModalLong1${q.SEQ_QUESTION_NO}" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalLongTitle"
				aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLongTitle">1:1문의 답변 수정</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<form
							action="${pageContext.request.contextPath}/customercenter/insertAnswer.do"
							method="get">

							<div class="modal-body">
								사용자 질문 내용
								<textarea readonly="readonly" id="insertcontent">${q.QUESTION_CONTENT}</textarea>
								 <br /> <br /> 
								관리자 답변 내용
								<textarea id="insertcontent" name="question_answer">${q.QUESTION_ANSWER}</textarea>
							</div>
							<div class="modal-footer">
								<input type="submit" class="btn btn-primary" value="답변 수정">
								<input type="hidden" name="seq_member_no" value="${q.SEQ_MEMBER_NO}"/>
								<input type="hidden" name="seq_question_no" value="${q.SEQ_QUESTION_NO}" />
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">닫기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			
						
			</c:forEach>
		</c:if>
	</table>
	<%
		int totalContent = (int)request.getAttribute("totalContents");
		int numPerPage = (int)request.getAttribute("numPerPage");
		int cPage = (int)request.getAttribute("cPage");
		String view = (String)request.getAttribute("view");
	%>
	<%= com.kh.spring.common.util.Utils.getPageBar(totalContent , cPage , numPerPage , view) %>
</section> 

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>