<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Get It:: 회원 로그인" name="pageTitle"/>
</jsp:include>
<style>
.content-container{
	border: 1px solid black;
	width: 100%;
}
.login-container{
	border: 1px solid black;
	margin: 0 auto;
	width: 700px;
	text-align: center;
}
.list-group{
	width: 300px;
	margin: 0 auto;
}
</style>
	<div class="content-container">
		<div class="login-container">
			<div class="login-text">
				<span>Welcome Login!</span>
			</div>
			<div class="login-link">
			<ul class="list-group">
				<li class="list-group-item list-group-item-action"><a href="">페이스북 로그인</a></li>
				<li class="list-group-item list-group-item-action"><a href="">gmail로그인</a></li>
				<li class="list-group-item list-group-item-action"><a href="">카카오톡 로그인</a></li>
			</ul>
			</div>
			<span>또는</span>
			<div class="login-form">
				<form action="">
				<label for="memberId">아이디 : </label>
				<input type="text" id="memberId"/><br />
				<label for="password">비밀번호: </label>
				<input type="password" id="password"/><br />
				<input type="button" value="로그인"/>
				</form>
			</div>
			<a href="">비밀번호를 잊어버리셨나요?</a>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>