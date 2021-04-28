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
                    <td><span>${r.nickName}</span>&nbsp;<span>${r.reviewDate }</span>&nbsp;
                    <c:if test="${r.userId eq loginUser.user_id }">
                    <a onclick="deleteReivew(${r.reviewNo})">삭제</a>
                    </c:if>
                    </td>
                    <td class="reviewStar">
                    <c:if test="${r.grade==5 }">
                    ★ ★ ★ ★ ★
                    </c:if>
                    <c:if test="${r.grade==4 }">
                    ★ ★ ★ ★ 
                    </c:if>
                    <c:if test="${r.grade==3 }">
                    ★ ★ ★
                    </c:if>
                    <c:if test="${r.grade==2 }">
                    ★ ★ 
                    </c:if>
                    <c:if test="${r.grade==1 }">
                    ★ 
                    </c:if>
                    
                    </td>
                </tr> 
                <tr>
                    <td colspan="2">${r.content }</td>
                </tr>        
      </c:forEach>       
                 
        </table>
       
		

		
         <input type="hidden" id="sessionloginuser" value='${loginUser.user_id }'/>`
           <input type="hidden" id="seller_id" value="${ seller.user_id } "/>
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
             <span>${loginUser.nickname}</span> 
            </div>
            
			<textarea id="reviewWriteArea" name="content" placeholder="거래 후기를 작성해 주세요."></textarea>
			<span id="counter" style="padding-left: 10%;">0 / 1000</span>
            <button id="writeBtn">등록하기</button>
        
		</div>
       
		
		<script>
		// 글자수 실시간 카운팅
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
            /* console.log($(this).attr("value"));  */
            star = $(this).attr("value");
        });   
		  </script>
		  <script> 
          
          $("#writeBtn").on("click",function(){
        	  var content = $("#reviewWriteArea").val();
        	  var seller = $("#seller_id").text();
        	 
      		
        	  console.log("content : " + content);
        	  console.log("seller : " + seller);
        	  console.log("star : " + star);
        	  var reviewArea = $("#review_tb");
    		  reviewArea.html("");
    	
    		  $('#star a').parent().children("a").removeClass("on"); 
              
    		  $("#reviewWriteArea").val("");
        	  $.ajax({
        		 url : "${ contextPath }/goods/reviewInsert" ,
        		 data : {content : content , userId : seller, grade : star},
        		 type : "post",
        		 contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        		 dataType : "json",
        		 success : function(data){
        		console.log(data);

        		 var loginid = $("#sessionloginuser").val();
        		 console.log("loginUser : "+loginid);
        		for(var i in data){
        		   var photo = data[i].photo;
        		   var grade = data[i].grade;
        		   var userId = data[i].userId;
        		     var a= "<tr><td rowspan='2' style='width:130px; height :130px; padding-left:20px;'>";
        			 
        			 if( photo !=null){
						a+="<img src ='${contextPath}/resources/images/userProfilePhoto/";
						a+=photo;
						a+="'>";
        			 }else if(photo == null){
        				 a+="<img src ='${contextPath}/resources/images/person.png'></td>";
 					}
        			 a+="<td><span>";
        			 a+=data[i].nickName;
        			 a+="</span>&nbsp;<span>";
        			 a+=data[i].reviewDate;
        			 a+="</span>&nbsp;";
        			 if(userId==loginid ){
        				 console.log("리뷰번호 : "+data[i].reviewNo);
                     	a+="<a onclick='deleteReivew(";
                     	a+=data[i].reviewNo;
                     	a+=")'>삭제</a>";
        				 
        			 }
           
        			 a+="</td><td class='reviewStar'>";
        			 if(grade==5){
        				 console.log("grade : "+grade);
        				 a+="★ ★ ★ ★ ★";
        			 }else if(grade==4){
        				 console.log("grade : "+grade);
        				 a+="★ ★ ★ ★";
        			 }else if(grade==3){
        				 console.log("grade : "+grade);
        				 a+="★ ★ ★";
        			 }else if(grade==2){
        				 console.log("grade : "+grade);
        				 a+="★ ★";
        			 }else if(grade==1){
        				 console.log("grade : "+grade);
        				 a+="★";
        			 }
        			 
        				a+="</td></tr><tr><td colspan='2'>";
        				a+=data[i].content;
        				a+="</td></tr>";
        			 reviewArea.append(a); 

        			 
        			 } 
        			 
    				
        			 
        		 },
        		 error : function(e){
        			 alert("리뷰등록 실패!");
        		 }
        		 
        	  });
          }); 
          
          function deleteReivew(num){
        	 
        	  var seller = $("#seller_id").text();
        	  var reviewArea = $("#review_tb");
    		  reviewArea.html("");
    		  
    		  $("#reviewWriteArea").val("");
        	  $.ajax({
        		 url : "${ contextPath }/goods/reviewDelete" ,
        		 data : {rno : num, seller : seller},
        		 type : "post",
        		 contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        		 dataType : "json",
        		 success : function(data){
        		console.log(data);

        		 var loginid = $("#sessionloginuser").val();
        		 console.log("loginUser : "+loginid);
        		for(var i in data){
        		   var photo = data[i].photo;
        		   var grade = data[i].grade;
        		   var userId = data[i].userId;
        		     var a= "<tr><td rowspan='2' style='width:130px; height :130px; padding-left:20px;'>";
        			 
        			 if( photo !=null){
						a+="<img src ='${contextPath}/resources/images/userProfilePhoto/";
						a+=photo;
						a+="'>";
        			 }else if(photo == null){
        				 a+="<img src ='${contextPath}/resources/images/person.png'></td>";
 					}
        			 a+="<td><span>";
        			 a+=data[i].nickName;
        			 a+="</span>&nbsp;<span>";
        			 a+=data[i].reviewDate;
        			 a+="</span>&nbsp;";
        			 if(userId==loginid ){
        				 console.log("리뷰번호 : "+data[i].reviewNo);
                     	a+="<a onclick='deleteReivew(";
                     	a+=data[i].reviewNo;
                     	a+=")'>삭제</a>";
        				 
        			 }
           
        			 a+="</td><td class='reviewStar'>";
        			 if(grade==5){
        				 console.log("grade : "+grade);
        				 a+="★ ★ ★ ★ ★";
        			 }else if(grade==4){
        				 console.log("grade : "+grade);
        				 a+="★ ★ ★ ★";
        			 }else if(grade==3){
        				 console.log("grade : "+grade);
        				 a+="★ ★ ★";
        			 }else if(grade==2){
        				 console.log("grade : "+grade);
        				 a+="★ ★";
        			 }else if(grade==1){
        				 console.log("grade : "+grade);
        				 a+="★";
        			 }
        			 
        				a+="</td></tr><tr><td colspan='2'>";
        				a+=data[i].content;
        				a+="</td></tr>";
        			 reviewArea.append(a); 

        			 
        			 } 
        			 
    				
        			 
        		 },
        		 error : function(e){
        			 alert("리뷰등록 실패!");
        		 }
        		 
        	  });
          } 
         
        </script>
		

</body>
</html>