<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle" />
</jsp:include>
<jsp:include page="/WEB-INF/views/common/mypageSide.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypage.css" />
<div class="real-content-container">
	<div class="mp-container">
		<div class="mp-title">
		내정보
		<!-- 추 후 로그인 시간이 오래 지났을 경우 비밀번호 기입 후 회원정보 수정하도록 만들기 -->
		</div>
		<div class="mypage-profile-body">
			<div class="profedit-body-title">기본정보</div>
					<div class="profedit-body-content">
						<div class="form-group">
							<label for="tel" class="profedit-form-label">전화번호</label>
							<input type="tel" name="tel" class="form-control profedit-form-input ng-pristine ng-valid" id="tel" />
						</div>
						<div class="form-group">	 
							<label for="email" class="profedit-form-label">이메일</label>
							<input type="email" class="form-control profedit-form-input ng-pristine ng-valid" id="email" />
						</div>
					</div>
		</div>
		<div class="mypage-profile-body">
			<div class="profedit-body-title">배송정보</div>
					<div class="profedit-body-content">
						<div class="dropdown">
							<label for="address" class="profedit-form-label">주소</label>
							<input autocomplete="off" class="form-control profedit-addr-form ng-pristine ng-valid" id="address" ng-keypress="keypress($event)" ng-model="addressKeyword" placeholder="읍, 면, 동으로 검색해주세요." type="text">
							<a class="btn profedit-search-btn profedit-search-btn btn-primary" ng-click="searchAddress()">검색</a>  <br />
						</div> 
						<input class="form-control profedit-addr-form ng-pristine ng-valid" ng-model="profile.addr1" placeholder="주소검색을 이용해주세요" readonly="readonly">  <br /> <br />
						<input class="form-control profedit-addr-form ng-pristine ng-valid" id="user-addr2" ng-model="profile.addr2" placeholder="상세주소">
					</div>		
		</div>
		<div class="mypage-profile-body">
			<div class="profedit-body-title">계좌정보</div>
			<div class="form-group"><label class="profedit-form-label">은행명</label><div><select class="form-control profedit-form-input ng-pristine ng-valid" ng-model="profile.bank_name" ng-options="item for item in bankNames"><option value="" selected="selected" label=""></option><option value="0" label="국민은행">국민은행</option><option value="1" label="우리은행">우리은행</option><option value="2" label="NH투자증권">NH투자증권</option><option value="3" label="신한은행">신한은행</option><option value="4" label="신한금융투자">신한금융투자</option><option value="5" label="농협은행">농협은행</option><option value="6" label="KEB하나은행">KEB하나은행</option><option value="7" label="하나대투증권">하나대투증권</option><option value="8" label="기업은행">기업은행</option><option value="9" label="우체국">우체국</option><option value="10" label="대구은행">대구은행</option><option value="11" label="부산은행">부산은행</option><option value="12" label="광주은행">광주은행</option><option value="13" label="전북은행">전북은행</option><option value="14" label="경남은행">경남은행</option><option value="15" label="교보증권">교보증권</option><option value="16" label="대신증권">대신증권</option><option value="17" label="미래에셋대우">미래에셋대우</option><option value="18" label="도이치은행">도이치은행</option><option value="19" label="동부증권">동부증권</option><option value="20" label="메리츠종합금융증권">메리츠종합금융증권</option><option value="21" label="미래에셋증권">미래에셋증권</option><option value="22" label="부국증권">부국증권</option><option value="23" label="산림조합중앙회">산림조합중앙회</option><option value="24" label="산업은행">산업은행</option><option value="25" label="삼성증권">삼성증권</option><option value="26" label="상호저축은행">상호저축은행</option><option value="27" label="새마을금고중앙회">새마을금고중앙회</option><option value="28" label="수협중앙회">수협중앙회</option><option value="29" label="신영증권">신영증권</option><option value="30" label="신협중앙회">신협중앙회</option><option value="31" label="아이엠투자증권">아이엠투자증권</option><option value="32" label="유안타증권">유안타증권</option><option value="33" label="유진투자증권">유진투자증권</option><option value="34" label="이베스트투자증권">이베스트투자증권</option><option value="35" label="제주은행">제주은행</option><option value="36" label="키움증권">키움증권</option><option value="37" label="하이투자증권">하이투자증권</option><option value="38" label="한국씨티은행">한국씨티은행</option><option value="39" label="한국투자증권">한국투자증권</option><option value="40" label="한화투자증권">한화투자증권</option><option value="41" label="현대증권">현대증권</option><option value="42" label="비엔피파리바은행">비엔피파리바은행</option><option value="43" label="BOA은행">BOA은행</option><option value="44" label="현대차투자증권">현대차투자증권</option><option value="45" label="HSBC은행">HSBC은행</option><option value="46" label="제이피모간체이스은행">제이피모간체이스은행</option><option value="47" label="LIG투자증권">LIG투자증권</option><option value="48" label="SC은행">SC은행</option><option value="49" label="SK증권">SK증권</option><option value="50" label="지역농축협">지역농축협</option><option value="51" label="외환은행">외환은행</option><option value="52" label="케이뱅크">케이뱅크</option><option value="53" label="카카오뱅크">카카오뱅크</option></select></div></div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>