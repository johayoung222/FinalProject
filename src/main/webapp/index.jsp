<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="안녕 스프링!" name="pageTitle" />
</jsp:include>
<style>
.indexphoto{
	width:100%;
	height:300px;
}
#favorite{
	padding-left:90px;
}
#favorite2{
	margin-left:50px;
}
#favorite3{
	margin-left:50px;
}
#favorite4{
	margin-left:50px;
}
#favorite5{
	margin-left:50px;
}

</style>
<div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="indexphoto" src="${pageContext.request.contextPath }/resources/images/flower1.PNG" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="indexphoto" src="${pageContext.request.contextPath }/resources/images/flower2.PNG" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="indexphoto" src="${pageContext.request.contextPath }/resources/images/flower3.PNG" alt="Third slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleFade" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<div>
	<h3><bold>인기 카테고리</bold></h3>
</div>
<div id="favorite">
<div>
<img src="${pageContext.request.contextPath }/resources/images/computer.PNG" id="favorite1" width="120px" height="100px"/>
<img src="${pageContext.request.contextPath }/resources/images/phone.PNG" id="favorite2" width="120px" height="100px"/>
<img src="${pageContext.request.contextPath }/resources/images/electronic.PNG" id="favorite3" width="120px" height="100px"/>
<img src="${pageContext.request.contextPath }/resources/images/food.PNG" id="favorite4" width="120px" height="100px"/>
<img src="${pageContext.request.contextPath }/resources/images/kitchen.PNG" id="favorite5" width="120px" height="100px"/>
<div><pre><strong>    컴퓨터                 핸드폰                 전자기기                 식품            생활/주방/미용가전</strong></pre></div>
</div>
</div>
<hr>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>