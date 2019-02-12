<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Dev목록" name="pageTitle" />
</jsp:include>
<table class="table">
	<tr>
		<th scope="col">번호</th>
		<th scope="col">이름</th>
		<th scope="col">나이</th>
		<th scope="col">이메일</th>
		<th scope="col">성별</th>
		<th scope="col">개발가능언어</th>
		<th scope="col">수정 | 삭제</th>
	</tr>
	<c:if test="${not empty list}">
		<c:forEach items="${list }" var="dev" varStatus="vs" >
		<tr>
			<td>${dev.devNo }</td>	
			<td>${dev.devName }</td>	
			<td>${dev.devAge }</td>	
			<td>${dev.devEmail }</td>	
			<td>${dev.devGender }</td>
			<td>
			<c:forEach items="${dev.devLang }" var="l" varStatus="vs">
			${l }${!vs.last?",":"" }
			</c:forEach>
			</td>
			<td>
				<button type="button" class="btn btn-outline-light" onclick="updateDev(${dev.devNo});">수정</button>
				<button type="button" class="btn btn-outline-light" onclick="deleteDev(${dev.devNo});">삭제</button>
			</td>
		</tr>
		</c:forEach>
	</c:if>
	<c:if test="${empty list}">
		<th colspan="6">조회된 정보가 없습니다.</th>
	</c:if>
</table>
<script>
function updateDev(no){
	location.href="${pageContext.request.contextPath}/demo/updateDev.do?no="+no;
}
function deleteDev(no){
	var delConfirm = confirm("정말로 삭제하시겠습니까?");
	if(delConfirm) {
		location.href="${pageContext.request.contextPath}/demo/deleteDev.do?no="+no;
	} else {
		alert("삭제가 취소되었습니다.");
	}
}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>