<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Good-Buy</title>
<!--sweetalert2-->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<link href="${ contextPath }/resources/css/goods/goodsinsert.css" rel="stylesheet" type="text/css">

<style>
.gcate input[type="button"]{
	outline:0;
	cursor :pointer;
	background-color:white;
}

</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
  
   <section id="gbSection">
        <p id="pg_title">상품등록</p>
  	  <form action="${ contextPath }/goods/insert" method="post" name="myForm" enctype="multipart/form-data">
	
        <table id="insert_goods">
            <tr>
                <th>
                    제목
                </th>
                <td colspan="3">
                    <input type="text" id="gtitle"name="gtitle" placeholder="상품 제목을 입력해주세요." required>
                </td>
            </tr>
            <tr>
                <th>
                    카테고리
                </th>
                <td class="gcate lg_color" >
                <div style="overflow:scroll; height:300px;">
                      <ul>
                      <c:forEach var="a" items="${list }">
                      	<li><button type="button" class="cate_lg" value="${ a.topcate }" onclick="cate_lg_btn(this);">${ a.topcate }</button></li>
                     </c:forEach>
                      </ul>
                      </div>
                </td>
                
                <td class="gcate md_color">
                
                <div id="cate_md" style="overflow:scroll; height:300px;" >
              		<c:forEach var="a" items="${list }">
              		
                    <ul id="cate_lg_ul${ a.topcate }">
                   		<c:forEach var="b" items="${a.subcate }">
                      		<li><button type="button" class="cate_md" value="${ b.topcate }" onclick="cate_md_btn(this);">${ b.topcate }</button></li>
                      	</c:forEach>
                      </ul>
                   </c:forEach>
                    
                    </div>
                </td>
                <td class="gcate sm_color">
                	<div id="cate_sm" style="overflow:scroll; height:300px;" >
                	<c:forEach var="a" items="${list }">
                   		<c:forEach var="b" items="${a.subcate }">
                   		<ul id="cate_md_ul${ a.topcate }${ b.topcate }">
                   			<c:forEach var="c" items="${b.subcate }">
                      		<li><button type="button" class="cate_sm" value="${ c.topcate }" onclick="cate_sm_btn(this);">${ c.topcate }</button></li>
                      		</c:forEach>
                      	</ul>
                      	</c:forEach>
                   </c:forEach>
                    
                    </div>
                   
                </td>
            </tr>
        	<tr>
        		<th>선택한 카테고리</th>
        		<td>
        		<div  style="margin-top : 10px; margin-bottom:10px;">
        			<span id="selectedCate1" ></span><span id="nbsp1"></span>
        			<span id="selectedCate2" > </span><span id="nbsp2"></span>
        			<span id="selectedCate3" ></span>
        		</div>
        		</td>
        	</tr>
            <tr>
                <th>
                    거래지역
                </th>
                <td colspan="3">
                    <select id="deal_town" name="gplace" required>
                        <option disabled selected value="">내 동네 선택</option>
                        <option value="1">${townInfo.address_1 } &nbsp;${townInfo.address_2 } &nbsp;${townInfo.address_3 } </option>
                        <c:if test="${ !empty secondTown}">
                        <option value="2">${secondTown.address_1 }&nbsp;${secondTown.address_2 }&nbsp;${secondTown.address_3 }</option>
						</c:if>
                        <option value="0">직거래 불가</option>
                    </select>
                </td>
            </tr>
            
            <tr>
                <th>
                    가격
                </th>
                <td colspan="3">
                    <input type="text" placeholder="가격을 입력해주세요." id="gprice"name="gprice" required>
                </td>
            </tr>
            <tr>
                <th>
                    상품 상태
                </th>
                <td colspan="3" id="godds_condition">
                    <div><label for="미개봉">미개봉&nbsp;</label><input type="checkbox" value="미개봉"name="gcondition"onclick="oneCheckbox(this)" > </div>
                    <div><label for="거의 새것">거의 새것&nbsp;</label><input type="checkbox" value="거의 새것"name="gcondition"onclick="oneCheckbox(this)"> </div>
                    <div><label for="사용감있음">사용감있음&nbsp;</label><input type="checkbox" value="사용감있음"name="gcondition"onclick="oneCheckbox(this)" > </div>
                </td>
            </tr>
           
            <tr>
                <th>
                    설명
                </th>
                <td colspan="3">
                    <textarea style="resize: none;" id="gcontent" placeholder="상품 설명을 입력해주세요" name="gcomment" required></textarea><br>
                    <span style="margin-left:85%;">0/1000</span>
                </td>
            </tr>
            <tr>
                <th>
                    이미지
                </th>
               <td colspan="3">
                	<p>*가장 앞에 있는 사진은 중고상품 리스트에서 보여질 사진입니다.</p>
                <%--	 <div id="imginput" style="border : 1px solid red;" class="dropzone-area"> 
                	 <div id="preview" style="border : 1px solid red;">
                	<%--  <label for="btn_upload">
                   	 <img  src="${ contextPath }/resources/images/insertimg.png" style="width: 150px;height: 150px;"/>
                   	 </label>
                   	 <div id="preview">
                   	 
                   	 </div> 
                     <button type="button" id="addItemBtn" onclick="uploadFile()" > <img  src="${ contextPath }/resources/images/insertimg.png" style="width: 150px;height: 150px;"/></button>
                    </div>
					
              		<button type="button" id='button-add-file' > <img  src="${ contextPath }/resources/images/insertimg.png" /></button>
          			 --%>
          			 <!-- 대표사진 -->
    
    
	<div id="photo_area" >
		<div id="photo_input1">
		<img src='${ contextPath }/resources/images/insertimg.png' class="photo_img" onclick="document.getElementById('file1').click();"> 
		<input type="file" id="file1" name="fileup" style="display:none;"onchange="setThumbnail(event, 1);" >
	
		</div>
		
	</div>
	
                   
                </td>
            </tr>


        </table>
        <script>
      
      function setThumbnail(event, num) { 
        var cnt = $("#photo_area").children().length;
        console.log(cnt);
        if(cnt<=5){
        	var num2 = num+1;
        	var reader = new FileReader(); 
        	reader.onload = function(event) { 
        	var img = document.createElement("img"); 
        	img.setAttribute("src", event.target.result); 
        	$(".photo_img").remove();
        	document.querySelector("div#photo_input"+num).append(img);
        	$("#photo_input"+num).append("<button class='button-delete-file'>X</button>");
        		
        	var a = "<div id='photo_input"+num2+"'><img src='${ contextPath }/resources/images/insertimg.png' class='photo_img' onclick='imgclick("+num2+");'>" 
        	+"<input type='file' id='file"+num2+"' name='fileup' style='display:none;' onchange='setThumbnail(event, "+num2+");' ></div>";
        	/* img2.append(a); */
        	$("#photo_area").append(a);
        		
        	}; 
        	reader.readAsDataURL(event.target.files[0]);
        }
        else{
        	  swal.fire({
        		  title: '첨부파일',
        		  html: '<br>첨부파일은 최대 5장 설정 가능합니다.<br>추가하고 싶은 사진이 있다면 기존파일을 삭제하세요.<br>',
        		  imageUrl: '${ contextPath }/resources/images/logo.png',
        		  imageWidth: 232,
        		  imageHeight: 90,
        		  imageAlt: 'Custom image',
        		});
        	}
        }
        function imgclick(name){
        	document.getElementById('file'+name).click();
        }
      
   </script>
<script>
$(function(){
	$('#button-add-file').click(addFileForm);
	$(document).on('click', '.button-delete-file', function(event) {
		$(this).parent().remove();
	});
});
var count = 0;
function addFileForm() {
	var html = "<div class='preview'>";
	html += "<input type='file' name='fileup'>";
	html += "<button class='button-delete-file'>삭제</button></div>";
	count++;
	$("#preview").append(html);
}

</script>
			<script>
			var lg;
			var md;
			var sm;
                function cate_lg_btn(num){
                	  $("#cate_md ul").css("display","none");
                	  $("#cate_sm ul").css("display","none");
                   	  $("#cate_lg_ul"+num.value).toggle();
                   	  $(".lg_color .cate_lg").removeAttr("style");
                   	  $(".md_color .cate_md").removeAttr("style");
                   	  $(num).css("color","#05AAD1");
                   	  lg=num.value;
                   	document.getElementById('selectedCate1').innerHTML="";
                   	document.getElementById('selectedCate2').innerHTML="";
                   	document.getElementById('selectedCate3').innerHTML="";
                	document.getElementById('nbsp1').innerHTML="";
                   	document.getElementById('nbsp2').innerHTML="";
                   	
                   	document.getElementById('selectedCate1').innerHTML=lg+"<input type='hidden' name='lfilter' value='"+lg+"'>";
                   	
                   
                   	

                }
                function cate_md_btn(num){
        			md=num.value;                	
                	console.log(num);
        			
              	  $("#cate_sm ul").css("display","none");
                  $("#cate_md_ul"+lg+md).toggle();
                  $(".md_color .cate_md").removeAttr("style");
                  $(num).css("color","#05AAD1");
              	document.getElementById('selectedCate2').innerHTML="";
               	document.getElementById('selectedCate3').innerHTML="";

               	document.getElementById('nbsp2').innerHTML="";
            	document.getElementById('nbsp1').innerHTML="&nbsp;&nbsp;->&nbsp;";
               	document.getElementById('selectedCate2').innerHTML=md+"<input type='hidden' name='mfilter' value='"+md+"'>";;
              }
               function cate_sm_btn(num){
            	   sm=num.value;
                  $(".sm_color .cate_sm").removeAttr("style");
                  $(num).css("color","#05AAD1");
 				document.getElementById('selectedCate3').innerHTML="";
 				document.getElementById('nbsp2').innerHTML="&nbsp;&nbsp;->&nbsp;";
               	document.getElementById('selectedCate3').innerHTML=sm+"<input type='hidden' name='sfilter' value='"+sm+"' >";
              }
		
        </script>

        <button type="reset" id="greset" >취소</button>
        <button type="submit" id="gsubmit" >등록하기</button>
    </form>
    </section>
<script>

      function oneCheckbox(a){
        var obj = document.getElementsByName("gcondition");

        for(var i=0; i<obj.length; i++){
            if(obj[i] != a){
            obj[i].checked = false;
            }
        }
}
   
      </script>
      
      	<jsp:include page="../common/footer.jsp"/>
</body>
</html>