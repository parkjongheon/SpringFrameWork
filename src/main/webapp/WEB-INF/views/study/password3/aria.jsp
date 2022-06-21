<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
	<script>
	'use strict';
	let str = "";
	let i =0;
	
	
	function ariaCheck(){
		let pwd = $("#pwd").val();
		
		$.ajax({
			type : "post",
			url : "${ctp}/study/password3/aria",
			data : {
				pwd : pwd
			},
			success :function(res){
				i++;
				str += i+" : " + res + "<br/>";
				$("#demo").html(str);
			},
			error : function(){
				alert("오류");
			}
		});
	}
	</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<div class="w3-content" style="max-width:2000px;margin-top:46px">
	<jsp:include page="/WEB-INF/views/include/slide2.jsp" />
	<p><br/></p>
		<h2>ARIA에 대하여</h2>
		<p>
			ARIA는 경량 환경 및 하드웨어 구현을 위해 최적화된.Involutional SPN 구조를 갖는 범용블록 암호알고리즘이다.<br/>
			ARIA가 사용하는 대부분의 연산은 XOR과 같은 단순한 바이트단위 연산으로 구성되어 있으며, 블록크기는 128bit이다<br/>
			ARIA라는 이름은 Academy(학계), Research Institute(연구소), Agency(정부기관)의 첫글자를 딴것으로,
			ARIA개발에 참여한 '학/연/관'의 공동 노력을 표현하고있다.<br/>
			ARIA암호화는 복호화가 가능하다.
		</p>
		<hr/>
		<p>
			<input type="text" name="pwd" id="pwd" autofocus />
			<input type="button" value="실습" onclick="ariaCheck()" />
		</p>
		<hr/>
		<div>
			출력결과<br/>
			<span id="demo"></span>
		</div>
	<p><br/></p>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>