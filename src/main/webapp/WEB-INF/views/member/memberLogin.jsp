<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="297674585572-kqfeb0ueu63g0o5qtoip4pcivfds9dpr.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
<fmt:requestEncoding value="UTF-8" />

<jsp:include page="/WEB-INF/views/common/sHeader.jsp">
	<jsp:param value="Get It :: 로그인" name="pageTitle" />
	<jsp:param value="1" name="pageName"/>
</jsp:include>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
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
.g-signin2{
	margin: 0 auto;
	padding: 15px;

}

</style>

	<div class="content-container" >
		<div class="login-container" style="border:0">
			<div class="login-text">
				<span id="font1"><strong>Welcome Login!</strong></span>
			</div>
			<div class="login-link" >
			<ul class="list-group">

                                
                                
				<li class="list-group-item list-group-item-action">
   				<fb:login-button id="status" scope="public_profile,email" data-size="large"  data-button-type="login_with"
               data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="flase"onlogin="checkLoginState();">
              FaceBook으로 로그인
       </fb:login-button>
  
				
				</li>
				<li class="list-group-item list-group-item-action">
			
			<div class="g-signin2" data-onsuccess="Googlelogin" data-width="222" data-height="40"
			data-auto-logout-link="false" data-theme="dark" value="google로 로그인">
			</div>
		 		
				 </li>
				<li class="list-group-item list-group-item-action"><a href="">
			    <a id="kakao-login-btn"></a>
                 <a href="http://developers.kakao.com/logout"></a>
				
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
	

<script  type="text/javascript">
function next2(){
	$(".content-container").hide();
	$("#enroll-container").show();
	$(".select-second").css({"color":"black","border-bottom":"none"}).next().css({"color":"#007bff","border-bottom":"2px solid #007bff"});
	var alarm = $("#agree4").prop("checked");
	memberEnrollFrm.alarm.value = alarm==true?"1":"0";
}

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
    	 FB.api('/me?fields=id,name,email,gender',  function(response) {        	
    	   
                 var memberId = response.id;
                 var memberName = response.name;
                 var memberEmail = response.email; 
                
               
               
            $.ajax({
          		url: "${pageContext.request.contextPath}/member/facebookLogin",
          		method:"post",
          		data: {memberId : memberId, memberName : memberName, memberEmail : memberEmail },
          		dataType: "json",
          		success: function(data){
          		if(data.fbisUsable == false){     
          		 alert("FaceBook로그인성공");
   				 window.location.href = "/spring";
          		}else{
          			alert("회원가입먼저 해주세요");
          			window.location.href ="${pageContext.request.contextPath}/member/memberEnroll.do";	
          		}
          		 
          		},
          		error:function(){
          			console.log("ajax요청 실패 에러!");
          		}
          	}); 
              
       
      })
    	
    } 
  }

  /*    카카오로그인 */// 사용할 앱의 JavaScript 키를 설정해 주세요.
   Kakao.init('ce5b973783f3c9e19db9e51f9c823d4b');
  // 카카오 로그인 버튼을 생성합니다.
  Kakao.Auth.createLoginButton({
    container: '#kakao-login-btn',
    success: function(authObj) {
      // 로그인 성공시, API를 호출합니다.
      Kakao.API.request({
        url: '/v1/user/me',
        success: function(res) {
 
       /*    console.log(JSON.stringify(res.id));
          console.log(JSON.stringify(res.properties.nickname)); */
          console.log(JSON.stringify(res.id));
          console.log(JSON.stringify(res.properties.nickname));
          
          
          var kakaoId = JSON.stringify(res.id);
          var kakaoName = JSON.stringify(res.properties.nickname);
          
          
          $.ajax({
        		url: "${pageContext.request.contextPath}/member/kakaoLogin",
        		method:"post",
        		data: {kakaoId : kakaoId, kakaoName : kakaoName}, 
        		success: function(data){
        		
        		
        			if(data.kisUsable == false){     
                 		 alert("카카오 로그인성공");
          				 window.location.href = "/spring";
                 	}else{
                 			alert("회원가입먼저 해주세요");
                 			window.location.href ="${pageContext.request.contextPath}/member/memberEnroll.do";	
                 	}
        		},
        		error:function(){
        			console.log("ajax요청 실패 에러!");
        		}
        	}); 
          
          
        },
        fail: function(error) {
          alert(JSON.stringify(error));
        }
      });
    },
    fail: function(err) {
      alert(JSON.stringify(err));
    }
  });


  /* 구글 로그인 */
   function Googlelogin(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
     /*    console.log("ID: " + profile.getId()); 
        console.log('Full Name: ' + profile.getName());
        console.log("Email: " + profile.getEmail()); */
        var googleId = profile.getId();
        var googleName = profile.getName();
        var googleEmail = profile.getEmail();

        
        // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
        
        
        
        $.ajax({
    		url: "${pageContext.request.contextPath}/member/googleLogin",
    		method:"post",
    		data: {googleId : googleId, googleName : googleName, googleEmail : googleEmail}, 
    		success: function(data){
    		
    		
    			if(data.gisUsable == false){     
             		 alert("구글 로그인성공");
      				 window.location.href = "/spring";
             	}else{
             			alert("회원가입먼저 해주세요");
             			window.location.href ="${pageContext.request.contextPath}/member/memberEnroll.do";	
             	}
    		},
    		error:function(){
    			console.log("ajax요청 실패 에러!");
    		}
    	}); 
      
      }



</script>
	
	
	
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>