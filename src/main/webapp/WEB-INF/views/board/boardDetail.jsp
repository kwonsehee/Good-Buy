<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
   
   
    <link href="${contextPath }/resources/css/board/boardDetail.css" rel="stylesheet" type="text/css">
   
</head>
<body>
   <jsp:include page="../common/menubar.jsp"/>
    
    <section id="gbSection">
           

         
        <div class="list">
            <div class="title2">동네생활</div>
          

        <div class="start">
               
        
            <ul>
                <li><p class="title">푸켓 여행 일대기 </p></li>
                
                <li><a href="javascript:reportPopup()" id="police">신고하기</a></li>
          
               <li><a href="javascript:deletePopup()" id="mypass">게시글 삭제</a></li>
                <br>
                <li class="name" style="color: black; font-size: 18px;">옥련동99대장</li>
                <li class="Date" style="font-size: 17px;">2021.11.13</li>
                <li><div class="kind"><p class="subject">우리동네질문</p></div></li>
            </ul>
            
        
            <img src="${ contextPath }/resources/images/board/storyimg.jpg"class="Photo" >
         
        </div>
            <br>

            <div id="board">
                <img class="left" src="${ contextPath }/resources/images/board/left.png" style="width: 52px; height: 44px;">
                <img class="mainimg" src="${ contextPath }/resources/images/board/see.jpg" style="width: 861px; height: 470px;">
                <img  class="right"src="${ contextPath }/resources/images/board/right.png" style="width: 52px; height: 44px;">
                <div class="page">
                    <label for="ra01">○</label>
                    <label for="ra02">○</label>
                    <label for="ra03">○</label>
                    <label for="ra04">○</label>
                    <label for="ra05">○</label>
                  </div>
            </div>
           
            
            <div class="bcontent"><p>친구, 가족, 연인과 함께 걷고 싶게 만드는  푸껫의 카론/카타 비치!
              따사로운 햇살이 가득한아름다운 해변에서 여유도 만끽하고, 사랑하는 사람들과특별한 추억여행을 즐겨보세요!</p></div>
            <div id="hearts">
            <img class="heart" src="${contextPath }/resources/images/board/heart.png" style="width: 42px; height: 39px;"></div>
            <div class="heartstory">좋아요를 눌러주세요!"</div>
            </div>
        
        <div id="replySection">
            <p style="color: #9a9999; padding: 50px 0 0 50px">댓글</p>
            <table>
                <tr>
                    <td>동춘동피바다</td>
                    <td colspan="2" class="subdate">2021.03.08 02:12</td>
                </tr>
                <tr>
                    <td colspan="2" > 친구, 가족, 연인과 함께 걷고 싶게 만드는  푸껫의 카론/카타 비치!</td>
                       <td class=reviews style="position:relative;left:23%;"><img src="${ contextPath }//resources/images/mypage/speech-bubble.png"  style="width : 20px;"><span style="font-size: 1.3em;">&nbsp;1</span></td>
                </tr>
                <tr>
                    <td style="padding-left: 50px;">나는 판매자</td>
                    <td colspan="2" class="subdate">2021.03.08 02:12</td>
                </tr>
                <tr>
                    <td colspan="3"><img src="${ contextPath }/resources/images/board/right-arrow.png" style="width: 20px; padding-right: 10px;">안됩니다. </td>
   
                    
                </tr>
                <tr>
                    <td>동춘동피바다</td>
                    <td colspan="2" class="subdate">2021.03.08 02:12</td>
                </tr>
                
                
                <tr>
                    <td colspan="2">친구, 가족, 연인과 함께 걷고 싶게 만드는  푸껫의 카론/카타 비치!</td>
                        <td class=reviews style="position:relative;left:23%;"><img src="${ contextPath }/resources/images/mypage/speech-bubble.png"  style="width : 20px;"><span style="font-size: 1.3em;">&nbsp;1</span></td>
                </tr>
                <br>
                <tr>
                    <td style="padding-left: 50px;">나는 판매자</td>
                    <td colspan="3" class="subdate">2021.03.08 02:12</td>
                </tr>
                <tr>
                    <td colspan="3"><img src="${ contextPath }/resources/images/board/right-arrow.png" style="width:20px; padding-right:10px;'">안됩니다. </td>
               
                    
                </tr>
            </table>
            <form method="POST">
            <div id="replyWrite">
            
                <textarea placeholder="댓글을 작성하시려면 로그인을 해주세요"></textarea>
                <span id="counter">0 / 1000</span>
                <button type="submit" id="writeBtn">등록하기</button>
</div>
</form>
</div>

    
    </section>

   

     <jsp:include page="../common/footer.jsp"/>


</body>
</html>