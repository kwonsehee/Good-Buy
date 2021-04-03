<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
<style>
.titleWrap {
	margin-top: 30px;
	text-align: center;
	height: 30px;;
}

.circle {
	display: inline-block;
	width: 15px;
	height: 15px;
	background: #05AAD1;
	border-radius: 50px;
	margin-top: 7px;
}

.circle:nth-child(1) {
	margin-right: 10px;
}

.Following {
	font-size: 18px;
	font-weight: bold;
}

.Following:nth-child(2) {
	margin-right: 10px;
}

#proPhoto {
	width: 160px;
	border-radius: 100px;
	border: 15px solid #F1F1F1;
	margin-left: 50%;
	transform: translate(-50%);
	margin-top: 30px;
}

#inputLabel {
	text-decoration: underline;
	font-size: 13px;
	cursor: pointer;
	margin-left: 45%;
}

#fileBtn {
	margin-top: 30px;
	margin-bottom: 50px;
	width: 120px;
	height: 45px;
	text-align: center;
	border: 0px;
	background: #222;
	color: #fff;
	border-radius: 27px;
	font-weight: bold;
	margin-left: 50%;
	transform: translate(-50%);
}
</style>
</head>
<body>
	 <div class="titleWrap">
        <span class="circle"></span>
        <span class="Following">프로필사진</span>
        <span class="circle"></span>
    </div>

    <div class="photoWrap">
        <img src="${ contextPath }/resources/images/mypage/loopy.jpeg" id="proPhoto">
    </div>
    <input type="file" id="inputFile" style="display: none;">
    <label for="inputFile" id="inputLabel">파일첨부</label>
    <br>
    <button id="fileBtn">등록하기</button>
</body>
</html>