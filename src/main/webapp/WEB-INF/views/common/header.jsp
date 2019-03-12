<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.2/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
	integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm"
	crossorigin="anonymous"></script>
<!-- 사용자작성 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style.css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
<style>
body{
	width: 100%;
}
[name="MainSearchFrm"]{
	display: inline-block;
}
#search_ {
	width: 400px;
	height: 50px;
    margin-left: 150px; 
	border: 2px solid blue;
}
#search2 {
	padding: 10px;
	position:relative;
	right:50px;
}
#nav-item1 {
	border-left: 1px solid lightgray;
}
.nav-link {
	border-right: 1px solid lightgray;
}
#button_ {
	background: white;
	cursor: pointer;
	background-color: inherit;
}
.nav-link:hover {
	color: #7151FC;
	border-bottom: 2px solid #7151FC;
}
#box-link{
	display: flex;
	justify-content: space-between;
	margin-left: 65%;
	background-color: rgb(246, 241, 252);
	width: 330px;
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
	margin-left: -80px;
	z-index: 1;
}
.item-link{
	color:gray;
}
#searchList{
	width: 400px;
	position: absolute;
	left: 35.3%;
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
#navbarNav ul li{
	width: 130px;	
	text-align: center;
}
.nav-link{
	font-size: 14px;
	border: none;
}
.dropdown-menu{
	background: rgb(250,250,250);
}
#cTable{
	font-family: 'Nanum Gothic', sans-serif;
	background: rgb(250,250,250);
}
#cTable tr td:not(:first-of-type){
	border-left: 1px solid black;
}
#cTable tr th{
	font-family: 'Noto Sans KR', sans-serif;
    background: #5853EB;
    color: white;
	text-align: center;
	font-weight: bolder;
	text-decoration: none;
}
#cTable tr:not(:first-of-type) td ul{
    font-family: 'Nanum Gothic', sans-serif;
	list-style: none;
	padding-left: 10px;
	padding-right: 10px;
}
#cTable tr:not(:first-of-type) td ul:hover{
	background: #368AFF;
 	border-radius:15px;
}
#cTable tr:not(:first-of-type) td ul>a{
	text-decoration: none;
}
#cTable tr:not(:first-of-type) td ul>a:hover{
    font-family: 'Noto Sans KR', sans-serif;
	text-decoration: none;
    color: white;
    font-weight: bolder;
}
</style>

</head>
<body>
	<div id="re-container">
		<div id="box-link">
			<c:if test="${memberLoggedIn != null }">
			<style>
			#box-link{
				width: 430px;
				margin-left: 55%;
				background: rgb(248,248,248);
			}
			</style>
				<c:if test="${memberLoggedIn.memberIsAdmin != null }">
				<style>
				#box-link{
					width: 530px;
					margin-left: 45%;
				}
				</style>
					<div id="box-link5">
						<a class="item-link"
							href="${pageContext.request.contextPath }/admin/adminView.do">관리자페이지</a>
					</div>
				</c:if>
				<div id="box-link4">
					<i class="fa fa-truck"></i> <a class="item-link" id="gotobasket"
						href="${pageContext.request.contextPath }/item/basket.do?memberNo=${memberLoggedIn.getSeqMemberNo()}">장바구니</a>
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
						<div class="card card-body" style="z-index:1;">
							<div>
								<a class="item-link"
									href="${pageContext.request.contextPath }/mypage/order.do">마이페이지</a>
							</div>
							<div>
								<a href="${pageContext.request.contextPath}/mypage/order.do"
									style="color: black">판매내역</a>|<a
									href="${pageContext.request.contextPath}/mypage/purchases.do"
									style="color: black">구매내역</a>|<a
									href="${pageContext.request.contextPath}/item/basket.do?memberNo=${memberLoggedIn.seqMemberNo}"
									style="color: black">장바구니</a>| <a
									href="${pageContext.request.contextPath}/mypage/coupons.do"
									style="color: black">쿠폰</a>|<a
									href="${pageContext.request.contextPath}/mypage/profile/edit.do"
									style="color: black">내정보</a>
							</div>
						</div>
					</div>
				</c:if>
			</div>
			<div class="box-link3">
				<a class="item-link"
					href="${pageContext.request.contextPath}/customercenter/ccintro.do">고객센터</a>
			</div>
		</div>
	</div>

	<div id="header-container">
		<a  href="${pageContext.request.contextPath }"><img src="${pageContext.request.contextPath }/resources/images/Getit_.PNG" width="200px" height="80px"></a>
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
				
				var table = $("<table id='resultList'></table>");
				
				var html = "";
				
				for(i=0; i<data.length; i++){
					html += "<tr><td>"+data[i]['PRODUCT_NAME']+"</td></tr>";
				}
				table.html(html);
				$("#searchList").html(table);
				
				$("#resultList tr td").on('click',function(){
					MainSearchFrm.searchKeyword.value = $(this).html();
					MainSearchFrm.submit();
				});
				
			},
			error: function(){
				console.log("ajax 요청 에러!!");
			}
		});
	});
	</script>
	<!--https://getbootstrap.com/docs/4.1/components/navbar/-->
	<style>
	#navbarNav{
	}
	#navbarNav ul{
	}
	#navbarNav ul li{
		width: 125px;	
		text-align: center;
	}
	.last{
	width: 155px;
	}
	.nav-link{
		font-size: 14px;
		border: none;
	}
	</style>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
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
					<div class="dropdown-menu" aria-labelledby="dropdown MenuLink">
						<table id="cTable" border="0">
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
								<th>
									유아동/출산
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
											<a href="${pageContext.request.contextPath }/category?caKey=C&ciKey=${ct.CATEGORY_MICRO }">
												<li>${ct.CATEGORY_MICRO_NAME }</li>
											</a>
										</ul>
									</c:if>
								</c:forEach>
								</td>
								<td>
								<c:forEach items="${allCategory }" var="ct">
									<c:if test="${ct.CATEGORY_MACRO == 'D' }">
										<ul>
											<a href="${pageContext.request.contextPath }/category?caKey=D&ciKey=${ct.CATEGORY_MICRO }">
												<li>${ct.CATEGORY_MICRO_NAME }</li>
											</a>
										</ul>
									</c:if>
								</c:forEach>
								</td>
								<td>
								<c:forEach items="${allCategory }" var="ct">
									<c:if test="${ct.CATEGORY_MACRO == 'E' }">
										<ul>
											<a href="${pageContext.request.contextPath }/category?caKey=E&ciKey=${ct.CATEGORY_MICRO }">
												<li>${ct.CATEGORY_MICRO_NAME }</li>
											</a>
										</ul>
									</c:if>
								</c:forEach>
								</td>
								<td>
									<c:forEach items="${allCategory }" var="ct">
									<c:if test="${ct.CATEGORY_MACRO == 'F' }">
										<ul>
											<a href="${pageContext.request.contextPath }/category?caKey=F&ciKey=${ct.CATEGORY_MICRO }">
												<li>${ct.CATEGORY_MICRO_NAME }</li>
											</a>
										</ul>
									</c:if>
									</c:forEach>
								</td>
							</tr>
							<tr>
								<th>완구/문구/취미</th>
								<th>해외명품</th>
								<th>도서/음반/DVD</th>
								<th>가구/인테리어</th>
								<th>여행/문화</th>
								<th>생활/건강</th>
							</tr>
							<tr>
								<td>
								<c:forEach items="${allCategory }" var="ct">
									<c:if test="${ct.CATEGORY_MACRO == 'G' }">
										<ul>
											<a href="${pageContext.request.contextPath }/category?caKey=G&ciKey=${ct.CATEGORY_MICRO }">
												<li>${ct.CATEGORY_MICRO_NAME }</li>
											</a>
										</ul>
									</c:if>
								</c:forEach>
								</td>
								<td>
								<c:forEach items="${allCategory }" var="ct">
									<c:if test="${ct.CATEGORY_MACRO == 'H' }">
										<ul>
											<a href="${pageContext.request.contextPath }/category?caKey=H&ciKey=${ct.CATEGORY_MICRO }">
												<li>${ct.CATEGORY_MICRO_NAME }</li>
											</a>
										</ul>
									</c:if>
								</c:forEach>
								</td>
								<td>
								<c:forEach items="${allCategory }" var="ct">
									<c:if test="${ct.CATEGORY_MACRO == 'J' }">
										<ul>
											<a href="${pageContext.request.contextPath }/category?caKey=J&ciKey=${ct.CATEGORY_MICRO }">
												<li>${ct.CATEGORY_MICRO_NAME }</li>
											</a>
										</ul>
									</c:if>
								</c:forEach>
								</td>
								<td>
								<c:forEach items="${allCategory }" var="ct">
									<c:if test="${ct.CATEGORY_MACRO == 'K' }">
										<ul>
											<a href="${pageContext.request.contextPath }/category?caKey=K&ciKey=${ct.CATEGORY_MICRO }">
												<li>${ct.CATEGORY_MICRO_NAME }</li>
											</a>
										</ul>
									</c:if>
								</c:forEach>
								</td>
								<td>
								<c:forEach items="${allCategory }" var="ct">
									<c:if test="${ct.CATEGORY_MACRO == 'L' }">
										<ul>
											<a href="${pageContext.request.contextPath }/category?caKey=L&ciKey=${ct.CATEGORY_MICRO }">
												<li>${ct.CATEGORY_MICRO_NAME }</li>
											</a>
										</ul>
									</c:if>
								</c:forEach>
								</td>
								<td>
								<c:forEach items="${allCategory }" var="ct">
									<c:if test="${ct.CATEGORY_MACRO == 'M' }">
										<ul>
											<a href="${pageContext.request.contextPath }/category?caKey=M&ciKey=${ct.CATEGORY_MICRO }">
												<li>${ct.CATEGORY_MICRO_NAME }</li>
											</a>
										</ul>
									</c:if>
								</c:forEach>
								</td>
							</tr>
						</table>
					</div>
				</li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/item/interest">관심상품</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/item/recommend">추천상품</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/item/brandNew">새로 등록된 상품</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/item/regist">판매예정상품</a></li>
				<li class="nav-item"><a class="nav-link last" href="${pageContext.request.contextPath }/auction/brandNew">새로 등록된 경매상품</a></li>
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
