<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
<link href="${ contextPath }/resources/css/mypage/memberUpdateForm.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	 <section id="gbSection">
    <div class="totalWrap">
     <div class="imgWrap">
            <img id="joinImg" src="${ contextPath }/resources/images/mypage/join.png">
        </div> 

        <div class="formWrap">
            <h4 id="goodbuy_h2">good-buy Family</h4>
            <h4 id="join_h2">회원 정보 수정</h4>  

            <form action="${ contextPath }/member/update" method="POST" class="joinform" onsubmit="sendNewInfo();">
                <p>NICKNAME</p>
                <input type="text" name="nickname" value="${ loginUser.nickname }"><br>
                <input type="password" name="userPwd" placeholder="PASSWORD" required><br>
                <input type="password" name="userNewPwd" placeholder="NEW PASSWORD"><br>
                <input type="password" name="userNewPwd2" placeholder="NEW PASSWORD"><br>
                <div class="checkPwd-success">비밀번호 일치</div> 
				<div class="checkPwd-fail">비밀번호 불일치</div>
                <p>EMAIL</p>
                <input type="email" name="email" value="${ loginUser.email }"><br>
                <p>PHONE</p>
                <input type="text" name="phone" value="${ loginUser.phone }"><br>
                <p>ADDRESS</p> 
                <select  id="town1" name="address_1">
					 <option value="address_1">&nbsp;${ townInfo.address_1 }</option>
						<c:forEach var="town" items="${ tlist1 }">
							<option>${ town.address_1 }</option>
						</c:forEach>
				</select>
					
                <select  id="town2" name="address_2">
                    <option>&nbsp;${ townInfo.address_2 }</option>
						<c:forEach var="town" items="${ tlist2 }">
							<option>${ town.address_2 }</option>
						</c:forEach>
				</select>
				
                <select  id="town3" name="address_3">
                    <option>&nbsp;${ townInfo.address_3 }</option>
                    <c:forEach var="town" items="${ tlist3 }">
						<option>${ town.address_3 }</option>
					</c:forEach>
                </select>
                <br><br><br><br><br><br><br>
                <button type="submit" id="submitBtn">수정하기</button>
            </form>         
            <a id="memberLeaveBtn" href="#">탈퇴하기</a>
        </div>
    </div>
    </section>
	
	
	
	
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
	/* 선택한 주소값,새비번 보내기 */
 	function sendNewInfo(){
 	 	var address_3 = $("select[name=address_3] option:selected").text();
 	 	console.log(newPwd);
 	 	//location.href="${contextPath}/member/update?address_3="+address_3;
 	};
 	
 	// 수정할 때 무조건 기존 비밀번호 입력해야 수정 가능
 	// 기존 비번 로그인유저와 일치하는지 검사(ajax)
 	$(function(){
 		$("#submitBtn").click(function(){
 			var originPwd = $(".joinform input[name=userPwd]");
 			
 			$.ajax({
 				url: "${contextPath}/member/originPwdCheck",
 				type:"post",
 				data : {originPwd : originPwd.val()},
 				success : function(data){
 					console.log(data);
 					// 비밀번호 일치 시 수정하기 버튼 활성화 불일치 시 버튼 비활성화 
 					 if(data == "success"){
 						$("#submitBtn").removeAttr("disabled");
 					}else {
 						$("#submitBtn").removeAttr("disabled");
 						//$("#submitBtn").attr("disabled",true);
 						alert("기존 비밀번호를 맞게 입력해주세요!");
 					} 
 					var newPwd = $(".joinform input[name=userNewPwd2]").val();
 					location.href="${contextPath}/member/update?newPwd="+newPwd;
 				},
 				error : function(e){
 					alert("error code: " + e.status + "\n" + "message: " + e.responseText);
 				}
 			});
 		});
 	});
 	
 	// 새로운 pwd 일치여부 검사
	$(function() {
		$(".checkPwd-success").hide();
		$(".checkPwd-fail").hide();
		$("input").keyup(function() {
			var pwd1 = $(".joinform input[name=userNewPwd]").val();
			var pwd2 = $(".joinform input[name=userNewPwd2]").val();
			if (pwd1 != "" || pwd2 != "") {
				if (pwd1 == pwd2) {
					$(".checkPwd-success").show();
					$(".checkPwd-fail").hide();
					$("#submitBtn").removeAttr("disabled");
				} else {
					$(".checkPwd-success").hide();
					$(".checkPwd-fail").show();
					$("#submitBtn").attr("disabled", "disabled");
				}
			}
		});
	});
 	
 	
 	
 	
 	
 	
 	
	</script>
	
	
	
	
	
	
</body>
</html>