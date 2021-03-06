﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="게시판" name="pageTitle"/>
</jsp:include>
<style>
/*글쓰기버튼*/
input#btn-add{float:right; margin: 0 0 15px;}
</style>
<script>
function fn_goBoardForm(){
	location.href = "${pageContext.request.contextPath}/board/boardForm.do";
}
</script>
<section id="board-container" class="container">
	<!-- @실습문제2 : 전체게시글 출력 -->
	<p>총 ${totalContents }건의 게시물이 있습니다.</p>
	<input type="button" value="글쓰기" id="btn-add" class="btn btn-outline-success" onclick="fn_goBoardForm();"/>
	<table id="tbl-board" class="table table-striped table-hover">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>첨부파일</th>
			<th>조회수</th>
		</tr>
		<!-- @실습과제 1 : 목록뿌리기 (첨부파일이 있으면 , file.png를 노출시킬 것이다.) -->
		<c:if test="${empty list }">
		<tr>
			<td colspan="6">게시글이 존재하지 않습니다.</td>
		</tr>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach items="${list }" var="b">
			<tr>
				<td>${b.BOARDNO }</td>
				<td><a href="${pageContext.request.contextPath }/board/boardView.do?boardNo=${b.BOARDNO}">${b.BOARDTITLE }</a></td>
				<td>${b.BOARDWRITER }</td>
				<td>${b.BOARDDATE }</td>
				<td>
	 				<c:if test="${b.FILECOUNT > 0}">
						<img alt="" src="${pageContext.request.contextPath }/resources/images/file.png">
					</c:if>
				</td>
				<td>${b.BOARDREADCOUNT }</td>
			</tr>			
			</c:forEach>
		</c:if>
	</table>
	<!-- @실습문제3 : 페이지바를 처리하는 유틸성 메소드를 만들어라. -->
	<%
		int totalContent = (int)request.getAttribute("totalContents");
		int numPerPage = (int)request.getAttribute("numPerPage");
		int cPage = (int)request.getAttribute("cPage");
	%>
	<%= com.kh.spring.common.util.Utils.getPageBar(totalContent , cPage , numPerPage , "boardList.do") %>
</section> 

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>