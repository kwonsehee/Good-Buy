<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
<link href="${ contextPath }/resources/css/mypage/memberUpdateForm.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	 <section id="gbSection">
    <div class="totalWrap">
     <div class="imgWrap">
            <img id="joinImg" src="${ contextPath }/resources/images/mypage/join.png">
        </div> 

        <div class="formWrap">
            <h4 id="goodbuy_h2">good-buy Family</h4>
            <h4 id="join_h2">회원 정보 수정</h4>  

            <form method="POST" class="joinform">
                <p>NICKNAME</p>
                <input type="text" name="userId" value="곽두팔"><br>
                <input type="password" name="userPwd" placeholder="PASSWORD"><br>
                <input type="password" name="userNewPwd" placeholder="NEW PASSWORD"><br>
                <input type="password" name="userNewPwd2" placeholder="NEW PASSWORD"><br>
                <p>EMAIL</p>
                <input type="email" name="email" value="anghongmoddi@gmail.com"><br>
                <p>PHONE</p>
                <input type="text" name="phone" value="010-3030-4040"><br>
                <p>ADDRESS</p> 
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
                <button type="submit">수정하기</button>
            </form>         
            <a id="memberLeaveBtn" href="#">탈퇴하기</a>
        </div>
    </div>
    </section>
	
	
	
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>