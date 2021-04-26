<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <!-- 공통 UI -->
       
        <link href="${contextPath }/resources/css/board/boardwrite.css" rel="stylesheet" type="text/css">
  

        
        <script type="text/javascript">
        
    /*체크박스 중복 방지*/
            function oneCheckbox(a){
        
                var obj = document.getElementsByName("bcate");
        
                for(var i=0; i<obj.length; i++){
        
                    if(obj[i] != a){
        
                        obj[i].checked = false;
        
                    }
        
                }
        
            }
        
        </script>
        
        
        
    </head>
    
<body>
<jsp:include page="../common/menubar.jsp"/>
 
     <section id="gbSection">
        <br>   <br>   
       <div class="all">
        <div id="ts">동네생활</div>
        
        <form action="${ contextPath }/board/insert" id="writeForm" method="POST" enctype="multipart/form-data">
            <br><br><br><br><br>
                <div id="ts1">제목:</div>
             
                 <input type="text" id="btitle"name="btitle">
      
       <!--  -->
            <div class="ts2">
       <div id="ts4">이미지</div>
             <input type="file" name="fileup" id="images"> <img src="${contextPath }/resources/images/board/photo.png"> 
            </div>
            <div id="catagory">카테고리: </div>
            <div  id="board_catagory">       
                <div><label>일상&nbsp;</label><input type="checkbox" value="1"name="bcate"onclick="oneCheckbox(this)"> </div>
                <div><label >맛집&nbsp;</label><input type="checkbox" value="2"name="bcate"onclick="oneCheckbox(this)"> </div>
                <div><label >동물&nbsp;</label><input type="checkbox" value="3"name="bcate"onclick="oneCheckbox(this)" > </div>
                <div><label >기타&nbsp;</label><input type="checkbox" value="4"name="bcate"onclick="oneCheckbox(this)" > </div>
         </div>
                <br>  <br>  <br>  <br>  <br>  <br>
        </div>
        <div id="ts3">STORY</div>
        <br>
        <textarea name="bhistory" id="history" style="resize:none; width: 1000px; height: 300px; border-radius: 10px;" required></textarea>
 
                <button type="submit" id="writeBtn">글쓰기</button>
        

       
    </form>
    </section>
   
   
  <jsp:include page="../common/footer.jsp"/>
  </body>

</html>