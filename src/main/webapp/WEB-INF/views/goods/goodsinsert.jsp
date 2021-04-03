<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Good-Buy</title>

<link href="${ contextPath }/resources/css/goods/goodsinsert.css" rel="stylesheet" type="text/css">

</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
  
   <section id="gbSection">
        <p id="pg_title">상품등록</p>
        <form>
        <table id="insert_goods">
            <tr>
                <th>
                    제목
                </th>
                <td colspan="3">
                    <input type="text" id="gtitle"placeholder="상품 제목을 입력해주세요.">
                </td>
            </tr>
            <tr>
                <th>
                    카테고리
                </th>
                <td>
                    <div class="gcate">
                        의류<br>
                        의류<br>
                        의류<br>
                        의류<br>
                        의류<br>
                        의류<br>
                        의류<br>
                    </div>
                </td>
                <td>
                    <div class="gcate">
                        의류<br>
                        의류<br>
                        의류<br>
                        의류<br>
                        의류<br>
                        의류<br>
                        의류<br>
                    </div>
                </td>
                <td>
                    <div class="gcate">  
                        의류<br>
                        의류<br>
                        의류<br>
                        의류<br>
                        의류<br>
                        의류<br>
                        의류<br>
                    </div>
                </td>
            </tr>
            <tr>
                <th>
                    거래지역
                </th>
                <td colspan="3">
                    <select id="deal_town">
                        <option disabled selected value="">내 동네 선택</option>
                        <option>내 동네1</option>
                        <option>내 동네2</option>
                        <option>직거래 불가</option>
                    </select>
                </td>
            </tr>
            
            <tr>
                <th>
                    가격
                </th>
                <td colspan="3">
                    <input type="text" placeholder="가격을 입력해주세요." id="gprice">
                </td>
            </tr>
            <tr>
                <th>
                    상품 상태
                </th>
                <td colspan="3" id="godds_condition">
                    <div><label for="미개봉">미개봉&nbsp;</label><input type="checkbox" id="미개봉"name="checkbox1"onclick="oneCheckbox(this)"> </div>
                    <div><label for="거의 새것">거의 새것&nbsp;</label><input type="checkbox" id="거의 새것"name="checkbox1"onclick="oneCheckbox(this)"> </div>
                    <div><label for="사용감있음">사용감있음&nbsp;</label><input type="checkbox" id="사용감있음"name="checkbox1"onclick="oneCheckbox(this)" > </div>
                </td>
            </tr>
           
            <tr>
                <th>
                    설명
                </th>
                <td colspan="3">
                    <textarea style="resize: none;" id="gcontent" placeholder="상품 설명을 입력해주세요"></textarea><br>
                    <span style="margin-left:85%;">0/1000</span>
                </td>
            </tr>
            <tr>
                <th>
                    이미지
                </th>
                <td colspan="3">
                    <div id="imginput">
                    <input type="image" src="${ contextPath }/resources/images/insertimg.png" style="width: 150px;height: 150px;">
                    </div>
                </td>
            </tr>


        </table>
        <button type="reset" id="greset" onclick="${ contextPath }/goods/list">취소</button>
        <button type="submit" id="gsubmit" >등록하기</button>
    </form>
    </section>
<script>
      function oneCheckbox(a){
        var obj = document.getElementsByName("checkbox1");

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