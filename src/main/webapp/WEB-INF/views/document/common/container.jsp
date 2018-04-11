<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./topTaglib.jsp"%>
<!DOCTYPE>
<html>

<!-- header -->
<jsp:include page="/WEB-INF/views/document/common/header.jsp" />

<body class="fixed-nav sticky-footer bg-dark" id="page-top">

	<!-- Navigation-->
	<jsp:include page="/WEB-INF/views/document/common/navi.jsp" />

	<!-- body -->
	<div class="content-wrapper">
		<div class="container-fluid">
		
			<!-- 컨텐츠 상단 디렉토리 -->
			<ol class="breadcrumb">
				<li class="breadcrumb-item">
					<a href="${categoryLink} ">${category1 }</a>
				</li>
				<c:if test="${category2 ne null}">
					<li class="breadcrumb-item active">${category2 }</li>
				</c:if>
			</ol>

			<!-- 컨텐츠 -->

			<div style="margin: 0 auto; text-align: center;">
				<jsp:include page="/WEB-INF/views/document/contents/${content }" />
			</div>
		</div>
		
		<!-- 푸터 -->
		<jsp:include page="/WEB-INF/views/document/common/footer.jsp" />

		<!-- 상단 스크롤 버튼-->
		<a class="scroll-to-top rounded" href="#page-top"> 
			<i class="fa fa-angle-up"></i>
		</a>
	</div>
	<c:if test="${!empty alert}">
		<script>
			alert("${alert}");
		</script>
	</c:if>
</body>