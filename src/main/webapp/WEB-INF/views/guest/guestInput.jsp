<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>content</title>
  <%@ include file="/WEB-INF/views/include/bs4.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<div class="w3-content" style="max-width:2000px;margin-top:46px">
	<%@ include file="/WEB-INF/views/include/slide2.jsp" %>
	<p><br/></p>
	<div class="container">
		<form name="myForm" method="post" class="was-validated">
	  	<h2>게시글 글쓰기</h2>
	    <div class="form-group">
	    	<label for="=name">성명</label>
	    	<input type="text" class="form-control"name="name" id="name" placeholder="제목을 입력하세요" required autofocus/>
	    	<div class="valid-feedback"></div>
	    	<div class="invalid-feedback">제목을 입력하세요.</div>
	    </div>
	    <div class="form-group">
	    	<label for="=name">E-mail</label>
	    	<input type="text" class="form-control"name="email" id="email" placeholder="제목을 입력하세요" required autofocus/>
	    	<div class="valid-feedback"></div>
	    	<div class="invalid-feedback">E-mail을 입력하세요.</div>
	    </div>
	    <div class="form-group">
	    	<label for="=name">HomePage</label>
	    	<input type="text" class="form-control"name="homepage" id="homepage" placeholder="제목을 입력하세요" required autofocus/>
	    	<div class="valid-feedback"></div>
	    	<div class="invalid-feedback">HomePage를 입력하세요.</div>
	    </div>
	    <div class="form-group">
	      <label for="content">방문소감</label>
	      <textarea rows="5" class="form-control"name="content" id="content" style="resize: none;" required >내용을 입력하세요</textarea>
	      <div class="invalid-feedback">내용은 필수 입력사항입니다.</div>
	    </div>
	    <div class="form-group">
	      <button type="reset" class="btn btn-primary">다시입력</button>      
	      <button type="button" class="btn btn-primary" onclick="Location.href='${ctp}/guestList.com';">돌아가기</button>      
	      <button type="submit" class="btn btn-primary" style="float: right;">게시물 등록</button>      
		</div>
		<input type="hidden" name="hostIp" value="<%=request.getRemoteAddr() %>">
		</form>
	</div>
	<p><br/></p>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>