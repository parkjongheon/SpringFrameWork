<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
	<style>
	.content{
		width: 1050px;
		height: 380px;
		border: solid;
		border-color: gray;
		border-radius: 30px;
		margin-top: 30px;
	}
	</style>
	<script>
	'use strict';
	// (소분류등록) 대분류 선택시 중분류 불러오기
	$(function() {
	    $("#product1").on('change', function(){
	    	search();
	    });
	});
	function search() {
		let product1 = $("#product1").val();
		$.ajax({
			type : "post",
			url : "${ctp}/shop/searchProduct2",
			data : {product1 : product1},
			success : function(vos){
				let str ='';
				str+='<option value="" selected disabled="disabled">중분류</option>';							
				for(let i=0; i<vos.length; i++){
					str+='<option value="'+vos[i].product2+'">'+vos[i].product2+'</option>';							
				}
				$("#product2").html(str);
			},
			error : function(){
				alert("전송오류");
			}
		});	
	}
	// 대분류등록
	function searchPrd1(){
		let prd1 = $("#topValue").val();
			$("#demo > p").remove();		
		if(prd1.trim() == ""){
			$("#demo").append('<p><b>(대분류)</b><font color="red">값을 입력해주세요</font></p>');
			$("#demo").focus();
		}
		else{
			$.ajax({
				type : "post",
				url : "${ctp}/shop/searchPrd1",
				data :{
					product1 : prd1
				},
				success : function(data){
					if(data == "1"){
						product1Form.submit();
					}
					else{
						$("#demo").append('<p><b>(대분류)</b><font color="red">입력한 값이 중복됩니다. 다시입력해주세요</font></p>');	
						$("#demo").focus();
					}
				},
				error : function(){
					alert("에러");
				}
			});
		}
	}
	// 중분류등록
	function searchPrd2(){
		let prd1 = $("#midprd1").val();
		let prd2 = $("#midValue").val();
		
		$("#demo > p").remove();
		
		if(prd1 == null){
			$("#demo").append('<p><b>(중분류)</b><font color="red">대분류를 선택해주세요</font></p>');
		}
		else if(prd2.trim() == ""){
			$("#demo").append('<p><b>(중분류)</b><font color="red">값을 입력해주세요</font></p>');
			$("#midValue").focus();
		}
		else{
			$.ajax({
				type : "post",
				url : "${ctp}/shop/searchPrd2",
				data :{
					product1 : prd1,
					product2 : prd2
				},
				success : function(data){
					if(data == "1"){
						product2Form.submit();
					}
					else{
						$("#demo").append('<p><b>(중분류)</b><font color="red">입력한 값이 중복됩니다. 다시입력해주세요</font></p>');
						$("#midValue").focus();
					}
				},
				error : function(){
					alert("에러");
				}
			});
		}
	}
	// 소분류등록
	function searchPrd3(){
		let prd1 = $("#product1").val();
		let prd2 = $("#product2").val();
		let prd3 = $("#bottomValue").val();
		
		$("#demo > p").remove();
		
		if(prd1 == null){
			$("#demo").append('<p><b>(소분류)</b><font color="red">대분류를 선택해주세요</font></p>');
		}
		else if(prd2 == null){
			$("#demo").append('<p><b>(소분류)</b><font color="red">중분류를 선택해주세요</font></p>');
		}
		else if(prd3.trim() == ""){
			$("#demo").append('<p><b>(소분류)</b><font color="red">값을 입력해주세요</font></p>');
			$("#bottomValue").focus();
		}
		else{
			$.ajax({
				type : "post",
				url : "${ctp}/shop/searchPrd3",
				data :{
					product1 : prd1,
					product2 : prd2,
					product3 : prd3
				},
				success : function(data){
					if(data == "1"){
						product3Form.submit();
					}
					else{
						$("#demo").append('<p><b>(소분류)</b><font color="red">입력한 값이 중복됩니다. 다시입력해주세요</font></p>');
						$("#bottomValue").focus();
					}
				},
				error : function(){
					alert("에러");
				}
			});
		}
	}
	
	</script>

</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<div class="w3-content" style="max-width:2000px;margin-top:46px">
	<jsp:include page="/WEB-INF/views/include/slide2.jsp" />
	<p><br/></p>
	<div class="container" >
	  <div class="bgimg w3-display-container w3-animate-opacity">
	  <div class="w3-container">
	    <h2 class="w3-center">카테고리 등록</h2>
	    <hr class="w3-border-grey" style="margin:auto;width:40%">
	    <div class="w3-container">
	    	<div class="content">
	    		<div class="w3-container w3-padding" style="width: 1200px;height:250px ;margin-left: 50px;margin-top:50px">
		    	<form name="product1Form" method="post" action="${ctp}/shop/product1Form">
	    			<div class="w3-container">
		    			<div class="w3-third" style="width: 210px;margin-right: 20px">
			    			<input type="text" name="product1" id="topValue" class="w3-input w3-border w3-round-large w3-margin-bottom">
		    			</div>
		    			<div class="w3-twothird" style="width: 100px">
			    			<input type="button" onclick="searchPrd1()" value="대분류 등록" class="w3-input w3-border w3-round-large w3-margin-bottom">
		    			</div>
	    			</div>
	    		</form>
	    		<hr class="w3-border-grey" style="width:80%;margin-bottom: 20px">
	    		<form name="product2Form" method="post" action="${ctp}/shop/product2Form">
	    			<div class="w3-container">
		    			<div class="w3-third" style="width: 210px;margin-right: 20px">
			    			<select id="midprd1" name="product1" class="w3-input w3-border w3-round-large w3-margin-bottom ">
		    				<option value="" selected disabled="disabled">대분류</option>
			    			<c:forEach var="vo" items="${vos}">
			    				<option value="${vo.product1}">${vo.product1}</option>
			    			</c:forEach>		    				
			    			</select>
		    			</div>
		    			<div class="w3-third" style="width: 210px;margin-right: 20px">
			    			<input type="text" id="midValue" name="product2" class="w3-input w3-border w3-round-large w3-margin-bottom">
		    			</div>
		    			<div class="w3-third" style="width: 100px">
			    			<input type="button" onclick="searchPrd2()" value="중분류 등록" class="w3-input w3-border w3-round-large w3-margin-bottom">
		    			</div>
	    			</div>
	    		</form>
    			<hr class="w3-border-grey" style="width:80%;margin-bottom: 20px">
	    		<form name="product3Form" method="post" action="${ctp}/shop/product3Form">
					<div class="w3-container">
						<div class="w3-quarter" style="width: 210px;margin-right: 20px">
			    			<select id="product1" name="product1" class="w3-input w3-border w3-round-large w3-margin-bottom ">
		    				<option value="" selected disabled="disabled">대분류</option>
			    			<c:forEach var="vo" items="${vos}">
			    				<option value="${vo.product1}">${vo.product1}</option>
			    			</c:forEach>		    				
			    			</select>
		    			</div>
		    			<div class="w3-quarter" style="width: 210px;margin-right: 20px">
		    				<select id="product2" name="product2" class="w3-input w3-border w3-round-large w3-margin-bottom ">
		    					<option value="" selected disabled="disabled">중분류</option>
		    				</select>
	    				</div>
	    				<div class="w3-quarter" style="width: 210px;margin-right: 20px">
			    			<input type="text" id="bottomValue" name="product3" class="w3-input w3-border w3-round-large w3-margin-bottom">
		    			</div>
		    			<div class="w3-quarter" style="width: 100px">
			    			<input type="button" onclick="searchPrd3()" value="소분류 등록" class="w3-input w3-border w3-round-large w3-margin-bottom">
		    			</div>
					</div>
	    		</form>
	    		</div>
	    		<div class="w3-container w3-center">
	    			<div id="demo"></div>
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
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>