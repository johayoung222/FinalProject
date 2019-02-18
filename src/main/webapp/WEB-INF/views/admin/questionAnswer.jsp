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
	position:relative;
	margin-left:180px;
}
</style>
<br />
<section id="questionAnswer-container" class="questionAnswer-container">
<p>1:1 질문 답변</p>
<hr />
	<table id="tbl-questionAnswer" class="table table-striped table-hover">
		<tr>
			<th>고유번호</th>
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
			<tr>				
				<th>${q.SEQ_QUESTION_NO}</th>
				<th>${q.QUESTION_CONTENT}</th>
				<th>${q.QUESTION_KINDS}</th>
				<th>${q.QUESTION}</th>
				<th>${q.SEQ_MEMBER_NO}</th>
				<th>${q.QUESTION_RESULT}</th>
				<th>${q.QUESTION_ANSWER}</th>						
			</tr>			
			</c:forEach>
		</c:if>
	</table>
	<%
		int totalContent = (int)request.getAttribute("totalContents");
		int numPerPage = (int)request.getAttribute("numPerPage");
		int cPage = (int)request.getAttribute("cPage");
	%>
	<%= com.kh.spring.common.util.Utils.getPageBar(totalContent , cPage , numPerPage , "questionAnswer.do") %>
</section> 

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>