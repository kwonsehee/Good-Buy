<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
  
    <link href="${contextPath }/resources/css/board/boardSerch.css" rel="stylesheet" type="text/css">
  

</head>

<body>
      <jsp:include page="../common/menubar.jsp"/>
    <section id="gbSection">
        <ul class="categorys">
              <li><a href="${contextPath }/board/list"><img  class="categorya" src="${contextPath }/resources/images/board/life.png"></a><br>일상</li>
            <li><a href="${contextPath }/board/list"><img  class="categorya" src="${contextPath }/resources/images/board/dog.png"></a><br>동물</li>
            <li><a href="${contextPath }/board/list"><img class="categorya"  src="${contextPath }/resources/images/board/food.png"></a><br>맛집</li>
            <li><a href="${contextPath }/board/list"><img  class="categorya" src="${contextPath }/resources/images/board/town.png"></a><br>기타</li>
    </ul>
    <br><br>
    <div class="townserch">
        <input type="text" id="townbox" placeholder="동네생활을 검색하세요!" style=" color:#05AAD1;">
        <button type="submit" id="townbutton" style="margin-left: 15px;">검색</button>
    
    </div>
    <br>
    <br>

    <div id="serchlist">
        <a>‘폰팔이’에 대한 검색결과가 없습니다 </a>
        </div>
        <br> <br>    <br>
        

        <pre id="serchs">  
 ※단어의 철자가 정확한지 확인해 보세요.<br>
 한글을 영어로 혹은 영어를 한글로 입력했는지 확인해 보세요.
검색어의 단어 수를 줄이거나, 보다 일반적인 검색어로 다시 검색해 보세요.
 두 단어 이상의 검색어인 경우, 띄어쓰기를 확인해 보세요. 

            </pre>
            <br>   <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>

<jsp:include page="../common/footer.jsp"/>

</body>
</html>