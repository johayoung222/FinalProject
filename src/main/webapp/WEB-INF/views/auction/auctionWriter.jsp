<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle" />
</jsp:include>
<script>
// onload함수에 summernote 적용부분

$(function() {
	$("#summernote").summernote({
		/* ※ Popovers
		☞ 팝 오버는 툴팁과 동일한 효과를 구현할 수 있지만, 더 많은 내용을 보여줄 수 있다.
		
		☞ 제목과 content 길이가 0일 경우, 보여지지 않는 것 또한 툴팁과 동일하다.
		
		☞ 반드시 Bootstrap의 툴팁 플러그인이 포함되어 있어야 한다.
		
		☞ 툴팁과 마찬가지로, 4가지의 방향(왼쪽, 상단, 하단, 오른쪽)으로 표시할 수 있다. */
		popover: false,
		height : 300, 		// 기본 높이값
		minHeight : null, 	// 최소 높이값(null은 제한 없음)
		maxHeight : null, 	// 최대 높이값(null은 제한 없음)
		focus : false, 		// 페이지가 열릴때 포커스를 지정함
		lang : 'ko-KR', 	// 한국어 지정(기본값은 en-US)
		callbacks: {
        	onImageUpload: function(files, editor, welEditable) {
                for (var i = files.length - 1; i >= 0; i--) {
                  sendFile(files[i], this);
                }
        	}
        }

	});
});
</script>

<div class="container"> 
	
<form name="frm" method="post" id="frm" enctype="multipart/form-data">
<div class="form-style-2">
	<div class="form-style-2-heading">상품등록</div>
		
			<label for="field1">
			<span>카테고리: </span>
		 
						<select class="select-field" id="lctg" name="lctg" onchange="fn_next(this.value)">
							<option value="" hidden="true">대분류</option>
							<c:forEach var="rs" items="${resultList}" varStatus="status">
								<option value="${rs.ctgcd}">${rs.ctgnm}</option>
							</c:forEach>
						</select> 
						
						<select class="select-field" id="mctg" name="mctg">
							<option value="" hidden="true">중분류</option>
						</select></label>
						<p id="ctgchk" style = "font-style: italic ; font-weight: bold; font-size:0.8em;  color: red;"></p>
			
			
			<label for="field2">
			<span>등록기간: </span>
				<div class="input-daterange input-group" id="datepicker" style="width: 50%">				
						<input type="text" class="input-sm form-control" name="dateRange" id="dateRange" value="" />	
				</div>			
			</label>
			
			
			<label for="field3">
			<span>상품명: </span>
				<input type="text" class="input-field" name="auctitle" id="auctitle" autocomplete="off" />
			</label>
			<p id="titchk" style = "font-style: italic ; font-weight: bold; font-size:0.5em;  color: red;"></p>
			
			
			</div>
		
			<div class="form-style-3">
			<label><span>상품이미지:</span></label>
			<p style = "font-style: italic ; font-weight: bold; font-size:0.8em;  color: red;">메인이미지는 필수 등록사항입니다.</p>
			<div class="filebox bs3-primary preview-image">
				<input class="upload-name" value="메인이미지선택" disabled="disabled" style="width: 200px;"> 
				<label for="file1">업로드</label> 
				<input type="file" name="file1" id="file1" class="upload-hidden" >
			</div>
			
			<div class="filebox bs3-primary preview-image">
				<input class="upload-name" value="서브이미지1선택" disabled="disabled" style="width: 200px;"> 
				<label for="file2">업로드</label> 
				<input type="file" name="file2" id="file2" class="upload-hidden">
			</div>
			
			<div class="filebox bs3-primary preview-image">
				<input class="upload-name" value="서브이미지2선택" disabled="disabled" style="width: 200px;"> 
				<label for="file3">업로드</label> 
				<input type="file" name="file3" id="file3" class="upload-hidden">
			</div>
			
			<div class="filebox bs3-primary preview-image">
				<input class="upload-name" value="서브이미지3선택" disabled="disabled" style="width: 200px;"> 
				<label for="file4">업로드</label> 
				<input type="file" name="file4" id="file4" class="upload-hidden">
			</div>
					
			</div>
			<p id="mimgchk" style = "font-style: italic ; font-weight: bold; font-size:0.8em;  color: red;"></p>
			
			<div class="form-style-2">
			
			<label for="field4">
			<span>상품가격: </span>
				<input type="text" class="input-field" name="sp" id="sp" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' autocomplete="off" >
			</label>
			<p id="spchk" style = "font-style: italic ; font-weight: bold; font-size:0.8em;  color: red;"></p>
			
			<label for="field5">
			<span>배송방법: </span>
				<select class="select-field" name="dw" id="dw" onchange="fee(this.value)">
							<option value="">선택</option>
							<option value="0">택배</option>
							<option value="1">직접수령</option>
				</select>
			</label>
			<p id="dwchk" style = "font-style: italic ; font-weight: bold; font-size:0.8em;  color: red;"></p>
			
			<script>
			// 배송 방법 선택시 배송료 필드에 disabled 추가,제거 해주는 함수
			function fee(dway) {
				
				var a = dway;
				
				if(a=="0"){
					$("input[name=df]").attr("disabled",false);
					
				}else if(a=="1"){
					$("input[name=df]").attr("disabled",true);
					$("input[name=df]").val("");
				}else{
					$("input[name=df]").attr("disabled",true);
					$("input[name=df]").val("");
				}			
			}
			
			</script>
			
			<label for="field6">
			<span>배송료: </span>
				<input type="text" class="input-field" name="df" id="df" disabled="" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' autocomplete="off" >
			</label>
			<p id="dfchk" style = "font-style: italic ; font-weight: bold; font-size:0.8em;  color: red;"></p>
			
			<label for="field7">
			<span>판매자: </span>
				<input type="text" class="input-field" name="sellername" id="sellername" autocomplete="off" >
			</label>				
			<p id="snchk" style = "font-style: italic ; font-weight: bold; font-size:0.8em;  color: red;"></p>
			
			<label for="field8"><span>판매자연락처: </span>			
			<select class="select-field" name="phone1" id="phone1" >
							<option value="">선택</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="011">017</option>
							<option value="011">019</option>
			</select> -
			<input type="text" class="tel-number-field" id="phone2" name="phone2" value="" maxlength="4"
			onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' /> -
			<input type="text" class="tel-number-field" id="phone3" name="phone3" value="" maxlength="4"
			onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' /></label>
			
			<p id="pnchk" style = "font-style: italic ; font-weight: bold; font-size:0.8em;  color: red;"></p>

			<label for="field9"><span>상세정보: </span>
			<div class="float"></div>
			<textarea class="textarea-field" id="summernote" name="aucdetail"></textarea>				
			</label>
			<p id="adchk" style = "font-style: italic ; font-weight: bold; font-size:0.8em;  color: red;"></p>
		
			<input type="button" id="saveBtn" value="입력"/>
			
	</div>
	</form>
	
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>