<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param value="Get It :: ${product.productName } 상세보기" name="pageTitle"/>
</jsp:include>

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<style>
.productInfo-container{
	border: 1px solid black;
}
.productInfo-category{
	border: 1px solid black;
}
.productInfo-header{
	border: 1px solid red;
}
.productInfo-header>table{
	margin: 0 auto;
}
</style>


<div class="productInfo-container">
	<div class="productInfo-category">
		<a href="">전자제품</a>
		<img src="" alt="#" />
		<a href="">스마트폰</a>
		<img src="" alt="#" />
	</div>
	
<div class="productInfo-header">

	<table border="1">
		<tr>
			<td>
				<img src="" alt="${product.productName } 이미지" width="340" height="300" >
			</td>
			<td>
			 	<table border="1" style="height:300px; width:400px;">
			 		<tr align="center">
			 			<td>판매자</td>
			 			<td>${member.memberName }</td>
			 		</tr>
			 		<tr align="center">
			 			<td>상품명</td>
			 			<td>${product.productName}</td>
			 		</tr>
			 		<tr align="center">
			 			<td>가격</td>
			 			 <td><fmt:formatNumber pattern="###,###" value="${product.productPrice }" />원</td>
			 		</tr>
			 		<tr align="center">
			 			<td>상품소개</td>
			 			<td>${product.productDescription}</td>
			 		</tr>
			 		<tr align="center">
			 			<td>수량</td>
			 			<td>1</td>
			 		</tr>
			 		<tr align="center">
			 			<td colspan="2">
			 				<button onclick="">장바구니 담기</button>
			 				<button onclick="location.href='${pageContext.request.contextPath}/item/perchase/${product.seqProductNo }'">구매하기</button>
			 			</td>
			 		</tr>
			 	</table>
			</td>
		</tr>
	</table>
</div><!-- productInfo-header end -->

<style>
.productInfo-content{
	border: 1px solid red;
}
.productInfo-content>div{
	margin-bottom: 20px;
}
.info-text{
	border: 1px solid black;
}
.info-delivery{
	border: 1px solid black;
}
.product-ask{
	border: 1px solid black;
}
.product-recommend{
	border: 1px solid black;
}
.power-link{
	border: 1px solid black;
}
.ask-header{
	display: flex;
	justify-content: space-between;
}
.ask-content{
	border-top: 1px solid lightgray;
	text-align: center;
}
.ask-comment{
	border: 1px solid red;
	height: 100px;
	text-align: center;
	display: none;
}
.ask-comment textarea{
	resize: none;
}
</style>
<div class="productInfo-content">

	<div class="info-text">상품 정보</div>
	
	<div class="info-delivery">
		<span>배송정보</span><br />
		<span>1. 판매자가 제품을 발송하면 택배사, 송장번호를 안내해드립니다.</span><br />
		<span>2. 결제 후 3일내 판매자가 제품을 발송하지 않으면 거래가 자동 취소됩니다.</span>
	</div>
	
	<div class="product-ask">
		<div class="ask-header">
			<span>상품문의</span>
			<button onclick="ask();">문의하기</button>
		</div>
		<div class="ask-comment">
			<textarea rows="3" cols="100" id="askContent"></textarea>
			<button onclick="itemAsk();">작성</button>
		</div>
		<div class="ask-content">
			<span>문의하신 내역이 없습니다.</span>
		</div>
	</div>
	
	<script>
	function ask(){
		$(".ask-comment").show();
	}
	function itemAsk(){
		var param = {"askContent":$("#askContent").val()};
		
		$.ajax({
			url: "${pageContext.request.contextPath}/item/ask",
			data: param,
			type: "get",
			success: function(data){
				console.log(data);
			},
			error: function(){
				console.log("ajax요청 에러!");
			}
		});
	}
	</script>
	
	<div class="product-recommend">이런 상품은 어때요?</div>
	
	<div class="power-link" ng-app="">
		<div class="naver-ads ng-scope" id="naver-ads" ng-controller="NaverAdsCtrl">
			<div class="ad-header">파워링크
				<span class="iconsp ico_ad">ad</span>
			</div>
			<div class="ad-content">
			<div class="ad-content-area">
				<div class="ad-item ng-scope" ng-if="$index < 3" ng-repeat="ad in ads">
					<div class="ad-item-no ng-binding">1</div>
					<div class="ad-item-content">
						<div class="ad-item-title">
							<a ng-href="https://adcr.naver.com/adcr?x=aO0qfOc4JdSL4d0VM+zbiP///w==kB8hap5haeGkBKBEw116VYIYNGNx0jnmzQ2WD3EP7dDVf6w3B3j94kibD6lC1yH01BQT4E34SNZgtIWrv/NPeeMfsRwuRlNDFFNf4X3b/fS6h4xprS2yZMkv7zvVYB2tZfxiU4adScnDn9SMTiLdyn8cE24xMAKJ7xttJJEdkAZKPzZ9k7WlRMiJlLN77aE3LHtIYa7XyubnCmZVcd6bJ0jJ0s1qG51ZQO/hgojQHf/PtqOEYFdjtSOdsgmX9BF+n/MnRSs77X/ck4/AHrXUsHsgBfCikLpR6kK89xg4aFPxtkjw00FI1DNdeT7pe9Iha4L/e9vI3nC4d7N0gtQRxMH7H7stP1iv4k5/Aaq0pY4Dzs8roQGv98+CRGba7sFS+NgYWpGb2xuBT/hP+VOY3YfsiEA+wHa/l+LCMWvIAEBOFMyu7F3g63j6IrmxnSHX8vVgesx/+XhEfelj0lmhd/tMNOc0Oi/StwtJcvwjYZCP1sbvujCqgP/GstY7n34DV7P1UpCyvKZpBrL4QZQadcPZhD7PCHIu65Bxu+aaEdyqTTx5EI4p8sfLSYNVpcTab3fvnSV/jTNXGbv5LhYXMBuHTiLOtJ+AeLbL3ta4adFg=" target="_blank" class="ng-binding" href="https://adcr.naver.com/adcr?x=aO0qfOc4JdSL4d0VM+zbiP///w==kB8hap5haeGkBKBEw116VYIYNGNx0jnmzQ2WD3EP7dDVf6w3B3j94kibD6lC1yH01BQT4E34SNZgtIWrv/NPeeMfsRwuRlNDFFNf4X3b/fS6h4xprS2yZMkv7zvVYB2tZfxiU4adScnDn9SMTiLdyn8cE24xMAKJ7xttJJEdkAZKPzZ9k7WlRMiJlLN77aE3LHtIYa7XyubnCmZVcd6bJ0jJ0s1qG51ZQO/hgojQHf/PtqOEYFdjtSOdsgmX9BF+n/MnRSs77X/ck4/AHrXUsHsgBfCikLpR6kK89xg4aFPxtkjw00FI1DNdeT7pe9Iha4L/e9vI3nC4d7N0gtQRxMH7H7stP1iv4k5/Aaq0pY4Dzs8roQGv98+CRGba7sFS+NgYWpGb2xuBT/hP+VOY3YfsiEA+wHa/l+LCMWvIAEBOFMyu7F3g63j6IrmxnSHX8vVgesx/+XhEfelj0lmhd/tMNOc0Oi/StwtJcvwjYZCP1sbvujCqgP/GstY7n34DV7P1UpCyvKZpBrL4QZQadcPZhD7PCHIu65Bxu+aaEdyqTTx5EI4p8sfLSYNVpcTab3fvnSV/jTNXGbv5LhYXMBuHTiLOtJ+AeLbL3ta4adFg=">비교사이트No1 인터넷1번가</a>
							<span class="iconsp ico_ad_mobile" ng-show="ad.isMobile"></span>
						</div>
						<div class="ad-item-url">
							<a ng-href="https://adcr.naver.com/adcr?x=aO0qfOc4JdSL4d0VM+zbiP///w==kB8hap5haeGkBKBEw116VYIYNGNx0jnmzQ2WD3EP7dDVf6w3B3j94kibD6lC1yH01BQT4E34SNZgtIWrv/NPeeMfsRwuRlNDFFNf4X3b/fS6h4xprS2yZMkv7zvVYB2tZfxiU4adScnDn9SMTiLdyn8cE24xMAKJ7xttJJEdkAZKPzZ9k7WlRMiJlLN77aE3LHtIYa7XyubnCmZVcd6bJ0jJ0s1qG51ZQO/hgojQHf/PtqOEYFdjtSOdsgmX9BF+n/MnRSs77X/ck4/AHrXUsHsgBfCikLpR6kK89xg4aFPxtkjw00FI1DNdeT7pe9Iha4L/e9vI3nC4d7N0gtQRxMH7H7stP1iv4k5/Aaq0pY4Dzs8roQGv98+CRGba7sFS+NgYWpGb2xuBT/hP+VOY3YfsiEA+wHa/l+LCMWvIAEBOFMyu7F3g63j6IrmxnSHX8vVgesx/+XhEfelj0lmhd/tMNOc0Oi/StwtJcvwjYZCP1sbvujCqgP/GstY7n34DV7P1UpCyvKZpBrL4QZQadcPZhD7PCHIu65Bxu+aaEdyqTTx5EI4p8sfLSYNVpcTab3fvnSV/jTNXGbv5LhYXMBuHTiLOtJ+AeLbL3ta4adFg=" target="_blank" class="ng-binding" href="https://adcr.naver.com/adcr?x=aO0qfOc4JdSL4d0VM+zbiP///w==kB8hap5haeGkBKBEw116VYIYNGNx0jnmzQ2WD3EP7dDVf6w3B3j94kibD6lC1yH01BQT4E34SNZgtIWrv/NPeeMfsRwuRlNDFFNf4X3b/fS6h4xprS2yZMkv7zvVYB2tZfxiU4adScnDn9SMTiLdyn8cE24xMAKJ7xttJJEdkAZKPzZ9k7WlRMiJlLN77aE3LHtIYa7XyubnCmZVcd6bJ0jJ0s1qG51ZQO/hgojQHf/PtqOEYFdjtSOdsgmX9BF+n/MnRSs77X/ck4/AHrXUsHsgBfCikLpR6kK89xg4aFPxtkjw00FI1DNdeT7pe9Iha4L/e9vI3nC4d7N0gtQRxMH7H7stP1iv4k5/Aaq0pY4Dzs8roQGv98+CRGba7sFS+NgYWpGb2xuBT/hP+VOY3YfsiEA+wHa/l+LCMWvIAEBOFMyu7F3g63j6IrmxnSHX8vVgesx/+XhEfelj0lmhd/tMNOc0Oi/StwtJcvwjYZCP1sbvujCqgP/GstY7n34DV7P1UpCyvKZpBrL4QZQadcPZhD7PCHIu65Bxu+aaEdyqTTx5EI4p8sfLSYNVpcTab3fvnSV/jTNXGbv5LhYXMBuHTiLOtJ+AeLbL3ta4adFg=">http://www.internet1st.kr</a>
						</div>
						<div class="ad-item-desc">
							<a ng-href="https://adcr.naver.com/adcr?x=aO0qfOc4JdSL4d0VM+zbiP///w==kB8hap5haeGkBKBEw116VYIYNGNx0jnmzQ2WD3EP7dDVf6w3B3j94kibD6lC1yH01BQT4E34SNZgtIWrv/NPeeMfsRwuRlNDFFNf4X3b/fS6h4xprS2yZMkv7zvVYB2tZfxiU4adScnDn9SMTiLdyn8cE24xMAKJ7xttJJEdkAZKPzZ9k7WlRMiJlLN77aE3LHtIYa7XyubnCmZVcd6bJ0jJ0s1qG51ZQO/hgojQHf/PtqOEYFdjtSOdsgmX9BF+n/MnRSs77X/ck4/AHrXUsHsgBfCikLpR6kK89xg4aFPxtkjw00FI1DNdeT7pe9Iha4L/e9vI3nC4d7N0gtQRxMH7H7stP1iv4k5/Aaq0pY4Dzs8roQGv98+CRGba7sFS+NgYWpGb2xuBT/hP+VOY3YfsiEA+wHa/l+LCMWvIAEBOFMyu7F3g63j6IrmxnSHX8vVgesx/+XhEfelj0lmhd/tMNOc0Oi/StwtJcvwjYZCP1sbvujCqgP/GstY7n34DV7P1UpCyvKZpBrL4QZQadcPZhD7PCHIu65Bxu+aaEdyqTTx5EI4p8sfLSYNVpcTab3fvnSV/jTNXGbv5LhYXMBuHTiLOtJ+AeLbL3ta4adFg=" target="_blank" class="ng-binding" href="https://adcr.naver.com/adcr?x=aO0qfOc4JdSL4d0VM+zbiP///w==kB8hap5haeGkBKBEw116VYIYNGNx0jnmzQ2WD3EP7dDVf6w3B3j94kibD6lC1yH01BQT4E34SNZgtIWrv/NPeeMfsRwuRlNDFFNf4X3b/fS6h4xprS2yZMkv7zvVYB2tZfxiU4adScnDn9SMTiLdyn8cE24xMAKJ7xttJJEdkAZKPzZ9k7WlRMiJlLN77aE3LHtIYa7XyubnCmZVcd6bJ0jJ0s1qG51ZQO/hgojQHf/PtqOEYFdjtSOdsgmX9BF+n/MnRSs77X/ck4/AHrXUsHsgBfCikLpR6kK89xg4aFPxtkjw00FI1DNdeT7pe9Iha4L/e9vI3nC4d7N0gtQRxMH7H7stP1iv4k5/Aaq0pY4Dzs8roQGv98+CRGba7sFS+NgYWpGb2xuBT/hP+VOY3YfsiEA+wHa/l+LCMWvIAEBOFMyu7F3g63j6IrmxnSHX8vVgesx/+XhEfelj0lmhd/tMNOc0Oi/StwtJcvwjYZCP1sbvujCqgP/GstY7n34DV7P1UpCyvKZpBrL4QZQadcPZhD7PCHIu65Bxu+aaEdyqTTx5EI4p8sfLSYNVpcTab3fvnSV/jTNXGbv5LhYXMBuHTiLOtJ+AeLbL3ta4adFg=">SKT 요금할인 / 신속설치 / 현금사은품 인터넷1번가</a>
						</div>
					</div>
				</div>
				<div class="ad-item ng-scope" ng-if="$index < 3" ng-repeat="ad in ads">
					<div class="ad-item-no ng-binding">2</div>
					<div class="ad-item-content">
						<div class="ad-item-title">
							<a ng-href="https://adcr.naver.com/adcr?x=oL80xe8FVXiDBg5OwpN3Hf///w==k7nMvb2xjWn5W3kg7mjtIaQ/01Yb7SfAGsYEtKau4jdWAM5TqhdBfJlPYpYgy45OBQP5soq4BklTUcuUEt0wTctHJ3m9WAxRa2lEJERiT2tyWvELJYxoyrurqq+SLtSBJxpi5M5k9b7MxAaJZ/B0QxGJGAnYZ1lYEwx9JEfqolWG/vFIm+iC/GoZcoIFmztA53ozMFsJ74tLJmfkzK0x2zOsky9guRSu1/BVF3V08IQylBCyU6F4PW7ZBKdBOBdb4fXThzO0ntsH2st0o5rFC140BQ7nWyn6Sq34GC4+cGGRm0EJ817JPGhhDhrH1nVvae6rK6SLafaMTJ8ihb3aF5f0Ea6mqj+Uqab4grOm3MTSqT6DZTHHsRM5hXVPWPerxS20iScs7xgGjjhoxFObsEKPSi2xAvCBanc6Cw+O6ENDJFuu41zDn0065qV2llFNdYNiDyHR+ummzm/1m8Ty4Q8y6Qw+aoaBi6y60bJEVZaV69Hjt9ri/JvL5JwJCvRgGOX6BmCtWF+a/elQTf3nmxXXprEW/sM9MHsS7TUA9YoS9fswscTNcKBJsw2Eb/292xizJhQlJkhqDAvG3y7OcscKw8WmXZPya8+QJmnZOk4A=" target="_blank" class="ng-binding" href="https://adcr.naver.com/adcr?x=oL80xe8FVXiDBg5OwpN3Hf///w==k7nMvb2xjWn5W3kg7mjtIaQ/01Yb7SfAGsYEtKau4jdWAM5TqhdBfJlPYpYgy45OBQP5soq4BklTUcuUEt0wTctHJ3m9WAxRa2lEJERiT2tyWvELJYxoyrurqq+SLtSBJxpi5M5k9b7MxAaJZ/B0QxGJGAnYZ1lYEwx9JEfqolWG/vFIm+iC/GoZcoIFmztA53ozMFsJ74tLJmfkzK0x2zOsky9guRSu1/BVF3V08IQylBCyU6F4PW7ZBKdBOBdb4fXThzO0ntsH2st0o5rFC140BQ7nWyn6Sq34GC4+cGGRm0EJ817JPGhhDhrH1nVvae6rK6SLafaMTJ8ihb3aF5f0Ea6mqj+Uqab4grOm3MTSqT6DZTHHsRM5hXVPWPerxS20iScs7xgGjjhoxFObsEKPSi2xAvCBanc6Cw+O6ENDJFuu41zDn0065qV2llFNdYNiDyHR+ummzm/1m8Ty4Q8y6Qw+aoaBi6y60bJEVZaV69Hjt9ri/JvL5JwJCvRgGOX6BmCtWF+a/elQTf3nmxXXprEW/sM9MHsS7TUA9YoS9fswscTNcKBJsw2Eb/292xizJhQlJkhqDAvG3y7OcscKw8WmXZPya8+QJmnZOk4A=">통신연체대납전문 알제이모바일</a>
							<span class="iconsp ico_ad_mobile" ng-show="ad.isMobile"></span>
						</div>
						<div class="ad-item-url">
							<a ng-href="https://adcr.naver.com/adcr?x=oL80xe8FVXiDBg5OwpN3Hf///w==k7nMvb2xjWn5W3kg7mjtIaQ/01Yb7SfAGsYEtKau4jdWAM5TqhdBfJlPYpYgy45OBQP5soq4BklTUcuUEt0wTctHJ3m9WAxRa2lEJERiT2tyWvELJYxoyrurqq+SLtSBJxpi5M5k9b7MxAaJZ/B0QxGJGAnYZ1lYEwx9JEfqolWG/vFIm+iC/GoZcoIFmztA53ozMFsJ74tLJmfkzK0x2zOsky9guRSu1/BVF3V08IQylBCyU6F4PW7ZBKdBOBdb4fXThzO0ntsH2st0o5rFC140BQ7nWyn6Sq34GC4+cGGRm0EJ817JPGhhDhrH1nVvae6rK6SLafaMTJ8ihb3aF5f0Ea6mqj+Uqab4grOm3MTSqT6DZTHHsRM5hXVPWPerxS20iScs7xgGjjhoxFObsEKPSi2xAvCBanc6Cw+O6ENDJFuu41zDn0065qV2llFNdYNiDyHR+ummzm/1m8Ty4Q8y6Qw+aoaBi6y60bJEVZaV69Hjt9ri/JvL5JwJCvRgGOX6BmCtWF+a/elQTf3nmxXXprEW/sM9MHsS7TUA9YoS9fswscTNcKBJsw2Eb/292xizJhQlJkhqDAvG3y7OcscKw8WmXZPya8+QJmnZOk4A=" target="_blank" class="ng-binding" href="https://adcr.naver.com/adcr?x=oL80xe8FVXiDBg5OwpN3Hf///w==k7nMvb2xjWn5W3kg7mjtIaQ/01Yb7SfAGsYEtKau4jdWAM5TqhdBfJlPYpYgy45OBQP5soq4BklTUcuUEt0wTctHJ3m9WAxRa2lEJERiT2tyWvELJYxoyrurqq+SLtSBJxpi5M5k9b7MxAaJZ/B0QxGJGAnYZ1lYEwx9JEfqolWG/vFIm+iC/GoZcoIFmztA53ozMFsJ74tLJmfkzK0x2zOsky9guRSu1/BVF3V08IQylBCyU6F4PW7ZBKdBOBdb4fXThzO0ntsH2st0o5rFC140BQ7nWyn6Sq34GC4+cGGRm0EJ817JPGhhDhrH1nVvae6rK6SLafaMTJ8ihb3aF5f0Ea6mqj+Uqab4grOm3MTSqT6DZTHHsRM5hXVPWPerxS20iScs7xgGjjhoxFObsEKPSi2xAvCBanc6Cw+O6ENDJFuu41zDn0065qV2llFNdYNiDyHR+ummzm/1m8Ty4Q8y6Qw+aoaBi6y60bJEVZaV69Hjt9ri/JvL5JwJCvRgGOX6BmCtWF+a/elQTf3nmxXXprEW/sM9MHsS7TUA9YoS9fswscTNcKBJsw2Eb/292xizJhQlJkhqDAvG3y7OcscKw8WmXZPya8+QJmnZOk4A=">http://rj모바일.net</a>
						</div>
						<div class="ad-item-desc">
							<a ng-href="https://adcr.naver.com/adcr?x=oL80xe8FVXiDBg5OwpN3Hf///w==k7nMvb2xjWn5W3kg7mjtIaQ/01Yb7SfAGsYEtKau4jdWAM5TqhdBfJlPYpYgy45OBQP5soq4BklTUcuUEt0wTctHJ3m9WAxRa2lEJERiT2tyWvELJYxoyrurqq+SLtSBJxpi5M5k9b7MxAaJZ/B0QxGJGAnYZ1lYEwx9JEfqolWG/vFIm+iC/GoZcoIFmztA53ozMFsJ74tLJmfkzK0x2zOsky9guRSu1/BVF3V08IQylBCyU6F4PW7ZBKdBOBdb4fXThzO0ntsH2st0o5rFC140BQ7nWyn6Sq34GC4+cGGRm0EJ817JPGhhDhrH1nVvae6rK6SLafaMTJ8ihb3aF5f0Ea6mqj+Uqab4grOm3MTSqT6DZTHHsRM5hXVPWPerxS20iScs7xgGjjhoxFObsEKPSi2xAvCBanc6Cw+O6ENDJFuu41zDn0065qV2llFNdYNiDyHR+ummzm/1m8Ty4Q8y6Qw+aoaBi6y60bJEVZaV69Hjt9ri/JvL5JwJCvRgGOX6BmCtWF+a/elQTf3nmxXXprEW/sM9MHsS7TUA9YoS9fswscTNcKBJsw2Eb/292xizJhQlJkhqDAvG3y7OcscKw8WmXZPya8+QJmnZOk4A=" target="_blank" class="ng-binding" href="https://adcr.naver.com/adcr?x=oL80xe8FVXiDBg5OwpN3Hf///w==k7nMvb2xjWn5W3kg7mjtIaQ/01Yb7SfAGsYEtKau4jdWAM5TqhdBfJlPYpYgy45OBQP5soq4BklTUcuUEt0wTctHJ3m9WAxRa2lEJERiT2tyWvELJYxoyrurqq+SLtSBJxpi5M5k9b7MxAaJZ/B0QxGJGAnYZ1lYEwx9JEfqolWG/vFIm+iC/GoZcoIFmztA53ozMFsJ74tLJmfkzK0x2zOsky9guRSu1/BVF3V08IQylBCyU6F4PW7ZBKdBOBdb4fXThzO0ntsH2st0o5rFC140BQ7nWyn6Sq34GC4+cGGRm0EJ817JPGhhDhrH1nVvae6rK6SLafaMTJ8ihb3aF5f0Ea6mqj+Uqab4grOm3MTSqT6DZTHHsRM5hXVPWPerxS20iScs7xgGjjhoxFObsEKPSi2xAvCBanc6Cw+O6ENDJFuu41zDn0065qV2llFNdYNiDyHR+ummzm/1m8Ty4Q8y6Qw+aoaBi6y60bJEVZaV69Hjt9ri/JvL5JwJCvRgGOX6BmCtWF+a/elQTf3nmxXXprEW/sM9MHsS7TUA9YoS9fswscTNcKBJsw2Eb/292xizJhQlJkhqDAvG3y7OcscKw8WmXZPya8+QJmnZOk4A=">박스폰, 가개통폰 매입, 최신스마트폰개통, 24시간 상담환영 , SKT</a>
						</div>
					</div>
				</div>
				<div class="ad-item ng-scope" ng-if="$index < 3" ng-repeat="ad in ads">
					<div class="ad-item-no ng-binding">3</div>
					<div class="ad-item-content">
						<div class="ad-item-title">
							<a ng-href="https://adcr.naver.com/adcr?x=SwRJo2apZWKcJl2W+ZPpDv///w==kNRMqauPBwYNaliVcW+iJl/+IkmYM90d9huUsBeQLgth6Mkwo2eyID/kpxafm2ztgPFv2UzRYliu+3G1RqW9hTFt9f5mEVfq+Wl8Ts9ORqc2pVCU3RyxteBM2LUHC+U02H4+FF1yT9AdL+yBHFB8vc2DHg5ceq9nuo/VyMvk34RMVscL6KuNkQClALpolP7kTNkOwlexEs0N6cDAjGNyFGqXEhoeGctxCfVT+DMiZ4PdHq2XffCBUqh14VTlDIn/cm7swYOAzSAeYL4/Z7N/7n+1//81U4CdvVHAqsvHC8SoDS+G9d1s1ADrXzW96rlBadFntAATZNAQa+3tGlOfxzYtqoQjXPQyHLNMHvvCITz9RhI7xMA64rEMbnlMDYyacfxnWGgd+Q12cZ3e1nkqOCcknW42RHe8uF6VcvOkAZETDzQ0CHazYLakiYtrv6TqBVDqDkI8vtnD01lcj45pb62W3NBsX+vCHW92GF5f3t/0OIIWHratPD3xvsCo/4JREaTrSzz+4GBSsZh8zMMsFfiNYTqBDfoLZin3FztEIsn7Yyqy5Cn6J43RC1UYpVFhmS0zO3jldd7w138AFo/EqbGVyf7MPjmYK3XNk6T7uZjEMz+03mYVCqgM0wneVnu9lEuauEKNwBnIHZMcTeAVacYq6R87mOjP7ZyU5teWbz1B+WmwBWnhlPQ/+6uKsT2toIgZ3fbDC2/E+/l04a6qJtaLzoxAByWOSOGH+0bev2bo=" target="_blank" class="ng-binding" href="https://adcr.naver.com/adcr?x=SwRJo2apZWKcJl2W+ZPpDv///w==kNRMqauPBwYNaliVcW+iJl/+IkmYM90d9huUsBeQLgth6Mkwo2eyID/kpxafm2ztgPFv2UzRYliu+3G1RqW9hTFt9f5mEVfq+Wl8Ts9ORqc2pVCU3RyxteBM2LUHC+U02H4+FF1yT9AdL+yBHFB8vc2DHg5ceq9nuo/VyMvk34RMVscL6KuNkQClALpolP7kTNkOwlexEs0N6cDAjGNyFGqXEhoeGctxCfVT+DMiZ4PdHq2XffCBUqh14VTlDIn/cm7swYOAzSAeYL4/Z7N/7n+1//81U4CdvVHAqsvHC8SoDS+G9d1s1ADrXzW96rlBadFntAATZNAQa+3tGlOfxzYtqoQjXPQyHLNMHvvCITz9RhI7xMA64rEMbnlMDYyacfxnWGgd+Q12cZ3e1nkqOCcknW42RHe8uF6VcvOkAZETDzQ0CHazYLakiYtrv6TqBVDqDkI8vtnD01lcj45pb62W3NBsX+vCHW92GF5f3t/0OIIWHratPD3xvsCo/4JREaTrSzz+4GBSsZh8zMMsFfiNYTqBDfoLZin3FztEIsn7Yyqy5Cn6J43RC1UYpVFhmS0zO3jldd7w138AFo/EqbGVyf7MPjmYK3XNk6T7uZjEMz+03mYVCqgM0wneVnu9lEuauEKNwBnIHZMcTeAVacYq6R87mOjP7ZyU5teWbz1B+WmwBWnhlPQ/+6uKsT2toIgZ3fbDC2/E+/l04a6qJtaLzoxAByWOSOGH+0bev2bo=">SKT 옥션</a>
							<span class="iconsp ico_ad_mobile" ng-show="ad.isMobile"></span>
						</div>
						<div class="ad-item-url">
							<a ng-href="https://adcr.naver.com/adcr?x=SwRJo2apZWKcJl2W+ZPpDv///w==kNRMqauPBwYNaliVcW+iJl/+IkmYM90d9huUsBeQLgth6Mkwo2eyID/kpxafm2ztgPFv2UzRYliu+3G1RqW9hTFt9f5mEVfq+Wl8Ts9ORqc2pVCU3RyxteBM2LUHC+U02H4+FF1yT9AdL+yBHFB8vc2DHg5ceq9nuo/VyMvk34RMVscL6KuNkQClALpolP7kTNkOwlexEs0N6cDAjGNyFGqXEhoeGctxCfVT+DMiZ4PdHq2XffCBUqh14VTlDIn/cm7swYOAzSAeYL4/Z7N/7n+1//81U4CdvVHAqsvHC8SoDS+G9d1s1ADrXzW96rlBadFntAATZNAQa+3tGlOfxzYtqoQjXPQyHLNMHvvCITz9RhI7xMA64rEMbnlMDYyacfxnWGgd+Q12cZ3e1nkqOCcknW42RHe8uF6VcvOkAZETDzQ0CHazYLakiYtrv6TqBVDqDkI8vtnD01lcj45pb62W3NBsX+vCHW92GF5f3t/0OIIWHratPD3xvsCo/4JREaTrSzz+4GBSsZh8zMMsFfiNYTqBDfoLZin3FztEIsn7Yyqy5Cn6J43RC1UYpVFhmS0zO3jldd7w138AFo/EqbGVyf7MPjmYK3XNk6T7uZjEMz+03mYVCqgM0wneVnu9lEuauEKNwBnIHZMcTeAVacYq6R87mOjP7ZyU5teWbz1B+WmwBWnhlPQ/+6uKsT2toIgZ3fbDC2/E+/l04a6qJtaLzoxAByWOSOGH+0bev2bo=" target="_blank" class="ng-binding" href="https://adcr.naver.com/adcr?x=SwRJo2apZWKcJl2W+ZPpDv///w==kNRMqauPBwYNaliVcW+iJl/+IkmYM90d9huUsBeQLgth6Mkwo2eyID/kpxafm2ztgPFv2UzRYliu+3G1RqW9hTFt9f5mEVfq+Wl8Ts9ORqc2pVCU3RyxteBM2LUHC+U02H4+FF1yT9AdL+yBHFB8vc2DHg5ceq9nuo/VyMvk34RMVscL6KuNkQClALpolP7kTNkOwlexEs0N6cDAjGNyFGqXEhoeGctxCfVT+DMiZ4PdHq2XffCBUqh14VTlDIn/cm7swYOAzSAeYL4/Z7N/7n+1//81U4CdvVHAqsvHC8SoDS+G9d1s1ADrXzW96rlBadFntAATZNAQa+3tGlOfxzYtqoQjXPQyHLNMHvvCITz9RhI7xMA64rEMbnlMDYyacfxnWGgd+Q12cZ3e1nkqOCcknW42RHe8uF6VcvOkAZETDzQ0CHazYLakiYtrv6TqBVDqDkI8vtnD01lcj45pb62W3NBsX+vCHW92GF5f3t/0OIIWHratPD3xvsCo/4JREaTrSzz+4GBSsZh8zMMsFfiNYTqBDfoLZin3FztEIsn7Yyqy5Cn6J43RC1UYpVFhmS0zO3jldd7w138AFo/EqbGVyf7MPjmYK3XNk6T7uZjEMz+03mYVCqgM0wneVnu9lEuauEKNwBnIHZMcTeAVacYq6R87mOjP7ZyU5teWbz1B+WmwBWnhlPQ/+6uKsT2toIgZ3fbDC2/E+/l04a6qJtaLzoxAByWOSOGH+0bev2bo=">http://www.auction.co.kr</a></div><div class="ad-item-desc"><a ng-href="https://adcr.naver.com/adcr?x=SwRJo2apZWKcJl2W+ZPpDv///w==kNRMqauPBwYNaliVcW+iJl/+IkmYM90d9huUsBeQLgth6Mkwo2eyID/kpxafm2ztgPFv2UzRYliu+3G1RqW9hTFt9f5mEVfq+Wl8Ts9ORqc2pVCU3RyxteBM2LUHC+U02H4+FF1yT9AdL+yBHFB8vc2DHg5ceq9nuo/VyMvk34RMVscL6KuNkQClALpolP7kTNkOwlexEs0N6cDAjGNyFGqXEhoeGctxCfVT+DMiZ4PdHq2XffCBUqh14VTlDIn/cm7swYOAzSAeYL4/Z7N/7n+1//81U4CdvVHAqsvHC8SoDS+G9d1s1ADrXzW96rlBadFntAATZNAQa+3tGlOfxzYtqoQjXPQyHLNMHvvCITz9RhI7xMA64rEMbnlMDYyacfxnWGgd+Q12cZ3e1nkqOCcknW42RHe8uF6VcvOkAZETDzQ0CHazYLakiYtrv6TqBVDqDkI8vtnD01lcj45pb62W3NBsX+vCHW92GF5f3t/0OIIWHratPD3xvsCo/4JREaTrSzz+4GBSsZh8zMMsFfiNYTqBDfoLZin3FztEIsn7Yyqy5Cn6J43RC1UYpVFhmS0zO3jldd7w138AFo/EqbGVyf7MPjmYK3XNk6T7uZjEMz+03mYVCqgM0wneVnu9lEuauEKNwBnIHZMcTeAVacYq6R87mOjP7ZyU5teWbz1B+WmwBWnhlPQ/+6uKsT2toIgZ3fbDC2/E+/l04a6qJtaLzoxAByWOSOGH+0bev2bo=" target="_blank" class="ng-binding" href="https://adcr.naver.com/adcr?x=SwRJo2apZWKcJl2W+ZPpDv///w==kNRMqauPBwYNaliVcW+iJl/+IkmYM90d9huUsBeQLgth6Mkwo2eyID/kpxafm2ztgPFv2UzRYliu+3G1RqW9hTFt9f5mEVfq+Wl8Ts9ORqc2pVCU3RyxteBM2LUHC+U02H4+FF1yT9AdL+yBHFB8vc2DHg5ceq9nuo/VyMvk34RMVscL6KuNkQClALpolP7kTNkOwlexEs0N6cDAjGNyFGqXEhoeGctxCfVT+DMiZ4PdHq2XffCBUqh14VTlDIn/cm7swYOAzSAeYL4/Z7N/7n+1//81U4CdvVHAqsvHC8SoDS+G9d1s1ADrXzW96rlBadFntAATZNAQa+3tGlOfxzYtqoQjXPQyHLNMHvvCITz9RhI7xMA64rEMbnlMDYyacfxnWGgd+Q12cZ3e1nkqOCcknW42RHe8uF6VcvOkAZETDzQ0CHazYLakiYtrv6TqBVDqDkI8vtnD01lcj45pb62W3NBsX+vCHW92GF5f3t/0OIIWHratPD3xvsCo/4JREaTrSzz+4GBSsZh8zMMsFfiNYTqBDfoLZin3FztEIsn7Yyqy5Cn6J43RC1UYpVFhmS0zO3jldd7w138AFo/EqbGVyf7MPjmYK3XNk6T7uZjEMz+03mYVCqgM0wneVnu9lEuauEKNwBnIHZMcTeAVacYq6R87mOjP7ZyU5teWbz1B+WmwBWnhlPQ/+6uKsT2toIgZ3fbDC2/E+/l04a6qJtaLzoxAByWOSOGH+0bev2bo=">2월엔 어서옥션! 4주간의 새로운혜택 SKT 누구나12%+스마일클럽은15%쿠폰!</a>
						</div>
					</div>
				</div>
				</div>
				<div class="ad-content-area">
				<div class="ad-item ng-scope" ng-if="$index >= 3" ng-repeat="ad in ads">
					<div class="ad-item-no ng-binding">4</div>
					<div class="ad-item-content">
						<div class="ad-item-title">
							<a ng-href="https://adcr.naver.com/adcr?x=TQfKLv4LMU5ORjy8wfSqxP///w==kGddxaIxe3Pqt5waRlLT1Z9aQHZsiKU5iUilEDowggtUgPqihG4OElDs0D+N1B9BKQnL2xMlTlUh+sxOI8Bi9irDSAsryI5+RPCsJEjf+zRPCissUsuEGJKuqXN/qhGEIRdcgBiuKy50KSuM4u8mBTdb5TsCHmlGjxrAQ2ptmIDIy3M1moViBHipcdu55crOetX2emKuVgC0dey4jJ0mK3TVK2WgvwLIak+fP01xFAtkcaaj17Q1sndhFICCTNv3LDMEYEBuEy36ITaDmlVkGR8+y4TJ80g7JXTCWzYnyVtcWRST/K38qScxsFYTtdUJlIXTrM+TW/C8nlYvjcB2L1zOhTs+2O/Vv6+wSDVmHGwtl1ztCaCvUtht84NCkpbG0dO831Q9/3TDUoCOImoNRjfxzmsfXhRISJSAS9JOYuP9VC9JafWyli0VSSgzl3uk9+tPJaqiTaVREifCnzxR22iAmZhicr1u7BDe6nId4K1lQKExSTtsyqMl081Xu7bCLTD1GP2qcxx/HtiZJl1DcPi5g7Fxp0bZydr48rhDYEGbbosZZ0bxZ1xRMVYINffnx3bZP0of1r37bN4Xzjlg3ATa07x853BUq5+NB1ShknJai86MQAcljkjhh/tG3r9m6" target="_blank" class="ng-binding" href="https://adcr.naver.com/adcr?x=TQfKLv4LMU5ORjy8wfSqxP///w==kGddxaIxe3Pqt5waRlLT1Z9aQHZsiKU5iUilEDowggtUgPqihG4OElDs0D+N1B9BKQnL2xMlTlUh+sxOI8Bi9irDSAsryI5+RPCsJEjf+zRPCissUsuEGJKuqXN/qhGEIRdcgBiuKy50KSuM4u8mBTdb5TsCHmlGjxrAQ2ptmIDIy3M1moViBHipcdu55crOetX2emKuVgC0dey4jJ0mK3TVK2WgvwLIak+fP01xFAtkcaaj17Q1sndhFICCTNv3LDMEYEBuEy36ITaDmlVkGR8+y4TJ80g7JXTCWzYnyVtcWRST/K38qScxsFYTtdUJlIXTrM+TW/C8nlYvjcB2L1zOhTs+2O/Vv6+wSDVmHGwtl1ztCaCvUtht84NCkpbG0dO831Q9/3TDUoCOImoNRjfxzmsfXhRISJSAS9JOYuP9VC9JafWyli0VSSgzl3uk9+tPJaqiTaVREifCnzxR22iAmZhicr1u7BDe6nId4K1lQKExSTtsyqMl081Xu7bCLTD1GP2qcxx/HtiZJl1DcPi5g7Fxp0bZydr48rhDYEGbbosZZ0bxZ1xRMVYINffnx3bZP0of1r37bN4Xzjlg3ATa07x853BUq5+NB1ShknJai86MQAcljkjhh/tG3r9m6">인터넷설치No1 인터넷1번가</a>
							<span class="iconsp ico_ad_mobile" ng-show="ad.isMobile"></span>
						</div>
						<div class="ad-item-url">
							<a ng-href="https://adcr.naver.com/adcr?x=TQfKLv4LMU5ORjy8wfSqxP///w==kGddxaIxe3Pqt5waRlLT1Z9aQHZsiKU5iUilEDowggtUgPqihG4OElDs0D+N1B9BKQnL2xMlTlUh+sxOI8Bi9irDSAsryI5+RPCsJEjf+zRPCissUsuEGJKuqXN/qhGEIRdcgBiuKy50KSuM4u8mBTdb5TsCHmlGjxrAQ2ptmIDIy3M1moViBHipcdu55crOetX2emKuVgC0dey4jJ0mK3TVK2WgvwLIak+fP01xFAtkcaaj17Q1sndhFICCTNv3LDMEYEBuEy36ITaDmlVkGR8+y4TJ80g7JXTCWzYnyVtcWRST/K38qScxsFYTtdUJlIXTrM+TW/C8nlYvjcB2L1zOhTs+2O/Vv6+wSDVmHGwtl1ztCaCvUtht84NCkpbG0dO831Q9/3TDUoCOImoNRjfxzmsfXhRISJSAS9JOYuP9VC9JafWyli0VSSgzl3uk9+tPJaqiTaVREifCnzxR22iAmZhicr1u7BDe6nId4K1lQKExSTtsyqMl081Xu7bCLTD1GP2qcxx/HtiZJl1DcPi5g7Fxp0bZydr48rhDYEGbbosZZ0bxZ1xRMVYINffnx3bZP0of1r37bN4Xzjlg3ATa07x853BUq5+NB1ShknJai86MQAcljkjhh/tG3r9m6" target="_blank" class="ng-binding" href="https://adcr.naver.com/adcr?x=TQfKLv4LMU5ORjy8wfSqxP///w==kGddxaIxe3Pqt5waRlLT1Z9aQHZsiKU5iUilEDowggtUgPqihG4OElDs0D+N1B9BKQnL2xMlTlUh+sxOI8Bi9irDSAsryI5+RPCsJEjf+zRPCissUsuEGJKuqXN/qhGEIRdcgBiuKy50KSuM4u8mBTdb5TsCHmlGjxrAQ2ptmIDIy3M1moViBHipcdu55crOetX2emKuVgC0dey4jJ0mK3TVK2WgvwLIak+fP01xFAtkcaaj17Q1sndhFICCTNv3LDMEYEBuEy36ITaDmlVkGR8+y4TJ80g7JXTCWzYnyVtcWRST/K38qScxsFYTtdUJlIXTrM+TW/C8nlYvjcB2L1zOhTs+2O/Vv6+wSDVmHGwtl1ztCaCvUtht84NCkpbG0dO831Q9/3TDUoCOImoNRjfxzmsfXhRISJSAS9JOYuP9VC9JafWyli0VSSgzl3uk9+tPJaqiTaVREifCnzxR22iAmZhicr1u7BDe6nId4K1lQKExSTtsyqMl081Xu7bCLTD1GP2qcxx/HtiZJl1DcPi5g7Fxp0bZydr48rhDYEGbbosZZ0bxZ1xRMVYINffnx3bZP0of1r37bN4Xzjlg3ATa07x853BUq5+NB1ShknJai86MQAcljkjhh/tG3r9m6">http://internet1st.kr</a>
						</div>
						<div class="ad-item-desc">
							<a ng-href="https://adcr.naver.com/adcr?x=TQfKLv4LMU5ORjy8wfSqxP///w==kGddxaIxe3Pqt5waRlLT1Z9aQHZsiKU5iUilEDowggtUgPqihG4OElDs0D+N1B9BKQnL2xMlTlUh+sxOI8Bi9irDSAsryI5+RPCsJEjf+zRPCissUsuEGJKuqXN/qhGEIRdcgBiuKy50KSuM4u8mBTdb5TsCHmlGjxrAQ2ptmIDIy3M1moViBHipcdu55crOetX2emKuVgC0dey4jJ0mK3TVK2WgvwLIak+fP01xFAtkcaaj17Q1sndhFICCTNv3LDMEYEBuEy36ITaDmlVkGR8+y4TJ80g7JXTCWzYnyVtcWRST/K38qScxsFYTtdUJlIXTrM+TW/C8nlYvjcB2L1zOhTs+2O/Vv6+wSDVmHGwtl1ztCaCvUtht84NCkpbG0dO831Q9/3TDUoCOImoNRjfxzmsfXhRISJSAS9JOYuP9VC9JafWyli0VSSgzl3uk9+tPJaqiTaVREifCnzxR22iAmZhicr1u7BDe6nId4K1lQKExSTtsyqMl081Xu7bCLTD1GP2qcxx/HtiZJl1DcPi5g7Fxp0bZydr48rhDYEGbbosZZ0bxZ1xRMVYINffnx3bZP0of1r37bN4Xzjlg3ATa07x853BUq5+NB1ShknJai86MQAcljkjhh/tG3r9m6" target="_blank" class="ng-binding" href="https://adcr.naver.com/adcr?x=TQfKLv4LMU5ORjy8wfSqxP///w==kGddxaIxe3Pqt5waRlLT1Z9aQHZsiKU5iUilEDowggtUgPqihG4OElDs0D+N1B9BKQnL2xMlTlUh+sxOI8Bi9irDSAsryI5+RPCsJEjf+zRPCissUsuEGJKuqXN/qhGEIRdcgBiuKy50KSuM4u8mBTdb5TsCHmlGjxrAQ2ptmIDIy3M1moViBHipcdu55crOetX2emKuVgC0dey4jJ0mK3TVK2WgvwLIak+fP01xFAtkcaaj17Q1sndhFICCTNv3LDMEYEBuEy36ITaDmlVkGR8+y4TJ80g7JXTCWzYnyVtcWRST/K38qScxsFYTtdUJlIXTrM+TW/C8nlYvjcB2L1zOhTs+2O/Vv6+wSDVmHGwtl1ztCaCvUtht84NCkpbG0dO831Q9/3TDUoCOImoNRjfxzmsfXhRISJSAS9JOYuP9VC9JafWyli0VSSgzl3uk9+tPJaqiTaVREifCnzxR22iAmZhicr1u7BDe6nId4K1lQKExSTtsyqMl081Xu7bCLTD1GP2qcxx/HtiZJl1DcPi5g7Fxp0bZydr48rhDYEGbbosZZ0bxZ1xRMVYINffnx3bZP0of1r37bN4Xzjlg3ATa07x853BUq5+NB1ShknJai86MQAcljkjhh/tG3r9m6">인터넷가입 No1 현금사은품 OK  빠른설치 OK 요금할인 OK 인터넷1번가</a>
						</div>
					</div>
				</div>
				<div class="ad-item ng-scope" ng-if="$index >= 3" ng-repeat="ad in ads">
					<div class="ad-item-no ng-binding">5</div>
					<div class="ad-item-content">
						<div class="ad-item-title">
							<a ng-href="https://adcr.naver.com/adcr?x=KfKMxJ/eH0HiqmM8ekxS1f///w==kF4ZgAZw7kJZO+yL49R+seBXPioBPN5A1RJ6QD3dFXHcuGKtsiruR4HTi7yM4o3QQuevhXx7eWKJ4K5olHps1jk+RL0YvCPnHpDdxxjvdnO2CAh+a3axPw2LhJpWoQl2TE3IPNJS+9OQmJUc+tTuPl9s/yVZn5ywmZdjxOhhElHBZy21sBuYwvTbLG3ZtvIzTn9+88zXE2MMH386XZUbP9lVm8y/JYZUoguRDiF5s+JYk5Usoapgkcm3kzoiB7RsVIfmaCQ7osIMLnb1L34H2zI8PXQHvKhkPmBDKGdDvWm2uIu1APcfXUvDRmTGpJxTWuilBCeoC2/3D7j3Uj3U99oy+QyIklWpcGwkKUhDE/+t6ZwDPjalWe7jGNLUiok3hsO0c5zl7I9Vd2KsVouDOyvNqdhHb8vUE9FJUsFXjAiOtd6PdYrIDCiG48qzGIIIDQtiapqVAWI+sBIA/gBRHcJ30InnWpUjGQgrCHVBaRjrLvG9oN/DRWPsJK6LZIufjqotSl1/NTfvp7pc1tKXUJPg4szew9OFIsAlAiPtXBbaFuyTsBMz2Sht7i3zV59MSZxEIlQgpzfCq77ePjJD5ExJKT4vRVYlqS2onaN2VMNBmHD6Rkcaqbdt3PTWFRZsIjlx6IHrZmqRFuP04yksfOjoW4WGPvr2O9d0jNwx0MeGbgiDebNyH4fWyNu4zm3LpSWJfDoZAcVU9lSwzv6UzOQ==" target="_blank" class="ng-binding" href="https://adcr.naver.com/adcr?x=KfKMxJ/eH0HiqmM8ekxS1f///w==kF4ZgAZw7kJZO+yL49R+seBXPioBPN5A1RJ6QD3dFXHcuGKtsiruR4HTi7yM4o3QQuevhXx7eWKJ4K5olHps1jk+RL0YvCPnHpDdxxjvdnO2CAh+a3axPw2LhJpWoQl2TE3IPNJS+9OQmJUc+tTuPl9s/yVZn5ywmZdjxOhhElHBZy21sBuYwvTbLG3ZtvIzTn9+88zXE2MMH386XZUbP9lVm8y/JYZUoguRDiF5s+JYk5Usoapgkcm3kzoiB7RsVIfmaCQ7osIMLnb1L34H2zI8PXQHvKhkPmBDKGdDvWm2uIu1APcfXUvDRmTGpJxTWuilBCeoC2/3D7j3Uj3U99oy+QyIklWpcGwkKUhDE/+t6ZwDPjalWe7jGNLUiok3hsO0c5zl7I9Vd2KsVouDOyvNqdhHb8vUE9FJUsFXjAiOtd6PdYrIDCiG48qzGIIIDQtiapqVAWI+sBIA/gBRHcJ30InnWpUjGQgrCHVBaRjrLvG9oN/DRWPsJK6LZIufjqotSl1/NTfvp7pc1tKXUJPg4szew9OFIsAlAiPtXBbaFuyTsBMz2Sht7i3zV59MSZxEIlQgpzfCq77ePjJD5ExJKT4vRVYlqS2onaN2VMNBmHD6Rkcaqbdt3PTWFRZsIjlx6IHrZmqRFuP04yksfOjoW4WGPvr2O9d0jNwx0MeGbgiDebNyH4fWyNu4zm3LpSWJfDoZAcVU9lSwzv6UzOQ==">SKT브로드앤라인</a>
							<span class="iconsp ico_ad_mobile" ng-show="ad.isMobile"></span>
						</div>
						<div class="ad-item-url">
							<a ng-href="https://adcr.naver.com/adcr?x=KfKMxJ/eH0HiqmM8ekxS1f///w==kF4ZgAZw7kJZO+yL49R+seBXPioBPN5A1RJ6QD3dFXHcuGKtsiruR4HTi7yM4o3QQuevhXx7eWKJ4K5olHps1jk+RL0YvCPnHpDdxxjvdnO2CAh+a3axPw2LhJpWoQl2TE3IPNJS+9OQmJUc+tTuPl9s/yVZn5ywmZdjxOhhElHBZy21sBuYwvTbLG3ZtvIzTn9+88zXE2MMH386XZUbP9lVm8y/JYZUoguRDiF5s+JYk5Usoapgkcm3kzoiB7RsVIfmaCQ7osIMLnb1L34H2zI8PXQHvKhkPmBDKGdDvWm2uIu1APcfXUvDRmTGpJxTWuilBCeoC2/3D7j3Uj3U99oy+QyIklWpcGwkKUhDE/+t6ZwDPjalWe7jGNLUiok3hsO0c5zl7I9Vd2KsVouDOyvNqdhHb8vUE9FJUsFXjAiOtd6PdYrIDCiG48qzGIIIDQtiapqVAWI+sBIA/gBRHcJ30InnWpUjGQgrCHVBaRjrLvG9oN/DRWPsJK6LZIufjqotSl1/NTfvp7pc1tKXUJPg4szew9OFIsAlAiPtXBbaFuyTsBMz2Sht7i3zV59MSZxEIlQgpzfCq77ePjJD5ExJKT4vRVYlqS2onaN2VMNBmHD6Rkcaqbdt3PTWFRZsIjlx6IHrZmqRFuP04yksfOjoW4WGPvr2O9d0jNwx0MeGbgiDebNyH4fWyNu4zm3LpSWJfDoZAcVU9lSwzv6UzOQ==" target="_blank" class="ng-binding" href="https://adcr.naver.com/adcr?x=KfKMxJ/eH0HiqmM8ekxS1f///w==kF4ZgAZw7kJZO+yL49R+seBXPioBPN5A1RJ6QD3dFXHcuGKtsiruR4HTi7yM4o3QQuevhXx7eWKJ4K5olHps1jk+RL0YvCPnHpDdxxjvdnO2CAh+a3axPw2LhJpWoQl2TE3IPNJS+9OQmJUc+tTuPl9s/yVZn5ywmZdjxOhhElHBZy21sBuYwvTbLG3ZtvIzTn9+88zXE2MMH386XZUbP9lVm8y/JYZUoguRDiF5s+JYk5Usoapgkcm3kzoiB7RsVIfmaCQ7osIMLnb1L34H2zI8PXQHvKhkPmBDKGdDvWm2uIu1APcfXUvDRmTGpJxTWuilBCeoC2/3D7j3Uj3U99oy+QyIklWpcGwkKUhDE/+t6ZwDPjalWe7jGNLUiok3hsO0c5zl7I9Vd2KsVouDOyvNqdhHb8vUE9FJUsFXjAiOtd6PdYrIDCiG48qzGIIIDQtiapqVAWI+sBIA/gBRHcJ30InnWpUjGQgrCHVBaRjrLvG9oN/DRWPsJK6LZIufjqotSl1/NTfvp7pc1tKXUJPg4szew9OFIsAlAiPtXBbaFuyTsBMz2Sht7i3zV59MSZxEIlQgpzfCq77ePjJD5ExJKT4vRVYlqS2onaN2VMNBmHD6Rkcaqbdt3PTWFRZsIjlx6IHrZmqRFuP04yksfOjoW4WGPvr2O9d0jNwx0MeGbgiDebNyH4fWyNu4zm3LpSWJfDoZAcVU9lSwzv6UzOQ==">http://www.broadnline.co.kr</a>
						</div>
						<div class="ad-item-desc">
							<a ng-href="https://adcr.naver.com/adcr?x=KfKMxJ/eH0HiqmM8ekxS1f///w==kF4ZgAZw7kJZO+yL49R+seBXPioBPN5A1RJ6QD3dFXHcuGKtsiruR4HTi7yM4o3QQuevhXx7eWKJ4K5olHps1jk+RL0YvCPnHpDdxxjvdnO2CAh+a3axPw2LhJpWoQl2TE3IPNJS+9OQmJUc+tTuPl9s/yVZn5ywmZdjxOhhElHBZy21sBuYwvTbLG3ZtvIzTn9+88zXE2MMH386XZUbP9lVm8y/JYZUoguRDiF5s+JYk5Usoapgkcm3kzoiB7RsVIfmaCQ7osIMLnb1L34H2zI8PXQHvKhkPmBDKGdDvWm2uIu1APcfXUvDRmTGpJxTWuilBCeoC2/3D7j3Uj3U99oy+QyIklWpcGwkKUhDE/+t6ZwDPjalWe7jGNLUiok3hsO0c5zl7I9Vd2KsVouDOyvNqdhHb8vUE9FJUsFXjAiOtd6PdYrIDCiG48qzGIIIDQtiapqVAWI+sBIA/gBRHcJ30InnWpUjGQgrCHVBaRjrLvG9oN/DRWPsJK6LZIufjqotSl1/NTfvp7pc1tKXUJPg4szew9OFIsAlAiPtXBbaFuyTsBMz2Sht7i3zV59MSZxEIlQgpzfCq77ePjJD5ExJKT4vRVYlqS2onaN2VMNBmHD6Rkcaqbdt3PTWFRZsIjlx6IHrZmqRFuP04yksfOjoW4WGPvr2O9d0jNwx0MeGbgiDebNyH4fWyNu4zm3LpSWJfDoZAcVU9lSwzv6UzOQ==" target="_blank" class="ng-binding" href="https://adcr.naver.com/adcr?x=KfKMxJ/eH0HiqmM8ekxS1f///w==kF4ZgAZw7kJZO+yL49R+seBXPioBPN5A1RJ6QD3dFXHcuGKtsiruR4HTi7yM4o3QQuevhXx7eWKJ4K5olHps1jk+RL0YvCPnHpDdxxjvdnO2CAh+a3axPw2LhJpWoQl2TE3IPNJS+9OQmJUc+tTuPl9s/yVZn5ywmZdjxOhhElHBZy21sBuYwvTbLG3ZtvIzTn9+88zXE2MMH386XZUbP9lVm8y/JYZUoguRDiF5s+JYk5Usoapgkcm3kzoiB7RsVIfmaCQ7osIMLnb1L34H2zI8PXQHvKhkPmBDKGdDvWm2uIu1APcfXUvDRmTGpJxTWuilBCeoC2/3D7j3Uj3U99oy+QyIklWpcGwkKUhDE/+t6ZwDPjalWe7jGNLUiok3hsO0c5zl7I9Vd2KsVouDOyvNqdhHb8vUE9FJUsFXjAiOtd6PdYrIDCiG48qzGIIIDQtiapqVAWI+sBIA/gBRHcJ30InnWpUjGQgrCHVBaRjrLvG9oN/DRWPsJK6LZIufjqotSl1/NTfvp7pc1tKXUJPg4szew9OFIsAlAiPtXBbaFuyTsBMz2Sht7i3zV59MSZxEIlQgpzfCq77ePjJD5ExJKT4vRVYlqS2onaN2VMNBmHD6Rkcaqbdt3PTWFRZsIjlx6IHrZmqRFuP04yksfOjoW4WGPvr2O9d0jNwx0MeGbgiDebNyH4fWyNu4zm3LpSWJfDoZAcVU9lSwzv6UzOQ==">SK 유무선결합 시 인터넷, 핸드폰 통신비 추가할인, 현금사은품지급, 결합상품전문</a>
						</div>
					</div>
				</div>
				<div class="ad-item ng-scope" ng-if="$index >= 3" ng-repeat="ad in ads">
					<div class="ad-item-no ng-binding">6</div>
					<div class="ad-item-content">
						<div class="ad-item-title">
							<a ng-href="https://adcr.naver.com/adcr?x=DG61Dml6iVrfd6VxlyVf5f///w==k2wR1bZg7HTZ/wAEJBzPz9Jq6kMtKflsao5Z4Cm9yCWsYpDVLfo5ZPO/rvY1JvTqLSoi4PJNUkwYne7+V9LI+QtJv0LOQY5wu4gwkIh50emyBwKAZ2bIyPZqtakSH1Te/Ystx5ISzElMA8+BbNecQPACyiHwfT8DSXlnR1gOTObj1IidVSbEJISVhACokjdNoSUgI0LmdIqcHLBPAqIVcgPp4Bk6OU67HMT4uDxficOMfzCTad/ajm4e9SRKdwJ4XoLi+kJNTW+pSLHBlNA0E7BiwFua/KHVaSdXCvDKCmOHFQfhDS77fL4UMmZ6xl4r/h1UPhTnPbFZ+c0M2s/ipaVrUcvG2BRw2QjIhAyXiraA76vt+QQj44tq6L8/d8bq8Bj9RxBgStlHDWO19h1LNsQd1369rek1spgkC8BFVr5HyBVrt77wEF/6N+p0R/JvsLBM+Pr1BtSCBAMgo3KY1lFLShdWHtdS98k01X7dQEyFKOSNogAS5e0CKRb1dVKMVCk/u3JFtY7OcU/yV2YSU5+6VF/PD26CqYMAk4qdf0ey4Nk0MCIWulZ/jf+VgOTUW6ucKG8iKCrsXxglyDrvROb+lnbPhFi7G0hJsq298KCUD7/T4T68QhT3rZXXiBJ9u1vTrIE9RR2eYaUm7CjUiybP8VOkWRWfGb8NfymKYTMm9AmQm/Ljlye60/ZniZ0736v/4qHY4hq40RSrq1rEhZrsVLGwOUQ01EHavSVue+84=" target="_blank" class="ng-binding" href="https://adcr.naver.com/adcr?x=DG61Dml6iVrfd6VxlyVf5f///w==k2wR1bZg7HTZ/wAEJBzPz9Jq6kMtKflsao5Z4Cm9yCWsYpDVLfo5ZPO/rvY1JvTqLSoi4PJNUkwYne7+V9LI+QtJv0LOQY5wu4gwkIh50emyBwKAZ2bIyPZqtakSH1Te/Ystx5ISzElMA8+BbNecQPACyiHwfT8DSXlnR1gOTObj1IidVSbEJISVhACokjdNoSUgI0LmdIqcHLBPAqIVcgPp4Bk6OU67HMT4uDxficOMfzCTad/ajm4e9SRKdwJ4XoLi+kJNTW+pSLHBlNA0E7BiwFua/KHVaSdXCvDKCmOHFQfhDS77fL4UMmZ6xl4r/h1UPhTnPbFZ+c0M2s/ipaVrUcvG2BRw2QjIhAyXiraA76vt+QQj44tq6L8/d8bq8Bj9RxBgStlHDWO19h1LNsQd1369rek1spgkC8BFVr5HyBVrt77wEF/6N+p0R/JvsLBM+Pr1BtSCBAMgo3KY1lFLShdWHtdS98k01X7dQEyFKOSNogAS5e0CKRb1dVKMVCk/u3JFtY7OcU/yV2YSU5+6VF/PD26CqYMAk4qdf0ey4Nk0MCIWulZ/jf+VgOTUW6ucKG8iKCrsXxglyDrvROb+lnbPhFi7G0hJsq298KCUD7/T4T68QhT3rZXXiBJ9u1vTrIE9RR2eYaUm7CjUiybP8VOkWRWfGb8NfymKYTMm9AmQm/Ljlye60/ZniZ0736v/4qHY4hq40RSrq1rEhZrsVLGwOUQ01EHavSVue+84=">SKT G9에서 산다</a>
							<span class="iconsp ico_ad_mobile ng-hide" ng-show="ad.isMobile"></span>
						</div>
						<div class="ad-item-url">
							<a ng-href="https://adcr.naver.com/adcr?x=DG61Dml6iVrfd6VxlyVf5f///w==k2wR1bZg7HTZ/wAEJBzPz9Jq6kMtKflsao5Z4Cm9yCWsYpDVLfo5ZPO/rvY1JvTqLSoi4PJNUkwYne7+V9LI+QtJv0LOQY5wu4gwkIh50emyBwKAZ2bIyPZqtakSH1Te/Ystx5ISzElMA8+BbNecQPACyiHwfT8DSXlnR1gOTObj1IidVSbEJISVhACokjdNoSUgI0LmdIqcHLBPAqIVcgPp4Bk6OU67HMT4uDxficOMfzCTad/ajm4e9SRKdwJ4XoLi+kJNTW+pSLHBlNA0E7BiwFua/KHVaSdXCvDKCmOHFQfhDS77fL4UMmZ6xl4r/h1UPhTnPbFZ+c0M2s/ipaVrUcvG2BRw2QjIhAyXiraA76vt+QQj44tq6L8/d8bq8Bj9RxBgStlHDWO19h1LNsQd1369rek1spgkC8BFVr5HyBVrt77wEF/6N+p0R/JvsLBM+Pr1BtSCBAMgo3KY1lFLShdWHtdS98k01X7dQEyFKOSNogAS5e0CKRb1dVKMVCk/u3JFtY7OcU/yV2YSU5+6VF/PD26CqYMAk4qdf0ey4Nk0MCIWulZ/jf+VgOTUW6ucKG8iKCrsXxglyDrvROb+lnbPhFi7G0hJsq298KCUD7/T4T68QhT3rZXXiBJ9u1vTrIE9RR2eYaUm7CjUiybP8VOkWRWfGb8NfymKYTMm9AmQm/Ljlye60/ZniZ0736v/4qHY4hq40RSrq1rEhZrsVLGwOUQ01EHavSVue+84=" target="_blank" class="ng-binding" href="https://adcr.naver.com/adcr?x=DG61Dml6iVrfd6VxlyVf5f///w==k2wR1bZg7HTZ/wAEJBzPz9Jq6kMtKflsao5Z4Cm9yCWsYpDVLfo5ZPO/rvY1JvTqLSoi4PJNUkwYne7+V9LI+QtJv0LOQY5wu4gwkIh50emyBwKAZ2bIyPZqtakSH1Te/Ystx5ISzElMA8+BbNecQPACyiHwfT8DSXlnR1gOTObj1IidVSbEJISVhACokjdNoSUgI0LmdIqcHLBPAqIVcgPp4Bk6OU67HMT4uDxficOMfzCTad/ajm4e9SRKdwJ4XoLi+kJNTW+pSLHBlNA0E7BiwFua/KHVaSdXCvDKCmOHFQfhDS77fL4UMmZ6xl4r/h1UPhTnPbFZ+c0M2s/ipaVrUcvG2BRw2QjIhAyXiraA76vt+QQj44tq6L8/d8bq8Bj9RxBgStlHDWO19h1LNsQd1369rek1spgkC8BFVr5HyBVrt77wEF/6N+p0R/JvsLBM+Pr1BtSCBAMgo3KY1lFLShdWHtdS98k01X7dQEyFKOSNogAS5e0CKRb1dVKMVCk/u3JFtY7OcU/yV2YSU5+6VF/PD26CqYMAk4qdf0ey4Nk0MCIWulZ/jf+VgOTUW6ucKG8iKCrsXxglyDrvROb+lnbPhFi7G0hJsq298KCUD7/T4T68QhT3rZXXiBJ9u1vTrIE9RR2eYaUm7CjUiybP8VOkWRWfGb8NfymKYTMm9AmQm/Ljlye60/ZniZ0736v/4qHY4hq40RSrq1rEhZrsVLGwOUQ01EHavSVue+84=">http://www.g9.co.kr/</a>
						</div>
						<div class="ad-item-desc">
							<a ng-href="https://adcr.naver.com/adcr?x=DG61Dml6iVrfd6VxlyVf5f///w==k2wR1bZg7HTZ/wAEJBzPz9Jq6kMtKflsao5Z4Cm9yCWsYpDVLfo5ZPO/rvY1JvTqLSoi4PJNUkwYne7+V9LI+QtJv0LOQY5wu4gwkIh50emyBwKAZ2bIyPZqtakSH1Te/Ystx5ISzElMA8+BbNecQPACyiHwfT8DSXlnR1gOTObj1IidVSbEJISVhACokjdNoSUgI0LmdIqcHLBPAqIVcgPp4Bk6OU67HMT4uDxficOMfzCTad/ajm4e9SRKdwJ4XoLi+kJNTW+pSLHBlNA0E7BiwFua/KHVaSdXCvDKCmOHFQfhDS77fL4UMmZ6xl4r/h1UPhTnPbFZ+c0M2s/ipaVrUcvG2BRw2QjIhAyXiraA76vt+QQj44tq6L8/d8bq8Bj9RxBgStlHDWO19h1LNsQd1369rek1spgkC8BFVr5HyBVrt77wEF/6N+p0R/JvsLBM+Pr1BtSCBAMgo3KY1lFLShdWHtdS98k01X7dQEyFKOSNogAS5e0CKRb1dVKMVCk/u3JFtY7OcU/yV2YSU5+6VF/PD26CqYMAk4qdf0ey4Nk0MCIWulZ/jf+VgOTUW6ucKG8iKCrsXxglyDrvROb+lnbPhFi7G0hJsq298KCUD7/T4T68QhT3rZXXiBJ9u1vTrIE9RR2eYaUm7CjUiybP8VOkWRWfGb8NfymKYTMm9AmQm/Ljlye60/ZniZ0736v/4qHY4hq40RSrq1rEhZrsVLGwOUQ01EHavSVue+84=" target="_blank" class="ng-binding" href="https://adcr.naver.com/adcr?x=DG61Dml6iVrfd6VxlyVf5f///w==k2wR1bZg7HTZ/wAEJBzPz9Jq6kMtKflsao5Z4Cm9yCWsYpDVLfo5ZPO/rvY1JvTqLSoi4PJNUkwYne7+V9LI+QtJv0LOQY5wu4gwkIh50emyBwKAZ2bIyPZqtakSH1Te/Ystx5ISzElMA8+BbNecQPACyiHwfT8DSXlnR1gOTObj1IidVSbEJISVhACokjdNoSUgI0LmdIqcHLBPAqIVcgPp4Bk6OU67HMT4uDxficOMfzCTad/ajm4e9SRKdwJ4XoLi+kJNTW+pSLHBlNA0E7BiwFua/KHVaSdXCvDKCmOHFQfhDS77fL4UMmZ6xl4r/h1UPhTnPbFZ+c0M2s/ipaVrUcvG2BRw2QjIhAyXiraA76vt+QQj44tq6L8/d8bq8Bj9RxBgStlHDWO19h1LNsQd1369rek1spgkC8BFVr5HyBVrt77wEF/6N+p0R/JvsLBM+Pr1BtSCBAMgo3KY1lFLShdWHtdS98k01X7dQEyFKOSNogAS5e0CKRb1dVKMVCk/u3JFtY7OcU/yV2YSU5+6VF/PD26CqYMAk4qdf0ey4Nk0MCIWulZ/jf+VgOTUW6ucKG8iKCrsXxglyDrvROb+lnbPhFi7G0hJsq298KCUD7/T4T68QhT3rZXXiBJ9u1vTrIE9RR2eYaUm7CjUiybP8VOkWRWfGb8NfymKYTMm9AmQm/Ljlye60/ZniZ0736v/4qHY4hq40RSrq1rEhZrsVLGwOUQ01EHavSVue+84=">누구나 매일매일 받는 G9 2월의 쿠폰! 천원부터 최대 5천원! SKT</a>
						</div>
					</div>
				</div>
				</div>
				<div class="clearfix"></div>
				</div>
			</div>
	</div><!-- power-link end -->

</div><!-- productInfo-content end -->

</div><!-- productInfo-container end -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>