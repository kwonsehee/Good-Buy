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
                   <option value="address_2" >&nbsp;시•구•군</option> 
                </select>
                
                <select id="town3" name="address_3">
                    <option value="address_3" >&nbsp;읍•면•동</option>
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
	
	/* 주소 분류 */
	$('document').ready(function(){
		var sido = ["서울특별시","강원도","경기도","경상남도","경상북도","광주광역시","대구광역시","부산광역시","세종특별자치시","울산광역시","인천광역시","전라남도","전라북도","제주특별자치도","충청남도","충청북도"];
		var area0 = ["강남구","강동구","강북구","강서구","관악구","광진구","노원구","동대문구","마포구","성동구","송파구","영등포구","용산구","종로구","중구","중랑구"];
		var area1 = ["강릉시","동해시","춘천시"];
		var area2 = ["고양시","광명시","광주시","성남시","수원시","시흥시","안양시","용인시","하남시"];
		var area3 = ["김해시","진주시","창원시"];
		var area4 = ["경주시","안동시","포항시"];
		var area5 = ["광산구","남구","동구","북구","서구"];
		var area6 = ["동구","서구","중구"];
		var area7 = ["동구","서구","중구","해운대구"];
		var area8 = ["남구","동구","북구","중구"];
		var area9 = ["남동구","동구","부평구","중구"];
		var area10 = ["목포시","무안군","여수시"];
		var area11 = ["군산시","남원시","전주시"];
		var area12 = ["서귀포시","제주시"];
		var area13 = ["공주시","아산시","천안시"];
		var area14 = ["상당구","서원구","청원구"];

		var area15 = ["동산면","신북읍"];
		var area16 = ["논현동","대치동","신사동"];
		var area17 = ["길동","둔촌동","천호동"];
		var area18 = ["미아동","삼양동","수유동"];
		var area19 = ["가양동","등촌동","화곡동"];
		var area20 = ["낙성대동","보라매동","신림동"];
		var area21 = ["구의동","군자동","자양동","중곡동"];
		var area22 = ["상계동","중계동","하계동"];
		var area23 = ["답십리동","장안동","제기동","청량리동"];
		var area24 = ["망원동","연남동","합정동"];
		var area25 = ["마장동","성수동","왕십리동","행당동"];
		var area26 = ["석촌동","송파동","잠실본동"];
		var area27 = ["대림동","신길동","영등포동"];
		var area28 = ["이태원동","한남동","효창동","후암동"];
		var area29 = ["삼청동","청운효자동","혜화동"];
		var area30 = ["명동","신당동","을지로동","회현동"];
		var area31 = ["면목동","상봉동","신내동","중화동"];
		
		$("#town1").on('change',function(){
			var bigTown = $("#town1 option:selected").text();
			//console.log(bigTown);
			$("#town2 option").remove();
			$("#town2").append("<option>&nbsp;시•구•군</option>");
			
			/* for(var i in sido){
				if(bigTown == sido[i]){
					break;
					var gugun = "area" + i;
					for(var j in gugun){
						$("#town2").append("<option>"+gugun[j]+"</option>");
					}
				}
			} */
			
			if(bigTown == "서울특별시"){
				for(var i in area0){
				$("#town2").append("<option>"+area0[i]+"</option>");
				}
			}
			if(bigTown == "강원도"){
				for(var i in area1){
				$("#town2").append("<option>"+area1[i]+"</option>");
				}
			}
			if(bigTown == "경기도"){
				for(var i in area2){
				$("#town2").append("<option>"+area2[i]+"</option>");
				}
			}
			if(bigTown == "경상남도"){
				for(var i in area3){
				$("#town2").append("<option>"+area3[i]+"</option>");
				}
			}
			if(bigTown == "경상북도"){
				for(var i in area4){
				$("#town2").append("<option>"+area4[i]+"</option>");
				}
			}
			if(bigTown == "광주광역시"){
				for(var i in area5){
				$("#town2").append("<option>"+area5[i]+"</option>");
				}
			}
			if(bigTown == "대구광역시"){
				for(var i in area6){
				$("#town2").append("<option>"+area6[i]+"</option>");
				}
			}
			if(bigTown == "대전광역시"){
				for(var i in area6){
				$("#town2").append("<option>"+area6[i]+"</option>");
				}
			}
			if(bigTown == "부산광역시"){
				for(var i in area7){
				$("#town2").append("<option>"+area7[i]+"</option>");
				}
			}
			if(bigTown == "세종특별자치시"){
				$("#town2").append("<option>--</option>");
			}
			if(bigTown == "울산광역시"){
				for(var i in area8){
				$("#town2").append("<option>"+area8[i]+"</option>");
				}
			}
			if(bigTown == "인천광역시"){
				for(var i in area9){
				$("#town2").append("<option>"+area9[i]+"</option>");
				}
			}
			if(bigTown == "전라남도"){
				for(var i in area10){
				$("#town2").append("<option>"+area10[i]+"</option>");
				}
			}
			if(bigTown == "전라북도"){
				for(var i in area11){
				$("#town2").append("<option>"+area11[i]+"</option>");
				}
			}
			if(bigTown == "제주특별자치도"){
				for(var i in area12){
				$("#town2").append("<option>"+area12[i]+"</option>");
				}
			}
			if(bigTown == "충청남도"){
				for(var i in area13){
				$("#town2").append("<option>"+area13[i]+"</option>");
				}
			}
			if(bigTown == "충청북도"){
				for(var i in area14){
				$("#town2").append("<option>"+area14[i]+"</option>");
				}
			}
		});
		
		
		$("#town2").on('change',function(){
			var bigTown = $("#town1 option:selected").text();
			var midTown = $("#town2 option:selected").text();
			console.log(midTown);
			console.log(bigTown);
			$("#town3 option").remove();
			$("#town3").append("<option>&nbsp;읍•면•동</option>");
			
			if(midTown == "강릉시"){
				$("#town3").append("<option>주문진읍</option>");
			}
			if(midTown == "동해시"){
				$("#town3").append("<option>성산면</option>");
			}
			if(midTown == "춘천시"){
				for(var i in area15){
				$("#town3").append("<option>"+area15[i]+"</option>");
				}
			}
			if(midTown == "강남구"){
				for(var i in area16){
				$("#town3").append("<option>"+area16[i]+"</option>");
				}
			}
			if(midTown == "강동구"){
				for(var i in area17){
				$("#town3").append("<option>"+area17[i]+"</option>");
				}
			}
			if(midTown == "강북구"){
				for(var i in area18){
				$("#town3").append("<option>"+area18[i]+"</option>");
				}
			}
			if(midTown == "강서구"){
				for(var i in area19){
				$("#town3").append("<option>"+area19[i]+"</option>");
				}
			}
			if(midTown == "관악구"){
				for(var i in area20){
				$("#town3").append("<option>"+area20[i]+"</option>");
				}
			}
			if(midTown == "광진구"){
				for(var i in area21){
				$("#town3").append("<option>"+area21[i]+"</option>");
				}
			}
			if(midTown == "노원구"){
				for(var i in area22){
				$("#town3").append("<option>"+area22[i]+"</option>");
				}
			}
			if(midTown == "동대문구"){
				for(var i in area23){
				$("#town3").append("<option>"+area23[i]+"</option>");
				}
			}
			if(midTown == "마포구"){
				for(var i in area24){
				$("#town3").append("<option>"+area24[i]+"</option>");
				}
			}
			if(midTown == "성동구"){
				for(var i in area25){
				$("#town3").append("<option>"+area25[i]+"</option>");
				}
			}
			if(midTown == "송파구"){
				for(var i in area26){
				$("#town3").append("<option>"+area26[i]+"</option>");
				}
			}
			if(midTown == "영등포구"){
				for(var i in area27){
				$("#town3").append("<option>"+area27[i]+"</option>");
				}
			}
			if(midTown == "용산구"){
				for(var i in area28){
				$("#town3").append("<option>"+area28[i]+"</option>");
				}
			}
			if(midTown == "종로구"){
				for(var i in area29){
				$("#town3").append("<option>"+area29[i]+"</option>");
				}
			}
			if(bigTown=="서울특별시" & midTown == "중구"){
				for(var i in area30){
				$("#town3").append("<option>"+area30[i]+"</option>");
				}
			}
			if(midTown == "중랑구"){
				for(var i in area31){
				$("#town3").append("<option>"+area31[i]+"</option>");
				}
			}
			
		});
		
	});
	
	
	</script>

</body>
</html>