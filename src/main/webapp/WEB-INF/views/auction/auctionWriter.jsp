<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle" />
</jsp:include>


<!-- Include Date Range Picker -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/daterangepicker.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/write.css" />
<%-- <script src="${pageContext.request.contextPath }/resources/js/popper.min.js"></script> --%>

<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/datepicker/moment.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/datepicker/daterangepicker.js"></script>
<script type="text/javascript" charset="UTF-8" src="${pageContext.request.contextPath }/resources/dist/summernote.js"></script>
<script src="${pageContext.request.contextPath }/resources/dist/lang/summernote-ko-KR.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.2/umd/popper.min.js"></script>
<script
    src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
    integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm"
    crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/dist/summernote.css" />


  


<script type="text/javascript">
//onload함수에 summernote 적용부분

		/* ※ Popovers
		☞ 팝 오버는 툴팁과 동일한 효과를 구현할 수 있지만, 더 많은 내용을 보여줄 수 있다.
		
		☞ 제목과 content 길이가 0일 경우, 보여지지 않는 것 또한 툴팁과 동일하다.
		
		☞ 반드시 Bootstrap의 툴팁 플러그인이 포함되어 있어야 한다.
		
		☞ 툴팁과 마찬가지로, 4가지의 방향(왼쪽, 상단, 하단, 오른쪽)으로 표시할 수 있다. */
$(function() {
	$("#summernote").summernote({
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


function sendFile(file, el) {
    var form_data = new FormData();
    form_data.append('file', file);
    $.ajax({
      data: form_data,
      type: "POST",
      url: '/image',
      cache: false,
      contentType: false,
      enctype: 'multipart/form-data',
      processData: false,
      success: function(url) {
        $(el).summernote('editor.insertImage', url);
        $('#imageBoard > ul').append('<li><img src="'+url+'" width="480" height="auto"/></li>');
        $('textarea[name="aucdetail"]').html($('#summernote').code());
      }
    });
  }
</script>



<div class="container"> 
	
<form name="frm" method="post" id="frm" enctype="multipart/form-data">
<div class="form-style-2">
	<div class="form-style-2-heading">겟잇 옥션 상품등록</div>
		
			<label for="field1">
			<span>카테고리: </span>
						<select class="select-field" id="lctg" name="lctg" onchange="fn_next(this.value)">
							<option value="" hidden="true">대분류</option>
							<c:forEach var="rs" items="${ctgList}" varStatus="status">
								<option value="${rs.categoryMacro}">${rs.categoryName}</option>
							</c:forEach>
						</select> 
						
						<select class="select-field" id="mctg" name="mctg">
							<option value="" hidden="true">소분류</option>
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
			<p id="titchk" style = "font-style: italic ; font-weight: bold; font-size:0.8em;  color: red;"></p>
			
			
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
							<option value="1">회사로 직접 방문</option>
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
				<input type="text" class="input-field" name="sellername" id="sellername" autocomplete="off" value="${memberLoggedIn.memberId }" disabled="disabled" >
			</label>				
			<p id="snchk" style = "font-style: italic ; font-weight: bold; font-size:0.8em;  color: red;"></p>
			
			<label for="field8"><span>판매자연락처: </span>			
			<!-- 
			<select class="select-field" name="phone1" id="phone1" >
							<option value="">선택</option>
							<option value="010">010</option>
							<option value="011">011</option>
			</select>
			 --> 
			 
			<input type="text" class="tel-number-field" id="phone1" name="phone1" value="${fn:substring(memberLoggedIn.memberPhone,0,3) }" maxlength="3" disabled="disabled" /> -
			<input type="text" class="tel-number-field" id="phone2" name="phone2" value="${fn:substring(memberLoggedIn.memberPhone,3,7) }" maxlength="4" disabled="disabled" /> -
			<input type="text" class="tel-number-field" id="phone3" name="phone3" value="${fn:substring(memberLoggedIn.memberPhone,7,13) }" maxlength="4" disabled="disabled" /></label>
			
			<p id="pnchk" style = "font-style: italic ; font-weight: bold; font-size:0.8em;  color: red;"></p>

			<label for="field9"><span>상세정보: </span>
			<div class="float"></div>
			<!-- <textarea class="textarea-field" id="summernote" name="aucdetail"></textarea> -->
			<div class="textarea-field" id="summernote" name="aucdetail"></div>			
			</label>
			<p id="adchk" style = "font-style: italic ; font-weight: bold; font-size:0.8em;  color: red;"></p>
		
			<input type="button" id="saveBtn" value="입력"/>
		</div>
	</form>
</div>


<script type="text/javascript">

//daterangepicker 적용부분

	$(function() {
		$('input[name="dateRange"]').daterangepicker({
			
			timePicker : true,
			timePickerIncrement : 30,
			locale : {
				format : 'YYYY-MM-DD H:mm A',
				cancelLabel : 'clear'
			}
			
		});
		$('input[name="dateRange"]').on(
				'apply.daterangepicker',
				function(ev, picker) {
					$(this).val(
							picker.startDate.format('YYYY-MM-DD H:mm A')
									+ ' ~ '
									+ picker.endDate
											.format('YYYY-MM-DD H:mm A'));
				});

		$('input[name="dateRange"]').on('cancel.daterangepicker',
				function(ev, picker) {
					$(this).val('');
				});

	});
	
</script>

<script>

//write 페이지에 대분류 선택하면 소분류 뽑아오는 함수

function fn_next(ctgcode) {
	
	var data = "ctgcode=" + ctgcode;

	$.ajax({
		type : 'POST',
		data : data,
		url : "${pageContext.request.contextPath}/selectMlist",
		dataType : "json",
		success : function(data) {
			if(data.resultMList != null) {
				$('#mctg').children("option").remove();
				//data.rows 에 코드, 이름 형태로 되어있다고 가정.
				var codeList = data.resultMList;
				$('#mctg').append( "<option value='' hidden='true'>소분류</option>");
				
				for (var i = 0; i < codeList.length; i++) {
					var option = "<option value='" + codeList[i].categoryMacro + "'>"
							+ codeList[i].categoryName + "</option>";
					//대상 콤보박스에 추가
					$('#mctg').append(option);
				}
			}
		},
		error : function(xhr, status, error) {
			alert("ajax처리오류!");
		}
	});
}

//글 저장 부분
$(function() {
	$("#saveBtn").click(function() {
		
		//null값 체크
		var text;
	    
		if (document.frm.lctg.value=="") {
	    	text = "대분류를 입력해주세용.";
	    	document.getElementById("ctgchk").innerHTML = text;
	    	document.frm.lctg.focus();
	        return;
	    }else{
	    	document.getElementById("ctgchk").innerHTML = "";
	    }
		
		if (document.frm.mctg.value=="") {
	    	text = "소분류를 입력해주세용";
	    	document.getElementById("ctgchk").innerHTML = text;
	    	document.frm.mctg.focus();
	        return;
	    }else{
	    	document.getElementById("ctgchk").innerHTML = "";
	    }
		
	   	if (document.frm.auctitle.value=="") {
	    	text = "상품명을 입력해주세용.";
	    	document.getElementById("titchk").innerHTML = text;
	    	document.frm.auctitle.focus();
	        return;
	    }else{
	    	document.getElementById("titchk").innerHTML = "";
	    }
	   	
	   	if (document.frm.file1.value=="") {
	    	text = "메인사진을 등록해주세용.";
	    	document.getElementById("mimgchk").innerHTML = text;
	    	document.frm.file1.focus();
	        return;
	    }else{
	    	document.getElementById("mimgchk").innerHTML = "";
	    }
	   	
	   	if (document.frm.sp.value=="") {
	    	text = "상품가격을 등록해주세용.";
	    	document.getElementById("spchk").innerHTML = text;
	    	document.frm.sp.focus();
	        return;
	    }else{
	    	document.getElementById("spchk").innerHTML = "";
	    }
	   	
	   	if (document.frm.dw.value=="") {
	    	text = "배송방법을 선택해주세용.";
	    	document.getElementById("dwchk").innerHTML = text;
	    	document.frm.dw.focus();
	        return;
	    }else{
	    	document.getElementById("dwchk").innerHTML = "";
	    }
	   	
	   	if(document.frm.dw.value=="0" && document.frm.df.value==""){
	   		text = "배송료를 입력해주세요.";
	   		document.getElementById("dfchk").innerHTML = text;
	    	document.frm.df.focus();
	        return;
	   	}else{
	    	document.getElementById("dfchk").innerHTML = "";
	    }
	   	
	   	if (document.frm.sellername.value=="") {
	    	text = "판매자를 입력해주세용.";
	    	document.getElementById("snchk").innerHTML = text;
	    	document.frm.sellername.focus();
	        return;
	    }else{
	    	document.getElementById("snchk").innerHTML = "";
	    }
	    
	   	if (document.frm.phone1.value=="" || document.frm.phone2.value=="" || document.frm.phone3.value=="") {
	    	text = "전화번호를 입력해주세용.";
	    	document.getElementById("pnchk").innerHTML = text;
	    	document.frm.phone1.focus();
	        return;
	    }else if(document.frm.phone2.value.length<3 || document.frm.phone3.value.length<4){
	    	text = "전화번호를 제대로 입력해주세용.";
	    	document.getElementById("pnchk").innerHTML = text;
	    	document.frm.phone1.focus();
	        return;
	    }else{
	    	document.getElementById("pnchk").innerHTML = "";
	    }
	   	
	   	if(document.frm.aucdetail.value==""){
	   		text = "상세정보를 입력해주세요.";
	   		document.getElementById("adchk").innerHTML = text;
	    	document.frm.aucdetail.focus();
	        return;
	   	}else{
	    	document.getElementById("adchk").innerHTML = "";
	    }
		
		var form = new FormData(document.getElementById('frm'));

		$.ajax({
			type : 'POST',
			data : form,
			url : "<c:url value='/uploadFileSave'/>",
			dataType : "json",
			processData: false,
		 	contentType: false, 
			success : function(data) {
				if (data.cnt > 0) {
					alert("저장됐습니다.");
					location.href = "<c:url value='/main'/>";
				} else {
					alert("저장에실패");
				} 
			},
			error : function(error) {
				  alert("error" + error);

			}
		});
	});
});

//숫자만 입력 받을 수 있게 해주는 함수	
function onlyNumber(event){
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		return false;
}
function removeChar(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		event.target.value = event.target.value.replace(/[^0-9]/g, "");
}
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>