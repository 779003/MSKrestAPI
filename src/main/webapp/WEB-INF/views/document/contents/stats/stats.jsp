<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link href="/bootstrap/datatables/dataTables.bootstrap4.css" rel="stylesheet">

    <div class="card mb-3">
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
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
                <tr>		
                  <td>6234L4FXE9e4778h0I2R</td>
                  <td><a href='/stats/6234L4FXE9e4778h0I2R'>�ǽ����� ������ã�� ����</a></td>
                  <td>����� ����</td>
                  <td>2018/04/11</td>
                  <td>2018/04/11</td>
                  <td>76</td>
                </tr>
                <tr>
                  <td>Qk9Ym70puv8S0c965r3J</td>
                  <td><a href='/stats/Qk9Ym70puv8S0c965r3J'>API ȣ�� �׽�Ʈ</a></td>
                  <td>����� ����</td>
                  <td>2018/04/11</td>
                  <td>2018/04/11</td>
                  <td>248</td>
                </tr>
                <tr>		
                  <td>4465K58784Rs667vew59</td>
                  <td><a href='/stats/4465K58784Rs667vew59'>app3</a></td>
                  <td>������ ����</td>
                  <td>2018/04/15</td>
                  <td>2018/04/15</td>
                  <td>0</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
	<script src="/bootstrap/datatables/jquery.dataTables.js"></script>
    <script src="/bootstrap/datatables/dataTables.bootstrap4.js"></script>
 	<script src="/js/sb-admin-datatables.js"></script>
  	<script>
  	window.onload = function() {
	  	$("#dataTable_length").html("��踦 ������ �ϴ� ���ø����̼��� �������ּ���.");
  		$("#dataTable_filter").hide();
  		$("#dataTable_info").hide();
  		$(".pagination").hide();
  	};
  	</script>
