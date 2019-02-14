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
</style>

	<div class="content-container">
		<div class="login-container">
			<div class="login-text">
				<span>Welcome Login!</span>
			</div>
			<div class="login-link">
			<ul class="list-group">
			<%-- <a href="${facebook_url}"><button
                                    class="btn btn-primary btn-round" style="width: 100%">
                                    <i class="fa fa-facebook" aria-hidden="true"></i>Facebook Login
                                </button></a>  --%>
                                
                                
                                
                                
				<li class="list-group-item list-group-item-action">
       <fb:login-button id="status" scope="public_profile,email" data-size="large" data-button-type="login_with" 
    data-show-faces="false" data-auto-logout-link="true" data-use-continue-as="false"onlogin="checkLoginState();">
       FaceBook login
       </fb:login-button>
				
				</li>
				<li class="list-group-item list-group-item-action"><a href="">구글로 로그인</a></li>
				<li class="list-group-item list-group-item-action"><a href="">카카오톡으로 로그인</a></li>
			</ul>
			</div>
			<span>또는</span>
			<div class="login-form">
				<form action="${pageContext.request.contextPath }/member/memberLogin.do" method="post">
				<label for="memberId">아이디 : </label>
				<input type="text" id="memberId" name="memberId"/><br />
				<label for="password">비밀번호: </label>
				<input type="password" id="password" name="password"/><br />
				<input type="submit" value="로그인"/>
				</form>
			</div>
			<a href="">비밀번호를 잊어버리셨나요?</a>
		</div>
	</div>
	
<script type="text/javascript">
     window.fbAsyncInit = function() {
        FB.init({
          appId      : '1302299029947046',
          xfbml      : true,
          version    : 'v3.2'
        });
        FB.AppEvents.logPageView();
      
         FB.getLoginStatus(function(response) {
          if (response.status === 'connected') {
              
          }
          else {
             FB.login(function(response) {
              // handle the response
            }, {scope: 'public_profile, email, user_birthday '});
          }
        });
         
      };
      (function(d, s, id){
         var js, fjs = d.getElementsByTagName(s)[0];
         if (d.getElementById(id)) {return;}
         js = d.createElement(s); js.id = id;
         js.src = "//connect.facebook.net/en_US/sdk.js";
         fjs.parentNode.insertBefore(js, fjs);
       }(document, 'script', 'facebook-jssdk'));
      
        function checkLoginState() {
            FB.getLoginStatus(function(response) {
                statusChangeCallback(response);
              });
        }
      function statusChangeCallback(response) {
        if (response.status === 'connected') {
          testAPI();
        } 
      }
     function testAPI() {
        FB.api('/me?fields=id,name,email',  function(response) {        	
        	 /*  console.log(response.id);
              console.log(response.name);
              console.log(response.email); */
              //console.log(JSON.stringify(response));
              var userinfo = JSON.stringify(response);
              console.log(userinfo);
             
        });
        
       
      }
     
</script>
	
	
	
	
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>