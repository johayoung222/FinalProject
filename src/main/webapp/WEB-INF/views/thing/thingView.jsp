<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="" name="pageTitle" />
</jsp:include>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<style>
.btnnn{
	width:100px;
	height:40px;
	display:inline-block;	
	margin : 5px auto;
}
.card-title{
	color:rgb(103, 105, 201);
	font-family: 'Nanum Gothic', sans-serif;
}
.form-control{
	width:140px;
	display:inline-block;	
	margin : 5px auto;
}
</style>
<div class="sell-title" style="text-align: center; font-style: oblique; font-size: xx-large;">먼저, 판매 방법을 선택하세요.</div>
<div class="sell-title" style="text-align: center; font-style: oblique;">겟잇의 모든 중고 거래는 안전거래입니다!</div>
<hr />
<div style="display: inline-flex; text-align: center; margin-left:11%;">
   <div class="card" style="width: 18rem;">
      <img class="card-img-top" src="${pageContext.request.contextPath }/resources/images/대신.PNG" alt="Card image cap">
      <div class="card-body">
         <h5 class="card-title" id="card-title"><strong>겟잇 베이직</strong></h5>
         <p class="card-text"></p>
      </div>
      <ul class="list-group list-group-flush">
         <li class="list-group-item">한번에 1개 제품 등록</li>
         <li class="list-group-item" >컨시지어가 판매가격 제안</li>
         <li class="list-group-item">구매자 응대 X</li>
         <li class="list-group-item">무료 배송 지원</li>
         <li class="list-group-item">안 팔리면 겟잇이 매입</li>
      </ul>
      
      <!-- Button trigger modal -->
      <button type="button" class="btn btn-primary btn-lg myBtn statusY" data-toggle="modal" data-target="#myModal" >판매하기</button>

      <!-- Modal -->
      <form name="form" action="${pageContext.request.contextPath}/thing/sell.do" onsubmit="return validateForm();" method="post" enctype="Multipart/form-data">
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
				
					<div class="modal-header">
					   <h4 class="modal-title" id="myModalLabel" >판매 등록</h4>
					   <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					      <span aria-hidden="true">&times;</span>
					   </button>
					</div>
					
	            <div class="modal-body">
	            
	            <select id="categoryMa" class="form-control form-control-sm">
					<option value="" disabled selected>대분류</option>
				</select>
				&nbsp;&nbsp;&nbsp;
				<select id="categoryMi" class="form-control form-control-sm">
				</select> <br /><hr />
	
				<script>
				$(function(){
					$.ajax({
						url : "${pageContext.request.contextPath}/admin/categoryMa.do",
						dataType : "json",
						success : function(data){
							var html ="";
							for(var i in data){
							html += "<option class='cMa' value="+data[i].categoryMacro+">"+data[i].categoryName+"</option>";
							}
							$("#categoryMa").append(html);
						},error : function(){
							console.log("ajax 요청 실패!!");
						}
					}); 
				});
				
				$("#categoryMa").on("change",function(){
					var macro = $(this).val();
					console.log("change 시 macro :"+macro);
					var none = "";
					$("#categoryMi").append(none);
					$.ajax({
						url : "${pageContext.request.contextPath}/admin/categoryMi.do",
						data : {macro:macro},
						type : "get",
						dataType : "json",
						success :function(data){
							$('#categoryMi').children("option").remove();
							var html ="<option value='' disabled selected>소분류</option>";
							for(var i in data){
							html += "<option class='cMi' value="+data[i].categoryMicro+">"+data[i].categoryName+"</option>";
							}
							$("#categoryMi").append(html);
						},error : function(){
							console.log("ajax 요청 실패!!");
						}
					});	
				});
				</script>
				      
	            <input type="hidden" name="seqMemberNo" id="seqMemberNo" value="${memberLoggedIn.getSeqMemberNo()}"/>
	            <input type="hidden" name="registAuction" id="registAuction" value="N"/>
	            <input type="hidden" name="registStatus" id="registStatus"/>
	            
	            <label for="">상품명을 입력해 주세요 : </label> 
	            <input type="text" name="registName" id="registName" required /> <br /><br /> 
	            <label for="">가격을 입력해 주세요 : </label> 
	            <input type="text" name="registPrice" id="registPrice" required/> <br /><br /> 
	            <label for="">중고 상품이십니까?</label>
	            &nbsp;&nbsp;예. <input type="radio" name="registKinds" class="registKinds" value="Y" /> 
	            	           아니오. <input type="radio" name="registKinds" class="registKinds" value="N" /> 
	            <br /><br />
	
	
	            <div class="input-group mb-3" style="padding: 0px;">
	               <div class="input-group-prepend" style="padding: 0px;">
	                  <span class="input-group-text">첨부파일1</span>
	               </div>
	               <div class="custom-file">
	                  <input type="file" class="custom-file-input" name="upFile" id="upFile1" multiple required> 
	                  <label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
	               </div>
	            </div>
	
	            <div class="input-group mb-3" style="padding: 0px;">
	               <div class="input-group-prepend" style="padding: 0px;">
	                  <span class="input-group-text">첨부파일2</span>
	               </div>
	               <div class="custom-file">
	                  <input type="file" class="custom-file-input" name="upFile" id="upFile2" multiple required> 
	                  <label class="custom-file-label" for="upFile2">파일을 선택하세요</label>
	               </div>
	            </div>
	            <br />
	            <label for="">수량을 적어주세요 : </label> 
	            <input type="number" name="registAmount" id="registAmount" required /> <br /><br />
	            <label for="">상품 설명을 적어주세요.</label> <br />
	            <textarea rows="5" cols="30" name="registDescription" id="registDescription" required></textarea>
                </div>
                <input type="submit" value="Save" class="btn btn-primary btnnn" />
           		<button type="button" class="btn btn-default btnnn" data-dismiss="modal">Close</button>
               </div>
            </div>
            
         </div>
         
      </form>

   </div>

   <div class="card" style="width: 18rem;">
      <img class="card-img-top" src="${pageContext.request.contextPath }/resources/images/직접.PNG" alt="Card image cap">
      <div class="card-body">
         <h5 class="card-title"><strong>직접 판매</strong></h5>
         <p class="card-text"></p>
      </div>
      <ul class="list-group list-group-flush">
         <li class="list-group-item">한번에 1개 제품 등록</li>
         <li class="list-group-item">판매가격 직접 입력</li>
         <li class="list-group-item">구매자 응대 O</li>
         <li class="list-group-item">편의점 택배 서비스 이용</li>
         <li class="list-group-item">매입 X</li>
      </ul>
      
      <!-- Button trigger modal -->
      <button type="button" class="btn btn-primary btn-lg myBtn statusN" data-toggle="modal" data-target="#myModal"  >판매하기</button>
	
		
      <!-- Modal 
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal"
                     aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                  </button>
                  <h4 class="modal-title" id="myModalLabel">Modal title</h4>
               </div>
               <div class="modal-body">...</div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                  <button type="button" class="btn btn-primary">Save
                     changes</button>
               </div>
            </div>
         </div>
      </div>-->
   </div>
   <!-- 로그인 권유 -->
	<div class="modal" tabindex="-1" role="dialog" id="memberMoveLogin">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">판매하기</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p>로그인을 하지 않은 회원은 판매하기를 이용할 수 없습니다..</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath }member/memberMoveLogin.do';">로그인 하러가기</button>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
   

<div class="card" style="width: 18rem;">
  <img class="card-img-top" src="${pageContext.request.contextPath }/resources/images/경매1.png"  alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title"><strong>겟잇 옥션</strong></h5>
    <p class="card-text"></p>
  </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item">한번에 1개 제품 등록</li>
    <li class="list-group-item">경매 시작 가격 직접 입력</li>
    <li class="list-group-item">구매자 응대 X</li>
    <li class="list-group-item">편의점 택배 서비스 이용</li>
    <li class="list-group-item">매입 X</li> 
  </ul>


<button type="button" class="btn btn-primary btn-lg auctionbtn" onclick="auctionV();" data-toggle="modal" data-target="#auctionModalPhone">
  판매하기
</button>
</div>
</div>

<hr />
<div class="sell-title" style="text-align: center; font-style: oblique; font-size: xx-large;">나에게   맞는 판매 방법은?</div>
<div class="jumbotron">
   <h1 class="display-4">안녕! 겟잇 베이직</h1>
   <hr class="my-4">
   <p class="lead">1. 팔 물건은 있는데, 판매하기가 귀찮다.</p>
   <p class="lead">2. 안 팔리는 물건, 매입해줬으면 좋겠다.</p>
   
   <!-- Button trigger modal -->
   <button type="button" class="btn btn-primary btn-lg myBtn statusY" data-toggle="modal" data-target="#myModal" >겟잇 베이직으로 판매하기</button>


   <!-- Modal 
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
      aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal"
                  aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
               <h4 class="modal-title" id="myModalLabel">Modal title</h4>
            </div>
            <div class="modal-body">...</div>
            <div class="modal-footer">
               <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
               <button type="button" class="btn btn-primary">Save changes</button>
            </div>
         </div>
      </div>
   </div>-->
   
</div>

<div class="jumbotron">
   <h1 class="display-4">안녕! 직접 판매</h1>
   <hr class="my-4">
   <p class="lead">1. 그냥 구매자랑 직접 거래하고 싶다.</p>
   <p class="lead">2. 네고, 직거래 없이 안전거래 하고 싶다.</p>
   
   <!-- Button trigger modal -->
   <button type="button" class="btn btn-primary btn-lg myBtn statusN" data-toggle="modal" data-target="#myModal"  >직접 판매하기</button>

   <!-- Modal 
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
      aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal"
                  aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
               <h4 class="modal-title" id="myModalLabel">Modal title</h4>
            </div>
            <div class="modal-body">...</div>
            <div class="modal-footer">
               <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
               <button type="button" class="btn btn-primary"
                  onclick="document.getElementById('thingEnrollFrm').submit();">Save
                  changes</button>
            </div>
         </div>
      </div>
   </div>-->
   
</div>


<div class="jumbotron">
    <h1 class="display-4">안녕! 겟잇 옥션</h1>
    <hr class="my-4">
    <p class="lead">1. 팔 물건은 있는데, 판매하기가 귀찮다.</p> 
    <p class="lead">2. 색다르게, 가격경쟁을 통해 팔고싶다.</p> 
  
	<!-- Button trigger modal -->
	<button type="button" class="btn btn-primary btn-lg auctionbtn" onclick="auctionV();" data-toggle="modal" data-target="#auctionModalPhone">겟잇 옥션으로 판매하기</button>
</div>

<!-- 휴대폰인증 팝업 모달 -->
<div class="modal" tabindex="-1" role="dialog" id="auctionModalPhone">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">판매하기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>휴대폰 인증을 하지 않은 회원은 겟잇 옥션 이용이 불가합니다.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath }/mypage/profile/edit.do'">휴대폰 인증하러가기</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<!-- 회원가입 권유 팝업 모달 -->
<div class="modal" tabindex="-1" role="dialog" id="auctionModalEnroll">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">판매하기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>회원가입을 하지 않은 회원은 겟잇 옥션 이용이 불가합니다.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath }/member/memberEnroll.do';">회원가입 하러가기</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<form name="thingEnrollFrm" action="${pageContext.request.contextPath}/thing/thingEnd.do"></form>

<script>
function validateForm(){
	var regExp1 = /^[0-9]{4,}$/;
	var registName = $("#registName").val();
	var registPrice = $("#registPrice").val();
	var registKinds = $(".registKinds:checked").val();
	var registDescription =$("#registDescription").val();
	
	if(registName == ""){
		alert("상품명을 작성해 주세요.");
		return false;
	}else if(registPrice == ""){
		alert("상품명을 작성해 주세요.");
		return false;
	}else if(!regExp1.test(registPrice)){
		alert("가격은 숫자를 입력해주세요.(천원이상!!)");
		return false;
	}else if(registKinds == null){
		alert("중고 상품인지 여부를 체크해주세요.");
		return false;
	}else if(registDescription == ""){
		alert("상품 설명을 작성해 주세요.")
		return false;
	}
	
	alert("상품 판매 신청이 되었습니다.");
	return true;
} 

$(".statusY").on('click',function(){
	$("#registStatus").val('Y');
	alert($("#registStatus").val());
});
$(".statusN").on('click',function(){
	$("#registStatus").val('N');
	alert($("#registStatus").val());
});
</script>





<script>
   function categoryClick(type){
      console.log(type); 
//      var category = $('#'+type).val();  
      
      $("button[name=category]").prop("disabled", true);   
      
   }
   //부트스트랩 파일변경시 파일명 보이기
   $(function(){
      $("[name=upFile]").on('change',function(){
         //var fileName = $(this).val();
         console.log($(this));
         var fileName = $(this).prop("files")[0].name;
         $(this).next(".custom-file-label").html(fileName);
      });
      
      /* 휴대폰 인증이 된 회원인 경우에 버튼의 data-target 값을 변경한다. */
      if(${memberLoggedIn == null}) {
		$(".auctionbtn").attr("data-target","#auctionModalEnroll");    	  
		$(".myBtn").attr("data-target","#memberMoveLogin");    	  
      } else if(${memberLoggedIn.memberPhone != null}) {
		$(".auctionbtn").attr("data-target","");
		$(".myBtn").attr("data-target","#myModal"); 
      }
      
   });

   
   /* 핸드폰 인증이 안된 회원일시에 confirm창 뛰우기 */
	function auctionV() {
		if(${memberLoggedIn.memberPhone != null}) {
			location.href='${pageContext.request.contextPath }/auctionWriter.do';
		}
		
	}
   
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>