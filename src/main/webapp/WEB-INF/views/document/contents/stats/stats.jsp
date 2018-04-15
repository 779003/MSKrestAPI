<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link href="/bootstrap/datatables/dataTables.bootstrap4.css" rel="stylesheet">

    <div class="card mb-3">
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              <thead>
                <tr>
                  <th>API 키</th>
                  <th>어플리케이션 이름</th>
                  <th>사용 API</th>
                  <th>등록일</th>
                  <th>최종수정일</th>
                  <th>누적 조회수</th>
                </tr>
              </thead>
              <tbody>
                <tr>		
                  <td>6234L4FXE9e4778h0I2R</td>
                  <td><a href='/stats/6234L4FXE9e4778h0I2R'>피쉬닷컴 수족관찾기 서비스</a></td>
                  <td>관상어 정보</td>
                  <td>2018/04/11</td>
                  <td>2018/04/11</td>
                  <td>76</td>
                </tr>
                <tr>
                  <td>Qk9Ym70puv8S0c965r3J</td>
                  <td><a href='/stats/Qk9Ym70puv8S0c965r3J'>API 호출 테스트</a></td>
                  <td>관상어 정보</td>
                  <td>2018/04/11</td>
                  <td>2018/04/11</td>
                  <td>248</td>
                </tr>
                <tr>		
                  <td>4465K58784Rs667vew59</td>
                  <td><a href='/stats/4465K58784Rs667vew59'>app3</a></td>
                  <td>수족관 정보</td>
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
	  	$("#dataTable_length").html("통계를 보고자 하는 애플리케이션을 선택해주세요.");
  		$("#dataTable_filter").hide();
  		$("#dataTable_info").hide();
  		$(".pagination").hide();
  	};
  	</script>
