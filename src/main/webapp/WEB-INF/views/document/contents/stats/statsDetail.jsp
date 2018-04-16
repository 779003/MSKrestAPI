<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link href="/bootstrap/datatables/dataTables.bootstrap4.css" rel="stylesheet">
      <!-- 기본 정보-->
      <div class="card mb-3">
        <div class="card-body">
			<h3>API 호출 테스트</h3>
			<div align="right"> 물고기 정보 API [ API KEY : Qk9Ym70puv8S0c965r3J ]</div>          
        </div>
      </div>
      <!-- 일간 현황--> 	
      <div class="card mb-3">
        <div class="card-header">일간 현황</div>
        <div class="card-body">
			<table style="width: 100%; text-align: center">
				<thead>
					<tr>		
						<th>오늘 요청수</th>
						<th>가장 많이 요청한 호스트</th>
						<th>성공 / 실패</th>
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
      <!-- 요청수 통계-->
      <div class="card mb-3">
        <div class="card-header">요청수 통계</div>
        <div class="card-body">
          <canvas id="myAreaChart" width="100%" height="30"></canvas>
        </div>
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
            <div class="card-footer small text-muted">코드 정보는 <a href="/docs/code">여기</a>서 확인하세요.</div>
          </div>
        </div>
      </div>
    
    <!-- API 로그 -->
    <div class="card mb-3">
        <div class="card-header">API 전체 로그</div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
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
                <tr>                  
                  <td>2018/04/11 오후 11:30:06</td>
                  <td>/api/v1/fish</td>
                  <td >http://app.icenium.com/appbuilder/simulator/CT1hX5cJzb55oIKqHpebt3Mj-J7w0QZog7F6ITnqYsoQVVpUkcTP7Vl-XoUp-XVzI8CaOwf5dJzAFlGRc1XfBw==/debug/iOS_Phone/6.4.0/index.html</td>
                  <td>0:0:0:0:0:0:0:1</td>
                  <td>SUCCESS</td>
                  <td></td>
                </tr>
                <tr>      
                  <td>2018/04/11 오후 11:32:18</td>            
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
//테스트 임시 데이터
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
referer[1] = '리퍼러없음';

var referer_count = new Array();
referer_count[0] = 36;
referer_count[1] = 13;

//에러코드 출력은 4개 제한 (상위)
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
