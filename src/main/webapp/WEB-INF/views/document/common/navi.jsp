<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 좌측 네비 -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
	<a class="navbar-brand" href="/docs">mskim 백엔드 서비스</a>
	<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
				<li class="nav-item" data-toggle="tooltip" data-placement="right" title="백엔드서비스 소개">
					<a class="nav-link" href="/docs">
						<span class="nav-link-text">백엔드서비스 소개</span>
					</a>
				</li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right" title="오류 코드 정리">
					<a class="nav-link" href="/docs/code">
						<span class="nav-link-text">오류 코드 정리</span>
					</a>
				</li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right" title="OpenAPI 사용방법">
					<a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#howToUse" data-parent="#exampleAccordion">
						<span class="nav-link-text">OpenAPI 사용방법</span>
					</a>
				<ul class="sidenav-second-level collapse" id="howToUse">
					<li>
						<a href="/docs/key">키 발급</a>
					</li>
				<li>
					<a href="/docs/api-use">API 호출</a>
				</li>
				</ul>
				</li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right" title="국내 수족관 지도 API">
					<a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseComponents" data-parent="#exampleAccordion">
						<span class="nav-link-text">국내 수족관 지도 API</span>
					</a>
					<ul class="sidenav-second-level collapse" id="collapseComponents">
						<li>
							<a class="nav-link js-scroll-trigger" href="/docs/aquariumInfo#structure">데이터 구조</a>
						</li>
						<li>
							<a class="nav-link js-scroll-trigger" href="/docs/aquariumInfo#example">적용 예</a>
						</li>
					</ul>
				</li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right" title="관상어 정보 API">
					<a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseExamplePages" data-parent="#exampleAccordion">
						<span class="nav-link-text">관상어 정보 API</span>
					</a>
					<ul class="sidenav-second-level collapse" id="collapseExamplePages">
						<li>
							<a class="nav-link js-scroll-trigger" href="/docs/fishInfo#structure">데이터 구조</a>
						</li>
						<li>
							<a class="nav-link js-scroll-trigger" href="/docs/fishInfo#example">적용 예</a>
						</li>
					</ul>
				</li>
			</ul>
		
		<!-- 상단 네비 -->	
		<ul class="navbar-nav sidenav-toggler">
			<li class="nav-item">
				<a class="nav-link text-center" id="sidenavToggler">
					<i class="fa fa-fw fa-angle-left"></i>
				</a>
			</li>
		</ul>
		<ul class="navbar-nav ml-auto">
			<c:choose>
				<c:when test="${ssMemberId eq '' or ssMemberId eq null}">
					<li class="nav-item">
						<a class="nav-link" href="/usr/login">
						<i class="fas fa-sign-in-alt"></i>로그인</a>
					</li>
				</c:when>
				
				<c:otherwise>
				<!-- 알림 -->
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle mr-lg-2" id="alertsDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<i class="fa fa-fw fa-bell"></i>
							<span class="d-lg-none">알림
								<span class="badge badge-pill badge-warning">6 New</span>
							</span> 
							<span class="indicator text-warning d-none d-lg-block">
								<i class="fa fa-fw fa-circle"></i>34
							</span>
						</a>
						<div class="dropdown-menu" aria-labelledby="alertsDropdown">
							<h6 class="dropdown-header">새 알림:</h6>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">
								<span class="text-danger">
									<strong><i class="fa fa-long-arrow-down fa-fw"></i>APP생성이 완료되었습니다.</strong>
								</span>
								<span class="small float-right text-muted">11:22 AM</span>
								<div class="dropdown-message small"> 마이페이지 > Open API 사용관리 메뉴에서 자세한 내용을 확인 하실 수 있습니다.</div>
							</a>
							
							<div class="dropdown-divider"></div>
							
							<a class="dropdown-item" href="#">
							<span class="text-success">
							<strong>
							<i class="fa fa-long-arrow-up fa-fw"></i>가입을 환영합니다.</strong>
							</span>
							<span class="small float-right text-muted">11:21 AM</span>
							<div class="dropdown-message small">환영합니다 ^^@@@@@@@ </div>
							</a>
						</div>
					</li>
						
					<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle mr-lg-2" id="myPageDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fa fa-fw fa-child"></i> 마이 페이지
					</a>
					<div class="dropdown-menu" aria-labelledby="myPageDropdown" style="left: -30%;">
					
					<a class="dropdown-item" href="#">
					<span class="text-success">
					<i class="fas fa-user-circle"></i> <strong>&nbsp;내 정보 수정</strong>
					</span>              
					</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="/apps">
					<span class="text-success">
					<i class="fab fa-whmcs"></i> <strong>&nbsp;Open API 사용 관리</strong>
					</span>              
					</a>
					<a class="dropdown-item" href="#">
					<span class="text-success">
					<i class="fas fa-chart-bar"></i> <strong>&nbsp;내 Open API 통계</strong>
					</span>              
					</a>
					</div>
					</li>          
					<li class="nav-item">
					<a class="nav-link" data-toggle="modal" data-target="#exampleModal">
					<i class="fas fa-sign-out-alt"></i>로그아웃</a>
					</li>
				</c:otherwise>	
			</c:choose>
		</ul>
		</div>
</nav>

<!-- Logout Modal-->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
<div class="modal-dialog" role="document">
<div class="modal-content">
<div class="modal-header">
<h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
<button class="close" type="button" data-dismiss="modal" aria-label="Close">
<span aria-hidden="true">×</span>
</button>
</div>
<div class="modal-body">로그아웃 하시려면 로그아웃 버튼을 눌러주세요.</div>
<div class="modal-footer">
<button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
<a class="btn btn-primary" href="/usr/logout">로그 아웃</a>
</div>
</div>
</div>
</div>
    
    