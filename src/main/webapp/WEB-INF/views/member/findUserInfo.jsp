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
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/emailjs-com@2.4.1/dist/email.min.js"></script>


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
	   		<c:if test="${ user_id != null }">
	   		<p id="userId" style="display:block;">ID : ${ user_id }</p>
	   		</c:if>
	   		
	   		
	   		<c:if test="${ user_id == null }">
	   		<p id="userId" style="display:block;">조회된 아이디가 없습니다.</p>
	   		</c:if> 
	   		
	   		</form>
	   		
	   		
	   	</div>
	   	
	   	
	   	<div id="passArea">
	   		<h1 class="h">비밀번호 찾기</h1>
	   		<input type="text" name="user_id" id="inputId"required  placeholder="ID"><br><br>
	   		<input type="text" name="email" class="inputEmail"required  placeholder="E_MAIL"><br>
	   		<button type="button" class="okBtn" id="findPwdBtn">확인</button>
	   	</div>
    
    </div>
    
  
    </section>


 	<jsp:include page="../common/footer.jsp"/>
 	
 	
 	
 	<script>
		$("#findPwdBtn").on('click',function(){
			var user_id = $("#passArea input[name=user_id]").val();
			var email = $("#passArea input[name=email]").val();
			
			$.ajax({
				url : "${ contextPath }/member/findPwd",
				type : "post",
				data : {user_id : user_id, email : email},
				dataType:"json",
				success : function(user){
					var user_id = user.user_id;
					var email = user.email;
					var user_pwd = user.user_pwd;
					
					ajaxSuccess(user_id, email, user_pwd);
				},
				error : function(e) {
					alert("error code: " + e.status + "\n" + "message: " + e.responseText);
				}
			});
			
		});
		
		
		function ajaxSuccess(user_id,email,user_pwd){
			
			$(function(){
				emailjs.init("user_Kmbb8XIwk8umyO1ONqpvV");
			});
			
			$(function(){
				emailjs.send("service_b3h5plq","template_gzmo22p",{
					id : user_id,
					pwd : user_pwd,
					email : email
				});
			});
			
			alert("회원님의 이메일로 임시 비밀번호를 발송하였습니다.");
			
		};
		
	</script>
	

</body>
</html>