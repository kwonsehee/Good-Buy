<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
<!-- 공통 UI -->
<link href="${ contextPath }/resources/css/member/memberJoin.css?p" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
   	
    <section id="gbSection">
    <div class="totalWrap">
     <div class="imgWrap1">
            <img id="joinImg" src="${ contextPath }/resources/images/join.png">
        </div> 

        <div class="joinformWrap">
            <h4 id="goodbuy_h2">good-buy Family</h4>
            <h4 id="join_h2">회원 가입</h4>  
            <p id="alreadyJoin_p">이미 가입하셨나요?  <a data-bs-toggle="modal" data-bs-target="#loginModal">로그인 하기</a></p> 
            
            <form action="${ contextPath }/member/join" method="POST" class="joinform" onsubmit="sendAddress();">
                <input type="text" name="user_id" placeholder="* ID" id="user_id" required><br>
                <input type="button" value="중복확인" id="idCheck">
                <input type="text" name="nickname" placeholder="* NICKNAME" required><br>
                <input type="password" name="user_pwd" placeholder="* PASSWORD" required><br>
                <input type="password" name="user_pwd2" placeholder="* PASSWORD" required><br>
				<div class="checkPwd-success">비밀번호 일치</div> 
				<div class="checkPwd-fail">비밀번호 불일치</div>
                <input type="email" name="email" placeholder="* EMAIL" required><br>
                <input type="text" name="phone" placeholder="* PHONE" required><br>
                <p>* ADDRESS</p> 
               
                <!-- 주소 선택 -->
                <select id="town1" name="address_1">
                    <option value="address_1">&nbsp;시•도</option>
                    <c:forEach var="town" items="${ tlist1 }">
                   		 <option>${ town.address_1 }</option>
                    </c:forEach>
                </select>
                
                <select id="town2" name="address_2">
                   <option value="address_2" >&nbsp;구•군</option> 
                    <c:forEach var="town" items="${ tlist2 }">
                    <option>${ town.address_2 }</option>
                    </c:forEach>
                </select>
                
                <select id="town3" name="address_3">
                    <option value="address_3" >&nbsp;읍•면•동</option>
                    <c:forEach var="town" items="${ tlist3 }">
                    	<option>${ town.address_3 }</option>
                    </c:forEach>
                </select>
                <br><br><br><br><br><br><br>
                <button type="submit" id="submitBtn" disabled>가입하기</button>
          		</form>
        </div>
    </div>
  
    </section>


 	<jsp:include page="../common/footer.jsp"/>
 	
 	
 	
 	<script>
 	/* 선택한 주소값 보내기 */
 	/* address_3에 해당하는 t_no 필요함 */
 	function sendAddress(){
 	 	var address_3 = $("select[name=address_3] option:selected").text();
 	 	location.href="${contextPath}/member/join?address_3?="+address_3;
 	};
 	
	// 비밀번호 일치여부 검사
	$(function() {
		$(".checkPwd-success").hide();
		$(".checkPwd-fail").hide();
		$("input").keyup(function() {
			var pwd1 = $(".joinform input[name=user_pwd]").val();
			var pwd2 = $(".joinform input[name=user_pwd2]").val();
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


	// 아이디 중복확인(ajax) & 아이디 형식 검사 
	$(function() {
		//아이디 중복시 false, 아이디 사용가능시 true
		var isUsable = false;

		$("#idCheck").click(function() {
			var user_id = $(".joinform input[name=user_id]");

			if (!user_id || user_id.val().length < 4) {
				alert("아이디는 최소 4~12자로 입력해주세요!");
				user_id.focus();
			} else if (!(/^[a-z][a-z\d]{3,11}$/.test($(".joinform input[name=user_id]").val()))) {
				alert('아이디는 영소문자로 시작해서 4~12자 입력해주세요!(숫자포함가능)');
				$(".joinform input[name=user_id]").select();
			} else {
				//4자리 이상의 id값을 입력했을 경우 ajax 통신
				$.ajax({	
						url : "${contextPath}/member/idCheck",
						type : "post",
						data : {user_id : user_id.val()},
						success : function(data) {
							console.log(data);

							if (data == "fail") {
								alert("이미 사용 중인 아이디입니다.");
								user_id.focus();
							} else {
								if (confirm("사용 가능한 아이디입니다. 사용하시겠습니까?")) {
									user_id.prop('readonly',true);//더이상 id입력 공간을 바꿀수 없도록 처리
									isUsable = true;//사용가능한 아이디라는 flag값으로 변경
								} else {
									//confirm창에서 취소를 누를 경우(처음, 또는 반복해서)
									user_id.prop("readonly",false);//다시 Id input 태그 수정가능하도록
									isUsable = false; //사용 불가능한 아이디 flag 
								}
							}

							//아이디 중복 체크 후 중복이 아니고 사용하겠다고 선택한경우
							//submitBtn disabled 제거
							if (isUsable) {
								$("#submitBtn").removeAttr("disabled");
							} else {
								$("#submitBtn").attr("disabled",true);
							}
						},
						error : function(e) {
							alert("error code: " + e.status + "\n" + "message: " + e.responseText);
						}
					});
			}
		});
	});
	</script>

</body>
</html>