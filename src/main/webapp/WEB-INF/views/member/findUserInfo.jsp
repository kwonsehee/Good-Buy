<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
<!-- 공통 UI -->
<link href="${ contextPath }/resources/css/member/findUserInfo.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
   	
    <section id="gbSection">
    
    <div id="totalWrap">
	   	<div id="idArea">
	   		<h1 class="h">아이디 찾기</h1>
	   		
	   		<form action="${ contextPath }/member/findId" method="post">
	   		<input type="text" name="email" id="inputEmail"required placeholder="E_MAIL"><br>
	   		<button type="submit" id="okBtn">확인</button>
	   		</form>
	   		
	   		<c:if test="${ user_id != null }">
	   		<p id="userId">ID : ${ user_id }</p>
	   		</c:if>
	   		
	   		<c:if test="${ user_id == null }">
	   		<p id="userId">조회된 아이디가 없습니다.</p>
	   		</c:if>
	   		
	   	</div>
	   	
	   	
	   	<div id="passArea">
	   		<h1 class="h">비밀번호 찾기</h1>
	   		<form action="${ contextPath }/member/findPwd" method="post">
	   		<input type="text" name="user_id" id="inputId"required  placeholder="ID"><br><br>
	   		<input type="text" name="email" id="inputEmail"required  placeholder="E_MAIL"><br>
	   		<button type="submit" id="okBtn">확인</button>
	   		</form>
	   	</div>
    
    </div>
    
  
    </section>


 	<jsp:include page="../common/footer.jsp"/>
 	
 	
 	
 	<script>
	
	</script>

</body>
</html>