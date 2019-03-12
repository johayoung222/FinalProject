<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Get It :: 중고거래의 중심" name="pageTitle" />
</jsp:include>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/detail.css" />

<script>
/* 현재 시간을 구하는 함수 */
function getTime() {
	today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();
	var hh = today.getHours();
	var MM = today.getMinutes();
	var MM = today.getMinutes();
	var ss = today.getSeconds();

	if(dd<10) { dd='0'+dd } 
	if(mm<10) { mm='0'+mm } 
	if(hh<10) { hh='0'+hh }
	if(ss<10) { ss='0'+ss }
	
	today = yyyy + '-' + mm+'-'+dd + " " + hh + ":" + MM + ":" + ss;
	return today;
}
</script>

	<c:forEach items="${auction }" var="a">

  <body>
  <c:set var="MemberNo" value="${memberLoggedIn.seqMemberNo}" />
  <c:set var="auctionMemberNo" value="${a.SEQ_MEMBER_NO }" />
    <!-- Page Content -->
    <div class="container">
		<div class="Detail_row">     		
		<%-- 경매등록 회원이 보는 화면 시작  --%>
			<div class="Detail_info">
				<div id="image" class="Detail_info_left" >
					<table class="Detail_info_imgtable">
						<tr>
							<td colspan="3" class="Detail_info_mainimg">
								<img src="${pageContext.request.contextPath }/resources/upload/${a.AUCTION_IMAGE_MAIN}" id="main_img" />
							</td>
						</tr>
						<tr>
							<td class="Detail_info_subimg">
							<c:choose>
								<c:when test="${a.AUCTION_IMAGE_SUB1 ne null}">
									<img src="${pageContext.request.contextPath }/resources/upload/${a.AUCTION_IMAGE_SUB1}" onmouseover="showSub('sub1_'+${detailResult.auctionUnq}+'.jpg');" onmouseout="showMain(${detailResult.auctionUnq}+'.jpg');" />
								</c:when>
								<c:otherwise>
									<img src="${pageContext.request.contextPath }/resources/images/null.png" />
								</c:otherwise>
							</c:choose>
							</td>
							<td class="Detail_info_subimg">
							<c:choose>
								<c:when test="${a.AUCTION_IMAGE_SUB2 ne null}">
									<img src="${pageContext.request.contextPath }/resources/upload/${a.AUCTION_IMAGE_SUB2}" onmouseover="showSub('sub1_'+${detailResult.auctionUnq}+'.jpg');" onmouseout="showMain(${detailResult.auctionUnq}+'.jpg');" />
								</c:when>
								<c:otherwise>
									<img src="${pageContext.request.contextPath }/resources/images/null.png" />
								</c:otherwise>
							</c:choose>
							</td>
							<td class="Detail_info_subimg">
							<c:choose>
								<c:when test="${a.AUCTION_IMAGE_SUB3 ne null}">
									<img src="${pageContext.request.contextPath }/resources/upload/${a.AUCTION_IMAGE_SUB3}" onmouseover="showSub('sub1_'+${detailResult.auctionUnq}+'.jpg');" onmouseout="showMain(${detailResult.auctionUnq}+'.jpg');" />
								</c:when>
								<c:otherwise>
									<img src="${pageContext.request.contextPath }/resources/images/null.png" />
								</c:otherwise>
							</c:choose>
							</td>
						</tr>
					</table>
				</div> <!-- /.end of image div -->
				
				<div id="content" class="Detail_info_rigth">
					<table class="Detail_info_rightinfo">
						<tr>
							<td>[ <c:out value="${ctgMacroName}"/> > <c:out value="${ctgMicroName}"/>]</td>
							<td><c:out value="${a.AUCTION_TITLE}"/></td>

							<c:if test="${memberLoggedIn.seqMemberNo ne a.SEQ_MEMBER_NO}">
								<c:if test="${empty myHistory }">
								<td rowspan="5">
									<div id="bidInfo" class="Detail_bidStamp">
										입찰 대기중<br>
									</div>
								</td>
								</c:if>
								<c:if test="${not empty myHistory }">
								<td rowspan="5">
									<div id="bidInfo" class="Detail_bidStamp">
										입찰참여 중<br>
										<c:out value="${myHistory.PRICE}"/>원
									</div>
								</td>
								</c:if>
							</c:if>
						</tr>
						<tr>
							<td>경매기간</td>
							<td><c:out value="${a.SDATE}"/>  ~  <c:out value="${a.EDATE}"/></td>
						</tr>
						<tr>
							<td>시작 가격</td>
							<td><c:out value="${a.AUCTION_PRICE}"/>원</td>
						</tr>
						<tr>
							<td>종료 가격</td>
							<td><c:out value=""/>원</td>
						</tr>
						<tr>
							<td>배송정보</td>
							<td>
								<c:if test="${a.AUCTION_STATUS eq 0}"><c:out value="배송"/> | <c:out value="3000"/>원 (도서산간 별도)</c:if>
								<c:if test="${a.AUCTION_STATUS eq 1}"><c:out value="직접 수령"/></c:if>
							</td>
						</tr>
					</table>
					
					<table class="Detail_info_rightbtn">
						<tr>
						 <td>
						  <form name="bid" id="bid">
							<div class="row">
								<c:if test="${memberLoggedIn.seqMemberNo eq a.SEQ_MEMBER_NO}">
									<label for="bidPrice" class="mb-0 ml-4 text-danger" style="font-size: 9pt;">
										※ 게시글 등록회원은 경매에 참여 할 수 없습니다.</label>
								</c:if>
								
								<div class="col-lg-8">
									<div class="input-group">				
										<input type="hidden" name="MemberNo" value="${memberLoggedIn != null?memberLoggedIn.seqMemberNo:'0' }">
										<input type="hidden" name="auctionUnq" value="${a.AUCTION_NO}">
										<input type="text" class="form-control" id="bidPrice" name="bidPrice" placeholder="현재입찰가 : ${history.PRICE}">						
										<span class="input-group-btn">
										  <button class="btn btn-primary" type="button" id="bidInsetBtn"
										  onclick="biding('${a.AUCTION_NO}','${history.PRICE}','${a.SDATE}','${a.EDATE}' , '${a.AUCTION_PRICE }')" data-toggle="modal" data-target="">경매 참여</button>

										  <button class="btn btn-danger" type="button" id="bidSubmit"
										  onclick="location.href='${pageContext.request.contextPath}/auction/auctionPerchase/${a.AUCTION_NO }'">결제 하기</button>
										</span>
									</div><!-- /input-group -->
								</div><!-- /.col-lg-6 -->
							</div><!-- /.row -->
						  </form>
						  </td>
						</tr>		
					</table>
				</div><!-- /.end of content -->
			</div><!-- /.end of Detail_info -->
	
		
			<table class="Detail_infotable">
				<tr>
				<td colspan="2">	
					<div id="Detail_tabcontainer">
					    <ul class="tabs">
					        <li class="active" rel="tab1" onclick="fn_tab('#tab1')">상세정보</li>
					        <li rel="tab2" onclick="fn_tab('#tab2')">문의하기</li>
					    </ul>
					    <div class="Detail_tab_container">  
					    	<!-- #tab1 상세정보 탭 내용 시작 -->
					        <div id="tab1" class="tab_content">   
				          		${a.AUCTIONDETAIL}
					        </div> <!-- end of div#tab1 -->   
					    </div><!-- end of div.Detail_tab_container -->
					   
					</div><!-- end of div#Detail_tabcontainer -->
					<!-- #container -->
				</td>
				</tr>
			</table> <!-- end of Detail_infotable -->
    
		</div>
		<!-- Detail_row -->
    </div>
    <!-- /.container -->
    <!-- /.Page Content -->

    <!-- Footer -->

	   <!-- 로그인 권유 -->
	<div class="modal" tabindex="-1" role="dialog" id="memberMoveLogin">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">경매하기</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p>로그인을 하지 않은 회원은 경매를 이용할 수 없습니다.</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath }/member/memberMoveLogin.do'">로그인 하러가기</button>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
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
	


    <!-- Bootstrap core JavaScript -->
    <!-- <script src="../../../../vendor/jquery/jquery.min.js"></script> -->
  </body>

	<script>
	 var today;
	$(function() {
		// $("#bidSubmit").hide();
		 var MemberNo = ${memberLoggedIn != null?memberLoggedIn.seqMemberNo:"0"};
		 var auctionMemberNo = ${a.SEQ_MEMBER_NO };
		 var edate = '${a.EDATE}';
		 var sdate = '${a.SDATE}';
		 today = getTime();
		 
		if(MemberNo == auctionMemberNo) {
			document.getElementById("bidInsetBtn").disabled = true;
		}
		if(today>edate) {
			document.getElementById("bidInsetBtn").disabled = true;
			$("#bidPrice").attr("placeholder" ,"이미 종료된 경매입니다.");
			// document.all("bidInfo").innerHTML = "<p>되었습니다.</p>";
		}
		if(today<sdate) {
			document.getElementById("bidInsetBtn").disabled = true;
			$("#bidPrice").attr("placeholder" ,"진행 예정인 경매입니다.");
			$("#bidInfo").html = "<p>입찰대기중</p>";
		}
		
	      /* 휴대폰 인증이 된 회원인 경우에 버튼의 data-target 값을 변경한다. */
	      if(${memberLoggedIn == null}) {
			$("#bidInsetBtn").attr("data-target","#memberMoveLogin");    	  
	      } else if(${memberLoggedIn.memberPhone == null}) {
			$("#bidInsetBtn").attr("data-target","#auctionModalPhone");
	      }
	});
	
	<%-- 메인/서브이미지 mouseover 이벤트 --%>
	function showSub(val) {
		var sobj = document.getElementById("main_img");
		//sobj.src = "../../../images/" + val;
	}
	function showMain(val){
		var mobj = document.getElementById("main_img");
		//mobj.src = "../../../images/main_" + val;
	};
	

	<%-- 경매 참여	 --%>		
	function biding(aunq,curprice,sdate,edate , basicPrice){
		var today = getTime();
		var unq = aunq;
		var curPrice=curprice;
		var startDate=sdate;
		var endDate =edate;
		var basicPrice = basicPrice;
		
		console.log(edate);
		console.log(today);
		var inputBid =  document.getElementById("bidPrice").value;
		var bidParams = $("#bid").serialize();
		if(today<startDate){
			alert('경매진행 대기중 입니다.');
			
		} else if(today>=endDate){
			alert('종료 된 경매입니다.');
		} else if(${memberLoggedIn == null}) {
			
		} else if(${memberLoggedIn.memberPhone == null}) {
			
		} else if("${bidCheck.check}" == "Y") {
			alert("이미 최고가로 입찰 진행중입니다.");
		} else {
			if(inputBid != null){
				
				if (Number(inputBid) > Number(curPrice) && Number(inputBid) > Number(basicPrice)){
					$.ajax({
						data: bidParams,
						url:"${pageContext.request.contextPath}/auctionHistoryInsert",
						type: "POST" ,
						dataType: "json",
						success: function(data) {
							if(data.Result == "success") {
								alert(inputBid+"원으로 경매에 참여하셨습니다.");
								self.location.reload();
							
							} else {
								alert("다시 시도해 주세요.");
							}
						},
						error: function(error) {
							alert("ersssror: "+error);
						}
					});
				} else {
					alert("가격을 올려서 입력하세요");
				}
			} <%-- if(inputBid != null) --%>
		} <%-- else --%>
	}	
	
	<%-- 상세보기 / QnA Tab 시작 --%>
	$(function () {
		$(".tab_content").hide();
		$(".tab_content:first").show();
		
	    $("ul.tabs li").click(function () {
	    	location.href = "${pageContext.request.contextPath}/customercenter/ccinquiry.do";
	    });
	});

	
	<%-- tab이름 지정 --%>
	function fn_tab(name){
		var tabid = name;
		
	}
	
	playAlert = setInterval(function() {
		console.log("${a.EDATE}");
		var today = getTime();
		console.log(today);
		var end = "${a.EDATE}";
		
		var auctionNo = ${a.AUCTION_NO};
		
		
		if(today >= end){
			if(${memberLoggedIn != null}) {
				$.ajax({
					url : "${pageContext.request.contextPath}/auctionBid.do",
					data: {auctionNo:auctionNo} ,
					dataType: "json",
					success : function(data) {
						if (data.cnt == 1) {
							$("#bidSubmit").show();
							clearInterval(playAlert);
							// location.href = "${pageContext.request.contextPath }";
						} else if (data.cnt == 2) {
							$("#bidSubmit").show();
							$("#bidSubmit").attr("disabled" , true);
							$("#bidInfo").html("결제 완료되었습니다.");
							clearInterval(playAlert);
						} else if (data.cnt == 0) {
							clearInterval(playAlert);
							// 낙찰자가 아닌 경우 아무런 행동하지 않는다.
						} 
					},
					error : function(error) {
						  alert("error" + error);
							clearInterval(playAlert);
					}
				});
				
				// 반복 종료를 위한 코드
				// clearInterval(playAlert);
			}
			
		}
		
	}, 1000);
</script>
	</c:forEach>
    
<!-- 	<script
    src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
    integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm"
    crossorigin="anonymous"></script> -->


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>