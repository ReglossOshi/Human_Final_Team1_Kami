<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@4.0.1/reset.min.css" />
<!-- 사용방법 -->
        <!-- 1. 헤더 밑에는 반드시 풋터가 있어야합니다. -->
<%@ include file="../includes/header.jsp" %>
        <!-- 2. CSS와 자바스크립트는 헤더 밑에 추가해주면 적용 됩니다. -->
    <link href="" rel="stylesheet" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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

    .form-row {
        margin-bottom: 10px;
        display:flex;
        width: 1500px;
        height: 100PX;
    }

    .modal.show {
      display: block;
    }

    .modal-body .row{
      display: flex;

    }
    #inputFields{
        display: flex;
        width: 1500px;
        height: 100px;

    }
      .inputDivBox {
          position: relative;
          width: 300px;
          margin-left: 50px;
          margin-top: 100px;
        }

        .inputBox {
          font-size: 15px;
          color: #222222;
          width: 250px;
          border: none;
          border-bottom: solid #aaaaaa 1px;
          padding-bottom: 10px;
          padding-left: 10px;
          position: relative;
          display: flex;
          background: none;
          z-index: 5;
        }

        .inputBox::placeholder { color: #aaaaaa; }
        .inputBox:focus { outline: none; }

        .inputSpanTag {
          display: block;
          position: absolute;
          bottom: 0;
          left: 0%;  /* right로만 바꿔주면 오 - 왼 */
          background-color: #666;
          width: 0;
          height: 2px;
          border-radius: 2px;
          transition: 0.5s;
        }

        .inputLabelTag {
          position: absolute;
          color: #aaa;
          left: 10px;
          font-size: 20px;
          bottom: 8px;
          transition: all .2s;
        }

    .inputBox:focus ~ span, .inputBox:valid ~ span {
      width: 100%;
    }
    .containerTable {
      display: block;
      text-align: center;
    }

    @-webkit-keyframes leftRight {
      0%    { -webkit-transform: translateX(0)}
      25%   { -webkit-transform: translateX(-10px)}
      75%   { -webkit-transform: translateX(10px)}
      100%  { -webkit-transform: translateX(0)}
    }
    @keyframes leftRight {
      0%    { transform: translateX(0)}
      25%   { transform: translateX(-10px)}
      75%   { transform: translateX(10px)}
      100%  { transform: translateX(0)}
    }

    input[type='file'] {
      display: block;
      width: 0;
      height: 0;
      overflow: hidden;
    }
    .form__input--file_wrap {
      margin-top: 20px;
      margin-left: 50px;
      display: flex;
    }
    .form__label--file {
      width: 80px;
      height: 30px;
      line-height:30px;
      background: #999;
      border-radius: 3px;
      color: #fff;
      font-weight: bold;
      display: flex;
      align-items: center;
      justify-content: center;
      cursor: pointer;
    }
    .form__span--file {
      padding: 0 5px 0 10px;
      margin-left: 5px;
      display: block;
      width: 315px;
      min-height: 30px;
      border: 1px solid #e7e7e7;
      border-radius: 3px;
      line-height: 30px;
      color: #999;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
      box-sizing: border-box;
    }

    .inputFullBox{

        margin-left: 15px;
        border: 1px solid black;
        border-radius: 5%;
        width: 45%;
        height: 90%;
        padding-bottom: 5%;
        margin-left: 3%;
    }

    .inputFullBoxTitle{
        width:400px;
        margin-left: 10%;
        display:flex;
    }
    .modalTitle{
        text-align: center;
        justify-content: center;
        margin: 0px auto;
        padding-top: 5%;
        font-size: 25px;
    }
    .inputFullPhotoBox{
        width: 45%;
        height: 572px;
        border: 1px solid black;
        border-radius: 5%;
        margin-left: 3%;

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

                              <div class="modal-dialog modal-dialog-centered modal-xl">
                              <form action="/recipe/upload" method="post" id="form1" enctype="multipart/form-data" onSubmit="return false">



                                <div class="modal-content">
                                  <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalToggleLabel">레시피 등록</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                  </div>
                                  <div class="modal-body">
                                      <div class = "inputDivBox">
                                          <input class = "inputBox recipe_name" id= "recipeInsertName" type="text" name ="recipeName" required>
                                          <label class = "inputLabelTag">레시피명</label>
                                          <span class = "inputSpanTag"></span>
                                     </div>
                                      <div class="form__input--file_wrap">
                                          <input class="form__input--file" id="upload1" type="file" multiple>
                                          <label class="form__label--file" for="upload1">파일선택</label>
                                          <span class="form__span--file">선택된 파일이 없습니다.</span>
                                      </div>
                                  </div>
                                  <div class="modal-footer">
                                      <button class="btn btn-primary" id="recipeInsertBtn" data-bs-target="#recipeInsertToggle2" data-bs-toggle="modal" data-bs-dismiss="modal" onclick="InsertRecipe();">레시피 추가</button>
                                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                  </div>
                                </div>
                                </form>
                              </div>
                            </div>




                          <div class="modal fade" id="recipeInsertToggle2" aria-hidden="true" aria-labelledby="recipeInsertToggle2Label2" tabindex="-1">
                              <div class="modal-dialog modal-dialog-centered modal-xl">
                                  <form id="recipeForm" action="/insertRecipeStandardList" method="post">
                                  <div class="modal-content">
                                      <div class="modal-header">
                                          <h5 class="modal-title" id="recipeInsertToggle2Label2">레시피 규격</h5>
                                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                      </div>
                                      <div class="modal-body ">
                                          <div class="container mt-5">
                                              <div id="inputFields">
                                                  <div class="inputDivBox form-row" >
                                                      <div class = "inputDivBox" id = "receiveParameterName">

                                                      </div>
                                                      <div class = "inputDivBox">
                                                          <input type="text" name="recipeStandardList[0].material_Name" class="inputBox form-control" placeholder="Material Name">
                                                          <label class = "inputLabelTag">재료명</label>
                                                          <span class = "inputSpanTag"></span>
                                                      </div>
                                                      <div class = "inputDivBox">
                                                          <input type="text" name="recipeStandardList[0].recipe_Product_Quantity" class="inputBox form-control" placeholder="Recipe Product Quantity">
                                                          <label class = "inputLabelTag">필요수량</label>
                                                          <span class = "inputSpanTag"></span>
                                                      </div>
                                                     <div class = "inputDivBox">
                                                        <input type="text" name="recipeStandardList[0].quantity_Units" class="inputBox form-control" placeholder="Quantity Units">
                                                        <label class = "inputLabelTag">단위</label>
                                                        <span class = "inputSpanTag"></span>
                                                     </div>
                                                      <div class = "inputDivBox">
                                                         <input type="text" name="recipeStandardList[0].usePhase" class="inputBox form-control" placeholder="Use Phase">
                                                         <label class = "inputLabelTag">사용단계</label>
                                                         <span class = "inputSpanTag"></span>
                                                      </div>
                                                  </div>
                                              </div>
                                          </div>
                                      </div>
                                      <div class="modal-footer">
                                          <button class="btn btn-primary" data-bs-target="#recipeInsertModalToggle" data-bs-toggle="modal" data-bs-dismiss="modal">Back to first</button>
                                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                          <button type="button" id="addInputField" class="btn btn-primary">열 추가</button>
                                          <button type="button" onClick='javascript: sendData();' class="btn btn-primary">데이터추가</button>
                                      </div>
                                  </div>
                                  </form>
                              </div>
                          </div>


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

    <script src="/resources/js/recipe.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-3.4.1.min.js"></script>

    <script>

        function InsertRecipe() {
            if (!$('#recipeInsertName').val()) {
                alert('레시피명을 입력하세요.');
                $('#recipeInsertName').focus();
                return;
            } else {

                $('#recipeInsertToggle2').attr("aria-hidden", "false");
                var recipeInputName = $("#receiveParameterName");
                var insertRecipe = $('#recipeInsertName').val();
                var str = "";

                console.log("1번", recipeInputName);
                console.log("버튼클릭");

                str += "    <input type='text' name='recipeStandardList[0].recipe_Name' value = '" + insertRecipe + "' class='form-control' placeholder='" + insertRecipe + "' readonly>";
                str += "    <label class='inputLabelTag'>1234</label>";
                str += "    <span class='inputSpanTag'></span>";

                recipeInputName.append(str);

                $("#addInputField").click(function () {
                    var insertRecipe = $('#recipeInsertName').val();
                    console.log("1번", recipeInputName);
                    let newRow =
                       `<div class="inputDivBox form-row">
                           <div class = "inputDivBox">
                               <input type="text" name="recipeStandardList[\${index}].recipe_Name" value = "\${insertRecipe}"   class="form-control" readonly>
                               <label class = "inputLabelTag">레시피명</label>
                               <span class = "inputSpanTag"></span>
                           </div>
                           <div class = "inputDivBox">
                               <input type="text" name="recipeStandardList[\${index}].material_Name" class="form-control" placeholder="Material ID">
                               <label class = "inputLabelTag">레시피명</label>
                               <span class = "inputSpanTag"></span>
                           </div>
                           <div class = "inputDivBox">
                               <input type="text" name="recipeStandardList[\${index}].recipe_Product_Quantity" class="form-control" placeholder="Recipe Product Quantity">
                               <label class = "inputLabelTag">레시피명</label>
                               <span class = "inputSpanTag"></span>
                           </div>
                          <div class = "inputDivBox">
                             <input type="text" name="recipeStandardList[\${index}].quantity_Units" class="form-control" placeholder="Quantity Units">
                             <label class = "inputLabelTag">레시피명</label>
                             <span class = "inputSpanTag"></span>
                          </div>
                           <div class = "inputDivBox">
                              <input type="text" name="recipeStandardList[\${index}].usePhase" class="form-control" placeholder="Use Phase">
                              <label class = "inputLabelTag">레시피명</label>
                              <span class = "inputSpanTag"></span>
                           </div>
                       </div>`;
                    let index2 = 2;
                    console.log(`aaaa: \${index}`);
                    console.log(`aaaa: ` + index);
                    console.log(`bbb: \${index2}`);

                    $("#inputFields").append(newRow);
                    index++; // 인덱스 증가
                });

            }
        }

        function sendData() {
            var recipeStandardList = [];

            // 모든 입력 필드를 가져와서 반복문으로 처리
            $(".form-row").each(function(index) {
                var recipe_Name = $(this).find("input[name='recipeStandardList[" + index + "].recipe_Name']").val();
                var material_Name = $(this).find("input[name='recipeStandardList[" + index + "].material_Name']").val();
                var recipe_Product_Quantity = $(this).find("input[name='recipeStandardList[" + index + "].recipe_Product_Quantity']").val();
                var quantity_Units = $(this).find("input[name='recipeStandardList[" + index + "].quantity_Units']").val();
                var usePhase = $(this).find("input[name='recipeStandardList[" + index + "].usePhase']").val();


                // 입력된 값들을 JSON 형식으로 만들어서 recipeStandardList에 추가
                var recipeStandard = {
                    "recipe_Name": recipe_Name,
                    "material_Name": material_Name,
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
            const form1 = document.getElementById('form1');
            form1.action = "/recipe/upload";
            form1.submit();
        }
        let index = 1;

      const fileTarget = $('.form__input--file_wrap input');

      fileTarget.on('change', function () {
        var files = $(this)[0].files;
        var fileArr = [];
        for (var i = 0; i < files.length; i++) {
          fileArr.push(files[i].name);
      }

      // 파일명 노출방법1: 배열 값 사이에 공백 추가
      var fileList = fileArr.join(', '); // 배열 값을 쉼표와 공백으로 연결
      $(this).siblings('.form__span--file').text(fileList);

    });

    </script>






<%@ include file="../includes/footer.jsp" %>