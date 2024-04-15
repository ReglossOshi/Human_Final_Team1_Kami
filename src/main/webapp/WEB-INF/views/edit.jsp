<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글 수정</title>
</head>
<body>
<h2>글 수정</h2>
<form class="constant-values-container" action="/board/update" method="post">
    <input type="hidden" name="id" value="${board.id}">
    Title: <input type="text" name="title" value="${board.title}"><br>
    Content: <textarea name="content">${board.content}</textarea><br>
    Author: <input type="text" name="author" value="${board.author}"><br>
    <button type="submit">수정 완료</button>
</form>
<a href="/board/${board.id}">취소</a>
</body>
</html>
