<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="/css/index.css">
    <link rel="stylesheet" href="/css/content.css">
    <link rel="stylesheet" href="/css/notice.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.js"></script>
    <title>Starbucks Coffee Korea :: update </title>
</head>
<body>
<div class="wrap">
    <!-- header 시작 (나중에 include로 빼서 넣기) -->
    
    <!-- header 끝 -->
    <!-- 본문 시작 -->
    <div class="content">
        <div class="notice_title">
            <h1>공지사항</h1>
            <ul class="notice_nav">
                <li><a href="#">WHAT'S NEW</a></li>
                <li>&ensp;>&ensp;</li>
                <li><a href="#">HOME</a></li>
            </ul>
        </div>
        <form action="/board/updateProc" method="post">
        <div class="notice_content_title">
        	<input type="hidden" name="id" value="${board.id}">
            <input class="write_notice_title" name="title" type="text" value="${board.title}"/>
        </div>
        <div class="notice_content">
            <textarea id="summernote" name="content">${board.content}</textarea>
        </div>
        <button class="write_button" type="submit">수정하기</button>
        <button class="list_button" type="button" onclick="location.href='/board'">목록</button>
        <div style="margin-bottom:120px;"></div>
    </form>
    </div>

    <!-- 본문 끝 -->
    <!-- footer 시작 (나중에 include로 빼서 넣기) -->
    <footer>
       
    </footer>
    <!-- footer 끝 -->
</div>
</div>
<script>
    $('#summernote').summernote({
      placeholder: 'Hello stand alone ui',
      tabsize: 2,
      height: 400,
      toolbar: [
        ['style', ['style']],
        ['font', ['bold', 'underline', 'clear']],
        ['color', ['color']],
        ['para', ['ul', 'ol', 'paragraph']],
        ['table', ['table']],
        ['insert', ['link', 'picture', 'video']],
        ['view', ['fullscreen', 'codeview', 'help']]
      ]
    });
</script>
</body>
</html>