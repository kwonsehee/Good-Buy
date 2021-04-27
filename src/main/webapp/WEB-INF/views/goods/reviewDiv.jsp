<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
      <table id="review_tb">
                <tr>
                    <td rowspan="2" style=" width : 130px; height: 130px; padding-left: 20px;"><img src="${ contextPath }/resources/images/person.png"></td>
                
                    <td><span>삼산경찰서</span>&nbsp;<span>2021.03.09</span></td>
                    <td class="reviewStar">★ ★ ★ ★ ★</td>
                </tr> 
                <tr>
                    <td colspan="2">딱 사진 그대로구요! 착한 가격에 아들 웃게해줬네요~^^딱 사진 그대로구요! 착한 가격에 아들 웃게해줬네요~^^딱 사진 그대로구요! 착한 가격에 아들 웃게해줬네요~^^딱 사진 그대로구요! 착한 가격에 아들 웃게해줬네요~^^딱 사진 그대로구요! 착한 가격에 아들 웃게해줬네요~^^딱 사진 그대로구요! 착한 가격에 아들 웃게해줬네요~^^</td>
                </tr>        
                <tr>
                    <td rowspan="2" style=" width : 130px; height: 130px; padding-left: 20px;"><img src="${ contextPath }/resources/images/person.png"></td>
                
                    <td><span>삼산경찰서</span>&nbsp;<span>2021.03.09</span></td>
                    <td class="reviewStar">★ ★ ★ ★ ★</td>
                </tr> 
                <tr>
                    <td colspan="2">딱 사진 그대로구요! 착한 가격에 아들 웃게해줬네요~^^딱 사진 그대로구요! 착한 가격에 아들 웃게해줬네요~^^딱 사진 그대로구요! 착한 가격에 아들 웃게해줬네요~^^딱 사진 그대로구요! 착한 가격에 아들 웃게해줬네요~^^딱 사진 그대로구요! 착한 가격에 아들 웃게해줬네요~^^딱 사진 그대로구요! 착한 가격에 아들 웃게해줬네요~^^</td>
                </tr>        
                <tr>
                    <td rowspan="2" style=" width : 130px; height: 130px; padding-left: 20px;"><img src="${ contextPath }/resources/images/person.png"></td>
                
                    <td><span>삼산경찰서</span>&nbsp;<span>2021.03.09</span></td>
                    <td class="reviewStar">★ ★ ★ ★ ★</td>
                </tr> 
                <tr>
                    <td colspan="2">딱 사진 그대로구요! 착한 가격에 아들 웃게해줬네요~^^딱 사진 그대로구요! 착한 가격에 아들 웃게해줬네요~^^딱 사진 그대로구요! 착한 가격에 아들 웃게해줬네요~^^딱 사진 그대로구요! 착한 가격에 아들 웃게해줬네요~^^딱 사진 그대로구요! 착한 가격에 아들 웃게해줬네요~^^딱 사진 그대로구요! 착한 가격에 아들 웃게해줬네요~^^</td>
                </tr>        
                <tr>
                    <td rowspan="2" style=" width : 130px; height: 130px; padding-left: 20px;"><img src="${ contextPath }/resources/images/person.png"></td>
                
                    <td><span>삼산경찰서</span>&nbsp;<span>2021.03.09</span></td>
                    <td class="reviewStar">★ ★ ★ ★ ★</td>
                </tr> 
                <tr>
                    <td colspan="2">딱 사진 그대로구요! 착한 가격에 아들 웃게해줬네요~^^딱 사진 그대로구요! 착한 가격에 아들 웃게해줬네요~^^딱 사진 그대로구요! 착한 가격에 아들 웃게해줬네요~^^딱 사진 그대로구요! 착한 가격에 아들 웃게해줬네요~^^딱 사진 그대로구요! 착한 가격에 아들 웃게해줬네요~^^딱 사진 그대로구요! 착한 가격에 아들 웃게해줬네요~^^</td>
                </tr>                 
            </table>
       
		

		
        <form method="POST">
           
            <div id="reviewwrite">
                <span id="star" style="padding-left: 10%;">
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
            
			<textarea id="reviewWriteArea" placeholder="거래 후기를 작성해 주세요."></textarea>
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