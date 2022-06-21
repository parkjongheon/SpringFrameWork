<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	Cookie[] cookies = request.getCookies();
	if(cookies !=null) {
		for(int i=0; i<cookies.length; i++){
			
			if(cookies[i].getName().equals("cMid")){
				pageContext.setAttribute("mid", cookies[i].getValue());
				break;
			}
		}
	}
%>
<c:set var="ctp" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memLogin.jsp</title>
  <%@ include file="/WEB-INF/views/include/bs4.jsp" %>
  <script>
  </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<div class="container">
<div class="modal-dialog">
	<div class="modal-content">
		<div class="container p-3 border">
		  <form name="myForm" method="post" class="was-validated">
		  	<h2>회원 로그인</h2>
		  	<p>회원 아이디와 비밀번호를 입력해 주세요</p>
		    <div class="form-group">
		    	<label for="=mid">회원 아이디</label>
		    	<input type="text" class="form-control"name="mid" id="mid" value="${mid}" placeholder="아이디를 입력하세요" required autofocus/>
		    	<div class="valid-feedback"></div>
		    	<div class="invalid-feedback">회원 아이디는 필수 입력사항입니다.</div>
		    </div>
		    <div class="form-group">
		      <label for="pwd">비밀번호</label>
		      <input type="password" class="form-control"name="pwd" id="pwd" placeholder="비밀번호를 입력하세요" required />
		      <div class="invalid-feedback">비밀번호는 필수 입력사항입니다.</div>
		    </div>
		    <div class="form-group">
		      <button type="submit" class="btn btn-primary" onclick="fCheck()">로그인</button> &nbsp;      
		      <button type="reset" class="btn btn-primary">취소</button> &nbsp;      
		      <button type="button" class="btn btn-primary" onclick="location.href='${ctp}/';">돌아가기</button> &nbsp;      
		      <button type="button" class="btn btn-primary" onclick="location.href='${ctp}/member/memJoin';">회원가입</button>      
				</div>
				<div class="row">
					<span class="col"><input type="checkbox" name="idCheck" checked></span>
					<span class="col"><a href="#">아이디찾기</a> / <a href="#">비밀번호 찾기</a></span>
				</div>
			</form>
			</div>
		</div>
	</div>
</div>
<p><br/></p>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>