<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<%
	int registNo = (int)request.getAttribute("registNo");
%>

<form action="">
<input type="hidden" id="registNo" value="${registNo }" />
<select name="categoryMa" id="categoryMa">
	<option value="" disabled selected>대분류</option>
	
</select>
&nbsp;&nbsp;&nbsp;
<select name="categoryMi" id="categoryMi">
	<option value="" disabled selected>소분류</option>

</select>

</form>
<script>
$(function(){
	$("#categoryMa").on("change",function(){
		alert("클릭됐나?");
		$.ajax({
			url : "${pageContext.request.contextPath}/admin/categoryMa.do",
			dataType : "json",
			type : "POST",
			success : function(data){
				console.log(data);
			},error : function(){
				console.log("ajax 요청 실패!!");
			}
		});
	});
	
});

</script>
