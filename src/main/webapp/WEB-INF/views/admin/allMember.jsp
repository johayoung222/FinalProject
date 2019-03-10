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
	margin-right:15px;
	min-height:600px;
	position:relative;
	margin-left:180px;
	top:-37px;
}
.tableTr td{
	height:70px;
	overflow:hidden;
	white-space : nowrap;
	text-overflow: ellipsis;
}
input[type=submit].btn-block {
    width: 100px;
    color:#007bff;
}
.allmember-nav{
	width:100%;
	padding-right:0px;
}
#tbl-allMember{
	text-align:center;
}

</style>
<br />
<section id="allMember-container" class="allMember-container">
	<nav class="navbar navbar-light bg-light allmember-nav" >
	<span>회원 리스트 조회</span>
	<div id="from">
	  <form class="form-inline" action='${pageContext.request.contextPath }/admin/memberSearch.do?cPage="+${cPage}+"&numPerPage="+${numPerPage}'>
		<select class="form-control" name="type">
  			<option value="member_id" ${type == "member_id"?"selected":""  }>아이디</option>
  			<option value="member_name" ${type == "member_name"?"selected":""  }>이름</option>
		</select>
		&nbsp;&nbsp;
	    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="search" id="search" value=${search }>
	    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
	  </form>
	  </div>
	</nav>
<hr />
	<table id="tbl-allMember" class="table table-striped table-hover" >
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>성별</th>
			<th>생년월일</th>
			<th>주소</th>
			<th>우편번호</th>
			<th>전화번호</th>
			<th>이메일</th>
			<th>관심상품</th>
			
		</tr>
		<c:if test="${empty list }">
		<tr>
			<td colspan="15">게시글이 존재하지 않습니다.</td>
		</tr>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach items="${list }" var="m">
			<tr class="tableTr"  >				
				<td>${m.MEMBER_ID }</td>
				<td>${m.MEMBER_NAME }</td>
				<td>
				${m.GENDER  == 'Y'?"남자":"여자"}				
				</td>
				<td>${m.MEMBER_BIRTH }</td>
				<td>${m.MEMBER_ADDRESS }</td>
				<td>${m.MEMBER_MAIL_NO }</td>
				<td>${m.MEMBER_PHONE }</td>
				<td>${m.MEMBER_EMAIL }</td>
				<td>
					<c:forEach items="${m.MEMBER_INTEREST }" var="l" varStatus="vs">
						${l }${!vs.last?",":"" }
					</c:forEach>
				</td>
				
			</tr>			
			</c:forEach>
		</c:if>
	</table>
	<div class="result" id="allMemberSearch-result"></div>
	<%
		int totalContent = (int)request.getAttribute("totalContents");
		int numPerPage = (int)request.getAttribute("numPerPage");
		int cPage = (int)request.getAttribute("cPage");
		String type = (String)request.getAttribute("type");
		String search = (String)request.getAttribute("search");
		String view = (String)request.getAttribute("view");
	%>
<%= com.kh.spring.common.util.Utils2.getPageBar(totalContent , cPage , numPerPage,type,search , view) %>
</section> 

<script>

$(document).on('click','.tableTr',function(){
	var memberId = $(this).children("td:first").text();
	var win = window.open("${pageContext.request.contextPath}/admin/memberPage.do?memberId="+memberId, "사용자 정보", "width=500,height=600,location=no,status=no,top=100,left=500");
});

</script> 

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>