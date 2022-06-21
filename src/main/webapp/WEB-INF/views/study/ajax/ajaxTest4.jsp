<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
	<script>
	// 개별검색(vo 사용)
	 'use strict';
	 function idCheck(){
		 let oid = $("#oid").val();
		 if(oid == ""){
			 alert("아이디를 입력하세요");
			 $("#oid").focus();
			 return false;
		 }
		 $.ajax({
			 type : "post",
			 url : "${ctp}/study/ajax/ajaxTest4",
			 data : {oid : oid},
			 success : function(vo){
				 let str ='<b>전송결과</b><hr/>';
				 if(vo != ""){
					 str += '아이디 :'+vo.oid+' <br/>';
					 str += '성명 :'+vo.name+' <br/>';
					 str += '비밀번호 :'+vo.pwd+'<br/>';
					 str += '키인덱스 :'+vo.keyIdx+'<br/>';
				 }
				 else{
					 str += '<font color=red><b>찾는자료가 없습니다</b></font>';
				 }
				 $("#demo").html(str);
			 },
			 error : function(){
				 alert("전송오류!");
			 }
		 });
	 }
	// 포함된 아이디 검색(vos 사용)
	function idList(){
		let oid = $("#oid").val();
		 if(oid == ""){
			 alert("아이디를 입력하세요");
			 $("#oid").focus();
			 return false;
		 }
		 $.ajax({
			 type : "post",
			 url : "${ctp}/study/ajax/ajaxTest5",
			 data : {oid : oid},
			 success : function(vos){
				 let str ='<b>전송결과</b><hr/>';
				 if(vos != ""){
					 
					 str += '<table class="table table-hover">';
					 str += '<tr>';
					 str += '<th>아이디</th><th>성명</th><th>키(인덱스)</th><th>비밀번호</th>';
					 str += '</tr>';
					 for(let i=0; i<vos.length; i++){
						 str += '<tr class="text-center">';
						 str += '<td>'+vos[i].oid+'</td><td>'+vos[i].name+'</td><td>'+vos[i].keyIdx+'</td><td>'+vos[i].pwd+'</td>';
						 str += '</tr>';						 
					 }
					 str += '</table>';
					 
				 }
				 else{
					 str += '<font color=red><b>찾는자료가 없습니다</b></font>';
				 }
				 $("#demo").html(str);
			 },
			 error : function(){
				 alert("전송오류!");
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
		<form name="myForm">
			<h2>aJax를 활용한 '회운 아이디' 검색하기</h2>
			<hr/>
			<p>
				<input type="text" name="oid" id="oid" autofocus /> &nbsp;
				<input type="button" value="돌아가기" onclick="location.href='${ctp}/study/ajax/ajaxMenu';" class="btn btn-secondary" />&nbsp;
				<input type="reset" value="다시입력" class="btn btn-secondary" />&nbsp;
				<input type="button" value="아이디검색" onclick="idCheck()" class="btn btn-secondary" />&nbsp;
				<input type="button" value="아이디일부검색" onclick="idList()" class="btn btn-secondary" />&nbsp;
			</p>
			<hr/>
			<p id="demo"></p>
		</form>
	<p><br/></p>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>