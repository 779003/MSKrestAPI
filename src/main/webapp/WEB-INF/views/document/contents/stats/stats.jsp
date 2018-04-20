<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<link href="/bootstrap/datatables/dataTables.bootstrap4.css" rel="stylesheet">

    <div class="card mb-3">
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" style="width:100%">
              <thead>
                <tr>
                  <th>API Ű</th>
                  <th>���ø����̼� �̸�</th>
                  <th>��� API</th>
                  <th>�����</th>
                  <th>����������</th>
                  <th>���� ��ȸ��</th>
                </tr>
              </thead>
              <tbody>
	              <c:forEach items="${appList}" var="app">
	              	<tr>		
	                  <td>${app.API_KEY}</td>
	                  <td><a href='/stats/${app.API_KEY}'>${app.APP_NAME}</a></td>
	                  <td>
	                  	<c:choose>
	                  		<c:when test="${'1' eq app.API_SEQ}">ȸ�� ����</c:when>
	                  		<c:when test="${'2' eq app.API_SEQ}">����� ����</c:when>
	                  		<c:when test="${'3' eq app.API_SEQ}">������ ����</c:when>
	                  	</c:choose> 
	                  </td>
	                  <td>${app.REG_DT}</td>
	                  <td>${app.MOD_DT}</td>
	                  <td>${app.CALL_COUNT_TOTAL}</td>
	                </tr>
	              </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </div>
	<script src="/bootstrap/datatables/jquery.dataTables.js"></script>
    <script src="/bootstrap/datatables/dataTables.bootstrap4.js"></script>
 	<script src="/js/sb-admin-datatables.js"></script>
  	<script>
	$(document).ready(function(){
	  	$("#dataTable_length").html("��踦 ������ �ϴ� ���ø����̼��� �������ּ���.");
  		$("#dataTable_filter").hide();
  		$("#dataTable_info").hide();
  		$(".pagination").hide();
  	});
  	</script>
