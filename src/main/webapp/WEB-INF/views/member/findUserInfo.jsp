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

 <c:if test="${ m != null }">
 <c:if test="${ msg == success }">
<!-- emailjs api -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/emailjs-com@2.4.1/dist/email.min.js"></script>
<script type="text/javascript">
      $(function(){
          emailjs.init("user_Kmbb8XIwk8umyO1ONqpvV");
          
          var emailC = {
               user_id : ${m.user_id},
               user_pwd : ${m.user_pwd}
               email : ${m.email}
           }

         emailjs.send("service_b3h5plq","template_gzmo22p",emailC)
         .then(function(response) {
              console.log("SUCCESS. status=%d, text=%s", response.status, response.text);
           }, function(err) {
              console.log("FAILED. error=", err);
           });
      })();
      
      alert("이메일로 임시 비밀번호가 전송되었습니다.");
   </script>
</c:if>
</c:if>

<c:if test="${ m == null }">
 <c:if test="${ msg == fail }">
	<script>
		alert("조회된 회원 정보가 없습니다.");
	</script>
</c:if>
</c:if>



</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
   	
    <section id="gbSection">
    
    <div id="totalWrap">
	   	<div id="idArea">
	   		<h1 class="h">아이디 찾기</h1>
	   		
	   		<form action="${ contextPath }/member/findId" method="post">
	   		<input type="text" name="email" class="inputEmail"required placeholder="E_MAIL"><br>
	   		<button type="submit" class="okBtn">확인</button>
	   		</form>
	   		
	   		<c:if test="${ user_id != null }">
	   		<p id="userId" style="display:block;">ID : ${ user_id }</p>
	   		</c:if>
	   		
	   		<%-- <c:if test="${ user_id == null }">
	   		<p id="userId" style="display:block;">조회된 아이디가 없습니다.</p>
	   		</c:if> --%>
	   		
	   		
	   	</div>
	   	
	   	
	   	<div id="passArea">
	   		<h1 class="h">비밀번호 찾기</h1>
	   		<form action="${ contextPath }/member/findPwd" method="post">
	   		<input type="text" name="user_id" id="inputId"required  placeholder="ID"><br><br>
	   		<input type="text" name="email" class="inputEmail"required  placeholder="E_MAIL"><br>
	   		<button type="submit" class="okBtn">확인</button>
	   		</form>
	   		
	   		<%-- <c:if test="${ m != null }">
	   		<p>${ m.user_id }</p>
	   		<p>${ m.email }</p>
	   		<p>${ m.user_pwd }</p>
	   		</c:if>
	   		 --%>
	   	</div>
    
    </div>
    
  
    </section>


 	<jsp:include page="../common/footer.jsp"/>
 	
 	
 	
 	<script>
	
	</script>

</body>
</html>