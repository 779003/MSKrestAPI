<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../common/topTaglib.jsp"%>

<!-- 수족관정보API 구조 -->
<div class="apiContents" id="structure">
	<div class="card mb-3">
			<div class="card-header" style="text-align: left">
				<i class="fas fa-wrench"></i> 수족관정보API 구조
			</div>
			<div class="card-body">
				<div class="docContents">
					<jsp:include page="/WEB-INF/views/document/contents/api_aquariumInfo/aquariumStructure.jsp" />
				</div>	
			</div>
		</div>
	</div>
<!-- 수족관정보API 예제 -->
<div class="apiContents" id="example">
	<div class="card mb-3">
			<div class="card-header" style="text-align: left">
				<i class="fas fa-pencil-alt"></i> 수족관정보API 예제
			</div>
			<div class="card-body">
				<div class="docContents">
					<jsp:include page="/WEB-INF/views/document/contents/api_aquariumInfo/aquariumExample.jsp" />
				</div>
			</div>
		</div>
	</div>
