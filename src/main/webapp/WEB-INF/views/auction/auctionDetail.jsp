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
	<script id="_waufcp">var _wau = _wau || []; _wau.push(["dynamic", "qf4dx0ul5a", "fcp", "ead1dc434343", "small"]);</script><script async src="//waust.at/d.js"></script>
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
	<style>
	#searchList{
		width: 400px;
		position: absolute;
		left: 20.4%;
		z-index: 1000;
		background-color: white;
	}
	#searchList table{
		border-collapse: collapse;
		width: 400px;
		border: 1px solid black;
	}
	#searchList table tr:hover{
		background-color: lightgray;
		cursor: pointer;
	}
	</style>
	<div id="header-container">
		<img src="${pageContext.request.contextPath }/resources/images/Getit_.PNG" width="200px" height="80px">
		<form action="${pageContext.request.contextPath }/item/search" name="MainSearchFrm">
			<input type="text" name="searchKeyword" placeholder="상품명으로 검색해보세요." id="search_" autocomplete="off" />
			<div class="searchList" id="searchList"></div>
			<a href="${pageContext.request.contextPath }/item/search">
				<i class="fa fa-search" id="search2"></i>
			</a>
		</form>
	</div>
	<script>
	$("#search_").on('keyup',function(){
		var myData = $("#search_").val().trim();
		
		if(myData == ""){
			return;
		}
		console.log(myData);
		$.ajax({
			url: "${pageContext.request.contextPath}/item/searchPad",
			method: "get",
			data: "myData="+myData,
			success: function(data){
				console.log(data);
				
				var table = $("<table></table>");
				
				var html = "";
				
				for(i=0; i<data.length; i++){
					html += "<tr><td>"+data[i]['PRODUCT_NAME']+"</td></tr>";
				}
				table.html(html);
				$("#searchList").html(table);
				
			},
			error: function(){
				console.log("ajax 요청 에러!!");
			}
		});
	});
	</script>
	<!--https://getbootstrap.com/docs/4.1/components/navbar/-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light" id="center_">
		<a class="navbar-brand" href="${pageContext.request.contextPath }"> <img
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
				<li class="nav-item" id="nav-item1">
					<a class="nav-link" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">전체 카테고리</a>
					<div class="dropdown-menu" aria-labelledby="dropdown	MenuLink">
						<table>
							<tr>
								<th>
									전자제품
								</th>
								<th>
									패션의류
								</th>
								<th>
									패션잡화
								</th>
								<th>
									화장품/미용
								</th>
								<th>
									스포츠/레저
								</th>
							</tr>
							<tr>
								<td>
								<c:forEach items="${allCategory }" var="ct">
									<c:if test="${ct.CATEGORY_MACRO == 'A' }">
										<ul>
											<a href="${pageContext.request.contextPath }/category?caKey=A&ciKey=${ct.CATEGORY_MICRO }">
												<li>${ct.CATEGORY_MICRO_NAME }</li>
											</a>
										</ul>
									</c:if>
								</c:forEach>
								</td>
								<td>
								<c:forEach items="${allCategory }" var="ct">
									<c:if test="${ct.CATEGORY_MACRO == 'B' }">
										<ul>
											<a href="${pageContext.request.contextPath }/category?caKey=B&ciKey=${ct.CATEGORY_MICRO }">
												<li>${ct.CATEGORY_MICRO_NAME }</li>
											</a>
										</ul>
									</c:if>
								</c:forEach>
								</td>
								<td>
								<c:forEach items="${allCategory }" var="ct">
									<c:if test="${ct.CATEGORY_MACRO == 'C' }">
										<ul>
											<li>${ct.CATEGORY_MICRO_NAME }</li>
										</ul>
									</c:if>
								</c:forEach>
								</td>
								<td>
								<c:forEach items="${allCategory }" var="ct">
									<c:if test="${ct.CATEGORY_MACRO == 'D' }">
										<ul>
											<li>${ct.CATEGORY_MICRO_NAME }</li>
										</ul>
									</c:if>
								</c:forEach>
								</td>
								<td>
								<c:forEach items="${allCategory }" var="ct">
									<c:if test="${ct.CATEGORY_MACRO == 'E' }">
										<ul>
											<li>${ct.CATEGORY_MICRO_NAME }</li>
										</ul>
									</c:if>
								</c:forEach>
								</td>
							</tr>
						</table>
					</div>
				</li>
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
		</script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/detail.css" />
<!-- header 끝 -->
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
								<td rowspan="5">
									<div id="bidInfo" class="Detail_bidStamp">
										입찰참여 중<br>
										<c:out value="${myHistory.PRICE}"/>원
									</div>
								</td>
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
										<input type="hidden" name="MemberNo" value="${memberLoggedIn.seqMemberNo }">
										<input type="hidden" name="auctionUnq" value="${a.AUCTION_NO}">
										<input type="text" class="form-control" id="bidPrice" name="bidPrice" placeholder="현재입찰가 : ${history.PRICE}">						
										<span class="input-group-btn">
										  <button class="btn btn-primary" type="button" id="bidInsetBtn"
										  onclick="biding('${a.AUCTION_NO}','${history.PRICE}','${a.SDATE}','${a.EDATE}')">경매 참여</button>
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
					        <li rel="tab2" onclick="fn_tab('#tab2')">Q&A</li>
					    </ul>
					    <div class="Detail_tab_container">  
					    	<!-- #tab1 상세정보 탭 내용 시작 -->
					        <div id="tab1" class="tab_content">   
				          		${a.AUCTIONDETAIL}
					        </div> <!-- end of div#tab1 -->   
					  	 	<!-- #tab2 Q&A 탭 내용 시작-->     
					        <div id="tab2" class="tab_content">
					        	<form name="Detail_qna" id="Detail_question">
					        		<!-- 질문 등록 창 게시글 등록자는 보이지 않음-->	
					        		<c:if test="${auctionMemberNo ne MemberNo}">	        	
									<div class="Detail_qnabox">
										<table class="Detail_answertxt">
											<tr>
												<td>
													<input type="hidden" name="memberUnq" value="${a.SEQ_MEMBER_NO }">
													<input type="hidden" name="auctionUnq" value="${a.AUCTION_NO}">
													<input type="hidden" name="questionerUnq" value="${memberLoggedIn.seqMemberNo}">	
													<textarea id="qnaContent" name="qnaContent" rows='5' class="Detail_answertextarea"></textarea>
												</td>
											</tr>
											<tr>
												<td>
													<input type="checkbox" name="qnaSecret" value="1"> 비밀글 &nbsp
													<input id="questionBtn" type="button" value="문의 하기"  class="btn btn-primary btn-sm" onclick="Detail_questionInsert()">
												</td>
											</tr>
										</table>
									</div> <!-- end of Detail_qnabox -->
									</c:if>
								</form><!-- end of form#Detail_question -->

								<!-- 질문목록 -->
								<div class="Detail_qnalist">
									<table class="Detail_question">
										<c:choose>
											<%-- 질문이 없을 때 --%>
											<c:when test="${qnaResult.isEmpty() }">
												<tr>
													<td class="Detail_question_name"></td>
													<td class="Detail_question_date"></td>
												</tr>
												<tr>
													<td colspan="2" class="Detail_question_content">
														등록된 질문이 없습니다.
													</td>
												</tr>
											</c:when>
											
											<%-- 질문이 있을 때 --%>
											<c:otherwise>
												<c:forEach var="qnalist" items="${qnaResult}" varStatus="status">	
													<c:if test="${qnalist.qnastep eq 0 && qnalist.delstatus eq 0}">
														<tr>
															<td class="Detail_question_name">[질문] <c:out value="${qnalist.questionerunq}"/></td>
															<td class="Detail_question_date"><c:out value="${qnalist.qnardate}"/></td>
														</tr>
														<tr>
															<td colspan="2" class="Detail_question_content">
																<c:out value="${qnalist.qnacontent}"/>
															</td>
														</tr>
													</c:if>
						
													<%-- 게시글 작성자의 답변 --%>
													<c:if test="${auctionMemberNo eq MemberNo && qnalist.qnastep eq 0}">
														<form id="Detail_Answer${status.count }">
															<tr>
																<td colspan="2" class="Detail_question_btn">
																	<a href="#answer${status.count}" class="btn btn-info btn-sm" data-toggle="collapse">답변</a>
																	<div id="answer${status.count}" class="collapse">
																		<input type="hidden" name="memberUnq" value="${auctionMemberNo }">
																		<input type="hidden" name="auctionUnq" value="${detailResult.auctionUnq}">
																		<input type="hidden" name="questionerUnq" value="${MemberNo}">
																		<input type="hidden" name="qnaGroup" value="${qnalist.qnaunq}">
																		<textarea rows='5' class="Detail_answertextarea" name="qnaContent"></textarea>																	
																		<input type="button" value="답변 등록" class="btn btn-danger btn-sm" onclick="qnaAnswer('Detail_Answer${status.count }')">
																	</div>
																</td>
															</tr>
														</form>
													</c:if>
			
													<%-- 질문 수정/삭제 --%>
													<c:if test="${MemberNo eq questionerunq}">
														<tr>
															<td colspan="2" class="Detail_question_btn">
																<input type="button" class="btn btn-warning btn-sm" onclick="fn_action('${qnalist.qnaunq}', 'M')" value="수정"/> /  
																<input type="button" class="btn btn-danger btn-sm" onclick="fn_action('${qnalist.qnaunq}', 'D')" value="삭제"/>
															</td>
														</tr>
													</c:if>
													
													<%-- 질문에 대한 답변 --%>
													<c:if test="${qnalist.qnastep eq 1 && qnalist.delstatus eq 0}">
														<tr>
															<td class="Detail_question_name">└[답변] <c:out value="${qnalist.memberunq}"/></td>
															<td class="Detail_question_date"><c:out value="${qnalist.qnardate}"/></td>
														</tr>
														<tr>
															<td colspan="2" class="Detail_question_content">
																<blockquote>
																<c:out value="${qnalist.qnacontent}"/>
																</blockquote>
															</td>
														</tr>
														
														<%-- 답변 수정/삭제 --%>
														<c:if test="${auctionMemberNo eq MemberNo }">
															<tr>
																<td colspan="2" class="Detail_question_btn">
																	<input type="button" class="btn btn-default btn-sm" onclick="fn_action('${qnalist.qnaunq}', 'M')" value="답변 수정"/>  
																	<input type="button" class="btn btn-danger btn-sm" onclick="fn_action('${qnalist.qnaunq}', 'D')" value="답변 삭제"/>
																</td>
															</tr>
														</c:if>
													</c:if>
						
												</c:forEach>
											</c:otherwise>
										</c:choose>					
									</table><!-- end of table.Detail_question -->
								</div><!-- end of div.Detail_qnalist -->
								
							</div> <!-- end of div#tab2 -->
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


    <!-- Bootstrap core JavaScript -->
    <!-- <script src="../../../../vendor/jquery/jquery.min.js"></script> -->
  </body>

	<script>
	 var today;
	$(function() {
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
		alert(bidParams);
		if(today<startDate){
			alert('경매진행 대기중 입니다.');
			
		} else if(today>endDate){
			alert('종료 된 경매입니다.');
		} else {
			if(inputBid != null){
				if (Number(inputBid) > Number(curPrice)){
					alert(typeof(inputBid) + " "+typeof(curPrice));
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
				} else if(Number(inputBid) <= Number(curPrice)) {
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
	function Detail_questionInsert(){
		var content = document.getElementById("qnaContent").value;
		var params = $("#Detail_question").serialize();
		
		if(content == "") {
			alert("질문을 입력해 주세요");
			return;
		}
		$.ajax({
			type: 'POST',
			data: params,
			url: "<c:url value='/Detail_insertQuestion'/>",
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
			var url = "/Detail_modifyQuestion_popup?qnaUnq="+questionUnq;
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
				url: "<c:url value='/Detail_deleteQuestion'/>",
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
			url: "<c:url value='/Detail_insertAnswer'/>",
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
	</c:forEach>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.2/umd/popper.min.js"></script>
	<script
    src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
    integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm"
    crossorigin="anonymous"></script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>