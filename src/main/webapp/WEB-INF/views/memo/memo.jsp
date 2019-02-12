<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="메모" name="pageTitle"/>
</jsp:include>

<style>
div#memo-container{width:60%; margin:0 auto;text-align:center;}
</style>
<div id="memo-container">
    <form action="${pageContext.request.contextPath}/memo/insertMemo.do" class="form-inline" method="post">
        <input type="text" class="form-control col-sm-6" name="memo" placeholder="메모" required/>&nbsp;
        <input type="password" class="form-control col-sm-2" name="password" maxlength="4" placeholder="비밀번호" required/>&nbsp;
        <button class="btn btn-outline-success" type="submit" >저장</button>
    </form>
    <br />
    <!-- 메모목록 -->
	<table class="table">
	    <tr>
	      <th>번호</th>
	      <th>메모</th>
	      <th>날짜</th>
	      <th>삭제</th>
	    </tr>
	    <c:if test="${not empty list }">
		    <c:forEach items="${list }" var="m" varStatus="vs">
		    <tr>
		    	<td>${m.memoNo }</td>
		    	<td>${m.memo }</td>
		    	<td>${m.memoDate }</td>
			    <td><button type="button" class="btn btn-outline-danger" onclick="deleteMemo('${m.memoNo}' , '${m.password }')">삭제</button></td>
		    </tr>
		    </c:forEach>
	    </c:if>
	    <c:if test="${empty list }">
	    <tr>
	    	<td colspan="4">작성된 메모가 없습니다.</td>
	    </tr>
	    </c:if>
	   
	</table>
</div>
<form name="memoDelFrm" action="deleteMemo.do" method="post">
	<input type="hidden" name="no" />
	<input type="hidden" name="password" />
</form>
<script>
function deleteMemo(memoNo , password) {
	var passwordInput = prompt("패스워드를 입력해주세요.");
	if(passwordInput == password) {
		memoDelFrm.password.value = password;		
	} 
	if(passwordInput == null) {
		return;
	}
	
		memoDelFrm.no.value = memoNo;
		memoDelFrm.submit();	
	/* else if(passwordInput.trim().length == 0) {
		alert("패스워드를 입력해주세요.");
	} else {
		alert("패스워드가 틀립니다.");
	} */
}
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>