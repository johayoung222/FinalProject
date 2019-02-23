<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="추천메뉴" name="pageTitle"/>
</jsp:include>
<style>
div#menu-container{text-align:center;}
div.menu-test{width:50%; margin:0 auto; text-align:center;}
div.result{width:70%; margin:0 auto;}
</style>
<div id="menu-container">
	<div class="menu-test">
		<h4>추천메뉴(GET)</h4>
		<form id="menuRecommendationFrm">
			<div class="form-check form-check-inline">
				<input type="radio" class="form-check-input" name="foodType" id="kr" value="kr" checked>
				<label for="kr" class="form-check-label">한식</label>&nbsp;
				<input type="radio" class="form-check-input" name="foodType" id="ch" value="ch">
				<label for="ch" class="form-check-label">중식</label>&nbsp;
				<input type="radio" class="form-check-input" name="foodType" id="jp" value="jp">
				<label for="jp" class="form-check-label">일식</label>&nbsp;
			</div>
			<br />
			<div class="form-check form-check-inline">
				<input type="radio" class="form-check-input" name="taste" id="hot" value="hot" checked>
				<label for="hot" class="form-check-label">매운맛</label>&nbsp;
				<input type="radio" class="form-check-input" name="taste" id="mild" value="mild">
				<label for="mild" class="form-check-label">순한맛</label>
			</div>
			<br />
			<input type="button" class="btn btn-block btn-outline-success btn-send" value="전송" >
		</form>
	</div>
	<div class="result" id="menuRecommendation-result"></div>
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>