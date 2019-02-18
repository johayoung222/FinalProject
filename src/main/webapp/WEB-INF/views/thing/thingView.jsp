<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
</jsp:include>
<div class="sell-title" style="text-align: center;font-style: oblique;font-size: xx-large;">먼저, 판매 방법을 선택하세요.</div>
<div class="sell-title" style="text-align: center;font-style: oblique;">겟잇의 모든 중고 거래는 안전거래입니다!</div>

<div style="display: inline-flex; text-align: center; margin-left: 32%;">  
<div class="card" style="width: 18rem;">
  <img class="card-img-top" src="${pageContext.request.contextPath }/resources/images/대신.PNG" alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title">겟잇 베이직</h5>
    <p class="card-text"></p>  
  </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item">한번에 1개 제품 등록</li>
    <li class="list-group-item">컨시지어가 판매가격 제안</li>
    <li class="list-group-item">구매자 응대 X</li>
    <li class="list-group-item">무료 배송 지원</li>
    <li class="list-group-item">안 팔리면 겟잇이 매입</li>
  </ul>
  <!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  판매하기
</button>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">판매 등록</h4> 
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
   <div class="modal-body">
     <div id="accordion" role="tablist">
   		<div id="accordion" role="tablist">
   		<label for="">카테고리</label> 
  <div class="card">
    <div class="card-header" role="tab" id="headingOne">
      <h5 class="mb-0">
        <a data-toggle="collapse" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          	전자기기
        </a>
      </h5>
    </div>

    <div id="collapseOne" class="collapse show" role="tabpanel" aria-labelledby="headingOne" data-parent="#accordion">
      <div class="card-body">
			<c:forEach items="${categoryList}" var="c">
			<c:if test="${c.categoryMacro eq 'A'}">
			<tr>
				<button id="${c.categoryName}" name="category" onclick="categoryClick('${c.categoryName}');" value="${c.categoryName}">${c.categoryName}</button> 
			</tr>			
			</c:if>
			</c:forEach>
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" role="tab" id="headingTwo">
      <h5 class="mb-0">
        <a class="collapsed" data-toggle="collapse" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
			의류
        </a>
      </h5>
    </div>
    <div id="collapseTwo" class="collapse" role="tabpanel" aria-labelledby="headingTwo" data-parent="#accordion">
      <div class="card-body">
			<c:forEach items="${categoryList}" var="c">
			<c:if test="${c.categoryMacro eq 'B'}">
			<tr>
				<button id="${c.categoryName}" name="category" onclick="categoryClick('${c.categoryName}');" value="${c.categoryName}">${c.categoryName}</button>
			</tr>			
			</c:if>
			</c:forEach>
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" role="tab" id="headingThree">
      <h5 class="mb-0">
        <a class="collapsed" data-toggle="collapse" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
			신발/가방/악세서리
        </a>
      </h5>
    </div>
    <div id="collapseThree" class="collapse" role="tabpanel" aria-labelledby="headingThree" data-parent="#accordion">
      <div class="card-body">
		<c:forEach items="${categoryList}" var="c">
			<c:if test="${c.categoryMacro eq 'C'}">
			<tr>
				<button id="${c.categoryName}" name="category" onclick="categoryClick('${c.categoryName}');" value="${c.categoryName}">${c.categoryName}</button>
			</tr>			
			</c:if>
			</c:forEach>
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" role="tab" id="headingFour">
      <h5 class="mb-0">
        <a class="collapsed" data-toggle="collapse" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
			화장품
        </a>
      </h5>
    </div>
    <div id="collapseFour" class="collapse" role="tabpanel" aria-labelledby="headingFour" data-parent="#accordion">
      <div class="card-body">
		<c:forEach items="${categoryList}" var="c">
			<c:if test="${c.categoryMacro eq 'D'}">
			<tr>
				<button id="${c.categoryName}" name="category" onclick="categoryClick('${c.categoryName}');" value="${c.categoryName}">${c.categoryName}</button>
			</tr>			
			</c:if>
			</c:forEach>
      </div> 
    </div>
  </div>
  <div class="card">
    <div class="card-header" role="tab" id="headingFive">
      <h5 class="mb-0">
        <a class="collapsed" data-toggle="collapse" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
			스포츠용품
        </a>
      </h5>
    </div>
    <div id="collapseFive" class="collapse" role="tabpanel" aria-labelledby="headingFive" data-parent="#accordion">
      <div class="card-body">
		<c:forEach items="${categoryList}" var="c">
			<c:if test="${c.categoryMacro eq 'E'}">
			<tr>
				<button id="${c.categoryName}" name="category" onclick="categoryClick('${c.categoryName}');" value="${c.categoryName}">${c.categoryName}</button>
			</tr>			
			</c:if>
			</c:forEach>
      </div> 
    </div>
  </div>
  <div class="card">
    <div class="card-header" role="tab" id="headingFour">
      <h5 class="mb-0">
        <a class="collapsed" data-toggle="collapse" href="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
			생필품/아동류
        </a>
      </h5>
    </div>
    <div id="collapseSix" class="collapse" role="tabpanel" aria-labelledby="headingSix" data-parent="#accordion">
      <div class="card-body">
		<c:forEach items="${categoryList}" var="c">
			<c:if test="${c.categoryMacro eq 'F'}">
			<tr>
				<button id="${c.categoryName}" name="category" onclick="categoryClick('${c.categoryName}');" value="${c.categoryName}">${c.categoryName}</button>
			</tr>			
			</c:if>
			</c:forEach>
      </div> 
    </div>
  </div>
  <div class="card">
    <div class="card-header" role="tab" id="headingSeven">
      <h5 class="mb-0">
        <a class="collapsed" data-toggle="collapse" href="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
			문구/사무용품
        </a>
      </h5>
    </div>
    <div id="collapseSeven" class="collapse" role="tabpanel" aria-labelledby="headingSeven" data-parent="#accordion">
      <div class="card-body">
		<c:forEach items="${categoryList}" var="c">
			<c:if test="${c.categoryMacro eq 'G'}">
			<tr>
				<button id="${c.categoryName}" name="category" onclick="categoryClick('${c.categoryName}');" value="${c.categoryName}">${c.categoryName}</button>
			</tr>			
			</c:if>
			</c:forEach>
      </div> 
    </div>
  </div>
  <div class="card">
    <div class="card-header" role="tab" id="headingEight">
      <h5 class="mb-0">
        <a class="collapsed" data-toggle="collapse" href="#collapseEight" aria-expanded="false" aria-controls="collapseEight">
			명품
        </a>
      </h5>
    </div>
    <div id="collapseEight" class="collapse" role="tabpanel" aria-labelledby="headingEight" data-parent="#accordion">
      <div class="card-body">
		<c:forEach items="${categoryList}" var="c">
			<c:if test="${c.categoryMacro eq 'H'}">
			<tr>
				<button id="${c.categoryName}" name="category" onclick="categoryClick('${c.categoryName}');" value="${c.categoryName}">${c.categoryName}</button>
			</tr>			
			</c:if>
			</c:forEach>
      </div> 
    </div>
  </div>
  <div class="card">
    <div class="card-header" role="tab" id="headingNine">
      <h5 class="mb-0">
        <a class="collapsed" data-toggle="collapse" href="#collapseNine" aria-expanded="false" aria-controls="collapseNine">
			자동차
        </a>
      </h5>
    </div>
    <div id="collapseNine" class="collapse" role="tabpanel" aria-labelledby="headingNine" data-parent="#accordion">
      <div class="card-body">
		<c:forEach items="${categoryList}" var="c">
			<c:if test="${c.categoryMacro eq 'I'}">
			<tr>
				<button id="${c.categoryName}" name="category" onclick="categoryClick('${c.categoryName}');" value="${c.categoryName}">${c.categoryName}</button>
			</tr>			
			</c:if>
			</c:forEach>
      </div> 
    </div>
  </div>
  <div class="card">
    <div class="card-header" role="tab" id="headingTen">
      <h5 class="mb-0">
        <a class="collapsed" data-toggle="collapse" href="#collapseTen" aria-expanded="false" aria-controls="collapseTen">
			도서/음반
        </a>
      </h5>
    </div>
    <div id="collapseTen" class="collapse" role="tabpanel" aria-labelledby="headingTen" data-parent="#accordion">
      <div class="card-body">
		<c:forEach items="${categoryList}" var="c">
			<c:if test="${c.categoryMacro eq 'J'}">
			<tr>
				<button id="${c.categoryName}" name="category" onclick="categoryClick('${c.categoryName}');" value="${c.categoryName}">${c.categoryName}</button>
			</tr>			
			</c:if>
			</c:forEach>
      </div> 
    </div>
  </div>
  <div class="card">
    <div class="card-header" role="tab" id="headingEleven">
      <h5 class="mb-0">
        <a class="collapsed" data-toggle="collapse" href="#collapseEleven" aria-expanded="false" aria-controls="collapseEleven">
			침실가구/주방용품
        </a>
      </h5>
    </div>
    <div id="collapseEleven" class="collapse" role="tabpanel" aria-labelledby="headingEleven" data-parent="#accordion">
      <div class="card-body">
		<c:forEach items="${categoryList}" var="c">
			<c:if test="${c.categoryMacro eq 'K'}">
			<tr>
				<button id="${c.categoryName}" name="category" onclick="categoryClick('${c.categoryName}');" value="${c.categoryName}">${c.categoryName}</button>
			</tr>			
			</c:if>
			</c:forEach>
      </div> 
    </div>
  </div>
  <div class="card">
    <div class="card-header" role="tab" id="headingTwelve">
      <h5 class="mb-0">
        <a class="collapsed" data-toggle="collapse" href="#collapseTwelve" aria-expanded="false" aria-controls="collapseTwelve">
			상품권
        </a>
      </h5>
    </div>
    <div id="collapseTwelve" class="collapse" role="tabpanel" aria-labelledby="headingTwelve" data-parent="#accordion">
      <div class="card-body">
		<c:forEach items="${categoryList}" var="c">
			<c:if test="${c.categoryMacro eq 'L'}">
			<tr>
				<button id="${c.categoryName}" name="category" onclick="categoryClick('${c.categoryName}');" value="${c.categoryName}">${c.categoryName}</button>
			</tr>			
			</c:if>
			</c:forEach>
      </div> 
    </div>
  </div>
  <div class="card">
    <div class="card-header" role="tab" id="headingThirteen">
      <h5 class="mb-0">
        <a class="collapsed" data-toggle="collapse" href="#collapseThirteen" aria-expanded="false" aria-controls="collapseThirteen">
			자동차/생활용품
        </a>
      </h5>
    </div>
    <div id="collapseThirteen" class="collapse" role="tabpanel" aria-labelledby="headingThirteen" data-parent="#accordion">
      <div class="card-body">
		<c:forEach items="${categoryList}" var="c">
			<c:if test="${c.categoryMacro eq 'M'}">
			<tr>
				<button id="${c.categoryName}" name="category" onclick="categoryClick('${c.categoryName}');" value="${c.categoryName}">${c.categoryName}</button>
			</tr>			
			</c:if>
			</c:forEach>
      </div> 
    </div>
  </div>
</div>  
	<br /><br /> <hr />
	<label for="">상품명을 입력해 주세요 : </label>
	<input type="text" value=""/>
	<br /><br />
	<label for="">가격을 입력해 주세요  : </label> 
	<input type="text" /> 
   		
   
</div> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
</div> 
<div class="card" style="width: 18rem;">
  <img class="card-img-top" src="${pageContext.request.contextPath }/resources/images/직접.PNG"  alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title">직접 판매</h5>
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
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  판매하기
</button>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div> 
</div> 

</div> 
<hr /> 
<div class="sell-title" style="text-align: center;font-style: oblique;font-size: xx-large;">나에게 맞는 판매 방법은?</div> 
<div class="jumbotron">
  <h1 class="display-4">안녕! 겟잇 베이직</h1>
  <hr class="my-4">
  <p class="lead">1. 팔 물건은 있는데, 판매하기가 귀찮다.</p> 
  <p class="lead">2. 안 팔리는 물건, 매입해줬으면 좋겠다.</p> 
  <!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  겟잇 베이직으로 판매하기
</button>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div> 
</div>
<div class="jumbotron">
  <h1 class="display-4">안녕! 직접 판매</h1>
  <hr class="my-4">
  <p class="lead">1. 그냥 구매자랑 직접 거래하고 싶다.</p> 
  <p class="lead">2. 네고, 직거래 없이 안전거래 하고 싶다.</p> 
  <!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  직접 판매하기
</button>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
</div>

<script>
	function categoryClick(type){
		console.log(type); 
//		var category = $('#'+type).val();  
		
		$("button[name=category]").prop("disabled", true);	
		
	}
	
	
</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
