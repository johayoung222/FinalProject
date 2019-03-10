<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding|Nanum+Pen+Script" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param value="" name="pageTitle"/>
</jsp:include>
<%-- <jsp:include page="/WEB-INF/views/common/basketside.jsp"></jsp:include>--%>
<style>
.productList-container{
	position:relative;
	margin-left:180px;
}
.mp-title>h2{
     font-family: 'Nanum Pen Script', cursive;


}
.buy-container{
	float: right;
/* 	margin-left:125%; */

}
#buyButton{

   float: right;
}

.mp-container{
font-family: 'Nanum Gothic', sans-serif;
}
#basketNo{
dispaly:none;
}
.prada{
	height:1px;
}
form[name="basketDelFrm"]{
width:20px;
height:5px;

}
#gotoItem{
	text-decoration: none;
	font-weight: bolder;
}



</style>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypage.css" />

<h2>즐겁게 이용해 주시길 바랍니다</h2>
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>