<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="allMember" name="pageTitle"/>
</jsp:include>

<jsp:include page="/WEB-INF/views/common/adminSide.jsp"></jsp:include>

<style>
.allMember-container{
	position:absolute;
	margin-left:180px;
}
</style>
<br />
<section id="allMember-container" class="allMember-container">
	<nav class="navbar navbar-light bg-light">
	<p>회원 리스트조회</p>
	  <form class="form-inline">
		<select class="form-control" name="type">
  			<option value="member_id" selected="selected">아이디</option>
  			<option value="member_name">이름</option>
		</select>
		&nbsp;&nbsp;
	    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="search" id="search">
	    <input type="button" class="btn btn-block btn-outline-success btn-send" value="전송" >
	  </form>
	</nav>
<hr />
	<table id="tbl-allMember" class="table table-striped table-hover">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>성별</th>
			<th>나이</th>
			<th>주소</th>
			<th>우편번호</th>
			<th>전화번호</th>
			<th>이메일</th>
			<th>관심상품</th>
			<th>적립포인트</th>
			<th>관리자속성</th>
			<th>판매자번호</th>
			<th>sns연동여부</th>
			<th>신고제제여부</th>
			<th>휴먼계정여부</th>
		</tr>
		<c:if test="${empty list }">
		<tr>
			<td colspan="15">게시글이 존재하지 않습니다.</td>
		</tr>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach items="${list }" var="m">
			<tr>				
				<th>${m.MEMBER_ID }</th>
				<th>${m.MEMBER_NAME }</th>
				<th>
				${m.GENDER  == 'Y'?"남자":"여자"}				
				</th>
				<th>${m.MEMBER_BIRTH }</th>
				<th>${m.MEMBER_ADDRESS }</th>
				<th>${m.MEMBER_MAIL_NO }</th>
				<th>${m.MEMBER_PHONE }</th>
				<th>${m.MEMBER_EMAIL }</th>
				<td>
					<c:forEach items="${m.MEMBER_INTEREST }" var="l" varStatus="vs">
						${l }${!vs.last?",":"" }
					</c:forEach>
				</td>
				<th>${m.MEMBER_MILEGE }</th>
				<th>${m.MEMBER_ISADMIN }</th>
				<th>${m.MEMBER_SELLER }</th>
				<th>${m.MEMBER_SNS_ACCOUNT }</th>
				<th>${m.MEMBER_REPORT }</th>
				<th>${MEMBER_STATUS }</th>
			</tr>			
			</c:forEach>
		</c:if>
	</table>
	<%
		int totalContent = (int)request.getAttribute("totalContents");
		int numPerPage = (int)request.getAttribute("numPerPage");
		int cPage = (int)request.getAttribute("cPage");
	%>
	<%= com.kh.spring.common.util.Utils.getPageBar(totalContent , cPage , numPerPage , "allMember.do") %>
</section> 
<script>
$("#form-inline .btn-send").on("click",function(){
	alert("클릭했다");
	$("#tbl-allMember").css("display","none");
	
	$.ajax({
		url:"${pageContext.request.contextPath}/admin/memberSearch.do",
		data:$("#form-inline").serialize(),
		dataType:"json",
		type:"get",
		success : function(data){
			alert("ajax 성공!!");
			 console.log(data);
             var html = "<table class=table>";
             html+="<tr><th>제품코드</th><th>상품명</th><th>매출액</th><th>판매량</th><th>구매자아이디</th><th>상품카테고리</th><th>주문번호</th></tr>";
             for(var i in data){
                 html += "<tr><td>"+data[i].productNo+"</td>";
                 html += "<td>"+data[i].productName+"</td>";
                 html += "<td>"+data[i].productIoPrice+"</td>";
                 html += "<td>"+data[i].productIoAmount+"</td>";
                 html += "<td>"+data[i].productBuyer+"</td>";
                 html += "<td>"+data[i].productCategory+"</td>";
                 html += "<td>"+data[i].productOrderNo+"</td></tr>";
             }
             html+="</table>";
             $("#paidProductSearch-result").html(html);
		},error:function(){
			console.log("ajax요청 오류!!");
		}
		
	});
	
});
</script> 

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>