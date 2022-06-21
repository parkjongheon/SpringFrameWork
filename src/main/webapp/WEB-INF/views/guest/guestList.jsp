<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="newLine" value="\n" />
<c:set var="ctp" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
  <%@ include file="/WEB-INF/views/include/bs4.jsp" %>
  <style>
  	th {background-color:#ccc; text-align:center}
  </style>
  <script>
  	'use strict';
  	function delCheck(idx) {
  		let ans = confirm("게시글을 삭제하시겠습니까?");
  		if(ans) location.href="${ctp}/guestDelete.gu?idx="+idx;
  	}
  </script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<div class="w3-content" style="max-width:2000px;margin-top:46px">
	<%@ include file="/WEB-INF/views/include/slide2.jsp" %>
	<p><br/></p>
	<div class="container">
	  <h2 class="text-center m-3">방 명 록</h2>
		<div class="row mb-2">
			<div class="col text-left"><a href="${ctp}/guest/guestInput" class="btn btn-secondary">글쓰기</a></div>
			<!-- 페이징처리 시작 -->
			
		    <!-- 페이징처리 끝 -->
			</div>  
		<div>
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<table class="table borderless m-0 p-0">
				<tr>
					<td>방문번호 : ${curScrStartNo}</td>
				</tr>
				<tr>
					<td>방문IP : ${vo.hostIp}</td>
				</tr>
			</table>
			<table class="table table-bordered">
				<tr>
					<th width="15%">성명</th>
					<td width="35%">${vo.name}</td>
					<th width="15%">방문 일자</th>
					<td width="35%">${vo.VDate}</td>
				</tr>
				<tr>
					<th>전자우편</th>
					<td colspan="3">
					<c:if test="${empty vo.email}">
						없음
					</c:if>
					<c:if test="${not empty vo.email}">
						${vo.email}
					</c:if>
					</td>
				</tr>
				<tr>
					<th>홈페이지</th>
					<td colspan="3">
					<c:set var="hpLen" value="#{fn:length(vo.homepage)}" />
					
					<c:if test="${empty vo.homepage || hpLen <=7}">
						없음
					</c:if>
					<c:if test="${not empty vo.homepage || hpLen >7}">
					<a href="${vo.homepage}" target="_black">${vo.homepage}</a>
					</c:if>
					</td>
				</tr>
				<tr>
					<th>글내용</th>
					<td colspan="3" style="height:200px">${fn:replace(vo.content,newLine,'<br/>')}</td>
				</tr>
			</table>
			<br/>
			<c:set var="curScrStartNo" value="${curScrStartNo -1}"/>
		</c:forEach>
		<!-- 블록 페이징처리 시작 -->
		  <div class="text-center">
		  	<ul class="pagination text-center">
		  	<c:if test="${pag != 1}">
		  		<li class="page-item"><a class="page-link" href="${ctp}/guest/guestList?pag=1">첫페이지</a></li>
		  	</c:if>
				<c:if test="${curBlock > 1 }">
				 <li class="page-item"><a class="page-link" href="${ctp}/guest/guestList?pag=${(curBlock-1)*blockSize+1}">이전블록</a></li>
				</c:if>
				<c:set var="no" value="${(curBlock*blockSize)+1}"/>
				<c:set var="size" value="${(curBlock*blockSize)+blockSize}"/>
				<c:forEach var="i" begin="${no}" end="${size}">
					<c:choose>
						<c:when test="${i > totPage}"></c:when>
						<c:when test="${i == pag}">
							<li class="page-item active"><a class="page-link" href="${ctp}/guest/guestList?pag=${i}">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="${ctp}/guest/guestList?pag=${i}">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${curBlock < lastBlock}">
					<li class="page-item"><a class="page-link" href="${ctp}/guest/guestList?pag=${(curBlock+1)*blockSize+1}">다음블록</a></li>	
				</c:if>
				<c:if test="${pag != totPage}">
					<li class="page-item"><a class="page-link" href="${ctp}/guest/guestList?pag=${totPage}">마지막페이지</a></li>
				</c:if>
		  	</ul>
  		</div>
	    <!-- 페이징처리 끝 -->
		</div>
	</div>
	<p><br/></p>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>