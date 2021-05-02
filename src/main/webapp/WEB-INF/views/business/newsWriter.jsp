<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
    <link href="${ contextPath }/resources/css/businessCss/newsWriter.css" rel="stylesheet" type="text/css">
    <!--sweetalert2-->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
</head>
<body>


		<c:if test="${ !empty msg && msg.equals('success')}">
   		<script>
            swal.fire({
  title: '소식 작성 완료',
  html: '<br>사용해 주셔서 감사합니다. <br>좋은 하루 되세요.<br>',
  imageUrl: '${ contextPath }/resources/images/logo.png',
  imageWidth: 232,
  imageHeight: 90,
  imageAlt: 'Custom image',
}).then(function(){
	window.opener.location.reload();    //부모창 reload
	window.close();    //현재 팝업창 Close
});
   		
   		</script>
   		<c:remove var="msg" />
   </c:if>
   
   		<c:if test="${ !empty msg && msg.equals('fail')}">
   		<script>
            swal.fire({
  title: '소식 작성 실패',
  html: '<br>소식 작성에 실패하였습니다. <br>좋은 Good-buy가 될 수 있도록 노력하겠습니다.<br>',
  imageUrl: '${ contextPath }/resources/images/logo.png',
  imageWidth: 232,
  imageHeight: 90,
  imageAlt: 'Custom image',
}).then(function(){
	window.opener.location.reload();    //부모창 reload
	window.close();    //현재 팝업창 Close
});
   		
   		</script>
   		<c:remove var="msg" />
   </c:if>
			
        <form action="${ contextPath }/business/news/insert" method="post" id="insertForm" enctype="multipart/form-data">
    <table id="newsWrite">
        <tr >
            <td colspan="2" id="imgArea" colspan="2"><img id="newsThumbnail"src="${contextPath}/resources/images/business/소식발행 샘플.png" >
            <input id="newsPhoto" type="file" name="file" > 	
            </td>
        </tr>
        <tr>
            <td><h3>제목</h3></td>
        </tr>
        <tr>
            <td><input type="text" id="titleInput" name="newsTitle"placeholder="제목을 입력해 주세요." ></td>
        </tr>
        <tr>
            <td><h3>소식</h3></td>
        </tr>
        <tr>
            <td><textarea name="shopNews" id="newsInfo" style="resize: none;" placeholder="상품/서비스 소개, 새로운 메뉴, 이벤트 등 다양한 소식을 알려보세요."></textarea></td>
        </tr>
        <tr id="btnArea">
            <td><button id="finalBtn" type="submit">완료</button></td>
        </tr>
    </table>
    </form>
    
    <script>
    $("#newsThumbnail").click(function(){
    	   $("#newsPhoto").click();
       });
       $(function(){
					// input type="file" 태그에 파일이 첨부 될 때 동작하는 이벤트
					$("[type=file]").change(function(){
						loadImg(this);
					});
				});
				
				function loadImg(element){
					// element를 판별해서 알맞은 위치에 preview 표현하기
					// console.log(element.name);
					
					// input type="file" 엘리먼트에 첨부 파일 속성, 첨부파일이 잘 존재하는지 확인
					if(element.files && element.files[0]){
						// 파일을 읽어들일 FileReader 객체 생성
						var reader = new FileReader();
						
						// 파일 읽기가 다 완료 되었을 때 실행 되는 메소드
						reader.onload = function(e){
							
							var selector;
							var size;
							
							switch(element.name){
							case "file" :
								selector = "#newsThumbnail";
								size = {width:"486px", height:"200px" };
								break;
							
							};
							$(selector).attr("src", e.target.result).css(size);
							
							console.log(e);
							console.log(e.target);
							console.log(e.target.result);
						};
						
						// 파일 읽기 하는 메소드
						reader.readAsDataURL(element.files[0]);
					};
				};
				

			
    </script>
</body>
</html>