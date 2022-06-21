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

  </script>
  <style>
	.content{
		width: 500px;
		height: 320px;
		border: solid;
		border-color: gray;
		border-radius: 30px;
		margin-top: 30px;
	}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<div class="w3-content" style="max-width:2000px;margin-top:46px">
	<%@ include file="/WEB-INF/views/include/slide2.jsp" %>
	<p><br/></p>
	<div class="container" >
	  <div class="bgimg w3-display-container w3-animate-opacity">
	  <div class="w3-container">
	    <h1 class="w3-jumbo w3-center">ADMIN LOGIN</h1>
	    <hr class="w3-border-grey" style="margin:auto;width:40%">
	    <div class="w3-container" style="margin-left : 270px">
	    	<div class="content">
		    	<form method="post">
	    		<div class="w3-container w3-padding" style="width: 400px;margin-left: 50px;margin-top:50px">
		    			<input type="text" name="mid" class="w3-input w3-border w3-round-large w3-margin-bottom " placeholder="아이디를 입력해주세요"/>
		    			<input type="password" name="pwd" class="w3-input w3-border w3-round-large w3-margin-bottom" placeholder="8자리를 입력해주세요"/>
	    		</div>
	    		<div class="w3-container w3-center" style="margin-top:50px">
	    			<input type="submit" value="등록하기" class="w3-button w3-border w3-round-large" style="width: 120px;margin-left: 15px">
	    		</div>
	    		</form>
	    	</div>
	    </div>
	  </div>
	  <div class="w3-display-bottomleft w3-padding-large">
	  </div>
	</div>
	</div>
	<p><br/></p>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>