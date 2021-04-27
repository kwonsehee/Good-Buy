<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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


			<div class="start">


				<ul>
					<li><p class="title">${b.btitle}</p></li>

					<li><a href="javascript:reportPopup()" id="police">신고하기</a></li>

					<li><a href="javascript:deletePopup()" id="mypass">게시글 삭제</a></li>
					<br>
					<li class="name" style="color: black; font-size: 18px;">${b.userid }</li>
					<li class="Date" style="font-size: 17px;">${b.bcreatedate}</li>
					<li><div class="kind">
							<p class="subject">${b.bcatename}</p>
						</div></li>
				</ul>


				<img
					src="${ contextPath }/resources/images/userProfilePhoto/${b.bphoto}"
					class="Photo">

			</div>
			<br>

			<div id="board">

				<img class="mainimg"
					src="${contextPath}/resources/images/boardupload/${b.bfile}"
					style="width: 800px; height: 470px;">
			</div>


			<div class="bcontent">
				<p>${b.bhistory}</p>
			</div>
			<div id="hearts">
				<img class="heart"
					src="${contextPath }/resources/images/board/heart.png"
					style="width: 42px; height: 39px;">
			</div>
			<div class="heartstory">좋아요를 눌러주세요!"</div>
		</div>

		<div id="replySection">
			<p style="color: #9a9999; padding: 50px 0 0 50px">댓글</p>
			<table>
				<tr>
					<td>동춘동피바다</td>
					<td colspan="2" class="subdate">2021.03.08 02:12</td>
				</tr>
				<tr>
					<td colspan="2">친구, 가족, 연인과 함께 걷고 싶게 만드는 푸껫의 카론/카타 비치!</td>
				</tr>


				<br>

			</table>
			<form method="POST">
				<div id="replyWrite">

					<textarea placeholder="댓글을 작성하시려면 로그인을 해주세요"></textarea>
					<span id="counter">0 / 1000</span>
					<button type="submit" id="writeBtn">등록하기</button>
				</div>
			</form>
		</div>


	</section>



	<jsp:include page="../common/footer.jsp" />


</body>
</html>