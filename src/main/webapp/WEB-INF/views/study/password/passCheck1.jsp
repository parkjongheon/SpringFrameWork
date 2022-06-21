<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>passCheck1.jsp</title>
	<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
	<script>
	'use strict';
	
	function fCheck(flag){
		let pwd = document.getElementById("pwd").value;
		if(pwd.trim() == ""){
			alert("비밀번호를 입력하세요!");
			document.getElementById("pwd").focus();
		}
		else if(pwd.length > 10){
			alert("비밀번호는 10자 이내로 입력해주세요");
			document.getElementById("pwd").focus();			
		}
		else{
			if(flag == 1){
				myForm.action = "${ctp}/study/password/passCheck1";
			}
			else{
				myForm.action = "${ctp}/study/password/passCheck2";				
			}
			myForm.submit();
		}
	}
	</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<div class="w3-content" style="max-width:2000px;margin-top:46px">
	<jsp:include page="/WEB-INF/views/include/slide2.jsp" />
	<div class="container">
	<p><br/></p>
	<form name="myForm" method="post">
		<h2> 비밀번호 암호화 연습</h2>
		<hr/>
		<p>(비밀번호는 10자 이내로 입력하세요)</p>
		<p>
			비밀번호 : <input type="password" name="pwd" id="pwd" />
			<input type="button" value="암호화(숫자만)" onclick="fCheck(1)" class="btn btn-info"/>
			<input type="button" value="암호화(혼합)" onclick="fCheck(2)" class="btn btn-info"/>
		</p>
		<hr/>
		<p>-결과-<br/>
			원본 : ${pwd}<br/>
			암호화 : ${encPwd}<br/>
			복호화 : ${decPwd}
		</p>
	</form>
	<p><br/></p>
	</div>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>