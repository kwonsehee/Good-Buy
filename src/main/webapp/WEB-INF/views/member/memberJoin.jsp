<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
<!-- 공통 UI -->
<link href="${ contextPath }/resources/css/member/memberJoin.css?" rel="stylesheet" type="text/css">
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
            
            <form action="${ contextPath }/member/join" method="POST" class="joinform" onsubmit="sendAddress(); joinValidate();">
                <input type="text" name="user_id" placeholder="* ID" id="user_id"><br>
                <input type="text" name="nickname" placeholder="* NICKNAME"><br>
                <input type="password" name="user_pwd" placeholder="* PASSWORD"><br>
                <input type="password" name="user_pwd2" placeholder="* PASSWORD"><br>
                <input type="email" name="email" placeholder="EMAIL"><br>
                <input type="text" name="phone" placeholder="*PHONE"><br>
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
                <button type="submit">가입하기</button>
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
 	
 	/* 유효성 검사 */
 	
 	/* function joinValidate(){
 		//아이디 - 영소문자로 시작해서 4~12자 입력(숫자포함가능)
 		if(!(/^[a-z][a-z\d]{3,11}$/.test($(".joinForm input[name=user_id]").val()))){
			alert('아이디는 영소문자로 시작해서 4~12자 입력(숫자포함가능)');
			$(".joinForm input[name=user_id]").select();
			return false;
		}
 		
 		//비밀번호 유효성 검사
 		
 		//비밀번호 - 비밀번호 확인 일치여부
 		/* 비밀번호 불일치 알려줄 공간 만들기 */
 		/*
 		if($(".joinForm input[name=user_pwd]").val() != $(".joinForm input[name=user_pwd2]").val()){
			$("#pwdResult").text("비밀번호 불일치").css("color","red");
			return false;
		}
 		
 		//닉네임 - 특수문자X 
 		if( !(/^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]+$/.test($(".joinForm input[name=nickname]").val()))){
			alert("닉네임은 한글/영문/숫자만 입력 가능합니다!");
			$(".joinForm input[name=nickname]").select();
			return false;
		}
 		
 		return true;
 		
 	}
 	 */
 	
 	
 	/* 아이디 중복확인(ajax)*/
 	/* 중복확인 버튼 만들기 */
 	$(function(){
 		var isUsable = false;
 	});
 	
 	</script>

</body>
</html>