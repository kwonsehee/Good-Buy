<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Good-Buy</title>
</head>
<body>

	<div class="gray_back">
	
			<c:forEach var="f" items="${sellingList }">
				<div class="follow_div">
					
					<img src="${ contextPath }/resources/images/goodupload/${f.changeName }" class="goodsPhoto">
					
					<p>${f.gtitle }</p>
					<p> ${f.address_3 }&nbsp;${f.gprice}원</p>
					
					<button type="button" class="btn_sq" onclick="location.href='${ contextPath }/goods/detail?gno=${f.gno }'" >
						<p>&nbsp;상품 상세보기</p>
					</button>
					
				</div>
			</c:forEach>
</div>



	<script>
	  
    function follow_btn(following){
       
        
    	 var follow = "\'"+following+"\'";
        var btn="#btn_"+following;
        console.log(btn);
        console.log(follow);
       /* 	document.getElementById("btn_"+following).value=''; */
      	  
           $.ajax({
              url : "${contextPath}/member/follow",
              data : {seller : following},
              type : "post",
              success : function(data){
                 if(data == "success"){
               	  values ="<button type='button' class='btn_sq' onclick=\"unfollow_btn("+follow+")\"> " 
               		/*  +"<img src='${ contextPath }/resources/images/follower.png'>" */
                         +"<p>&nbsp;&nbsp;팔로우&nbsp;취소</p></button>"
                        
 						 
               	   $(btn).html(values);
               		swal.fire({
                 	  title: 'Follow',
                 	  html: '<br>'+follow+'님을 팔로우하였습니다.<br>판매자의 상품을 더욱더 빨리 만나보실 수 있습니다.<br>',
                 	  imageUrl: '${ contextPath }/resources/images/logo.png',
                 	  imageWidth: 232,
                 	  imageHeight: 90,
                 	  imageAlt: 'Custom image',
                 	}); 
                 }  
                 else{
                	 /* swal.fire({
                	   	  title: 'Follow',
                	   	  html: '<br>\'데세헤\' 님을 팔로우에 실패하였습니다.<br>이용에 불편을 드려서 죄송합니다.<br>',
                	   	  imageUrl: '${ contextPath }/resources/images/logo.png',
                	   	  imageWidth: 232,
                	   	  imageHeight: 90,
                	   	  imageAlt: 'Custom image',
                	   	}); */
                	 alert("follow 실패!");
                 }
                    
              },
              error : function(e){
                 alert("error code : " + e.status + "\n"
                       + "message : "+ e.responseText);
              }
           })
        }
    function unfollow_btn(following){
        
        
    	 var follow = "\'"+following+"\'";
         var btn="#btn_"+following;
         console.log(btn);
         console.log(follow);
       	/* document.getElementById(btn).value=''; */
      	  
           $.ajax({
              url : "${contextPath}/member/unfollow",
              data : {seller : following},
              type : "post",
              success : function(data){
                 if(data == "success"){
               	  values ="<button type='button' class='btn_sq' onclick=\"follow_btn("+follow+")\"> " 
               		  +"<img src='${ contextPath }/resources/images/follower.png'/>"
                         +"<p>&nbsp;&nbsp;&nbsp;팔로우</p></button>"
                        
 						 
               	   $(btn).html(values);
               		swal.fire({
                 	  title: 'Follow',
                 	  html: '<br>'+follow+'님을 팔로우를 취소하였습니다.<br>판매자의 상품을 더욱더 빨리 만나보실 수 있습니다.<br>',
                 	  imageUrl: '${ contextPath }/resources/images/logo.png',
                 	  imageWidth: 232,
                 	  imageHeight: 90,
                 	  imageAlt: 'Custom image',
                 	}); 
                 }  
                 else{
                	 /* swal.fire({
                	   	  title: 'Follow',
                	   	  html: '<br>\'데세헤\' 님을 팔로우에 실패하였습니다.<br>이용에 불편을 드려서 죄송합니다.<br>',
                	   	  imageUrl: '${ contextPath }/resources/images/logo.png',
                	   	  imageWidth: 232,
                	   	  imageHeight: 90,
                	   	  imageAlt: 'Custom image',
                	   	}); */
                	 alert("follow 실패!");
                 }
                    
              },
              error : function(e){
                 alert("error code : " + e.status + "\n"
                       + "message : "+ e.responseText);
              }
           })
        }
     
     
	
	
	
	</script>
</body>
</html>