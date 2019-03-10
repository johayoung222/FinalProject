<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp">
	<jsp:param value="adminView" name="pageTitle"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/adminSide.jsp"></jsp:include>
<style>
.adminView-container{
	height:750px;
	position:relative;
	margin-left:180px;
	margin-right:15px;
	top:-37px;
}
#image_{
	margin:200px;
}
</style>
<section class="adminView-container">
<img src="${pageContext.request.contextPath }/resources/images/Getitadmin.PNG" width="400px" height="200px" id="image_">


</section>



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>