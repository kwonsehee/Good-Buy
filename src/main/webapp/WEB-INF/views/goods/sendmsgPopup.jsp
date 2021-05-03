<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 메뉴바는 어떤 페이지이든 포함하고 있으므로 contextPath 변수 선언 후 application에서 모두 사용 -->
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Good-Buy</title>
<!--sweetalert2-->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<style type="text/css">
#sendMsg_tb,#sendMsg_tb tr, #sendMsg_tb td , #sendMsg_tb th{
    border-collapse:collapse;
    
  }
  #sendMsg_tb{
      margin: auto;
      width: 100%;
      height: 100%;
  }
  
  #sendMsg_tb p{
      opacity: 0.95;
    font-size: 25px;
    font-weight: bold;
  }
  #sendMsg_tb tr:nth-child(1){
    background-color: #f9f9f9;
  }
  #sendMsg_tb tr:nth-child(3){
      font-size: 14px;
      color:#555353;
      font-weight: lighter;
  }
  #sendMsg_tb textarea{
    width: 100%;
    height: 250px;
   font-size: 16px;
  resize: none;
 margin-bottom: 30px;
  background-color: #f9f9f9;
  border: 0px;
  }
  #greset{
        
      width: 171px;
        height: 47px;
        border-radius: 27px;
        font-size: 16px;
        border: solid 1px #000000;
        background-color: #ffffff;
        font-size: 16px;
        font-weight: bold;
      }
      #gsubmit{
     
        width: 160px;
        height: 40px;
        border-radius: 27px;
        font-size: 16px;
        background-color: #000000;
        border: 0px;
      color : white;
      font-size: 16px;
      font-weight: bold;
      }

      .titleWrap{
        margin-top:30px;
        text-align: center;
        height: 30px;;
    }
    .circle{
        display:inline-block;
        width:15px;
        height:15px;
        background: #05AAD1;
        border-radius: 50px;   
        margin-top:7px;
    }
    .circle:nth-child(1){margin-right:10px;}
    .circle:nth-child(3){margin-left:10px;}

    .sendMSG{font-size:18px;font-weight: bold;}
.photo_circle{
width : 40px;
height : 40px;
margin-left: 180%;
    border-radius: 100px;
}
  
</style>
</head>
<body>

 <!-- 메세지가 있다면 출력하고 지우기 -->
   <c:if test="${ !empty msg && msg.equals('success')}">
   		<script>
            swal.fire({
  title: '메세지 전송 성공',
  html: '<br>메세지가 판매자에게 전달되었습니다.<br>답장이 도착하면 알림으로 알려드리겠습니다.<br>',
  imageUrl: '${ contextPath }/resources/images/logo.png',
  imageWidth: 232,
  imageHeight: 90,
  imageAlt: 'Custom image',
}).then(function(){
	window.close();
});
   		</script>
   		<c:remove var="msg" />
   		
   </c:if>
     <c:if test="${ !empty msg && msg.equals('fail')}">
   		<script>
            swal.fire({
  title: '메세지 전송 실패',
  html: '<br>사용에 불편을 드려서 죄송합니다. <br>좋은 Good-buy가 될 수 있도록 노력하겠습니다.<br>',
  imageUrl: '${ contextPath }/resources/images/logo.png',
  imageWidth: 232,
  imageHeight: 90,
  imageAlt: 'Custom image',
}).then(function(){
	window.close();
});		
   		
   		</script>
   		<c:remove var="msg" />
   </c:if>
   <div class="titleWrap">
        <span class="circle"></span>
        <span class="sendMSG">Send Message</span>
        <span class="circle"></span>
    </div>
  <form method="POST" action="${ contextPath }/msg/goodsinsert">
    <table id="sendMsg_tb">
        <tr style="height: 80px;">
            <th>
            	<c:if test="${ !empty sellerPhoto }">
                <img src="${ contextPath }/resources/images/userProfilePhoto/${ sellerPhoto }" class="photo_circle"> 
               </c:if>
            	<c:if test="${ empty sellerPhoto }">
                <img src="${ contextPath }/resources/images/user.png"class="photo_circle"> 
               </c:if>
            </th>
            <th><span  style="margin-left:-20%;">${ sellername }</span></th>
        </tr>
        <tr>
            <td rowspan="2" style="width: 100px;">
             <img src="${ contextPath }/resources/images/goodupload/${g.filelist[0]}"width="100px"></td>
            <td>${ g.gtitle}</td>
        </tr>
        <tr>
            <td>${ g.gprice }원</td>
        </tr>

        <tr>
            <td colspan="2"><textarea name="mcontent"></textarea></td>
        </tr>
        <tr>
        <th  colspan="2"><button type="submit" id="gsubmit" >보내기</button></th>    
        </tr>
    </table>
	</form>
</body>
</html>