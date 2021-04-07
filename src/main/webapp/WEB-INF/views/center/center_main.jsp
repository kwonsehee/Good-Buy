<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!-- 공통 UI -->
    <link href="${ contextPath }/resources/css/admin/admin_membercenter.css?" rel="stylesheet" type="text/css">
  <style>
      
  </style>
</head>
<body>
    <jsp:include page="../common/menubar.jsp" />

    <section id="gbSection">


        <div id="div1">
            <h1 id="head1"><a href="${ contextPath }/center/join">고객센터</a></h1>
        </div>


        <div id="div2">
            
            <button id="button1"><a id="a1" href="${ contextPath }/center/join">공지사항</a></button>
            <button id="button1"><a id="a2" href="${ contextPath }/center/FAQ">FAQ</a></button>
            <button id="button1"><a id="a3" href="${ contextPath }/center/QNA">문의</a></button>
        </div>


        




        <div id="div4">
            

                
              <ul class="mylist">
                <li class="menu">
                    <a style="font-size: 30px; font-weight: bolder;">믿을 수 있는 중고거래 굿바이 중고거래 공지사항입니다<img src="${ contextPath }/resources/images/admin//내리기.PNG" style="float:right; width: 35px;"></a>
                    <ul class="hide">
                        <li style="font-size: 15px; border-bottom: 1px solid white; border-top: 1px solid white; color: gray"><img src="images/공지사항그냥.jpg"></li>
                        <li style="font-size: 15px; border-bottom: 1px solid white; border-top: 1px solid white;">안녕하세요 굿바이 중고거래입니다. 잘부탁드립니다</li>
                        <li style="font-size: 15px; border-bottom: 1px solid white; border-top: 1px solid white; color: gray">2021/03/27</li>
                    </ul>
                </li>
              </ul>
           
            
            <ul class="mylist">
                <li class="menu">
                    <a style="font-size: 30px; font-weight: bolder;">그만큼 기분이 좋은 공지사항 입니다<img src="${ contextPath }/resources/images/admin//내리기.PNG" style="float:right; width: 35px;"></a>
                    <ul class="hide">
                        <li style="font-size: 15px; border-bottom: 1px solid white; border-top: 1px solid white;">행복한 중고거래가 되도록 노력하는 굿바이가 되겠습니다</li>
                        <li style="font-size: 15px; border-bottom: 1px solid white; border-top: 1px solid white; color: gray">2021/03/26</li>
                    </ul>
                </li>
            </ul>

            <ul class="mylist">
                <li class="menu">
                    <a style="font-size: 30px; font-weight: bolder;">공지사항 세번째<img src="${ contextPath }/resources/images/admin//내리기.PNG" style="float:right; width: 35px;"></a>
                    <ul class="hide">
                        <li style="font-size: 15px; border-bottom: 1px solid white; border-top: 1px solid white;">공지사항 설명 세번째</li>
                        <li style="font-size: 15px; border-bottom: 1px solid white; border-top: 1px solid white; color: gray">2021/03/25</li>
                    </ul>
                </li>
            </ul>
			<c:forEach var="n" items="${ list }">
               
               <ul class="mylist">
                <li class="menu">
                    <a style="font-size: 30px; font-weight: bolder;">${ n.nt_title }<img src="${ contextPath }/resources/images/admin//내리기.PNG" style="float:right; width: 35px;"></a>
                    <ul class="hide">
                        <li style="font-size: 15px; border-bottom: 1px solid white; border-top: 1px solid white;">${ n.nt_content }</li>
                        <li style="font-size: 15px; border-bottom: 1px solid white; border-top: 1px solid white; color: gray">${ n.nt_create_date }</li>
                    </ul>
                </li>
            </ul>
            </c:forEach>
            
            
        </div>


                
                
                
                

        
    </section>

    


     <script>
    $(document).ready(function(){
        // memu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $(".menu>a").click(function(){
            // 현재 클릭한 태그가 a 이기 때문에
            // a 옆의 태그중 ul 태그에 hide 클래스 태그를 넣던지 빼던지 한다.

        });
    });

    $(document).ready(function(){
        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $(".menu>a").click(function(){
            var submenu = $(this).next("ul");
 
            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        });
    });

</script>


<jsp:include page="../common/footer.jsp" />


    

</body>
</html>