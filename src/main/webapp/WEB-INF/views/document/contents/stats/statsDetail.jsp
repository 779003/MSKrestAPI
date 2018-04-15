<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link href="/bootstrap/datatables/dataTables.bootstrap4.css" rel="stylesheet">
      <!-- �⺻ ����-->
      <div class="card mb-3">
        <div class="card-body">
			<h3>API ȣ�� �׽�Ʈ</h3>
			<div align="right"> ����� ���� API [ API KEY : Qk9Ym70puv8S0c965r3J ]</div>          
        </div>
      </div>
      <!-- �ϰ� ��Ȳ--> 	
      <div class="card mb-3">
        <div class="card-header">�ϰ� ��Ȳ</div>
        <div class="card-body">
			<table style="width: 100%; text-align: center">
				<thead>
					<tr>		
						<th>���� ��û��</th>
						<th>���� ���� ��û�� ȣ��Ʈ</th>
						<th>���� / ����</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>43</td>
						<td>98.0.205.34</td>
						<td>48 / 1</td>
					</tr>
				</tbody>
			</table>      
        </div>
      </div>
      <!-- ��û�� ���-->
      <div class="card mb-3">
        <div class="card-header">��û�� ���</div>
        <div class="card-body">
          <canvas id="myAreaChart" width="100%" height="30"></canvas>
        </div>
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
            <div class="card-footer small text-muted">�ڵ� ������ <a href="/docs/code">����</a>�� Ȯ���ϼ���.</div>
          </div>
        </div>
      </div>
    
    <!-- API �α� -->
    <div class="card mb-3">
        <div class="card-header">API ��ü �α�</div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
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
                <tr>                  
                  <td>2018/04/11 ���� 11:30:06</td>
                  <td>/api/v1/fish</td>
                  <td >http://app.icenium.com/appbuilder/simulator/CT1hX5cJzb55oIKqHpebt3Mj-J7w0QZog7F6ITnqYsoQVVpUkcTP7Vl-XoUp-XVzI8CaOwf5dJzAFlGRc1XfBw==/debug/iOS_Phone/6.4.0/index.html</td>
                  <td>0:0:0:0:0:0:0:1</td>
                  <td>SUCCESS</td>
                  <td></td>
                </tr>
                <tr>      
                  <td>2018/04/11 ���� 11:32:18</td>            
                  <td>/api/v1/fish/432</td>
                  <td></td>
                  <td>0:0:0:0:0:0:0:1</td>
                  <td>FAILURE</td>
                  <td>1006</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    
<script>
//�׽�Ʈ �ӽ� ������
var calls_date = new Array();
calls_date[0] = "18'/04/09";
calls_date[1] = "18'/04/10";
calls_date[2] = "18'/04/11";
calls_date[3] = "18'/04/11";
calls_date[4] = "18'/04/12";
calls_date[5] = "18'/04/13";
calls_date[6] = "18'/04/14";

var calls = new Array();
calls[0] = 50;
calls[1] = 32;
calls[2] = 12;
calls[3] = 100;
calls[4] = 1;
calls[5] = 52;
calls[6] = 1;

var referer = new Array();
referer[0] = 'http://app.icenium.com';
referer[1] = '���۷�����';

var referer_count = new Array();
referer_count[0] = 36;
referer_count[1] = 13;

//�����ڵ� ����� 4�� ���� (����)
var error_code = new Array();
error_code[0] = "3005";
error_code[1] = "1001";
error_code[2] = "3001";
error_code[3] = "1005";

var error_code_count = new Array();
error_code_count[0] = 8;
error_code_count[1] = 4;
error_code_count[2] = 2;
error_code_count[3] = 1;
</script>
    
    <!-- Page level plugin JavaScript-->
    <script src="/bootstrap/chart.js/Chart.js"></script>
	<script src="/bootstrap/datatables/jquery.dataTables.js"></script>
    <script src="/bootstrap/datatables/dataTables.bootstrap4.js"></script>
    <!-- Custom scripts for this page-->
    <script src="/js/sb-admin-charts.js"></script>
 	<script src="/js/sb-admin-datatables.js"></script>
