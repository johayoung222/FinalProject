<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="YYYY-MM-dd" var="today" />
<!-- header 시작 -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Get It :: 중고거래의 중심" name="pageTitle" />
</jsp:include>
<!-- header 끝 -->
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Gamja+Flower|Jua|Nanum+Brush+Script|Nanum+Gothic|Nanum+Myeongjo|Nanum+Pen+Script|Noto+Sans+KR|Sunflower:300" rel="stylesheet">
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
		fontNames: ['Do Hyeon', 'Nanum Gothic', 'Nanum Myeongjo', 'Nanum Pen Script', 'Nanum Brush Script' , 'Noto Sans KR' , 'Sunflower' , 'Jua' , 'Gamja Flower'] ,
		fontNamesIgnoreCheck: ['Do Hyeon' , 'Nanum Gothic' , 'Nanum Myeongjo' , 'Nanum Pen Script' , 'Nanum Brush Script' , 'Noto Sans KR' , 'Sunflower' , 'Jua' , 'Gamja Flower'] ,
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
      url: '${pageContext.request.contextPath}/image',
      cache: false,
      contentType: false,
      enctype: 'multipart/form-data',
      processData: false,
      success: function(url) {
        $(el).summernote('editor.insertImage', "${pageContext.request.contextPath}/resources/upload/"+url);
        $('#imageBoard > ul').append('<li><img src="'+url+'" width="480" height="auto"/></li>');
        $('div[name="auctiondetail"]').html($('#summernote').summernote());
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
						<select class="select-field" id="categoryMacro" name="categoryMacro" onchange="fn_next(this.value)">
							<option value="" hidden="true">대분류</option>
							<c:forEach var="rs" items="${ctgList}" varStatus="status">
								<option id="categoryMacro" value="${rs.categoryMacro}">${rs.categoryName}</option>
							</c:forEach>
						</select> 
						
						<select class="select-field" id="categoryMicro" name="categoryMicro">
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
				<input type="text" class="input-field" name="auctionTitle" id="auctionTitle" autocomplete="off" />
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
				<input type="text" class="input-field" name="auctionPrice" id="auctionPrice" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' autocomplete="off" >
			</label>
			<p id="spchk" style = "font-style: italic ; font-weight: bold; font-size:0.8em;  color: red;"></p>
			
			<label for="field5">
			<span>배송방법: </span>
				<select class="select-field" name="auctionStatus" id="auctionStatus">
							<option value="">선택</option>
							<option value="0">택배</option>
							<option value="1">회사로 직접 방문</option>
				</select>
			</label>
			<p id="dwchk" style = "font-style: italic ; font-weight: bold; font-size:0.8em;  color: red;"></p>
			
			
			<label for="field7">
			<span>판매자: </span>
				<input type="text" class="input-field" name="auctionMember" id="auctionMember" autocomplete="off" value="${memberLoggedIn.memberId }" disabled="disabled" >
			</label>				
			<p id="snchk" style = "font-style: italic ; font-weight: bold; font-size:0.8em;  color: red;"></p>
			
			<label for="field8"><span>판매자연락처: </span>			
			 
			<input type="text" class="tel-number-field" id="phone1" name="phone1" value="${fn:substring(memberLoggedIn.memberPhone,0,3) }" maxlength="3" disabled="disabled" /> -
			<input type="text" class="tel-number-field" id="phone2" name="phone2" value="${fn:substring(memberLoggedIn.memberPhone,3,7) }" maxlength="4" disabled="disabled" /> -
			<input type="text" class="tel-number-field" id="phone3" name="phone3" value="${fn:substring(memberLoggedIn.memberPhone,7,13) }" maxlength="4" disabled="disabled" /></label>
			
			<p id="pnchk" style = "font-style: italic ; font-weight: bold; font-size:0.8em;  color: red;"></p>

			<label for="field9"><span>상세정보: </span>
			<div class="float"></div>
			<!-- <textarea class="textarea-field" id="summernote" name="aucdetail"></textarea> -->
			<textarea class="textarea-field" id="summernote" name="auctiondetail"></textarea>			
			</label>
			<p id="adchk" style = "font-style: italic ; font-weight: bold; font-size:0.8em;  color: red;"></p>
		
			<input type="button" id="saveBtn" value="입력"/>
		</div>
	</form>
</div>


<script>


//daterangepicker 적용부분
var dateFlag = 0;	// 초기값으로 dateFlag값이 1이 될 경우에
var dateFlagMsg = "";

$(function() {
	
	$('input[name="dateRange"]').daterangepicker({		
	    "singleDatePicker": true,
		locale : {
			format : 'YYYY-MM-DD H:mm A',
			cancelLabel : 'clear'
		}
	
	});
	$('input[name="dateRange"]').on('apply.daterangepicker', function(ev, picker) {
		console.log(picker.startDate.format('YYYY-MM-DD H:mm A').substr(0,10));
		
		var startD = new Date(picker.startDate.format('YYYY-MM-DD H:mm A'));
		var endD = new Date(picker.endDate.format('YYYY-MM-DD H:mm A'));
		var todayD = new Date("${today}");
		
		// 경매기간 7일 split으로 잘라서 일 단위 계산
		var endDateArray = picker.startDate.format('YYYY-MM-DD H:mm A').substr(0,10).split("-");
		var todayDateArray = "${today}".split("-");
		// alert("오늘날짜 일 : "+todayDateArray[2]+" 끝나는 날짜 일 : "+endDateArray[2]);
		// alert("밀리세컨드 startDay = "+startD.getTime());
		// alert("picker.start typeof"+typeof(picker.startDate));
		var test = new Date(startD.getTime() + (1000*60*60*24*3)).toJSON();
		// alert("test = "+test);
		
		if(startD < todayD) {
			dateFlagMsg = "경매 등록 기간을 현재 날짜 이후여야 합니다.";
			// var dateFlag = 0;
			$(this).val("날짜를 다시 선택해주세요.").css("color" , "red");
			alert(dateFlagMsg);
		} else {
			dateFlag = 1;
			// alert(todayD);
			// console.log("pickD = "+typeof(${today}));
			
			// 시간 , AM / PM 자르기
			var temp = picker.startDate.format('YYYY-MM-DD H:mm A').substr(11,7);
			
			$(this).val(picker.startDate.format('YYYY-MM-DD H:mm A')+ ' ~ '+ test.substr(0,10) + " " + temp).css("color" , "black");;			
		}
	});
	
	

	$('input[name="dateRange"]').on('cancel.daterangepicker',
			function(ev, picker) {
				$(this).val('');
			});

});




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
				$('#categoryMicro').children("option").remove();
				//data.rows 에 코드, 이름 형태로 되어있다고 가정.
				var codeList = data.resultMList;
				$('#categoryMicro').append( "<option value='' id='categoryMicro' hidden='true'>소분류</option>");
				
				for (var i = 0; i < codeList.length; i++) {
					var option = "<option value='" + codeList[i].categoryMicro + "'>"+ codeList[i].categoryName + "</option>";
					//대상 콤보박스에 추가
					$('#categoryMicro').append(option);
				}
			}
		},
		error : function(xhr, status, error) {
			alert("ajax처리오류!");
		}
	});
}

//파일 미리보기 구현 함수
$(document).ready(
	function() {
		var fileTarget = $('.filebox .upload-hidden');

		fileTarget.on('change', function() {
			if (window.FileReader) {
				// 파일명 추출
				var filename = $(this)[0].files[0].name;
			} else {
				// Old IE 파일명 추출
				var filename = $(this).val().split('/').pop().split('\\').pop();
			}
			;
			var fileName;
			fileName = filename.slice(filename.indexOf(".") + 1).toLowerCase();
			if(fileName != "jpg" && fileName != "png" &&  fileName != "gif" &&  fileName != "bmp"){
				alert("이미지 파일은 (jpg, png, gif, bmp) 형식만 등록 가능합니다.");
				$(this).siblings('.upload-name').val("");
				return;
			}

		
			$(this).siblings('.upload-name').val(filename);
		});

		//preview image 
		var imgTarget = $('.preview-image .upload-hidden');

		imgTarget.on('change', function() {
							var parent = $(this).parent();
							parent.children('.upload-display').remove();

							if (window.FileReader) {
								//image 파일만
								if (!$(this)[0].files[0].type.match(/image\//))
									return;
									

								var reader = new FileReader();
								reader.onload = function(e) {
									var src = e.target.result;
									parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
								}
								reader.readAsDataURL($(this)[0].files[0]);
							} else {
								$(this)[0].select();
								$(this)[0].blur();
								var imgSrc = document.selection.createRange().text;
								parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

								var img = $(this).siblings('.upload-display').find('img');
								img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+ imgSrc + "\")";
							}
						});
	});

//글 저장 부분
$(function() {
	$("#saveBtn").click(function() {
		
		//null값 체크
		var text;
	    
		if (document.frm.categoryMacro.value=="") {
	    	text = "대분류를 입력해주세용.";
	    	document.getElementById("ctgchk").innerHTML = text;
	    	document.frm.categoryMacro.focus();
	        return;
	    }else{
	    	document.getElementById("ctgchk").innerHTML = "";
	    }
		
		if (document.frm.categoryMicro.value=="") {
	    	text = "소분류를 입력해주세용";
	    	document.getElementById("ctgchk").innerHTML = text;
	    	document.frm.categoryMicro.focus();
	        return;
	    }else{
	    	document.getElementById("ctgchk").innerHTML = "";
	    }
		
		if(dateFlag == 1) {
			
		} else {
			alert("원하시는 날짜를 선택해주세요.");
			return;
		}
		
	   	if (document.frm.auctionTitle.value=="") {
	    	text = "상품명을 입력해주세용.";
	    	document.getElementById("titchk").innerHTML = text;
	    	document.frm.auctionTitle.focus();
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
	   	
	   	if (document.frm.auctionPrice.value=="") {
	    	text = "상품가격을 등록해주세용.";
	    	document.getElementById("spchk").innerHTML = text;
	    	document.frm.sp.focus();
	        return;
	    }else{
	    	document.getElementById("spchk").innerHTML = "";
	    }
	   	
	   	if (document.frm.auctionStatus.value=="") {
	    	text = "배송방법을 선택해주세용.";
	    	document.getElementById("dwchk").innerHTML = text;
	    	document.frm.auctionStatus.focus();
	        return;
	    }else{
	    	document.getElementById("dwchk").innerHTML = "";
	    }
	   	
	   	var summernotehtml = $('#summernote').summernote('code');
	   	console.log(summernotehtml);
	   	if(summernotehtml=="<p><br></p>"){
	   		text = "상세정보를 입력해주세요.";
	   		document.getElementById("adchk").innerHTML = text;
	    	// document.frm.auctiondetail.focus();
	        return;
	   	}else{
	    	document.getElementById("adchk").innerHTML = "";
	    }
		
		var form = new FormData(document.getElementById('frm'));

		console.log(form);
		
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
					location.href = "${pageContext.request.contextPath }";
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