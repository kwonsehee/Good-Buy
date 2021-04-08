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
				<div class="setBox firstBox">
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
				
				<!-- 두번째 동네 추가되어 있을 때 삭제 클릭 시 동네 삭제 -->
				<c:if test="${ mtlist.size() == 2 }">
					<div class="setBox secondBox">
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
								<br>
								<button type="submit">등록</button>
							</form>
						</div>
					</div>
				</div>
			</div>


			<span id="mytown">${ mtlist.get(0) }</span>
            <span id="townCount">근처 동네 1 개</span>

            <p id="ppp">선택한 동네의 이웃들만 피드에서 이 게시글을 볼 수 있어요.</p>
            <form class="townAreaForm">
                <input type="range" name="townArea" id="townArea" min="1" max="4" value="1" step="1" onchange="showValue(this)">
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
			location.href="${contextPath}/mypage/deleteTown?townName="+townName;
		}
		
		// 두번째 동네 추가 Modal창 띄우기
		function showModal(){
			$("#addTown").modal("show");
		}

		// 동네 범위 변경 텍스트 동적으로 보여주기
		function showValue(value) {
			var val = $("#townArea").val();
			console.log(val);

			if (val == 1) {
				$("#mytown").show();
				$("#townCount").html("근처 동네 1개");
			} else if (val == 2) {
				$("#mytown").show();
				$("#townCount").html("근처 동네 5개");
			} else if (val == 3) {
				$("#mytown").show();
				$("#townCount").html("근처 동네 15개");
			} else {
				$("#mytown").hide();
				$("#townCount").html("전국");
			}
		}
	</script>
	
</body>
</html>