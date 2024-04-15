<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>새 글 작성</title>
</head>
<body>
<h2>새 글 작성</h2>
<form class="constant-values-container" action="/board" method="post">
    Title: <input type="text" name="title"><br>
    Content: <textarea name="content"></textarea><br>
    Author: <input type="text" name="author"><br>
    <button type="submit">저장</button>
</form>
<a href="/board">취소</a>
</body>
</html>
