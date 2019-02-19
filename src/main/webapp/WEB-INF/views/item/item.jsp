<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Get It :: 중고거래의 중심" name="pageTitle" />
</jsp:include>
<style>
.table-bordered{
	margin-left:42px
}
#item1{
	width:20%;
	height:100px;
}
.font_{
	text-align:center;
}
</style>
<div>
	<h2>카테고리 별 상품들 두는 곳</h2>
</div>
<hr>
<div>
	<h2>인기순, 최신순, 낮은 가격순, 높은 가격순</h2>
</div>
<hr>
<div>
	<table class="table table-bordered" id="item1" style="float:left; width:20%;" >
		<tr>
			<th colspan="2">
			회원 아이디 및 이미지
			</th>
		</tr>
		<tr>
			<th colspan="2">
			<img src="${pageContext.request.contextPath }/resources/images/computer.PNG" id="favorite1" width="175px" height="100px"/>
			</th>
		</tr>
		<tr>
			<th colspan="2">
			<a href="${pageContext.request.contextPath }/item/iteminformation.do">[새상품]애플 데스크탑</a>	
			</th>
		</tr>
		<tr>
			<th colspan="2">
			890,000원
			</th>
		</tr>
		<tr>
			<td colspan="1" class="font_"><a href="${pageContext.request.contextPath }/item/basket.do"><img src="${pageContext.request.contextPath }/resources/images/basket.PNG" width="20px" height="20px"/>장바구니</a></td>
			<td colspan="1" class="font_"><a href="#"><i class="glyphicon glyphicon-thumbs-up"></i>찜하기</a></td>
		</tr>
		
	</table>
	<table class="table table-bordered" id="item2" style="float:left; width:20%;" >
		<tr>
			<th colspan="2">
			회원 아이디 및 이미지
			</th>
		</tr>
		<tr>
			<th colspan="2">
			<img src="${pageContext.request.contextPath }/resources/images/computer.PNG" id="favorite1" width="175px" height="100px"/>
			</th>
		</tr>
		<tr>
			<th colspan="2">
			[새상품]애플 데스크탑
			</th>
		</tr>
		<tr>
			<th colspan="2">
			890,000원
			</th>
		</tr>
		<tr>
			<td colspan="1" class="font_"><a href="#"><img src="${pageContext.request.contextPath }/resources/images/basket.PNG" width="20px" height="20px"/>장바구니</a></td>
			<td colspan="1" class="font_"><a href="#"><i class="glyphicon glyphicon-thumbs-up"></i>찜하기</a></td>
		</tr>
		
	</table>
	<table class="table table-bordered" id="item3" style="float:left; width:20%;" >
		<tr>
			<th colspan="2">
			회원 아이디 및 이미지
			</th>
		</tr>
		<tr>
			<th colspan="2">
			<img src="${pageContext.request.contextPath }/resources/images/computer.PNG" id="favorite1" width="175px" height="100px"/>
			</th>
		</tr>
		<tr>
			<th colspan="2">
			[새상품]애플 데스크탑
			</th>
		</tr>
		<tr>
			<th colspan="2">
			890,000원
			</th>
		</tr>
		<tr>
			<td colspan="1" class="font_"><a href="#"><img src="${pageContext.request.contextPath }/resources/images/basket.PNG" width="20px" height="20px"/>장바구니</a></td>
			<td colspan="1" class="font_"><a href="#"><i class="glyphicon glyphicon-thumbs-up"></i>찜하기</a></td>
		</tr>
		
	</table><table class="table table-bordered" id="item4" style="float:left; width:20%;" >
		<tr>
			<th colspan="2">
			회원 아이디 및 이미지
			</th>
		</tr>
		<tr>
			<th colspan="2">
			<img src="${pageContext.request.contextPath }/resources/images/computer.PNG" id="favorite1" width="175px" height="100px"/>
			</th>
		</tr>
		<tr>
			<th colspan="2">
			[새상품]애플 데스크탑
			</th>
		</tr>
		<tr>
			<th colspan="2">
			890,000원
			</th>
		</tr>
		<tr>
			<td colspan="1" class="font_"><a href="#"><img src="${pageContext.request.contextPath }/resources/images/basket.PNG" width="20px" height="20px"/>장바구니</a></td>
			<td colspan="1" class="font_"><a href="#"><i class="glyphicon glyphicon-thumbs-up"></i>찜하기</a></td>
		</tr>
		
	</table>
	
</div>

<div>
	<table class="table table-bordered" id="item1" style="float:left; width:20%;" >
		<tr>
			<th colspan="2">
			회원 아이디 및 이미지
			</th>
		</tr>
		<tr>
			<th colspan="2">
			<img src="${pageContext.request.contextPath }/resources/images/computer.PNG" id="favorite1" width="175px" height="100px"/>
			</th>
		</tr>
		<tr>
			<th colspan="2">
			[새상품]애플 데스크탑
			</th>
		</tr>
		<tr>
			<th colspan="2">
			890,000원
			</th>
		</tr>
		<tr>
			<td colspan="1" class="font_"><a href="#"><img src="${pageContext.request.contextPath }/resources/images/basket.PNG" width="20px" height="20px"/>장바구니</a></td>
			<td colspan="1" class="font_"><a href="#"><i class="glyphicon glyphicon-thumbs-up"></i>찜하기</a></td>
		</tr>
		
	</table>
	<table class="table table-bordered" id="item2" style="float:left; width:20%;" >
		<tr>
			<th colspan="2">
			회원 아이디 및 이미지
			</th>
		</tr>
		<tr>
			<th colspan="2">
			<img src="${pageContext.request.contextPath }/resources/images/computer.PNG" id="favorite1" width="175px" height="100px"/>
			</th>
		</tr>
		<tr>
			<th colspan="2">
			[새상품]애플 데스크탑
			</th>
		</tr>
		<tr>
			<th colspan="2">
			890,000원
			</th>
		</tr>
		<tr>
			<td colspan="1" class="font_"><a href="#"><img src="${pageContext.request.contextPath }/resources/images/basket.PNG" width="20px" height="20px"/>장바구니</a></td>
			<td colspan="1" class="font_"><a href="#"><i class="glyphicon glyphicon-thumbs-up"></i>찜하기</a></td>
		</tr>
		
	</table>
	<table class="table table-bordered" id="item3" style="float:left; width:20%;" >
		<tr>
			<th colspan="2">
			회원 아이디 및 이미지
			</th>
		</tr>
		<tr>
			<th colspan="2">
			<img src="${pageContext.request.contextPath }/resources/images/computer.PNG" id="favorite1" width="175px" height="100px"/>
			</th>
		</tr>
		<tr>
			<th colspan="2">
			[새상품]애플 데스크탑
			</th>
		</tr>
		<tr>
			<th colspan="2">
			890,000원
			</th>
		</tr>
		<tr>
			<td colspan="1" class="font_"><a href="#"><img src="${pageContext.request.contextPath }/resources/images/basket.PNG" width="20px" height="20px"/>장바구니</a></td>
			<td colspan="1" class="font_"><a href="#"><i class="glyphicon glyphicon-thumbs-up"></i>찜하기</a></td>
		</tr>
		
	</table><table class="table table-bordered" id="item4" style="float:left; width:20%;" >
		<tr>
			<th colspan="2">
			회원 아이디 및 이미지
			</th>
		</tr>
		<tr>
			<th colspan="2">
			<img src="${pageContext.request.contextPath }/resources/images/computer.PNG" id="favorite1" width="175px" height="100px"/>
			</th>
		</tr>
		<tr>
			<th colspan="2">
			[새상품]애플 데스크탑
			</th>
		</tr>
		<tr>
			<th colspan="2">
			890,000원
			</th>
		</tr>
		<tr>
			<td colspan="1" class="font_"><a href="#"><img src="${pageContext.request.contextPath }/resources/images/basket.PNG" width="20px" height="20px"/>장바구니</a></td>
			<td colspan="1" class="font_"><a href="#"><i class="glyphicon glyphicon-thumbs-up"></i>찜하기</a></td>
		</tr>
		
	</table>
	
</div>

<div>
	<table class="table table-bordered" id="item1" style="float:left; width:20%;" >
		<tr>
			<th colspan="2">
			회원 아이디 및 이미지
			</th>
		</tr>
		<tr>
			<th colspan="2">
			<img src="${pageContext.request.contextPath }/resources/images/computer.PNG" id="favorite1" width="175px" height="100px"/>
			</th>
		</tr>
		<tr>
			<th colspan="2">
			[새상품]애플 데스크탑
			</th>
		</tr>
		<tr>
			<th colspan="2">
			890,000원
			</th>
		</tr>
		<tr>
			<td colspan="1" class="font_"><a href="#"><img src="${pageContext.request.contextPath }/resources/images/basket.PNG" width="20px" height="20px"/>장바구니</a></td>
			<td colspan="1" class="font_"><a href="#"><i class="glyphicon glyphicon-thumbs-up"></i>찜하기</a></td>
		</tr>
		
	</table>
	<table class="table table-bordered" id="item2" style="float:left; width:20%;" >
		<tr>
			<th colspan="2">
			회원 아이디 및 이미지
			</th>
		</tr>
		<tr>
			<th colspan="2">
			<img src="${pageContext.request.contextPath }/resources/images/computer.PNG" id="favorite1" width="175px" height="100px"/>
			</th>
		</tr>
		<tr>
			<th colspan="2">
			[새상품]애플 데스크탑
			</th>
		</tr>
		<tr>
			<th colspan="2">
			890,000원
			</th>
		</tr>
		<tr>
			<td colspan="1" class="font_"><a href="#"><img src="${pageContext.request.contextPath }/resources/images/basket.PNG" width="20px" height="20px"/>장바구니</a></td>
			<td colspan="1" class="font_"><a href="#"><i class="glyphicon glyphicon-thumbs-up"></i>찜하기</a></td>
		</tr>
		
	</table>
	<table class="table table-bordered" id="item3" style="float:left; width:20%;" >
		<tr>
			<th colspan="2">
			회원 아이디 및 이미지
			</th>
		</tr>
		<tr>
			<th colspan="2">
			<img src="${pageContext.request.contextPath }/resources/images/computer.PNG" id="favorite1" width="175px" height="100px"/>
			</th>
		</tr>
		<tr>
			<th colspan="2">
			[새상품]애플 데스크탑
			</th>
		</tr>
		<tr>
			<th colspan="2">
			890,000원
			</th>
		</tr>
		<tr>
			<td colspan="1" class="font_"><a href="#"><img src="${pageContext.request.contextPath }/resources/images/basket.PNG" width="20px" height="20px"/>장바구니</a></td>
			<td colspan="1" class="font_"><a href="#"><i class="glyphicon glyphicon-thumbs-up"></i>찜하기</a></td>
		</tr>
		
	</table><table class="table table-bordered" id="item4" style="float:left; width:20%;" >
		<tr>
			<th colspan="2">
			회원 아이디 및 이미지
			</th>
		</tr>
		<tr>
			<th colspan="2">
			<img src="${pageContext.request.contextPath }/resources/images/computer.PNG" id="favorite1" width="175px" height="100px"/>
			</th>
		</tr>
		<tr>
			<th colspan="2">
			[새상품]애플 데스크탑
			</th>
		</tr>
		<tr>
			<th colspan="2">
			890,000원
			</th>
		</tr>
		<tr>
			<td colspan="1" class="font_"><a href="#"><img src="${pageContext.request.contextPath }/resources/images/basket.PNG" width="20px" height="20px"/>장바구니</a></td>
			<td colspan="1" class="font_"><a href="#"><i class="glyphicon glyphicon-thumbs-up"></i>찜하기</a></td>
		</tr>
		
	</table>
	
</div>

<div>
	<table class="table table-bordered" id="item1" style="float:left; width:20%;" >
		<tr>
			<th colspan="2">
			회원 아이디 및 이미지
			</th>
		</tr>
		<tr>
			<th colspan="2">
			<img src="${pageContext.request.contextPath }/resources/images/computer.PNG" id="favorite1" width="175px" height="100px"/>
			</th>
		</tr>
		<tr>
			<th colspan="2">
			[새상품]애플 데스크탑
			</th>
		</tr>
		<tr>
			<th colspan="2">
			890,000원
			</th>
		</tr>
		<tr>
			<td colspan="1" class="font_"><a href="#"><img src="${pageContext.request.contextPath }/resources/images/basket.PNG" width="20px" height="20px"/>장바구니</a></td>
			<td colspan="1" class="font_"><a href="#"><i class="glyphicon glyphicon-thumbs-up"></i>찜하기</a></td>
		</tr>
		
	</table>
	<table class="table table-bordered" id="item2" style="float:left; width:20%;" >
		<tr>
			<th colspan="2">
			회원 아이디 및 이미지
			</th>
		</tr>
		<tr>
			<th colspan="2">
			<img src="${pageContext.request.contextPath }/resources/images/computer.PNG" id="favorite1" width="175px" height="100px"/>
			</th>
		</tr>
		<tr>
			<th colspan="2">
			[새상품]애플 데스크탑
			</th>
		</tr>
		<tr>
			<th colspan="2">
			890,000원
			</th>
		</tr>
		<tr>
			<td colspan="1" class="font_"><a href="#"><img src="${pageContext.request.contextPath }/resources/images/basket.PNG" width="20px" height="20px"/>장바구니</a></td>
			<td colspan="1" class="font_"><a href="#"><i class="glyphicon glyphicon-thumbs-up"></i>찜하기</a></td>
		</tr>
		
	</table>
	<table class="table table-bordered" id="item3" style="float:left; width:20%;" >
		<tr>
			<th colspan="2">
			회원 아이디 및 이미지
			</th>
		</tr>
		<tr>
			<th colspan="2">
			<img src="${pageContext.request.contextPath }/resources/images/computer.PNG" id="favorite1" width="175px" height="100px"/>
			</th>
		</tr>
		<tr>
			<th colspan="2">
			[새상품]애플 데스크탑
			</th>
		</tr>
		<tr>
			<th colspan="2">
			890,000원
			</th>
		</tr>
		<tr>
			<td colspan="1" class="font_"><a href="#"><img src="${pageContext.request.contextPath }/resources/images/basket.PNG" width="20px" height="20px"/>장바구니</a></td>
			<td colspan="1" class="font_"><a href="#"><i class="glyphicon glyphicon-thumbs-up"></i>찜하기</a></td>
		</tr>
		
	</table><table class="table table-bordered" id="item4" style="float:left; width:20%;" >
		<tr>
			<th colspan="2">
			회원 아이디 및 이미지
			</th>
		</tr>
		<tr>
			<th colspan="2">
			<img src="${pageContext.request.contextPath }/resources/images/computer.PNG" id="favorite1" width="175px" height="100px"/>
			</th>
		</tr>
		<tr>
			<th colspan="2">
			[새상품]애플 데스크탑
			</th>
		</tr>
		<tr>
			<th colspan="2">
			890,000원
			</th>
		</tr>
		<tr>
			<td colspan="1" class="font_"><a href="#"><img src="${pageContext.request.contextPath }/resources/images/basket.PNG" width="20px" height="20px"/>장바구니</a></td>
			<td colspan="1" class="font_"><a href="#"><i class="glyphicon glyphicon-thumbs-up"></i>찜하기</a></td>
		</tr>
		
	</table>
	
</div>




<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>