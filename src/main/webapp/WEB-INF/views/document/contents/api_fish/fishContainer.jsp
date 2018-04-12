<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../common/topTaglib.jsp"%>

<!-- 관상어정보API 구조 -->
<div class="apiContents" id="structure">
	<div class="card mb-3">
		<div class="card-header" style="text-align: left">
			<i class="fas fa-wrench"></i> 관상어 정보API 예제
		</div>
		<div class="card-body">
			<div class="docContents">
				<jsp:include page="/WEB-INF/views/document/contents/api_fish/fishStructure.jsp" />
			</div>
		</div>
	</div>
</div>
<!-- 관상어정보API 예제 -->
<div class="apiContents" id="example">
	<div class="card mb-3">
		<div class="card-header" style="text-align: left">
			<i class="fas fa-pencil-alt"></i> 관상어정보API 예제
		</div>
		<div class="card-body">
			<div class="docContents">
				<jsp:include page="/WEB-INF/views/document/contents/api_fish/fishExample.jsp" />
			</div>
		</div>
	</div>
</div>