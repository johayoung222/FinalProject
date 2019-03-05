<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="adminView" name="pageTitle"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/adminSide.jsp"></jsp:include>
<style>
.adminView-container{
	width:1300px;
	height:750px;
	position:relative;
	margin-left:180px;
	top:-37px;
}
</style>
<section class="adminView-container"></section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>