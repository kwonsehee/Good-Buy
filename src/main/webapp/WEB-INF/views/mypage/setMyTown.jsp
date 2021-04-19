<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
<link href="${ contextPath }/resources/css/mypage/setMyTown.css?c" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	 <section id="gbSection">
        <img src="${ contextPath }/resources/images/mypage/left-arrow.png" id ="backBtn" onclick="location.href='${ contextPath }/mypage/main'">
        <h1 class="title_h1">내 동네 설정</h1>

		<div class="totalWrap">
			<p>동네 선택</p>
			<p>지역은 최소 1개 이상 최대 2개까지 설정 가능해요.</p>
			<div class="setBoxWrap">
				<div class="setBox firstBox" onclick="changeTownType('${mtlist.get(0)}','${ townInfo.address_2 }','${ townInfo.address_1 }')">
					<ul>
						<!-- 첫번째 동네 이름 출력 -->
						<li id="defaultTown">${ mtlist.get(0) }</li>
						<!-- 동네 하나일 때 삭제 클릭 시 alert -->
						<c:if test="${ mtlist.size() == 1 }">
						<li><input type="button" value="X" class="Xbtn" onclick="showAlert()"></li>
						</c:if>
						<!-- 동네 두개일 때 삭제 클릭 시 동네 삭제 -->
						<c:if test="${ mtlist.size() == 2 }">
						<li><input type="button" value="X" class="Xbtn" onclick="deleteTown('${mtlist.get(0)}')"></li>
						</c:if>
					</ul>
				</div>
				
				<!-- 두번째 동네 추가 안되어 있을 때 div 클릭 시 동네 추가 모달창 -->
				<c:if test="${ mtlist.size() == 1 }">
					<div class="setBox secondBox" style="cursor:pointer;" onclick="showModal()">
					<ul>
						<li id="newTownli_1">+</li>
					</ul>
					</div>
				</c:if>
				
				<!-- 두번째 동네 추가되어 있을 때 삭제 버튼 클릭 시 동네 삭제 -->
				<!-- 두번째 동네 추가되어 있을 때 div 클릭 시 기본동네가 두번째 동네로 바뀌게 -->
				<c:if test="${ mtlist.size() == 2 }">
					<div class="setBox secondBox" onclick="changeTownType('${mtlist.get(0)}','${ townInfo.address_2 }','${ townInfo.address_1 }')">
					<ul>
						 <li id="newTownli_2">${  mtlist.get(1) }</li>
		                 <li id="newTownli_3"><input type="button" value="X" class="Xbtn secondXbtn" onclick="deleteTown('${mtlist.get(1)}')"></li>
					</ul>
					</div>
				</c:if>
				</div>
			
			<br> <br> <br>

			<!-- 주소 추가 Modal  -->
			<div class="modal fade" id="addTown" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<div class="titleWrap">
								<span class="circle"></span> 
								<span class="welcome">내 동네 추가</span>
								<span class="circle"></span>
							</div>
						</div>

						<div class="modal-body">
							<form action="${ contextPath }/mypage/addTown" method="post"
								id="addTownForm">
								<p>두 번째로 등록할 동네를 선택하세요!</p>
								
								<select id="town1" name="address_1">
									<option value="address_1">&nbsp;시•도</option>
				                    <c:forEach var="town" items="${ tlist1 }">
				                   		 <option>${ town.address_1 }</option>
				                    </c:forEach>
								</select>
								
								<select id="town2" name="address_2">
				                   <option value="address_2" >&nbsp;구•군</option>
				                </select>
                
				                <select id="town3" name="address_3">
				                    <option value="address_3" >&nbsp;읍•면•동</option>
				                </select>
								<br>
								<button type="submit">등록</button>
							</form>
						</div>
					</div>
				</div>
			</div>

			<!-- 내동네 설정 화면 들어왔을 때 처음 셋팅되어 있는 값 -->
			<span id="mytown">
			<c:if test="${ townInfo.area == 1 || townInfo.area == 2 || townInfo.area == 3}">${ mtlist.get(0) }</c:if>
			</span>
		
            <span id="townCount">
            <c:if test="${ townInfo.area == 1 }">내 동네 1개</c:if>
            <c:if test="${ townInfo.area == 2 }">포함&nbsp;${ townInfo.address_2 }</c:if>
            <c:if test="${ townInfo.area == 3 }">포함&nbsp;${ townInfo.address_1 }</c:if>
            <c:if test="${ townInfo.area == 4 }">전국</c:if>
            </span>

            <p id="ppp">선택한 동네의 이웃들만 피드에서 이 게시글을 볼 수 있어요.</p>
            <form class="townAreaForm">
                <input type="range" name="townArea" id="townArea" min="1" max="4" value="${ townInfo.area }" step="1" onchange="showValue('${mtlist.get(0)}','${ townInfo.address_2 }','${ townInfo.address_1 }',
                																										  ,'${ townInfo.area }')">
                																				 
            </form>
           <div class="nonameDiv">
               <ul>
                   <li>내 동네</li>
                   <li>전국</li>
                </ul>
           </div>
        </div>
	
    </section>
	
	<jsp:include page="../common/footer.jsp"/>


	<script>
		
		function showAlert(){
			alert("동네는 최소 1개 설정되어야 합니다 :)");
		}
		
		// 동네 하나 삭제하고 남은 동네 하나가 MYTOWN_TYPE = 1로 업데이트 되어야 함
		function deleteTown(townName){
			// 이벤트 전파 버블링 방지
			event.stopPropagation();
			location.href="${contextPath}/mypage/deleteTown?townName="+townName;
		}
		
		// 두번째 동네 추가 Modal창 띄우기
		function showModal(){
			$("#addTown").modal("show");
		}
		
		// range 움직일 때 마다
		// 동네 범위 동적으로 바껴야함(Ajax전송)
		$(document).on('input change','#townArea',function(){
			var changeArea = $("#townArea").val();
			console.log("바꾸고싶은 동네 범위 : " +changeArea);

			$.ajax({

			url: "changeArea",
			data: {area :changeArea},
			dataType:"json",
			type: "get",
			success: function(townInfo){
				// 동네 범위 변경 성공 시 
				// 동네 범위 변경 텍스트 다시 셋팅
				var area = townInfo.area;
				var address_1 = townInfo.address_1;
				var address_2 = townInfo.address_2;
				var address_3 = townInfo.address_3;
								
				 if (area == 1) {
						$("#mytown").html(address_3);
						$("#mytown").show();
						$("#townCount").html("내 동네 1개");
					} else if (area == 2) {
						$("#mytown").html(address_3);
						$("#mytown").show();
						$("#townCount").html("포함  "+address_2);
					} else if (area == 3) {
						$("#mytown").html(address_3);
						$("#mytown").show();
						$("#townCount").html("포함  "+address_1);
					} else {
						$("#mytown").hide();
						$("#townCount").html("전국");
					} 
				
			},
			error: function(e){
				alert("error code: " + e.status + "\n" + "message: " + e.responseText);
			}
			
			});
			
			
		});
		
		// range 움직일 때 마다 동네 범위 변경 텍스트 동적으로 보여주기(javascript)
		function showValue(address_3,address_2,address_1,area) {
			if (area == 1) {
				$("#mytown").html(address_3);
				$("#mytown").show();
				$("#townCount").html("내 동네 1개");
			} else if (area == 2) {
				$("#mytown").html(address_3);
				$("#mytown").show();
				$("#townCount").html("포함  "+address_2);
			} else if (area == 3) {
				$("#mytown").html(address_3);
				$("#mytown").show();
				$("#townCount").html("포함  "+address_1);
			} else {
				$("#mytown").hide();
				$("#townCount").html("전국");
			}
			
			
		}
		
		// 동네 div 클릭 시 스타일 바뀔 때(javascript)
		// 동네 범위 문구 동적으로 바껴야 함(Ajax응답 후)
		// 동네 타입 MYTOWN_TYPE = 1로 업데이트 되어야 함(Ajax 전송)
		function changeTownType(address_3,address_2,address_1){
			var val = $("#townArea").val();
			$("#mytown").html(address_3);
			
			if(event.target.id == "defaultTown"){
				$(".firstBox").css("background","#9BDDEC");
				$(".firstBox").css("border","1px solid #fff");
				$(".Xbtn").css("color","#fff");
				$(".secondBox").css("background","#F9F9F9");
				$(".secondBox").css("border","1px solid #E0E0E0");
				$(".secondXbtn").css("color","black");
				
			} else {
				$(".secondBox").css("background","#9BDDEC");
				$(".secondBox").css("border","1px solid #fff");
				$(".firstBox").css("background","#F9F9F9");
				$(".firstBox").css("border","1px solid #E0E0E0");
				$(".Xbtn").css("color","black");
				$(".secondXbtn").css("color","#fff");
				
			}
			
			$.ajax({
				
				url:"changeTownType",
				type:"get",
				dataType:"json",
				success: function(townInfo){
					var area = townInfo.area;
					var address_1 = townInfo.address_1;
					var address_2 = townInfo.address_2;
					var address_3 = townInfo.address_3;
					//var t_no = townInfo.t_no;
					 
					 if (area == 1) {
						$("#mytown").html(address_3);
						$("#mytown").show();
						$("#townCount").html("내 동네 1개");
					} else if (area == 2) {
						$("#mytown").html(address_3);
						$("#mytown").show();
						$("#townCount").html("포함  "+address_2);
					} else if (area == 3) {
						$("#mytown").html(address_3);
						$("#mytown").show();
						$("#townCount").html("포함  "+address_1);
					} else {
						$("#mytown").hide();
						$("#townCount").html("전국");
					}  
					 
					
					// 기본동네 타입 바꾸고 나서 처음 화면 range에 셋팅되어 있던 기본동네 다시 셋팅
					$("#townArea").attr("value",area);
					$("#townArea").removeAttr("onchange");	// onchange 속성 지우고 다시 부여
					$("#townArea").attr("onchange",showValue(address_3,address_2,address_1,area));
					
				},
				error: function(e){
					alert("error code: " + e.status + "\n" + "message: " + e.responseText);
				}
			});
			
			
			};  
			 
			
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