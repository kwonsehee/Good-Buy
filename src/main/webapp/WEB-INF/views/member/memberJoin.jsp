<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
<!-- 공통 UI -->
 <link href="${ contextPath }/resources/css/memberJoin.css?" rel="stylesheet" type="text/css">
<style>
	
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
   	
    <section id="gbSection">
    <div class="totalWrap">
     <div class="imgWrap1">
            <img id="joinImg" src="${ contextPath }/resources/images/join.png">
        </div> 

        <div class="joinformWrap">
            <h4 id="goodbuy_h2">good-buy Family</h4>
            <h4 id="join_h2">회원 가입</h4>  
            <p id="alreadyJoin_p">이미 가입하셨나요?  <a data-bs-toggle="modal" data-bs-target="#loginModal">로그인 하기</a></p> 
            <form action="${ contextPath }/member/join" method="POST" class="joinform">
                <input type="text" name="user_id" placeholder="* ID"><br>
                <input type="text" name="nickname" placeholder="* NICKNAME"><br>
                <input type="password" name="user_pwd" placeholder="* PASSWORD"><br>
                <input type="password" name="user_pwd2" placeholder="* PASSWORD"><br>
                <input type="email" name="email" placeholder="EMAIL"><br>
                <input type="text" name="phone" placeholder="*PHONE"><br>
                <p>* ADDRESS</p> 
                <select name="town1">
                    <option>&nbsp;시•도</option>
                </select>
                <select name="town2">
                    <option>&nbsp;구•군</option>
                </select>
                <select name="town3">
                    <option>&nbsp;읍•면•동</option>
                </select>
                <br><br><br><br><br><br><br>
                <button type="submit">가입하기</button>
            </form>         
        </div>
    </div>
    </section>


 	<jsp:include page="../common/footer.jsp"/>

</body>
</html>