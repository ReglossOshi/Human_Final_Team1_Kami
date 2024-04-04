<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="KO">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>업무 지시 사항</title>
    <style>
        div.content {
	        margin: 0;
	        padding: 0;
    	}
    
    	textarea {
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
        }

        .content {                                    /* 테두리 색상 변화에 대한 전환 효과 */
            border: 1px solid #ccc;
            padding: 20px;
            background-color: #f9f9f9;
            transition: border-color 0.3s; 
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
            justify-content: left;
            align-items: center;            
        }

        li {                                        /* 배경색 변화에 대한 전환 효과 */
            background-color: #f0f0f0;
            padding: 0px;
            margin-right: 0px;
            border-radius: 5px;
            transition: background-color 0.3s; 
        }
       
        /* 제목, 내용, 작성자는 왼쪽 정렬 */
        .navi-left {
            float: left;
        }
        
        /* 날짜는 오른쪽 정렬 */
        .navi-right {
            float: right;
        }
        
        .content:hover {
            border-color: #007bff; 					/* 마우스 호버시 테두리 색상 변경 */
        }
       
        button:active{
           background-color: #f00;  				/* 마우스 클릭 활성화시 배경색 변경 */
        }
               
        div {        	
        	margin: 0;
        	padding: 0;
        }
        
        img {        
        	vertical-align: bottom;
 /* 		display: black; */
/*         	magin-bottom: -3px */        	
        }

    </style>
</head>

<body>

	<form action="3.work_update.jsp" method="post" >
	
	    <div class="container" >
	    
	        <div class="content" >
	        	<div class="btn-container" style="margin: 0; padding: 0; justify-content: space-evenly;">
	                <h2>업무 지시 사항</h2>
	                <div style="width: 150px;"></div>
	                <button class="btn-primary" type="submit">완료</button>
	            </div>
	        </div>
	
			<div class="content">
			    <ul style="margin: 0; padding: 0;">
			        <li class="navi-left" style="margin-right: 0px;"> <!-- 왼쪽 정렬 -->
			            <label for="subject"></label>
			            <textarea id="subject" rows="" cols="53" placeholder="제목" style='resize : none'></textarea>
			        </li>
			        
			        <li class="navi-right"> <!-- 오른쪽 정렬 -->
			            <label for="date"></label>
			            <textarea id="date" rows="" cols="52" placeholder="날짜" style='resize : none'></textarea>						      	
			        </li>
			    </ul>
			</div>
				        
			<div class="content" style="margin-top: 0px;">
			    <ul style="margin: 0; padding: 0;">
			        <li class="navi-left">
			            <label for="content"></label>
			            <textarea id="content" rows="10" cols="108" placeholder="내용" style='resize : none'></textarea>
			        </li>
			    </ul>
			</div>
	        
			<div class="content" style="margin-top: 0px;">
			    <ul style="margin: 0; padding: 0;">
			        <li class="navi-left">
			            <label for="writer"></label>	
			            <textarea id="writer" rows="" cols="108" placeholder="작성자" style='resize : none'></textarea>
			        </li>
			    </ul>
			</div>	
			     
	    </div>											<!-- <div class="container"> -->
	    
    </form>
    
</body>

</html>
