<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp">
	<jsp:param value="allMember" name="pageTitle"/>
</jsp:include>

<jsp:include page="/WEB-INF/views/common/adminSide.jsp"></jsp:include>

<style>
.siteStatistics-container{
	width:1300px;
	min-height:750px;
	height:750px;
	position:relative;
	margin-left:180px;
	top:-37px;
}

</style>

<!--Load the AJAX API-->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
function MF() {
   $.ajax({
      	url:"${pageContext.request.contextPath}/admin/memberGender.do",
      	dataType:"json",
      	success:function(data){
      	//console.log(data);

      	// Load the Visualization API and the corechart package.
      	google.charts.load('current', {'packages':['corechart']});	

      	// Set a callback to run when the Google Visualization API is loaded.
      	google.charts.setOnLoadCallback(drawChart1);
      		 
      	function drawChart1() {
      		var data1 = new google.visualization.DataTable();
      	    data1.addColumn('string', 'gender');
      	    data1.addColumn('number', 'number');
      	    data1.addRows([
      	      ['남자', data[0].CNT],
      	      ['여자', data[1].CNT],
      	    ]);

      	    // Set chart options
      	    var options1 = {'title':'남/여 비율',
      	                   'width':500,
      	                   'height':500};

      	    // Instantiate and draw our chart, passing in some options.
      	    var chart1 = new google.visualization.PieChart(document.getElementById('MF'));
      	    chart1.draw(data1, options1);
      		  }
      	},error:function(){
      		console.log("ajax요청 실패!!");
      	}
      });
	var x = document.getElementById("MF");
	if (x.style.display === "block") {
  		 x.style.display = "none";
 	} else {
 		 x.style.display = "block";
 	}
}
    
function paidProductCategory(){
	//console.log("결제된 상품 비율");
		$.ajax({
    	url:"${pageContext.request.contextPath}/admin/paidProductCategory.do",
    	dataType:"json",
    	success:function(data){
    	//console.log(data);
    	
    	// Load the Visualization API and the corechart package.
       	google.charts.load('current', {'packages':['corechart']});	

       	// Set a callback to run when the Google Visualization API is loaded.
       	google.charts.setOnLoadCallback(drawChart1(data));
       		 
       	function drawChart1(data) {
       		var data1 = new google.visualization.DataTable();
      	    data1.addColumn('string', 'category');
      	    data1.addColumn('number', 'number');
      	    for(var i in data){
      	    data1.addRows([
      	       	[data[i].NAME, data[i].CNT]
      	    ]);
      	    }

      	    // Set chart options
      	    var options1 = {'title':'결제된 상품 비율',
      	                   'width':500,
      	                   'height':500};

		 // Instantiate and draw our chart, passing in some options.
		 var chart1 = new google.visualization.PieChart(document.getElementById('paidProductCategory'));
		 chart1.draw(data1, options1);
       	}
    	},error:function(){
    		console.log("ajax요청 실패!!");
    	}
    }); 
	
	var x = document.getElementById("paidProductCategory");
	if (x.style.display === "block") {
  		 x.style.display = "none";
 	} else {
 		 x.style.display = "block";
 	}
}

function regist(){
	//console.log("판매 상품 비율");
	$.ajax({
    	url:"${pageContext.request.contextPath}/admin/registCategory.do",
    	dataType:"json",
    	success:function(data){
    	//console.log(data);
    	
    	// Load the Visualization API and the corechart package.
       	google.charts.load('current', {'packages':['corechart']});	

       	// Set a callback to run when the Google Visualization API is loaded.
       	google.charts.setOnLoadCallback(drawChart1(data));
       		 
       	function drawChart1(data) {
       		var data1 = new google.visualization.DataTable();
      	    data1.addColumn('string', 'categoryName');
      	    data1.addColumn('number', 'number');
      	    for(var i in data){
      	    data1.addRows([
      	       	[data[i].NAME, data[i].CNT]
      	    ]);
      	    }

      	    // Set chart options
      	    var options1 = {'title':'판매 상품 비율',
      	                   'width':500,
      	                   'height':500};

		 // Instantiate and draw our chart, passing in some options.
		 var chart1 = new google.visualization.PieChart(document.getElementById('regist'));
		 chart1.draw(data1, options1);
       	}
    	},error:function(){
    		console.log("ajax요청 실패!!");
    	}
    }); 
	var x = document.getElementById("regist");
	if (x.style.display === "block") {
  		 x.style.display = "none";
 	} else {
 		 x.style.display = "block";
 	}
}
 
function auction(){
	//console.log("경매 상품 비율");
	$.ajax({
    	url:"${pageContext.request.contextPath}/admin/auctionCategory.do",
    	dataType:"json",
    	success:function(data){
    	//console.log(data);
    	
    	// Load the Visualization API and the corechart package.
       	google.charts.load('current', {'packages':['corechart']});	

       	// Set a callback to run when the Google Visualization API is loaded.
       	google.charts.setOnLoadCallback(drawChart1(data));
       		 
       	function drawChart1(data) {
       		var data1 = new google.visualization.DataTable();
      	    data1.addColumn('string', 'categoryName');
      	    data1.addColumn('number', 'number');
      	    for(var i in data){
      	    data1.addRows([
      	       	[data[i].NAME, data[i].CNT]
      	    ]);
      	    }

      	    // Set chart options
      	    var options1 = {'title':'경매 상품 비율',
      	                   'width':500,
      	                   'height':500};

		 // Instantiate and draw our chart, passing in some options.
		 var chart1 = new google.visualization.PieChart(document.getElementById('auction'));
		 chart1.draw(data1, options1);
       	}
    	},error:function(){
    		console.log("ajax요청 실패!!");
    	}
    }); 
	var x = document.getElementById("auction");
	if (x.style.display === "block") {
  		 x.style.display = "none";
 	} else {
 		 x.style.display = "block";
 	}
}

function question(){
	//console.log("1:1문의 비율");
	$.ajax({
    	url:"${pageContext.request.contextPath}/admin/questionCategory.do",
    	dataType:"json",
    	success:function(data){
    	//console.log(data);
    	
    	// Load the Visualization API and the corechart package.
       	google.charts.load('current', {'packages':['corechart']});	

       	// Set a callback to run when the Google Visualization API is loaded.
       	google.charts.setOnLoadCallback(drawChart1(data));
       		 
       	function drawChart1(data) {
       		var data1 = new google.visualization.DataTable();
      	    data1.addColumn('string', 'categoryName');
      	    data1.addColumn('number', 'number');
      	    for(var i in data){
      	    data1.addRows([
      	       	[data[i].NAME, data[i].CNT]
      	    ]);
      	    }

      	    // Set chart options
      	    var options1 = {'title':'1:1문의 비율',
      	                   'width':500,
      	                   'height':500};

		 // Instantiate and draw our chart, passing in some options.
		 var chart1 = new google.visualization.PieChart(document.getElementById('question'));
		 chart1.draw(data1, options1);
       	}
    	},error:function(){
    		console.log("ajax요청 실패!!");
    	}
    }); 
	var x = document.getElementById("question");
	if (x.style.display === "block") {
  		 x.style.display = "none";
 	} else {
 		 x.style.display = "block";
 	}
}
</script>
<style>
#MF, #paidProductCategory #regist #auction #question{
	display:none;
}
rect{
	display:inline;
	position:relative;
}
.site{
	position:relative;
	display:inline-block;
	width:500px;
}


</style>

<br />
<section id="siteStatistics-container" class="siteStatistics-container">
<p>사이트 통계</p>
<hr />
<button type="button" class="btn btn-outline-dark" id="MF-btn" onclick="MF();">남/녀 비율</button>
<button type="button" class="btn btn-outline-dark" id="paidProductCategory-btn" onclick="paidProductCategory();">결제된 상품 비율</button>
<button type="button" class="btn btn-outline-dark" id="reigst-btn" onclick="regist();">판매 상품 비율</button>
<button type="button" class="btn btn-outline-dark" id="auction-btn" onclick="auction();">경매 상품 비율</button>
<button type="button" class="btn btn-outline-dark" id="question-btn" onclick="question();">1:1문의 비율</button>
<hr />
<div class="site" id="MF"></div>

<div class="site" id="paidProductCategory"></div>
     
<div class="site" id="regist"></div>

<div class="site" id="auction"></div>

<div class="site" id="question"></div>
  
</section> 

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>