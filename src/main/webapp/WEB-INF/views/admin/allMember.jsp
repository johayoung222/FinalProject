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


<section id="allMember-container" class="allMember-container">
	
	<nav class="navbar navbar-light bg-light">
	<p>회원 리스트조회</p>
	  <form class="form-inline" action='${pageContext.request.contextPath }/admin/memberSearch.do?cPage="+${cPage}+"&numPerPage="+${numPerPage}'>
		<select class="form-control" name="type">
  			<option value="member_id" ${type == "member_id"?"selected":""  }>아이디</option>
  			<option value="member_name" ${type == "member_name"?"selected":""  }>이름</option>
		</select>
		&nbsp;&nbsp;
	    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="search" id="search" value=${search}>
	    <input type="submit" class="btn btn-block btn-outline-success btn-send" value="전송" >
	  </form>
	</nav>
<hr />
	<table id="tbl-allMember" class="table table-striped table-hover" >
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
				<td>${m.MEMBER_MILEGE }</td>
				<td>${m.MEMBER_ISADMIN }</td>
				<td>${m.MEMBER_SELLER }</td>
				<td>${m.MEMBER_SNS_ACCOUNT }</td>
				<td>${m.MEMBER_REPORT }</td>
				<td>${MEMBER_STATUS }</td>
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
	<%= com.kh.spring.common.util.Utils2.getPageBar(totalContent , cPage , numPerPage ,type,search, view) %>

</section> 

<script>
/*
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
             html+="<tr><th>아이디</th><th>이름</th><th>성별</th><th>나이</th><th>주소</th><th>우편번호</th><th>전화번호</th><th>이메일</th><th>관심상품</th><th>적립포인트</th><th>관리자속성</th><th>판매자번호</th><th>sns연동여부</th><th>신고제제여부</th><th>휴면계정여부</th></tr>";
             for(var i in data){
                 html += "<tr><td>"+data[i].seq_member_no+"</td>";
                 html += "<td>"+data[i].memeberId+"</td>";
                 html += "<td>"+data[i].memberPassword+"</td>";
                 html += "<td>"+data[i].memeberName+"</td>";
                 html += "<td>"+data[i].gender+"</td>";
                 html += "<td>"+data[i].memberBirth+"</td>";
                 html += "<td>"+data[i].memberAddress+"</td>";
                 html += "<td>"+data[i].memberPhone+"</td>";
                 html += "<td>"+data[i].memberInterest+"</td>";
                 html += "<td>"+data[i].memberMilage+"</td>";
                 html += "<td>"+data[i].memberEmail+"</td>";
                 html += "<td>"+data[i].memberIsAdmin+"</td>";
                 html += "<td>"+data[i].memberSeller+"</td>";
                 html += "<td>"+data[i].memberSnsAccount+"</td>";
                 html += "<td>"+data[i].memberReport+"</td>";
                 html += "<td>"+data[i].memberStatus+"</td></tr>";
             }
             html+="</table>";
             $("#allMemberSearch-result-result").html(html);
		},error:function(){
			console.log("ajax요청 오류!!");
		}
		
	});
	
});*/
</script> 

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>