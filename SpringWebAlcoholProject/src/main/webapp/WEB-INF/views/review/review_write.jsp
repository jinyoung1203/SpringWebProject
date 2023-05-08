<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.starpoint_wrap {
	display: inline-block;
}

.starpoint_box {
	position: relative;
	background:
		url(https://ido-archive.github.io/svc/etc/element/img/sp_star.png) 0 0
		no-repeat;
	font-size: 0;
}

.starpoint_box .starpoint_bg {
	display: block;
	position: absolute;
	top: 0;
	left: 0;
	height: 18px;
	background:
		url(https://ido-archive.github.io/svc/etc/element/img/sp_star.png) 0
		-20px no-repeat;
	pointer-events: none;
}

.starpoint_box .label_star {
	display: inline-block;
	width: 10px;
	height: 18px;
	box-sizing: border-box;
}

.starpoint_box .star_radio {
	opacity: 0;
	width: 0;
	height: 0;
	position: absolute;
}

.starpoint_box .star_radio:nth-of-type(1):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(1):checked ~ .starpoint_bg {
	width: 10%;
}

.starpoint_box .star_radio:nth-of-type(2):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(2):checked ~ .starpoint_bg {
	width: 20%;
}

.starpoint_box .star_radio:nth-of-type(3):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(3):checked ~ .starpoint_bg {
	width: 30%;
}

.starpoint_box .star_radio:nth-of-type(4):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(4):checked ~ .starpoint_bg {
	width: 40%;
}

.starpoint_box .star_radio:nth-of-type(5):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(5):checked ~ .starpoint_bg {
	width: 50%;
}

.starpoint_box .star_radio:nth-of-type(6):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(6):checked ~ .starpoint_bg {
	width: 60%;
}

.starpoint_box .star_radio:nth-of-type(7):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(7):checked ~ .starpoint_bg {
	width: 70%;
}

.starpoint_box .star_radio:nth-of-type(8):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(8):checked ~ .starpoint_bg {
	width: 80%;
}

.starpoint_box .star_radio:nth-of-type(9):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(9):checked ~ .starpoint_bg {
	width: 90%;
}

.starpoint_box .star_radio:nth-of-type(10):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(10):checked ~ .starpoint_bg {
	width: 100%;
}

.blind {
	position: absolute;
	clip: rect(0, 0, 0, 0);
	margin: -1px;
	width: 1px;
	height: 1px;
	overflow: hidden;
}

</style>
<script>
	function rating(rating) {
		console.log(rating);
		var star_score = document.getElementById('stars');
		console.log(star_score);
		star_score.value = rating;
	}
	
	function register(f) {
		console.log(f.starpoint.value);
		console.log(f.review_rating.value);
		f.action = "review_register.do";
		f.submit();
	}
	
</script>
</head>

<body>
	<h1>글쓰기</h1>
	<form>
		<div>
			<input type="text" name="review_filename" placeholder="제목">
		</div>
		<div>
			<textarea name="review_content" placeholder="내용"></textarea>
		</div>
		<div class="starpoint_wrap">
			<div class="starpoint_box">
				<c:forEach var="i" begin="1" end="10">
					<label for="starpoint_${i}" class="label_star" title="${i / 2.0}">
						<span class="blind">${i/2.0}점</span>
					</label>
					<input type="radio" name="starpoint" id="starpoint_${i}"
						class="star_radio" onclick="rating(${i / 2.0})">
				</c:forEach>
				<span class="starpoint_bg"></span>
			</div>
		</div>
		<div>
			<input type="button" value="등록" onclick="register(this.form);">
		</div>
		<c:if test="${ user1 ne null }"> 
			<input type="hidden" name="user1_idx" value="${user1.user1_idx}">
		</c:if>
		<c:if test="${ user1 eq null }">
			<input type="hidden" name="user1_idx" value="41">
			
		</c:if>
		<input type="hidden" name="product_idx" value="${ list.product_idx }">
		<input type="hidden" name="review_rating" id="stars">
	</form>






</body>
</html>
