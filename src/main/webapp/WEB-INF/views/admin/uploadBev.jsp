<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SHCgram</title>

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
				<form action="/admin/upload/bev" method="post"
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
							<td><input type="text" name="name" placeholder="음료이름"></td>
						</tr>
						<tr>
							<td><input type="number" name="price" placeholder="가격"></td>
						</tr>
							<tr>
							<td>
							<label><input type="radio" name="category" value="콜드 브루 커피">콜드브루</label>
							<label><input type="radio" name="category" value="브루드 커피">브루드</label>
							<label><input type="radio" name="category" value="에스프레소">에스프레소</label>
							<label><input type="radio" name="category" value="프라프치노">프라프치노</label><br/>
							<label><input type="radio" name="category" value="블렌디드">블렌디드</label>
							<label><input type="radio" name="category" value="스타벅스 피지오">피지오</label>
							<label><input type="radio" name="category" value="티(티바나)">티</label>
							<label><input type="radio" name="category" value="기타 제조 음료">기타</label>
							<label><input type="radio" name="category" value="스타벅스 주스(병음료)">주스</label>
			
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