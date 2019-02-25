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
#search_ {
    width: 400px;
    height: 50px;
    /* margin-left: 200px; */
    margin-left: 21%;
    border: 2px solid blue;
    margin-bottom: 25px;
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
.box-link1{
border-right: 1px solid lightgray; float: right; width: 7%; height:40px; text-align:center;
}
.box-link2{
border-right: 1px solid lightgray; float: right; width: 10%; height:40px; text-align:center;
}
.box-link3{
border-right: 1px solid lightgray; float: right; width:10%; height:40px; text-align:center;
}
#box-link4{
border-right: 1px solid lightgray; float: right; width:12.5%; height:40px; text-align:center;
}
#box-link5{
border-right: 1px solid lightgray; float: right; width:10%; height:40px; text-align:center;
}
#button_{
	background:white;
	border-color: white;
	outline: 0;
}
#collapseExample{
	position:relative;
	right:210px;
	width:360px;
}
.card-body1 {
    padding: 0px;
}


 	
</style>
</head>
<body>
    <div id="container">
        <div id="box-link">
            <div  class="box-link1" >
                <c:if test="${memberLoggedIn == null }">
                <a class="item-link" href="${pageContext.request.contextPath }/member/memberMoveLogin.do">로그인</a>
                </c:if>
                <c:if test="${memberLoggedIn != null }">
              <a class="item-link" id="logout"href="${pageContext.request.contextPath }/member/memberLogout.do">로그아웃</a> 
          
             
                </c:if>
            </div>
            <div  class="box-link2">
                <c:if test="${memberLoggedIn == null }">
                <a class="item-link" href="${pageContext.request.contextPath }/member/memberEnroll.do">회원가입</a>
                </c:if>
                <c:if test="${memberLoggedIn != null }">
               <a class="item-link" onfocus="blur()" id="button_" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
 				마이페이지▼
 			   </a>
                <div class="collapse" id="collapseExample">
  				<div class="card card-body1">
  				<div><a class="item-link" href="${pageContext.request.contextPath }/mypage/order.do">마이페이지</a></div>
				<div><a href="${pageContext.request.contextPath}/mypage/order.do" style="color:red">판매내역</a>
  				| <a href="${pageContext.request.contextPath}/mypage/purchases.do" style="color:orange">구매내역</a>
  				| <a href="${pageContext.request.contextPath}/mypage/bookmarks.do" style="color:green">찜한상품</a>
  				| <a href="${pageContext.request.contextPath}/mypage/coupons.do" style="color:blue">쿠폰</a> <br />
  				<a href="${pageContext.request.contextPath}/mypage/profile/credit.do" style="color:purple">프로모션</a>
  				| <a href="${pageContext.request.contextPath}/mypage/profile/edit.do" style="color:pink">내 정보</a>
  				| <a href="${pageContext.request.contextPath}/mypage/wishlist.do" style="color:black">알림 설정</a>
				</div>
				</div>
			</div>
                </c:if>
            </div>
            <div  class="box-link3" >
                <a class="item-link" href="${pageContext.request.contextPath}/customercenter/ccintro.do">고객센터▼</a>
            </div>
            <div id="box-link4">
                <i class="fa fa-truck"></i>
                <a class="item-link" href="${pageContext.request.contextPath }/item/basket.do">장바구니▼</a>
            </div>
            <div id="box-link5">
             <c:if test="${memberLoggedIn.memberIsAdmin != null }">
                <a class="item-link" href="${pageContext.request.contextPath }/admin/adminView.do">관리자페이지</a>
                </c:if>
            </div>
        </div>
    </div>
    <br><br>
    <div id="header-container" style="margin-left: 300px;">        
             <input type="text" name="search" placeholder="상품명으로 검색해보세요." id="search_" /> <i class="fa fa-search"
            id="search2"></i>
    </div>
    <!--https://getbootstrap.com/docs/4.1/components/navbar/-->
    <nav class="navbar navbar-expand-lg navbar-light bg-light" id="center_"> 
        <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarNav" aria-controls="navbarNav"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <!--     좌우정렬위해 .mr-auto추가 -->
            <ul class="navbar-nav mr-auto">
                <li class="nav-item" id="nav-item1" >
                <a class="nav-link" href="#" 
                 role="button" id="dropdownMenuLink" 
                 data-toggle="dropdown" aria-haspopup="true" 
                 aria-expanded="false">전체 카테고리</a>
                 <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                 <div>
                 <a class="dropdown-item" href="${pageContext.request.contextPath }/item/item.do">핸드폰</a>
                 <a class="dropdown-item" href="#">Another action</a>
                 <a class="dropdown-item" href="#">Something else here</a>
                 </div>
                 <div>
                 <a class="dropdown-item" href="#">Action</a>
                 <a class="dropdown-item" href="#">Another action</a>
                 <a class="dropdown-item" href="#">Something else here</a>
                 </div>
                 <div>
                 <a class="dropdown-item" href="#">Action</a>
                 <a class="dropdown-item" href="#">Another action</a>
                 <a class="dropdown-item" href="#">Something else here</a>
                 </div>
                 <div>
                 <a class="dropdown-item" href="#">Action</a>
                 <a class="dropdown-item" href="#">Another action</a>
                 <a class="dropdown-item" href="#">Something else here</a>
                 </div>
                 </div>
                 
                 </li>
                <li class="nav-item"><a class="nav-link"
                    href="#">관심상품</a></li>
                <li class="nav-item"><a class="nav-link"
                    href="#">추천상품</a></li>
                <li class="nav-item"><a class="nav-link"
                    href="#">추가할인</a></li>
                <li class="nav-item"><a class="nav-link"
                    href="#">새로 등록된 상품</a></li>
                <li class="nav-item"><a class="nav-link"
                    href="#">판매예정상품</a></li>
            </ul>
        </div>
        <a class="nav-link" href="${pageContext.request.contextPath}/thing/thing.do">안쓰는 물건 판매하기</a> 
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
