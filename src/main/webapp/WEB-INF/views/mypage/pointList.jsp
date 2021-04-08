<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신 근처의 굿-바이 마켓 Good-Buy!</title>
<link href="${ contextPath }/resources/css/mypage/pointList.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<section id="gbSection">
        <img src="${ contextPath }/resources/images/mypage/left-arrow.png" id ="backBtn" onclick="location.href='${ contextPath }/mypage/main'">
        <h1 class="title_h1">포인트 내역</h1>
        <ul class="subCategory_ul">
            <li><a id="sub_board" href="${ contextPath }/mypage/pointList">전체내역</a></li>
            <li><a id="sub_boardReply" href="">적립</a></li>
            <li><a id="sub_goods" href="">사용</a></li>
        </ul>

        <ul class="pointTextBox">
            <li>
                <div>전체 보유 포인트 : 1,500 P</div>
            </li>
            <li>
                <div>사용한 포인트 : 600 P</div>
            </li>
        </ul>

        <div class="tableWrap">
            <table>
                <tr>
                    <td>+50</td>
                    <td>댓글 작성 적립</td>
                </tr>
                <tr>
                    <td>+50</td>
                    <td>동네생활 글 작성 적립</td>
                </tr>
                <tr>
                    <td>+50</td>
                    <td>댓글 작성 적립</td>
                </tr>
                <tr>
                    <td>+50</td>
                    <td>댓글 작성 적립</td>
                </tr>
                <tr style="color: #05AAD1;">
                    <td>-100</td>
                    <td>끌올 사용</td>
                </tr>
                <tr>
                    <td>+50</td>
                    <td>댓글 작성 적립</td>
                </tr>
                <tr>
                    <td>+50</td>
                    <td>댓글 작성 적립</td>
                </tr>
                <tr style="color: #05AAD1;">
                    <td>-100</td>
                    <td>끌올 사용</td>
                </tr>
                <tr>
                    <td>+50</td>
                    <td>댓글 작성 적립</td>
                </tr>
                <tr>
                    <td>+50</td>
                    <td>댓글 작성 적립</td>
                </tr>
            </table>
        </div>


        <div class="pagingArea">
            <ul>
                <li><a href="#">&lt;&lt;</a></li>
                <li><a href="#">&lt;</a></li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">&gt;</a></li>
                <li><a href="#">&gt;&gt;</a></li>
            </ul>
        </div>
    </section>

	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>