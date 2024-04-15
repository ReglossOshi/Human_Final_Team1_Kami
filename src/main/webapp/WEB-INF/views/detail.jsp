<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 상세 정보</title>
</head>
<body>
<h2>게시물 상세 정보</h2>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Content</th>
        <th>Author</th>
    </tr>
    <tr>
        <td>${board.id}</td>
        <td>${board.title}</td>
        <td>${board.content}</td>
        <td>${board.author}</td>
    </tr>
</table>
<a href="/board">목록으로 돌아가기</a>
</body>
</html>
