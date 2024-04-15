<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 목록</title>
</head>
<body>
<h2>게시물 목록</h2>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Content</th>
        <th>Author</th>
        <th>Action</th>
    </tr>
    <c:forEach items="${boards}" var="board">
        <tr>
            <td>${board.id}</td>
            <td>${board.title}</td>
            <td>${board.content}</td>
            <td>${board.author}</td>
            <td>
                <a href="/board/${board.id}">상세보기</a>
                <a href="/board/edit/${board.id}">수정</a>
                <form action="/board/delete/${board.id}" method="post" style="display:inline;">
                    <button type="submit">삭제</button>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>
<a href="/board/new">새 글 작성</a>
</body>
</html>
