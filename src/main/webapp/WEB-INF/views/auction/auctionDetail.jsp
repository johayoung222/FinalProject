<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />

<!-- header 시작 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${param.pageTitle}</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.js"></script>
<!-- 부트스트랩관련 라이브러리 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">
<!-- <script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
	integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm"
	crossorigin="anonymous"></script> -->
<!-- 사용자작성 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style.css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
	width: 100%;
}

[name="MainSearchFrm"]{
	display: inline-block;
}
#search_ {
	width: 400px;
	height: 50px;
	/* margin-left: 200px; */
	margin-left: 11%;
	border: 2px solid blue;
}

#search2 {
	padding: 10px;
}

#nav-item1 {
	border-left: 1px solid lightgray;
}

.nav-link {
	border-right: 1px solid lightgray;
}

#button_ {
	background: white;
}

.nav-link:hover {
	color: #7151FC;
	border-bottom: 2px solid #7151FC;
}

#container {
	padding-left: 45%;
	border: 0px;
}

#box-link {
	display: flex;
	justify-content: space-between;
	background-color: rgb(246, 241, 252);
	border-radius: 5px;
	height: 30px;
}

#box-link>div {
	width: 100px;
	text-align: center;
	padding-top: 4px;
	border-right: 1px solid white;
}

#box-link a {
	text-decoration: none;
}

#box-link a:hover {
	color: white;
}

#collapseExample {
	width: 260px;
	margin-left: -40px;
}

#button_ {
	cursor: pointer;
	background-color: inherit;
}
.item-link{
	color:gray;
}

</style>

</head>
<body>
	<div id="container">
		<div id="box-link">
			<c:if test="${memberLoggedIn != null }">
				<div id="box-link5">
					<c:if test="${memberLoggedIn.memberIsAdmin != null }">
						<a class="item-link"
							href="${pageContext.request.contextPath }/admin/adminView.do">관리자페이지</a>
					</c:if>
				</div>
				<div id="box-link4">
					<i class="fa fa-truck"></i> <a class="item-link" id="gotobasket"
						href="${pageContext.request.contextPath }/item/basket.do">장바구니</a>
				</div>
			</c:if>
			<div class="box-link1">
				<c:if test="${memberLoggedIn == null }">
					<a class="item-link"
						href="${pageContext.request.contextPath }/member/memberMoveLogin.do">로그인</a>
				</c:if>
				<c:if test="${memberLoggedIn != null }">
					<a class="item-link" id="logout"
						href="${pageContext.request.contextPath }/member/memberLogout.do">로그아웃</a>
				</c:if>
			</div>
			<div class="box-link2">
				<c:if test="${memberLoggedIn == null }">
					<a class="item-link"
						href="${pageContext.request.contextPath }/member/memberEnroll.do">회원가입</a>
				</c:if>
				<c:if test="${memberLoggedIn != null }">
					<a id="button_" data-toggle="collapse"
						data-target="#collapseExample" aria-expanded="false"
						aria-controls="collapseExample"> 마이페이지 </a>
					<div class="collapse" id="collapseExample">
						<div class="card card-body">
							<div>
								<a class="item-link"
									href="${pageContext.request.contextPath }/mypage/order.do">마이페이지</a>
							</div>
							<div>
								<a href="${pageContext.request.contextPath}/mypage/order.do"
									style="color: red"><strong>판매내역</strong></a>|<a
									href="${pageContext.request.contextPath}/mypage/purchases.do"
									style="color: orange">구매내역</a>|<a
									href="${pageContext.request.contextPath}/mypage/bookmarks.do"
									style="color: green">찜한상품</a>| <a
									href="${pageContext.request.contextPath}/mypage/coupons.do"
									style="color: blue"><strong>쿠폰</strong></a>|<a
									href="${pageContext.request.contextPath}/mypage/profile/credit.do"
									style="color: purple"><strong>프로모션</strong></a>|<a
									href="${pageContext.request.contextPath}/mypage/profile/edit.do"
									style="color: pink">내정보</a>|<a
									href="${pageContext.request.contextPath}/mypage/wishlist.do"
									style="color: black"><strong>알림설정</strong></a>
							</div>
						</div>
					</div>
				</c:if>
			</div>
			<div class="box-link3">
				<a class="item-link"
					href="${pageContext.request.contextPath}/customercenter/ccintro.do">고객센터▼</a>
			</div>

		</div>
	</div>
	<div id="header-container">
		<img src="${pageContext.request.contextPath }/resources/images/Getit_.PNG" width="200px" height="80px">
		<form action="${pageContext.request.contextPath }/item/search" name="MainSearchFrm">
			<input type="text" name="searchKeyword" placeholder="상품명으로 검색해보세요." id="search_" /> 
		<a href="${pageContext.request.contextPath }/item/search">
			<i class="fa fa-search" id="search2"></i>
		</a>
		</form>
	</div>
	<script>
	$("#search_").on('keyup',function(){
		var myData = JSON.stringify($("#search_").val().trim());
		console.log(myData);
		$.ajax({
			url: "${pageContext.request.contextPath}/item/searchPad",
			method: "get",
			data: {"myData":myData},
			success: function(data){
				console.log(data);
			},
			error: function(){
				console.log("ajax 요청 에러!!");
			}
		});
	});
	</script>
	<!--https://getbootstrap.com/docs/4.1/components/navbar/-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light" id="center_">
		<a class="navbar-brand" href="#"> <img
			src="${pageContext.request.contextPath }/resources/images/Getit_.PNG"
			alt="스프링로고" width="50px" style="border-radius: 50px;" />
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<!--     좌우정렬위해 .mr-auto추가 -->
			<ul class="navbar-nav mr-auto">
				<li class="nav-item" id="nav-item1"><a class="nav-link"
					href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false">전체 카테고리</a>
					<div class="dropdown-menu" aria-labelledby="dropdown	MenuLink">

					</div></li>
				<li class="nav-item"><a class="nav-link" href="#">관심상품</a></li>
				<li class="nav-item"><a class="nav-link" href="#">추천상품</a></li>
				<li class="nav-item"><a class="nav-link" href="#">추가할인</a></li>
				<li class="nav-item"><a class="nav-link" href="#">새로 등록된 상품</a></li>
				<li class="nav-item"><a class="nav-link" href="#">판매예정상품</a></li>
			</ul>
		</div>
		<a class="nav-link"
			href="${pageContext.request.contextPath}/thing/thing.do">안쓰는 물건
			판매하기</a>
	</nav>

	<!-- 로그인모달 : https://getbootstrap.com/docs/4.1/components/modal/#live-demo -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">로그인</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<!--로그인폼 : https://getbootstrap.com/docs/4.1/components/forms/#overview -->
				<form
					action="${pageContext.request.contextPath}/member/memberLogin.do"
					method="post">
					<div class="modal-body">
						<input type="text" class="form-control" name="memberId"
							placeholder="아이디" required> <br /> <input
							type="password" class="form-control" name="password"
							placeholder="비밀번호" required>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-outline-success">로그인</button>
						<button type="button" class="btn btn-outline-success"
							data-dismiss="modal">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<section id="content">
		<script>
			function logout() {
				window.locatiom.href = "${pageContext.request.contextPath}/member/memberLogout.do";
			}
			$(document).ready(
					function() {
						var seqMemberNo = ${memberLoggedIn.getSeqMemberNo()};

						$("#gotobasket").attr("href","${pageContext.request.contextPath}/item/basket.do?memberNo="+ seqMemberNo)

					});
		</script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/detail.css" />
<!-- header 끝 -->

	<script>
	 var today;
	$(document).ready(function() {
		 var bidmemberUnq = ${memberLoggedIn.seqMemberNo};
		 var registerUnq = ${detailResult.memberUnq };
		 var edate = '${detailResult.eDate}';
		 var sdate = '${detailResult.sDate}';
		 today = getTime();
		 
		if(bidmemberUnq == registerUnq) {
			document.getElementById("bidInsetBtn").disabled = true;
		}
		if(today>edate) {
			document.getElementById("bidInsetBtn").disabled = true;
			$("#bidPrice").attr("placeholder" ,"이미 종료된 경매입니다.");
			document.all("bidInfo").innerHTML = "<p>마감되었습니다.</p>";
		}
		if(today<sdate) {
			document.getElementById("bidInsetBtn").disabled = true;
			$("#bidPrice").attr("placeholder" ,"진행 예정인 경매입니다.");
			document.all("bidInfo").innerHTML = "<p>입찰대기중</p>";
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
	
	/* 현재 시간을 구하는 함수 */
	function getTime() {
		today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1; //January is 0!
		var yyyy = today.getFullYear();
		var hh = today.getHours();
		var MM = today.getMinutes();
		var ss = today.getSeconds();

		if(dd<10) { dd='0'+dd } 
		if(mm<10) { mm='0'+mm } 
		if(hh<10) { hh='0'+hh }
		
		today = yyyy + '-' + mm+'-'+dd + " " + hh + ":" + MM + ":" + ss;
		return today;
	}
	<%-- 경매 참여	 --%>		
	function biding(aunq,curprice,sdate,edate){
		var today = getTime();
		var unq = aunq;
		var curPrice=curprice;
		var startDate=sdate;
		var endDate =edate;	
		var inputBid =  document.getElementById("bidPrice").value;
		var bidParams = $("#bid").serialize();
	
		if(today<startDate){
			alert('경매진행 대기중 입니다.');
			
		} else if(today>endDate){
			alert('종료 된 경매입니다.');
		} else {
			if(inputBid != null){
				if (inputBid > curPrice){
					$.ajax({
						type: 'POST',
						data: bidParams,
						url:"<c:url value='/kobayDetail_bidInsert'/>",
						dataType: "json",
						success: function(data) {
							if(data.bidResult == "success") {
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
				} else if(inputBid <= curPrice) {
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
	        $("ul.tabs li").removeClass("active").css("color", "#333");
	        //$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
	        $(this).addClass("active").css("color", "#0100FF");
	        $(".tab_content").hide()
	        var activeTab = $(this).attr("rel");
	        
	        $("#" + activeTab).fadeIn()
	    });
	});
		
	<%-- tab이름 지정 --%>
	function fn_tab(name){
		var tabid = name;
		
	}
		
	<%-- 질문 입력 시작 --%>
	function kobayDetail_questionInsert(){
		var content = document.getElementById("qnaContent").value;
		var params = $("#kobayDetail_question").serialize();
		
		if(content == "") {
			alert("질문을 입력해 주세요");
			return;
		}
		$.ajax({
			type: 'POST',
			data: params,
			url: "<c:url value='/kobayDetail_insertQuestion'/>",
			dataType: "json",
			success: function(data) {
				if(data.qnaResult == "success") {
					alert("질문이 등록되었습니다.");
					self.location.reload();
				
				} else {
					alert("다시 시도해 주세요.");	
				}
				
			},
			error: function(error) {
				alert("ersssror: "+error);
			}
			
		});
			
	}
		
	<%-- 수정 /삭제 열기 시작 --%>
	function fn_action(qUnq, actionVal) {
		var questionUnq = qUnq;
		var action = actionVal;
	
		<%-- 질문 수정 팝업 --%>
		if(action=='M') {
			var url = "/kobayDetail_modifyQuestion_popup?qnaUnq="+questionUnq;
			var setting = "width=800,height=200,left=100,top=150";
			
			window.open( url, "post_popup", setting);
			self.location.reload();
		}
			
		<%-- 질문 삭제 --%>	
		if(action=='D'){
			alert('삭제하시겠습니까?');
			var del = "qnaUnq=" + questionUnq + "&delStatus=" + 1;
							
			$.ajax({
				type: 'POST',
				data: del,
				url: "<c:url value='/kobayDetail_deleteQuestion'/>",
				dataType: "json",
				success: function(data) {
					if(data.qnaResult == "success") {
						alert("삭제되었습니다.");
						self.location.reload();	
					} else {
						alert("다시 시도해 주세요.");	
					}
				},
				error: function(error) {
					alert("ersssror: "+error);
				}
			});
		}		   
	}
		
		
	<%-- 답변 달기 --%>
	function qnaAnswer(formID) {
		var params = $("form[id=" +formID +"]").serialize();
		
		$.ajax({
			type: 'POST',
			data: params,
			url: "<c:url value='/kobayDetail_insertAnswer'/>",
			dataType: "json",
			success: function(data) {
				if(data.qnaResult == "success") {
					alert("답변이 등록되었습니다.");
					self.location.reload();
				} else {
					alert("다시 시도해 주세요.");	
				}
			},
			error: function(error) {
				alert("ersssror: "+error);
			}
		});
	}
	
</script>

  <body>
  <c:set var="bidmemberUnq" value="${sessionScope.unq}" />
  <c:set var="registerUnq" value="${detailResult.memberUnq }" />
    <!-- Page Content -->
    <div class="container">
		<div class="kobayDetail_row">     		
		<%-- 경매등록 회원이 보는 화면 시작  --%>
			<div class="kobayDetail_info">
				<div id="image" class="kobayDetail_info_left" >
					<table class="kobayDetail_info_imgtable">
						<tr>
							<td colspan="3" class="kobayDetail_info_mainimg">
								<img src="/upload/${detailResult.aucImageMain}" id="main_img" />
							</td>
						</tr>
						<tr>
							<td class="kobayDetail_info_subimg">
							<c:choose>
								<c:when test="${detailResult.aucImageSub1 ne null}">
									<img src="/upload/${detailResult.aucImageSub1}" onmouseover="showSub('sub1_'+${detailResult.auctionUnq}+'.jpg');" onmouseout="showMain(${detailResult.auctionUnq}+'.jpg');" />
								</c:when>
								<c:otherwise>
									<img src="/upload/null.png" />
								</c:otherwise>
							</c:choose>
							</td>
							<td class="kobayDetail_info_subimg">
							<c:choose>
								<c:when test="${detailResult.aucImageSub2 ne null}">
									<img src="/upload/${detailResult.aucImageSub2}" onmouseover="showSub('sub1_'+${detailResult.auctionUnq}+'.jpg');" onmouseout="showMain(${detailResult.auctionUnq}+'.jpg');" />
								</c:when>
								<c:otherwise>
									<img src="/upload/null.png" />
								</c:otherwise>
							</c:choose>
							</td>
							<td class="kobayDetail_info_subimg">
							<c:choose>
								<c:when test="${detailResult.aucImageSub3 ne null}">
									<img src="/upload/${detailResult.aucImageSub3}" onmouseover="showSub('sub1_'+${detailResult.auctionUnq}+'.jpg');" onmouseout="showMain(${detailResult.auctionUnq}+'.jpg');" />
								</c:when>
								<c:otherwise>
									<img src="/upload/null.png" />
								</c:otherwise>
							</c:choose>
							</td>
						</tr>
					</table>
				</div> <!-- /.end of image div -->
				
				<div id="content" class="kobayDetail_info_rigth">
					<table class="kobayDetail_info_rightinfo">
						<tr>
							<td>[ <c:out value="${detailResult.lCtg}"/> ]</td>
							<td><c:out value="${detailResult.aucTitle}"/></td>

							<c:if test="${bidmemberUnq ne detailResult.memberUnq}">
								<td rowspan="5">
									<div id="bidInfo" class="kobayDetail_bidStamp">
										입찰참여 중<br>
										<c:out value="${myBid.bidPrice}"/>원
									</div>
								</td>
							</c:if>
						</tr>
						<tr>
							<td>경매기간</td>
							<td><c:out value="${detailResult.sDate}"/>  ~  <c:out value="${detailResult.eDate}"/></td>
						</tr>
						<tr>
							<td>시작 가격</td>
							<td><c:out value="${detailResult.sPrice}"/>원</td>
						</tr>
						<tr>
							<td>종료 가격</td>
							<td><c:out value="${detailResult.ePrice}"/>원</td>
						</tr>
						<tr>
							<td>배송정보</td>
							<td>
								<c:if test="${detailResult.deliveryWay eq 0}"><c:out value="배송"/> | <c:out value="${detailResult.deliveryFee}"/>원 (도서산간 별도)</c:if>
								<c:if test="${detailResult.deliveryWay eq 1}"><c:out value="직접 수령"/></c:if>
							</td>
						</tr>
					</table>
					
					<table class="kobayDetail_info_rightbtn">
						<tr>
						 <td>
						  <form name="bid" id="bid">
							<div class="row">
								<c:if test="${bidmemberUnq == registerUnq}">
									<label for="bidPrice" class="mb-0 ml-4 text-danger" style="font-size: 9pt;">
										※ 게시글 등록회원은 경매에 참여 할 수 없습니다.</label>
								</c:if>
								
								<div class="col-lg-8">
									<div class="input-group">				
										<input type="hidden" name="bidmemberUnq" value="${bidmemberUnq }">
										<input type="hidden" name="auctionUnq" value="${detailResult.auctionUnq}">
										<input type="text" class="form-control" id="bidPrice" name="bidPrice" placeholder="현재입찰가 : ${detailResult.bidPrice}">						
										<span class="input-group-btn">
										  <button class="btn btn-primary" type="button" id="bidInsetBtn"
										  onclick="biding('${detailResult.auctionUnq}','${detailResult.bidPrice}','${detailResult.sDate}','${detailResult.eDate}')">경매 참여</button>
										</span>
									</div><!-- /input-group -->
								</div><!-- /.col-lg-6 -->
							</div><!-- /.row -->
						  </form>
						  </td>
						</tr>		
					</table>
				</div><!-- /.end of content -->
			</div><!-- /.end of kobayDetail_info -->
	
		
			<table class="kobayDetail_infotable">
				<tr>
				<td colspan="2">	
					<div id="kobayDetail_tabcontainer">
					    <ul class="tabs">
					        <li class="active" rel="tab1" onclick="fn_tab('#tab1')">상세정보</li>
					        <li rel="tab2" onclick="fn_tab('#tab2')">Q&A</li>
					    </ul>
					    <div class="kobayDetail_tab_container">  
					    	<!-- #tab1 상세정보 탭 내용 시작 -->
					        <div id="tab1" class="tab_content">   
				          		${detailResult.aucDetail}
					        </div> <!-- end of div#tab1 -->   
					  	 	<!-- #tab2 Q&A 탭 내용 시작-->     
					        <div id="tab2" class="tab_content">
					        	<form name="kobayDetail_qna" id="kobayDetail_question">
					        		<!-- 질문 등록 창 게시글 등록자는 보이지 않음-->	
					        		<c:if test="${registerUnq ne bidmemberUnq}">	        	
									<div class="kobayDetail_qnabox">
										<table class="kobayDetail_answertxt">
											<tr>
												<td>
													<input type="hidden" name="memberUnq" value="${registerUnq }">
													<input type="hidden" name="auctionUnq" value="${detailResult.auctionUnq}">
													<input type="hidden" name="questionerUnq" value="${bidmemberUnq}">	
													<textarea id="qnaContent" name="qnaContent" rows='5' class="kobayDetail_answertextarea"></textarea>
												</td>
											</tr>
											<tr>
												<td>
													<input type="checkbox" name="qnaSecret" value="1"> 비밀글 &nbsp
													<input id="questionBtn" type="button" value="문의 하기"  class="btn btn-primary btn-sm" onclick="kobayDetail_questionInsert()">
												</td>
											</tr>
										</table>
									</div> <!-- end of kobayDetail_qnabox -->
									</c:if>
								</form><!-- end of form#kobayDetail_question -->

								<!-- 질문목록 -->
								<div class="kobayDetail_qnalist">
									<table class="kobayDetail_question">
										<c:choose>
											<%-- 질문이 없을 때 --%>
											<c:when test="${qnaResult.isEmpty() }">
												<tr>
													<td class="kobayDetail_question_name"></td>
													<td class="kobayDetail_question_date"></td>
												</tr>
												<tr>
													<td colspan="2" class="kobayDetail_question_content">
														등록된 질문이 없습니다.
													</td>
												</tr>
											</c:when>
											
											<%-- 질문이 있을 때 --%>
											<c:otherwise>
												<c:forEach var="qnalist" items="${qnaResult}" varStatus="status">	
													<c:if test="${qnalist.qnastep eq 0 && qnalist.delstatus eq 0}">
														<tr>
															<td class="kobayDetail_question_name">[질문] <c:out value="${qnalist.questionerunq}"/></td>
															<td class="kobayDetail_question_date"><c:out value="${qnalist.qnardate}"/></td>
														</tr>
														<tr>
															<td colspan="2" class="kobayDetail_question_content">
																<c:out value="${qnalist.qnacontent}"/>
															</td>
														</tr>
													</c:if>
						
													<%-- 게시글 작성자의 답변 --%>
													<c:if test="${registerUnq eq bidmemberUnq && qnalist.qnastep eq 0}">
														<form id="kobayDetail_Answer${status.count }">
															<tr>
																<td colspan="2" class="kobayDetail_question_btn">
																	<a href="#answer${status.count}" class="btn btn-info btn-sm" data-toggle="collapse">답변</a>
																	<div id="answer${status.count}" class="collapse">
																		<input type="hidden" name="memberUnq" value="${registerUnq }">
																		<input type="hidden" name="auctionUnq" value="${detailResult.auctionUnq}">
																		<input type="hidden" name="questionerUnq" value="${bidmemberUnq}">
																		<input type="hidden" name="qnaGroup" value="${qnalist.qnaunq}">
																		<textarea rows='5' class="kobayDetail_answertextarea" name="qnaContent"></textarea>																	
																		<input type="button" value="답변 등록" class="btn btn-danger btn-sm" onclick="qnaAnswer('kobayDetail_Answer${status.count }')">
																	</div>
																</td>
															</tr>
														</form>
													</c:if>
			
													<%-- 질문 수정/삭제 --%>
													<c:if test="${bidmemberUnq eq questionerunq}">
														<tr>
															<td colspan="2" class="kobayDetail_question_btn">
																<input type="button" class="btn btn-warning btn-sm" onclick="fn_action('${qnalist.qnaunq}', 'M')" value="수정"/> /  
																<input type="button" class="btn btn-danger btn-sm" onclick="fn_action('${qnalist.qnaunq}', 'D')" value="삭제"/>
															</td>
														</tr>
													</c:if>
													
													<%-- 질문에 대한 답변 --%>
													<c:if test="${qnalist.qnastep eq 1 && qnalist.delstatus eq 0}">
														<tr>
															<td class="kobayDetail_question_name">└[답변] <c:out value="${qnalist.memberunq}"/></td>
															<td class="kobayDetail_question_date"><c:out value="${qnalist.qnardate}"/></td>
														</tr>
														<tr>
															<td colspan="2" class="kobayDetail_question_content">
																<blockquote>
																<c:out value="${qnalist.qnacontent}"/>
																</blockquote>
															</td>
														</tr>
														
														<%-- 답변 수정/삭제 --%>
														<c:if test="${registerUnq eq bidmemberUnq }">
															<tr>
																<td colspan="2" class="kobayDetail_question_btn">
																	<input type="button" class="btn btn-default btn-sm" onclick="fn_action('${qnalist.qnaunq}', 'M')" value="답변 수정"/>  
																	<input type="button" class="btn btn-danger btn-sm" onclick="fn_action('${qnalist.qnaunq}', 'D')" value="답변 삭제"/>
																</td>
															</tr>
														</c:if>
													</c:if>
						
												</c:forEach>
											</c:otherwise>
										</c:choose>					
									</table><!-- end of table.kobayDetail_question -->
								</div><!-- end of div.kobayDetail_qnalist -->
								
							</div> <!-- end of div#tab2 -->
					    </div><!-- end of div.kobayDetail_tab_container -->
					   
					</div><!-- end of div#kobayDetail_tabcontainer -->
					<!-- #container -->
				</td>
				</tr>
			</table> <!-- end of kobayDetail_infotable -->
    
		</div>
		<!-- kobayDetail_row -->
    </div>
    <!-- /.container -->
    <!-- /.Page Content -->

    <!-- Footer -->


    <!-- Bootstrap core JavaScript -->
    <!-- <script src="../../../../vendor/jquery/jquery.min.js"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.2/umd/popper.min.js"></script>
	<script
    src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
    integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm"
    crossorigin="anonymous"></script>


  </body>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>