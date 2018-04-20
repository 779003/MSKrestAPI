<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="/bootstrap/datatables/dataTables.bootstrap4.css" rel="stylesheet">
<link href="/css/datepicker.css" rel="stylesheet" type="text/css">

      <!-- �⺻ ����-->
      <div class="card mb-3">
        <div class="card-body">
			<h3>${statsDetailMain.APP_NAME}</h3>
			<div align="right"> 
				<c:choose>
					<c:when test="${'1' eq statsDetailMain.API_SEQ}">ȸ�� ���� API</c:when>
					<c:when test="${'2' eq statsDetailMain.API_SEQ}">����� ���� API</c:when>
					<c:when test="${'3' eq statsDetailMain.API_SEQ}">������ ���� API</c:when>
					<c:otherwise>�˼����� API</c:otherwise>
				</c:choose>
				[ API KEY : ${statsDetailMain.API_KEY} ]</div>          
        </div>
      </div>
      <!-- �ϰ� ��Ȳ--> 	
      <div class="card mb-3">
        <div class="card-header">�ϰ� ��Ȳ</div>
        <div class="card-body">
			<table style="width: 100%; text-align: center">
				<thead>
					<tr>		
						<th >���� ��û��</th>
						<th >���� ���� ��û�� ȣ��Ʈ</th>
						<th >���� / ����</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<c:choose>
								<c:when test="${empty statsToday.CALL_COUNT}">
									���� ������ �����ϴ�.
								</c:when>
								<c:otherwise>
									<font style="font-size: large;">${statsToday.CALL_COUNT}</font>
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${empty statsToday.TOP_HOST}">
									���� ������ �����ϴ�.
								</c:when>
								<c:otherwise>
									<font style="font-size: large;">${statsToday.TOP_HOST}</font>
								</c:otherwise>
							</c:choose>	
						</td>
						<td>
							<c:choose>
								<c:when test="${empty statsToday.SUCCESS_COUNT and statsToday.FAILURE_COUNT}">
									���� ������ �����ϴ�.
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
      <!-- �Ⱓ���� -->
      <div class="card-header">
	     <form id="selectDateForm" action="/stats/${statsDetailMain.API_KEY}">
	      	<p><b>�Ⱓ�� ���</b></p> 
	      	<p style="text-align:left"> ���� ���� �Ⱓ : ${selectDate}</p> 
	      	<p style="text-align:right"> �Ⱓ���� : 
				<input name='selectDate' value="${selectDate}" type="text" data-range="true" data-multiple-dates-separator="-" data-language="en" class="datepicker-here"/>
			<button type="button" class="btn btn-primary half" onclick="datePickup()">��ȸ</button> 
			</p>
		 </form>
	  </div>
      <!-- ��û�� ���-->
      <div class="card mb-3">
        <div class="card-header">��û �� ���</div>
        <div class="card-body">
          <canvas id="myAreaChart" width="100%" height="30"></canvas>
        </div>
        <div class="card-footer small text-muted">�� ���� ��û ���� ���Ե��� �ʽ��ϴ�.</div>
      </div>
      
      <div class="row">
      
        <div class="col-lg-8">
          <!-- ��û ���۷� ���-->
          <div class="card mb-3">
            <div class="card-header">��û ���۷� ���</div>
            <div class="card-body">
              <canvas id="myBarChart" width="100" height="50"></canvas>
            </div>
          </div>
        </div>
        
        <div class="col-lg-4">
        
          <!-- ��û ���� �м�-->
          <div class="card mb-3">
            <div class="card-header">��û ���� �м�</div>
            <div class="card-body">
              <canvas id="myPieChart" width="100%" height="100"></canvas>
            </div>
            <div class="card-footer small text-muted">�� �ڵ� ������ <a href="/docs/code">����</a>�� Ȯ���ϼ���.</div>
          </div>
        </div>
      </div>
    
    <!-- API �α� -->
    <div class="card mb-3">
        <div class="card-header">API ��ü �α�</div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" style="width: 100%">
              <thead>
                <tr>   
                  <th style="white-space: nowrap">��û �ð�</th>              
                  <th style="white-space: nowrap">��û URL</th>
                  <th style="white-space: nowrap">���۷�</th>
                  <th style="white-space: nowrap">��û�� ȣ��Ʈ</th>
                  <th style="white-space: nowrap">���� ����</th>
                  <th style="white-space: nowrap">���� �ڵ�</th>
                </tr>
              </thead>
              <tfoot>
                <tr>
                  <th>��û �ð�</th>                
                  <th>��û URL</th>
                  <th>���۷�</th>
                  <th>��û�� ȣ��Ʈ</th>
                  <th>���� ����</th>
                  <th>���� �ڵ�</th>
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

//�׽�Ʈ �ӽ� ������
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