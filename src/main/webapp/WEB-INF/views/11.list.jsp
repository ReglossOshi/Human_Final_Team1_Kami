<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Board List</title>
</head>
<body>
<h2>Board List</h2>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Content</th>
        <th>Author</th>
    </tr>
    <c:forEach items="${boards}" var="board">
        <tr>
            <td>${board.id}</td>
            <td>${board.title}</td>
            <td>${board.content}</td>
            <td>${board.author}</td>
            <td><a href="<c:url value='/boards/edit/${board.id}'/>">Edit</a></td>
            <td><a href="<c:url value='/boards/delete/${board.id}'/>">Delete</a></td>
        </tr>
    </c:forEach>
</table>
<br>
<a href="<c:url value=''/>">New Board</a>
</body>
</html>