<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신 근처의 굿-바이 마켓 Good-Buy!</title>


<link href="${contextPath }/resources/css/board/boardDetail.css"
	rel="stylesheet" type="text/css">

</head>
<body>
	<jsp:include page="../common/menubar.jsp" />

	<section id="gbSection">



		<div class="list">
			<div class="title2">동네생활</div>
			

					
			<div id="hearts">

				<button id="heartLike" class="heart" onclick="heartLike(${b.bno})">
					<img src="${contextPath }/resources/images/board/heart.png"
						style="width: 42px; height: 39px;">
				</button>

				<button id="heartCancel" class="heart"onclick="heartLikeCancel(${b.bno})" style="display: none;">
					<img src="${contextPath }/resources/images/board/redheart.png"
						style="width: 42px; height: 39px;">
				</button>

			<div class="heartstory">좋아요를 눌러주세요!"</div>
			</div>

				<ul>
					<li><p class="title">${b.btitle}</p></li>
				<li id="propil"> <img
					src="${ contextPath }/resources/images/userProfilePhoto/${b.bphoto}"
					class="Photo"></li>
					
					<li class="name" style="color: black; font-size: 18px;">${b.userid }</li>
					<li><div class="kind">
							<p class="subject">${b.bcatename}</p>
						</div></li>
					<li class="Date" style="font-size: 17px;">${b.bcreatedate}</li>
				</ul>



		
			<br>

			<div id="board">

				<img class="mainimg"
					src="${contextPath}/resources/images/boardupload/${b.bfile}"
					style="width: 800px; height: 470px;">
			</div>


			<div class="bcontent">
				<p>${b.bhistory}</p>
			</div>
				<!--  	<div id="pass">
					<a href="javascript:reportPopup()" id="police">신고하기</a></li>

					<a href="javascript:deletePopup()" id="mypass">게시글 삭제</a></li>
                         </div>-->

			<script>
function heartLike (bno){ 
	$.ajax({
		url:"${contextPath}/board/count",
		data:{bno:bno},
		type:"POST",
		success:function (data){
			console.log(data);
		 
			$("#heartLike").hide();
			$("#heartCancel").show();
		},
		error:function(e){
			console.log(e);
		}
		
	});
	
}
function heartLikeCancel(bno){
	$.ajax({
		url:"${contextPath}/board/countCancel",
		data:{bno:bno},
		type:"POST",
		success:function (data){
			console.log(data);
			$("#heartLike").show();
			$("#heartCancel").hide();
		},
		error:function(e){
			console.log(e);
		}
		
	});
	
}


</script>
		</div>

		<div id="replySection">
			<p style="color: #9a9999; padding: 10px 0 0 10px;">댓글</p>
			<table id="replyTable">

				<c:if test="${ !empty rlist }">
					<c:forEach var="r" items="${ rlist }">
						<tr>
							<td colspan="2">${r.user_id}
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${r.createDate }</td>

						</tr>
						<tr>
							<td style="width: 94%;">${r.rcontent }</td>
							<td style="width: 14%;"><c:if
									test="${ r.user_id.equals(loginUser.user_id) }">
									<span class="deleteReply" onclick="deletereplyBtn(${r.rno })">삭제</span>
								</c:if></td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${ empty rlist }">
					<tr>
						<td colspan="3">작성된 댓글이 없습니다.
					</tr>
				</c:if>


			</table>

			<div id="replyWrite">
				<input type="hidden" id="sessionloginuser"
					value='${loginUser.user_id }' />
				<c:if test="${ empty loginUser }">
					<textarea name="rcontent" placeholder="댓글을 작성하시려면 로그인을 해주세요"
						onclick="noUser()"></textarea>


				</c:if>
				
					<c:if test="${ !empty loginUser }">
						<p class="reply_left">${ loginUser.user_id }&nbsp;님</p>
						<textarea id="replyContent" name="rcontent"
							placeholder="댓글을 작성해주세요"></textarea>

					</c:if>

					<p id="counter" class="reply_left">(0 / 1000)</p>
					<input type="hidden" name="bno" value="${b.bno}">
					<button id="writeBtn">등록하기</button>
				
				<script>
					
						var imgs;
						var img_count;
						var img_position = 1;
						imgs = $(".slider ul");
						img_count = imgs.children().length;
						console.log(img_count);
						//button clickc
						$('#back').click(function(){
							if(1<img_position){
								imgs.animate({
									left : '+=400px'
								});
								img_position--;
							}
						});
						$('#next').click(function(){
							if(img_count>img_position){
								imgs.animate({
									left : '-=400px'
								});
								img_position++;
							}
						});
					
				
				</script>





				<script>
             
   $("#writeBtn").on("click", function(){
	   
	   var rcontent = $("#replyContent").val();
		var loginid = $("#sessionloginuser").val();
	   $.ajax({
		   url : "${contextPath}/board/insertReply",
		   data : {rcontent : rcontent},
		  type : "post",
		  dataType : "json",
		  success : function(data){
			  console.log(data);//해당 게시글에 작성된 댓글리스트 받아오기
			 //-> <tbody> 안에 data 의 댓글 리스트를 형식에 맞게 세팅 
			     
			  tableBody = $("#replyTable");
              tableBody.html("");
		
			  console.log(loginid);
              for(var i in data){
            	  var rno = data[i].rno;
            	  var user_id = data[i].user_id;
              	   var a = "<tr> <td colspan='2'>";
              	   a+=data[i].user_id;
              	   a+='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';

              	   a+=data[i].createDate;
              	   a+="</td></tr><tr><td style='width:94%;'>";
              	   a+=data[i].rcontent;
              	   if(user_id==loginid){
              		   
              	   		a+="</td><td style='width:14%;'><span class='deleteReply' onclick='deletereplyBtn("+rno+")'>삭제</span></td></tr>";
              	   }else{
              	   		a+="</td><td style='width:14%;'></td></tr>";
              		   
              	   }
              		  
              	 
              	   tableBody.append(a);
              	   
                 }
            
            //-> 댓글 작성 <textarea> 비워주기
			  $("#replyContent").val("b");
		  }
		  
	   });
   });
   function deletereplyBtn(rno){
	   console.log(rno);
	   var loginid = $("#sessionloginuser").val();
	   $.ajax({
		   url : "${contextPath}/board/deleteReply",
		   data : {rno : rno},
		  type : "post",
		  dataType : "json",
		  success : function(data){
			  console.log(data);//해당 게시글에 작성된 댓글리스트 받아오기
			 //-> <tbody> 안에 data 의 댓글 리스트를 형식에 맞게 세팅 
			     
			  tableBody = $("#replyTable");
              tableBody.html("");
              
              for(var i in data){
            	  var rno = data[i].rno;
            	  var user_id = data[i].user_id;
              	   var a = "<tr> <td colspan='2'>";
              	   a+=data[i].user_id;
              	   a+='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';

              	   a+=data[i].createDate;
              	   a+="</td></tr><tr><td style='width:94%;'>";
              	   a+=data[i].rcontent;
              	   if(user_id==loginid){
              		   
              	   		a+="</td><td style='width:14%;'><span class='deleteReply' onclick='deletereplyBtn("+rno+")'>삭제</span></td></tr>";
              	   }else{
              	   		a+="</td><td style='width:14%;'></td></tr>";
              		   
              	   }
              		  
              	 
              	   tableBody.append(a);
              	   
                 }
            
            //-> 댓글 작성 <textarea> 비워주기
			  $("#replyContent").val("");
		  }
		  
	   });
   }
   
   </script>
			</div>

		</div>



	</section>



	<jsp:include page="../common/footer.jsp" />


</body>
</html>