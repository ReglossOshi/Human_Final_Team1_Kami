<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="KO">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>업무 지시 사항</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .content {                                    /* 테두리 색상 변화에 대한 전환 효과 */
            border: 1px solid #ccc;
            padding: 0px;
            background-color: #f9f9f9;
            transition: border-color 0.3s;
        }

        .btn-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            border-radius: 5px;
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
            justify-content: center;
            align-items: center;
        }

        li {
            background-color: #f0f0f0;
            padding: 10px;
            margin-right: 65px;
            border-radius: 5px;
            transition: background-color 0.3s; /* 배경색 변화에 대한 전환 효과 */
        }

        .content:hover {
            border-color: #007bff; /* 마우스 호버시 테두리 색상 변경 */
        }

        li:hover {
            background-color: #dcdcdc; /* 마우스 호버시 배경색 변경 */
        }

        li:active{
            background-color: #f00;  /* 마우스 클릭 활성화시 배경색 변경 */
        }


    </style>
</head>

<body>

<form class="container" aucton="/work" method="post">

    <div class="btn-container">
        <h2>업무 지시 사항</h2>
        <button class="btn-primary" onclick="location.href='2.work_process.jsp'">작성</button>
    </div>


    <div class="content">
        <nav class="navi">
            <ul>
                <li><a >번호</a></li>
                <li><a >제목</a></li>
                <li><a >작성자</a></li>
                <li><a >작성일</a></li>
                <li><a >조회수</a></li>
            </ul>
        </nav>
    </div>

    <div class="content">
        <ul>
            <li><a href="" target="" ></a></li>
            <li><a href="" target="" ></a></li>
            <li><a href="" target="" ></a></li>
            <li><a href="" target="" ></a></li>
            <li><a href="" target="" ></a></li>
        </ul>
    </div>

    <div class="content">
        <ul>
            <li><a href="" target="" ></a></li>
            <li><a href="" target="" ></a></li>
            <li><a href="" target="" ></a></li>
            <li><a href="" target="" ></a></li>
            <li><a href="" target="" ></a></li>
        </ul>
    </div>

    <div class="content">
        <ul>
            <li><a href="" target="" ></a></li>
            <li><a href="" target="" ></a></li>
            <li><a href="" target="" ></a></li>
            <li><a href="" target="" ></a></li>
            <li><a href="" target="" ></a></li>
        </ul>
    </div>

    <ul>
        <li class="pagination">
            <a href="#"></a><a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">>></a>
        </li>
    </ul>

</form>

</body>

</html>