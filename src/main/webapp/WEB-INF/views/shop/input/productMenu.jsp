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
		width: 800px;
		height: 500px;
		border: solid;
		border-color: gray;
		border-radius: 30px;
		margin-top: 30px;
	}
	</style>
	<script>
	'use strict';
	// 대분류선택시 중분류 불러오기
	$(function() {
	    $("#product1").on('change', function(){
	    	$("#product3 > option").remove();
	    	$("#product3").append("<option>소분류</option>");
	    	searchProduct2();
	    });
	});
	function searchProduct2() {
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
	// 중분류선택시 소분류 불러오기
	$(function() {
	    $("#product2").on('change', function(){
	    	searchProduct3();
	    });
	});
	function searchProduct3() {
		let product1 = $("#product1").val();
		let product2 = $("#product2").val();
		$.ajax({
			type : "post",
			url : "${ctp}/shop/searchProduct3",
			data : {
				product1 : product1,
				product2 : product2
				},
			success : function(vos){
				let str ='';
				str+='<option value="" selected disabled="disabled">소분류</option>';							
				for(let i=0; i<vos.length; i++){
					str+='<option value="'+vos[i].product3+'">'+vos[i].product3+'</option>';							
				}
				$("#product3").html(str);
			},
			error : function(){
				alert("전송오류");
			}
		});	
	}	
	// 상품등록시 중복검사 및 공백검사후 submit
	function productCheck(){
		let product = $("#product").val();
		let product1 = $("#product1").val();
		let product2 = $("#product2").val();
		let product3 = $("#product3").val();
		let price = $("#price").val();
		let title = $("#title ").val();
		$("#demo > p").remove();
		
		if(product.trim() == ""){
			$("#demo").append('<p><font color="red">상품명을 입력해주세요</font></p>');
			$("#product").focus();
		}
		else if(product1 == null || product2 == null || product3 == null){
			$("#demo").append('<p><font color="red">카테고리는 비워둘수없습니다.</font></p>');
		}
		else if(price.trim() == ""){
			$("#demo").append('<p><font color="red">가격을 입력해주세요</font></p>');
		}
		else if(title.trim() == ""){
			$("#demo").append('<p><font color="red">상품설명을 입력해주세요</font></p>');
		}
		else{
			$.ajax({
				type : "post",
				url : "${ctp}/shop/productCheck",
				data : {
					product : product
					},
				success : function(data){
					if(data == "1"){
						myForm.submit();
					}
					else{
						$("#demo > p").remove();	
						$("#demo").append('<p><font color="red">상품명이 중복됩니다 다시입력해주세요</font></p>');
					}
				},
				error : function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		}
	}
	</script>
	<style>
	 textarea {
    width: 100%;
    height: 14.25em;
    border: none;
    resize: none;
  	}
	</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<div class="w3-content" style="max-width:2000px;margin-top:46px">
	<jsp:include page="/WEB-INF/views/include/slide2.jsp" />
	<p><br/></p>
	<div class="container" >
	  <div class="bgimg w3-display-container w3-animate-opacity">
	  <div class="w3-container">
	    <h2 class="w3-center">상품등록</h2>
	    <hr class="w3-border-grey" style="margin:auto;width:40%">
	    <div class="w3-container" style="margin-left : 130px">
	    	<div class="content">
		    	<form name="myForm" method="post">
	    		<div class="w3-container w3-padding" style="width: 800px;height:250px ;margin-left: 50px;margin-top:50px">
	    			<div class="w3-third" style="width: 210px">
		    			<select id="product1" name="product1" class="w3-input w3-border w3-round-large w3-margin-bottom ">
		    				<option value="" selected disabled="disabled">대분류</option>
		    			<c:forEach var="vo" items="${vos}">
		    				<option value="${vo.product1}">${vo.product1}</option>
		    			</c:forEach>		    				
		    			</select>
	    			</div>
	    			<div class="w3-third" style="width: 210px;margin-left: 20px">
		    			<select id="product2" name="product2" class="w3-input w3-border w3-round-large w3-margin-bottom ">
		    				<option value="" selected disabled="disabled">중분류</option>
		    			</select>
	    			</div>
	    			<div class="w3-third" style="width: 210px;margin-left: 20px">
		    			<select id="product3" name="product3" class="w3-input w3-border w3-round-large w3-margin-bottom ">
		    				<option value="" selected disabled="disabled">소분류</option>
		    			</select>
	    			</div>
	    			
	    			<div class="w3-half" style="width: 325px">
	    			<label>상품명</label>
	    			<input type="text" name="product" id="product" class="w3-input w3-border w3-round-large w3-margin-bottom"/>
	    			
	    			<label>가격</label>
	    			<input type="text" name="price" id="price" class="w3-input w3-border w3-round-large w3-margin-bottom"/>
	    			<label>상품설명</label>
	    			<input type="text" name="title" id="title" class="w3-input w3-border w3-round-large"/>
	    			</div>
	    			<div class="w3-half" style="width: 325px;height:300px ;margin-left: 20px">
	    			<label>상세설명</label>
	    				<textarea cols="50" name="content" id="content" class="w3-input w3-border w3-round-large"></textarea>
	    			</div>
	    		</div>
	    		<div class="w3-container w3-center">
	    			<div id="demo">
	    			</div>
	    			<input type="button" value="등록하기" class="w3-button w3-border w3-round-large" onclick="productCheck()" style="width: 120px;margin-left: 15px">
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