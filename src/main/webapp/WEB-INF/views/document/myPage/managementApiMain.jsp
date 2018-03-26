<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

        
<h3>내 API 사용 관리</h3>

<div id="container">
		
		<ul class="tab">
		<c:choose>
			<c:when test="${fn:length(myApps) == 0}">
				<!-- <li class="current" data-tab="tab6"><a href="#">앱이 없습니다</a></li> -->
			</c:when>
			<c:otherwise>
				<c:forEach var="app" items="${myApps}" varStatus="status">
					<li <c:if test="${status.index eq 0}">class="current"</c:if> data-tab="tab${status.index}"><a href="#">${app.app_name}</a></li>
				</c:forEach>
			</c:otherwise>
		</c:choose>	
			
			
		</ul>
		
		<c:choose>
			<c:when test="${fn:length(myApps) == 0}">
				<div id="tab6" class="tabcontent current">
					<h3>사용중인 앱이 없습니다.</h3>
					<p>API를 사용하시려면 하단의 오픈API신청 버튼을 눌러 앱을 생성해 주세요.</p>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach var="app" items="${myApps}" varStatus="status">
				
					<div id="tab${status.index}" class="tabcontent  <c:if test="${status.index eq 0}">current</c:if>">
						<h5>상세 정보</h5>
						<h3>${app.app_name }</h3>								
						<div align="right">
							<table class="appInfoTable" style="width: 50%;">
								<tr>
									<th width="30%">API Key</th> 
									<td width="70%">${app.api_key }</td>
								</tr>
								<tr>
									<th>생성일</th> 
									<td>
										<fmt:parseDate var="dateString" value="${app.reg_dt}" pattern="yyyy-MM-dd HH:mm:ss" /> 
										<fmt:formatDate value="${dateString}" pattern="yyyy년 MM월 dd일 HH시 mm분" />
									</td>
								</tr>
								<tr>
									<th>마지막 수정일</th> 
									<td>
										<fmt:parseDate var="dateString" value="${app.mod_dt}" pattern="yyyy-MM-dd HH:mm:ss" /> 
										<fmt:formatDate value="${dateString}" pattern="yyyy년 MM월 dd일 HH시 mm분" />
									</td>
								</tr>
								<tr>
									<th>사용 여부</th> 
									<td>
										<c:choose>
											<c:when test="${app.use_yn eq 'Y'}">사용중</c:when>
											<c:otherwise>미사용</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</table>
						</div>
						<div align="center" style="padding-top: 10px">
							<table  class="appInfoTable" style="width: 100%;">
							<tr>
								<th width="15%">허용 URL</th> 
								<td width="85%">
									<c:choose>
										<c:when test="${app.api_allow eq '' or empty app.api_allow}">모두 허용</c:when>
									<c:otherwise>${app.api_allow}</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th colspan="2">설명</th> 							
							</tr>
							<tr>						
							<td colspan="2">${app.description }</td>
							</tr>
							<tr>
								<th colspan="2">오픈 API 일일 사용량 <span style="color: red" id='usageDesc${status.index}'></span></th> 							
							</tr>
							<tr>						
							<th>${app.api_name_kor }</th>
							<td>
							
							
							
								<div class="progress">
								  <div id="pgBar-${status.index}" aria-valuenow="1" aria-valuemax="100" class="progress-bar" role="progressbar" aria-valuemin="0" >
								  </div>
								</div>
							</td>
							</tr>
							</table>
						</div>
						<div align="right">
							<div class="btn-group" role="group" >
							  <button type="button" class="btn btn-default" onclick="javascript:location.href ='/apps/modify/${app.api_key}'">수정하기</button>
							  <button type="button" class="btn btn-default">삭제하기</button>
							</div>
						</div>	
					</div>
					<script>
						var count = "${app.call_count}" *1;
						var maxQuota = "${maxQuota}" *1;
						
						if(count == 0 ){
							var usageRate = "0%";
						}else{
							var usageRate = Math.floor((count/maxQuota)*100);
							usageRate += "%";
						}																
						$('#pgBar-${status.index}').css('width',usageRate);	
						$('#pgBar-${status.index}').attr('aria-valuenow',count);
						$('#pgBar-${status.index}').attr('aria-valuemax',maxQuota);
						$('#pgBar-${status.index}').text(usageRate);
						$('#usageDesc${status.index}').text("[오늘 API 호출량 : "+count+"건, 하루 허용량 : "+ maxQuota+"건]");
						$('.progress').css('background-color', '#996666');
					</script>
				</c:forEach>
			</c:otherwise>
		</c:choose>	
		
	</div>


<hr>
<div class="alert alert-success" role="alert"><a href="/apps/register">오픈 API 신청</a></div>



