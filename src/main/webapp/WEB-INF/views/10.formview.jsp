<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Board Form</title>
</head>
<body>
<h2>Board Form</h2>
<form action="${actionUrl}" method="post">
    <input type="hidden" name="id" value="${board.id}">
    <label for="title">Title:</label><br>
    <input type="text" id="title" name="title" value="${board.title}"><br>
    <label for="content">Content:</label><br>
    <textarea id="content" name="content">${board.content}</textarea><br>
    <label for="author">Author:</label><br>
    <input type="text" id="author" name="author" value="${board.author}"><br>
    <input type="submit" value="Submit">
</form>
</body>
</html>
