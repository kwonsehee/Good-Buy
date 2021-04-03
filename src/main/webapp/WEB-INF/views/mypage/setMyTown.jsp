<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
<link href="${ contextPath }/resources/css/mypage/setMyTown.css?v" rel="stylesheet" type="text/css">
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
                    <li>길동</li>
                    <li><input type="button" value="X" class="Xbtn"></li>
                </ul>             
            </div>
            <div class="setBox secondBox">
             	          
            </div>
			</div>
            <br> <br> <br>

            <span id="mytown">길동</span>
            <span id="townCount">근처 동네 1 개</span>

            <p>선택한 동네의 이웃들만 피드에서 이 게시글을 볼 수 있어요.</p>
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
	 // 첫번째 동네 삭제 클릭 시 - alert
	 $(".firstBox .Xbtn").on('click',function(){
		 alert("동네는 최소 1개 설정되어야 합니다 :)");
	 });
	 
	 // 두번째 동네 추가시 팝업
	 
	 // 두번재 동네 추가시 div style 바뀌게
	 
	 // 두번째 동네 삭제 클릭 시 - 삭제 
	 
		
	 
       function showValue(value){
        //    var mytown = $("#mytown").text;
           var val = $("#townArea").val();
          console.log(val);
        //   console.log(mytown);

          if(val == 1){
           // $("#mytown").html(mytown);
            $("#townCount").html("근처 동네 1개");
          } else if(val == 2){
          //  $("#mytown").html(mytown);
            $("#townCount").html("근처 동네 5개");
          } else if(val == 3){
          //  $("#mytown").html(mytown);
            $("#townCount").html("근처 동네 15개");
          } else {
            $("#mytown").html("");
            $("#townCount").html("전국");
          }
       }
       
    </script>
</body>
</html>