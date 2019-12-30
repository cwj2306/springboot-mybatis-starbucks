<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Starbucks Coffee Korea :: Admin</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="../css/image_upload.css">
</head>
<body>

	<div class="container">
		<div class="box">
			<div class="bigbox">

				<br />

				<div class="text">
					<hr class="hr" />
					커피 업로드
					<hr class="hr" />
				</div>
				<!-- 섬네일은 아래 주소 참고 -->
				<!-- https://medium.com/@asadise/create-thumbnail-for-an-image-in-spring-framework-49776c873ea1 -->
				<form action="/admin/upload/coffee" method="post"
					enctype="multipart/form-data">
					<table class="table">
						<tr>
							<td><input id="input_img" type="file" name="file"
								placeholder="사진파일"></td>
						</tr>
						<tr>
							<td>
								<div class="img_wrap">
									<img id="img" />
								</div>
							</td>
						</tr>
						<tr>
							<td><input type="text" name="name" placeholder="커피 이름"></td>
						</tr>
						<tr>
							<td><input type="text" name="detail" placeholder="상세 설명"></td>
						</tr>
						<tr>
							<td><input type="number" name="price" placeholder="가격"></td>
						</tr>
							<tr>
							<td>맛:
							<label><input type="radio" name="flavor" value="짭짤한 맛">짭짤</label>
							<label><input type="radio" name="flavor" value="과일 맛">과일</label>
							<label><input type="radio" name="flavor" value="구운 맛">구운</label>
							<label><input type="radio" name="flavor" value="달콤한(캐러멜) 맛">달콤</label>
							</td>
						</tr>
							<tr>
							<td>느낌:
							<label><input type="radio" name="feel" value="상쾌하고 부드러운 느낌">상쾌,부드러움</label>
							<label><input type="radio" name="feel" value="오랫동안 여운이 남는 느낌">여운남는</label>
							</td>
						</tr>
							<tr>
							<td>강도:
							<label><input type="radio" name="strong" value="은은하고 부드러움">은은,부드러움</label>
							<label><input type="radio" name="strong" value="강도가 세고 강렬함">세고 강렬</label>
							</td>
						</tr>
								<tr>
							<td>로스트:
							<label><input type="radio" name="roast"value="블론드 로스트">블론드</label>
							<label><input type="radio" name="roast"value="미디엄 로스트">미디엄</label>
							<label><input type="radio" name="roast"value="다크 로스트">다크</label>
							</td>
						</tr>
				
					</table>
					<input type="submit" value="업로드">
				</form>

			</div>
			<div class="smallbox">
				<div class=text>
					<a href="javascript:window.history.back()" class="under1">뒤로가기</a>
				</div>
			</div>
		</div>
	</div>

	<script>
		var sel_file;
		$(document).ready(function() {
			$('#input_img').on("change", handleImgFileSelect);
		});
		function handleImgFileSelect(e) {
			console.log("으"+e.target.files)
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			filesArr.forEach(function(f) {
				if (!f.type.match("image.*")) {
					alert("확장자는 이미지 확장자만 가능합니다.");
					return;
				}
				sel_file = f;
				var reader = new FileReader();
				reader.onload = function(e) {
					console.log("앙"+e.target.result)
					$('#img').attr('src', e.target.result);
				}
				reader.readAsDataURL(f);
			});
		}
	</script>
</body>
</html>