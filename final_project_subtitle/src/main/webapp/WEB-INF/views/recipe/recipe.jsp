<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@4.0.1/reset.min.css" />
<!-- 사용방법 -->
        <!-- 1. 헤더 밑에는 반드시 풋터가 있어야합니다. -->
<%@ include file="../includes/header.jsp" %>
        <!-- 2. CSS와 자바스크립트는 헤더 밑에 추가해주면 적용 됩니다. -->
    <link href="" rel="stylesheet" />

    <style>
    @font-face {
        font-family: 'PuradakGentleGothicR';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.1/PuradakGentleGothicR.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
    }
    .container {
        margin-left: 20px;
        margin-top: 5%;
        width: 80%;
        height: 600PX;
    	display: grid;
    	grid-template-columns: 1fr 1fr;
    	grid-template-columns: 200px 200px 200px;  <!--떨어진 거리-->
    	row-gap: 300px;
    	column-gap: 150px;
    }
    .item{
        width: 300px;
        height: 250px;
        text-align: center;
        align-items: center;
        justify-content: center;
        overflow: hidden;
    }
    .chickenPhotoBox{
        width: 300px;
        height: 200px;
       overflow: hidden;
    }
    .namePhotoBox{
        margin-top: 20px;
        width: 300px;
        height: 50px;
        font-family: 'PuradakGentleGothicR';
    }
    .recipeBtnBigBox{
        width: 100%;
        height: 50px;
        display: flex;
    }
    .recipeBtnLeftBox{
        width: 33%;
    }
    .recipeBtnMidBox{
        width: 33%;
    }
    .recipeBtnRightBox{
        margin-right: 2%;
        text-align: right;
        width: 34%;
    }
    .recipeHeadNameBox{
        margin-top: 2%;
        margin-bottom: -2%;
        width: 100%;
        height: 5%;
        display: flex;
                text-align: center;
                align-items: center;
                justify-content: center;
    }
    h3{
        font-family: 'PuradakGentleGothicR';
    }

    </style>
                <main>
                    <div class = "recipeHeadNameBox" >
                        <h3 class "recipeHeadName"> 레시피 목록 </h3>
                    </div>

                    <div class="container">
                        <c:forEach items="${recipeVOList}" var="recipe">
                        <div class="item">
                            <div class = "chickenPhotoBox" id = "chickenPhotoBox <c:out value='${recipe.recipe_Id}'/>"><img id="chickenPhoto" src="/resources/upload/chickenPhoto/<c:out value='${recipe.filename}'/>"> </div>
                            <div class='recipe_list' id = "recipe_list<c:out value='${recipe.recipe_Id}'/>" display="hidden" value ="<c:out value='${recipe.recipe_Id}' />"></div>
                            <div class = "namePhotoBox"><td><c:out value="${recipe.recipe_Name}" /></td></div>
                        </div>
                        </c:forEach>

                    </div>

                    <div class = "recipeBtnBigBox">
                        <div class = "recipeBtnLeftBox">

                        </div>
                        <div class = "recipeBtnMidBox">

                        </div>
                        <div class = "recipeBtnRightBox">
                            <div class="modal fade" id="recipeInsertModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
                              <div class="modal-dialog modal-dialog-centered">
                              <form action="/recipe/upload" method="post" id="form1" enctype="multipart/form-data" onSubmit="return false">
                                <div class="modal-content">
                                  <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalToggleLabel">레시피 등록</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                  </div>
                                  <div class="modal-body">
                                        <div class = "inputDivBox">
                                            <div class = "inputDivBoxDiv">
                                                <input class = "inputBox recipe_name" id= "recipeInsertName" type="text" name ="recipeName" required>
                                                <label class = "inputLabelTag">레시피명</label>
                                                <span class = "inputSpanTag"></span>
                                            </div>
                                        </div>
                                    <input type = "file" name = "file"></input>
                                  </div>
                                  <div class="modal-footer">
                                      <button class="btn btn-primary" id = "recipeInsertBtn" data-bs-target="#recipeInsertToggle2" data-bs-toggle="modal" data-bs-dismiss="modal" onClick='javascript:InsertOnlyRecipe();'>레시피 추가</button>
                                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                  </div>
                                </div>
                                </form>
                              </div>
                            </div>
                            <div class="modal fade" id="recipeInsertToggle2" aria-hidden="true" aria-labelledby="recipeInsertToggle2Label2" tabindex="-1">
                              <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                  <div class="modal-header">
                                    <h5 class="modal-title" id="recipeInsertToggle2Label2">레시피 규격</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                  </div>
                                  <div class="modal-body">

                                    <div class = "standardInputBox">
                                        <div class = "inputDivBox">
                                            <div class = "inputDivBoxDiv">
                                                <input class = "inputBox recipe_name" type="number" name ="recipe_Id" id ="recipe_Id" required>
                                                <label class = "inputLabelTag">레시피번호</label>
                                                <span class = "inputSpanTag"></span>
                                                <input class = "inputBox recipe_name" type="number" name ="material_id" id ="material_id" required>
                                                <label class = "inputLabelTag">재료번호</label>
                                                <span class = "inputSpanTag"></span>
                                                <input class = "inputBox recipe_name" type="number" name ="recipe_Product_Quantity" id ="recipe_Product_Quantity" required>
                                                <label class = "inputLabelTag">필요수량</label>
                                                <span class = "inputSpanTag"></span>
                                                <input class = "inputBox recipe_name" type="text" name ="quantity_Units" id ="quantity_Units" required>
                                                <label class = "inputLabelTag">단위</label>
                                                <span class = "inputSpanTag"></span>
                                                <input class = "inputBox recipe_name" type="text" name ="usePhase" id ="usePhase" required>
                                                <label class = "inputLabelTag">사용단계</label>
                                                <span class = "inputSpanTag"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <button onclick="sendData()">데이터 전송</button>

                                  </div>
                                  <div class="modal-footer">
                                    <button class="btn btn-primary" data-bs-target="#recipeInsertModalToggle" data-bs-toggle="modal" data-bs-dismiss="modal">Back to first</button>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <a class="btn btn-primary" data-bs-toggle="modal" href="#recipeInsertModalToggle" role="button">레시피</a>
                        </div>
                    </div>

                </main>

        <!-- 4. 자바스크립트는 화면이 그려진 뒤에 적용해야 되기에 풋터 앞쪽에 추가해야 됩니다. -->
    <script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="/resources/js/recipe.js"></script>



    <script>
        function InsertOnlyRecipe() {
            const form1 = document.getElementById('form1');

            form1.action = "/recipe/upload";
            if(!$('#recipeInsertName').val()){
                alert('레시피명을 입력하세요.');	// 이름 입력하라고 팝업 뜸.
                $('#recipeInsertName').focus();		// 이름 입력 칸으로 포커스 이동
                return;
            }
                else{
               $('#recipeInsertToggle2').attr("aria-hidden", "false");

            }
        }

    function sendData() {
        var recipeStandardList = [];

        // 모든 입력 필드를 가져와서 반복문으로 처리
        $(".inputDivBoxDiv").each(function(index) {
            var recipe_Id = $(this).find("#recipe_Id").val();
            var material_Id = $(this).find("#material_Id").val();
            var recipe_Product_Quantity = $(this).find("#recipe_Product_Quantity").val();
            var quantity_Units = $(this).find("#quantity_Units").val();
            var usePhase = $(this).find("#usePhase").val();

            // 입력된 값들을 JSON 형식으로 만들어서 recipeStandardList에 추가
            var recipeStandard = {
                "recipe_Id": recipe_Id,
                "material_Id": material_Id,
                "recipe_Product_Quantity": recipe_Product_Quantity,
                "quantity_Units": quantity_Units,
                "usePhase": usePhase
            };
            recipeStandardList.push(recipeStandard);
        });

        // 만들어진 JSON 데이터를 서버로 전송
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/recipe/rest/recipe-standard",
            data: JSON.stringify(recipeStandardList),
            success: function(response) {
                alert("Data sent successfully!");
            },
            error: function(error) {
                console.error("Error occurred: ", error);
            }
        });
    }
    </script>




<%@ include file="../includes/footer.jsp" %>