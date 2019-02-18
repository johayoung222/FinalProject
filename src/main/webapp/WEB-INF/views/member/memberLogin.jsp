<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />

<jsp:include page="/WEB-INF/views/common/sHeader.jsp">
	<jsp:param value="Get It :: 로그인" name="pageTitle" />
	<jsp:param value="1" name="pageName"/>
</jsp:include>
<style>
.content-container{
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
#memberId_{
	margin-left:16px;
	border: 1px solid black;
}
#password{
	border:1px solid black;
}
#login_{
	background-color:#f8f9fa;
	
}
#font2{
	color:lightgray;
	
}

</style>

	<div class="content-container" >
		<div class="login-container" style="border:0">
			<div class="login-text">
				<span id="font1"><strong>Welcome Login!</strong></span>
			</div>
			<div class="login-link" >
			<ul class="list-group">
				<li class="list-group-item list-group-item-action" style="border:0">
				<a href="">
				<img src="${pageContext.request.contextPath }/resources/images/facelogin.PNG"  width="100%" height="100%"/>
				</a>
				</li>
				<li class="list-group-item list-group-item-action" style="border:0">
				<a href="">
					<img src="${pageContext.request.contextPath }/resources/images/googlelog.PNG"  width="100%" height="100%"/>
				</a>
				</li>
				<li class="list-group-item list-group-item-action" style="border:0">
				<a href="">
					<img src="${pageContext.request.contextPath }/resources/images/kakaologin.PNG"  width="100%" height="100%"/>
				</a>
				</li>
			</ul>
			</div>
			<br>
			<div class="login-form">
				<form action="${pageContext.request.contextPath }/member/memberLogin.do" method="post">
				<label for="memberId">아이디</label>
				<input type="text" id="memberId_" name="memberId"/><br />
				<label for="password">비밀번호</label>
				<input type="password" id="password" name="password"/><br />
				<input type="submit" id="login_" value="로그인"/>
				</form>
			</div>
			<a href="" id="font2">비밀번호를 잊어버리셨나요?</a>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>