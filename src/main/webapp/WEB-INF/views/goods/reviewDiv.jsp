<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
      <table id="review_tb">
      <c:forEach var="r" items="${ reList}">
                <tr>
                    <td rowspan="2" style=" width : 130px; height: 130px; padding-left: 20px;">
                    <c:if test="${r.photo eq null }">
                    <img src="${ contextPath }/resources/images/person.png">
                	</c:if>
                	<c:if test="${r.photo ne null }">
                    <img src="${ contextPath }/resources/images/userProfilePhoto/${r.photo}">
                	</c:if>
                	</td>
                    <td><span>${r.nickName}</span>&nbsp;<span>${r.reviewDate }</span></td>
                    <td class="reviewStar">★ ★ ★ ★ ★</td>
                </tr> 
                <tr>
                    <td colspan="2">${r.content }</td>
                </tr>        
      </c:forEach>       
                 
            </table>
       
		

		
        <form method="POST" >
           <input type="hidden" name="user_id" value="${ seller.user_id } "/>
            <div id="reviewwrite">
                <span id="star" style="padding-left: 10%;" name="grade">
                    <a value="1" style="padding-right: 0;">★</a> 
                    <a  value="2" style="padding-right: 0;">★</a> 
                    <a  value="3" style="padding-right: 0;">★</a> 
                    <a  value="4" style="padding-right: 0;">★</a>
                    <a value="5" style="padding-right: 0;">★</a>
                </span>
                <br>
            <div id="review_writer">
             <img src="${ contextPath }/resources/images/person.png" ><br>
             <span>데세헤</span> 
            </div>
            
			<textarea id="reviewWriteArea" name="content" placeholder="거래 후기를 작성해 주세요."></textarea>
			<span id="counter" style="padding-left: 10%;">0 / 1000</span>
            <button type="submit" id="writeBtn">등록하기</button>
        
		</div>
        </form>
		<!--  글자수 실시간 카운팅 -->
		<script>
		$('#reviewWriteArea').keyup(function (e){
		    var content = $(this).val();
		    $('#counter').html("("+content.length+" / 1000)");   
		    
		    if(content.length > 1000){
		    	alert('최대 1000자까지 입력 가능합니다.');
		    	$(this).val(content.substring(0, 1000));
		    	$('#counter').html("(1000 / 1000)");
		    	
		    }
		 });
		  // 별 색 채워짐 이벤트
          $('#star a').click(function(){ 
            $(this).parent().children("a").removeClass("on"); 
            $(this).addClass("on").prevAll("a").addClass("on"); 
            console.log($(this).attr("value")); 
            star = $(this).attr("value");
        });   
		</script>

</body>
</html>