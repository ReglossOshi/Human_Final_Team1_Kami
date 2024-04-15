<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="KO">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>업무 지시 사항</title>
    <style>
        div.content,
        textarea,
        div,
        img {
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 780px;
            margin: 0 auto;
            border: none;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            padding: 9px;
        }

        .content {
            border: 1px solid #ccc;
            padding: 20px;
            background-color: #f9f9f9;
            transition: border-color 0.3s;
            margin-bottom: 20px; /* 추가된 마진 */
        }

        .btn-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
            color: white;
            padding: 8px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 13px;
            border-radius: 0px;
            cursor: pointer;
        }

        .pagination {
            text-align: center;
        }

        .pagination a {
            padding: 5px 10px;
            text-decoration: none;
            color: #007bff;
        }

        ul {
            list-style-type: none;
            padding: 0;
            display: flex;
            justify-content: left;
            align-items: center;
            margin: 0;
        }

        li {
            background-color: #f0f0f0;
            padding: 0px;
            margin-right: 0px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .navi-left {
            float: left;
        }

        .navi-right {
            float: right;
        }

        .content:hover {
            border-color: #007bff;
        }

        button:active {
            background-color: #f00;
        }

        img {
            vertical-align: bottom;
        }

        textarea {
            resize: none;
        }

    </style>
</head>

<body>

<form class="container" action="/workupdate" method="post">

    <div class="container">
        <div class="content">
            <div class="btn-container">
                <h2>업무 지시 사항</h2>
                <div style="width: 50px; padding: 45px;"></div>
                <button class="btn-primary" type="submit" style="margin-left: 220px;" button onclick="">수정</button>
                <button class="btn-primary" type="submit" style="margin-right: 50px;" button onclick="">삭제</button>
            </div>
        </div>

        <div class="content">
            <ul>
                <li class="navi-left">
                    <label for="subject"></label>
                    <textarea id="subject" rows="" cols="51" placeholder="제목"></textarea>
                </li>

                <li class="navi-right">
                    <label for="date"></label>
                    <textarea id="date" rows="" cols="51" placeholder="날짜"></textarea>
                </li>
            </ul>
        </div>

        <div class="content">
            <ul>
                <li class="navi-left">
                    <label for="content"></label>
                    <textarea id="content" rows="10" cols="105" placeholder="내용"></textarea>
                </li>
            </ul>
        </div>

        <div class="content">
            <ul>
                <li class="navi-left">
                    <label for="writer"></label>
                    <textarea id="writer" rows="" cols="105" placeholder="작성자"></textarea>
                </li>
            </ul>
        </div>
    </div> <!-- <div class="container"> -->

</form>

</body>

</html>