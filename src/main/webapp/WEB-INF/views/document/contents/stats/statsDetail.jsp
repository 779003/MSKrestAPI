<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="/bootstrap/datatables/dataTables.bootstrap4.css" rel="stylesheet">
<link href="/css/datepicker.css" rel="stylesheet" type="text/css">

      <!-- 기본 정보-->
      <div class="card mb-3">
        <div class="card-body">
			<h3>${statsDetailMain.APP_NAME}</h3>
			<div align="right"> 
				<c:choose>
					<c:when test="${'1' eq statsDetailMain.API_SEQ}">회원 관리 API</c:when>
					<c:when test="${'2' eq statsDetailMain.API_SEQ}">관상어 정보 API</c:when>
					<c:when test="${'3' eq statsDetailMain.API_SEQ}">수족관 정보 API</c:when>
					<c:otherwise>알수없는 API</c:otherwise>
				</c:choose>
				[ API KEY : ${statsDetailMain.API_KEY} ]</div>          
        </div>
      </div>
      <!-- 일간 현황--> 	
      <div class="card mb-3">
        <div class="card-header">일간 현황</div>
        <div class="card-body">
			<table style="width: 100%; text-align: center">
				<thead>
					<tr>		
						<th >오늘 요청수</th>
						<th >가장 많이 요청한 호스트</th>
						<th >성공 / 실패</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<c:choose>
								<c:when test="${empty statsToday.CALL_COUNT}">
									오늘 정보가 없습니다.
								</c:when>
								<c:otherwise>
									<font style="font-size: large;">${statsToday.CALL_COUNT}</font>
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${empty statsToday.TOP_HOST}">
									오늘 정보가 없습니다.
								</c:when>
								<c:otherwise>
									<font style="font-size: large;">${statsToday.TOP_HOST}</font>
								</c:otherwise>
							</c:choose>	
						</td>
						<td>
							<c:choose>
								<c:when test="${empty statsToday.SUCCESS_COUNT and statsToday.FAILURE_COUNT}">
									오늘 정보가 없습니다.
								</c:when>
								<c:otherwise>
									<font color="green" style="font-size: xx-large;">${statsToday.SUCCESS_COUNT}</font> 
									/ 
									<font color="red" style="font-size: xx-large;">${statsToday.FAILURE_COUNT}</font>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</tbody>
			</table>      
        </div>
      </div>
      <!-- 기간선택 -->
      <div class="card-header">
	     <form id="selectDateForm" action="/stats/${statsDetailMain.API_KEY}">
	      	<p><b>기간별 통계</b></p> 
	      	<p style="text-align:left"> 현재 선택 기간 : ${selectDate}</p> 
	      	<p style="text-align:right"> 기간선택 : 
				<input name='selectDate' value="${selectDate}" type="text" data-range="true" data-multiple-dates-separator="-" data-language="en" class="datepicker-here"/>
			<button type="button" class="btn btn-primary half" onclick="datePickup()">조회</button> 
			</p>
		 </form>
	  </div>
      <!-- 요청수 통계-->
      <div class="card mb-3">
        <div class="card-header">요청 수 통계</div>
        <div class="card-body">
          <canvas id="myAreaChart" width="100%" height="30"></canvas>
        </div>
        <div class="card-footer small text-muted">※ 오늘 요청 수는 포함되지 않습니다.</div>
      </div>
      
      <div class="row">
      
        <div class="col-lg-8">
          <!-- 요청 리퍼러 통계-->
          <div class="card mb-3">
            <div class="card-header">요청 리퍼러 통계</div>
            <div class="card-body">
              <canvas id="myBarChart" width="100" height="50"></canvas>
            </div>
          </div>
        </div>
        
        <div class="col-lg-4">
        
          <!-- 요청 실패 분석-->
          <div class="card mb-3">
            <div class="card-header">요청 실패 분석</div>
            <div class="card-body">
              <canvas id="myPieChart" width="100%" height="100"></canvas>
            </div>
            <div class="card-footer small text-muted">※ 코드 정보는 <a href="/docs/code">여기</a>서 확인하세요.</div>
          </div>
        </div>
      </div>
    
    <!-- API 로그 -->
    <div class="card mb-3">
        <div class="card-header">API 전체 로그</div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" style="width: 100%">
              <thead>
                <tr>   
                  <th style="white-space: nowrap">요청 시간</th>              
                  <th style="white-space: nowrap">요청 URL</th>
                  <th style="white-space: nowrap">리퍼러</th>
                  <th style="white-space: nowrap">요청한 호스트</th>
                  <th style="white-space: nowrap">성공 여부</th>
                  <th style="white-space: nowrap">에러 코드</th>
                </tr>
              </thead>
              <tfoot>
                <tr>
                  <th>요청 시간</th>                
                  <th>요청 URL</th>
                  <th>리퍼러</th>
                  <th>요청한 호스트</th>
                  <th>성공 여부</th>
                  <th>에러 코드</th>
                </tr>
              </tfoot>
              <tbody>
              <c:forEach items="${statsLogList}" var="statsLog">
              	<tr>                  
                  <td>
                  	<fmt:parseDate var="dateString" value="${statsLog.ACCEPT_TIME}" pattern="yyyy-MM-dd HH:mm:ss" /> 
					<fmt:formatDate value="${dateString}" pattern="yyyy/MM/dd HH:mm" />
                  </td>
                  <td>${statsLog.REQUEST_URL}</td>
                  <td >${statsLog.REFERER}</td>
                  <td>${statsLog.REMOTE_HOST}</td>
                  <td>${statsLog.SUCCESS}</td>
                  <td>${statsLog.ERROR_CODE}</td>
                </tr>
              </c:forEach>              
              </tbody>
            </table>
          </div>
        </div>
      </div>
    
    
<script>

function datePickup(){
	$("#selectDateForm").submit();
}

//테스트 임시 데이터
var calls_date = new Array();
var calls = new Array();
var referer = new Array();
var referer_count = new Array();
var error_code = new Array();
var error_code_count = new Array();

<c:forEach items="${statsCall}" var="callsLog">
	<fmt:parseDate var="dateString" value="${callsLog.LOG_DATE}" pattern="yyyy-MM-dd HH:mm:ss" /> 
	calls_date.push('<fmt:formatDate value="${dateString}" pattern="yyyy/MM/dd" />');
	calls.push("${callsLog.CALL_COUNT}");
</c:forEach>

<c:forEach items="${statsReferer}" var="refererLog">
	var referer_name = "${refererLog.REFERER}";
	if(referer_name.length >20){
		referer_name = "${refererLog.REFERER}".substring(0,20) +"...";
	}
	referer.push(referer_name);
	referer_count.push("${refererLog.REFERER_COUNT}");
</c:forEach>

<c:forEach items="${statsError}" var="errorLog">
	error_code.push("${errorLog.ERROR_CODE}");
	error_code_count.push("${errorLog.ERROR_COUNT}");
</c:forEach>

</script>
    
    <script src="/bootstrap/chart.js/Chart.js"></script>
	<script src="/bootstrap/datatables/jquery.dataTables.js"></script>
    <script src="/bootstrap/datatables/dataTables.bootstrap4.js"></script>
    <script src="/js/sb-admin-charts.js"></script>
 	<script src="/js/sb-admin-datatables.js"></script>

 	    <script src="/js/datepicker.js"></script>
        <script src="/js/datepicker.kor.js"></script>