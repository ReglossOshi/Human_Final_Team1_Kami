<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ include file="../includes/header.jsp" %>
<link href="/resources/css/manufacturing.css" rel="stylesheet" />
<style>
#modalArea .inputDivBoxDiv {
  position: relative;
  width: 300px;
  margin-left: 50px;
  margin-top: 100px;
  margin-bottom: 100px;
}

#modalArea .inputDivBox input {
  font-size: 15px;
  color: #222222;
  width: 300px;
  border: none;
  border-bottom: solid #aaaaaa 1px;
  padding-bottom: 10px;
  padding-left: 10px;
  position: relative;
  background: none;
  z-index: 5;
}

#modalArea .inputDivBox input::placeholder { color: #aaaaaa; }
#modalArea .inputDivBox input:focus { outline: none; }

#modalArea .inputDivBox span {
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

#modalArea .inputDivBox label {
  position: absolute;
  color: #aaa;
  left: 10px;
  font-size: 20px;
  bottom: 8px;
  transition: all .2s;
}

#modalArea .inputDivBox input:focus ~ label, #modalArea .inputDivBox input:valid ~ label {
  font-size: 16px;
  bottom: 40px;
  color: #666;
  font-weight: bold;
}

#modalArea .inputDivBox input:focus ~ span, #modalArea .inputDivBox input:valid ~ span {
  width: 100%;
}


/* Basic Styling */

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

.inputFullBox {
  margin-left: 15px;
  border: 1px solid black;
  border-radius: 5%;
  width: 45%;
  height: 90%;
  padding-bottom: 5%;
  margin-left: 3%;
}

.inputFullBoxTitle {
  width:400px;
  margin-left: 10%;
  display:flex;
}
.modalTitle {
  text-align: center;
  justify-content: center;
  margin: 0px auto;
  padding-top: 5%;
  font-size: 25px;
}
.inputFullPhotoBox {
  width: 45%;
  height: 572px;
  border: 1px solid black;
  border-radius: 5%;
  margin-left: 3%;
}
</style>


    <!-- 모달 버튼 -->
    <!--
        btn : [bootstrap] 버튼 사용
        btn-sm : [bootstrap] 작은 버튼
        btn-info : [bootstrap] 버튼 테마 적용(청색)
        ml-2 : [bootstrap] margin left의 줄임말, - 뒤 숫자 만큼 margin을 줌
        mt-2 : [bootstrap] margin top의 줄임말, - 뒤 숫자 만큼 margin을 줌
        modalBtn : 작성자는 클릭 이벤트에 사용, 여러 버튼을 사용할 때 주로 이용함
     -->
    <button class="btn btn-sm btn-info ml-2 mt-2 modalBtn" id="testModal">open?</button>

            <div class = "inputDivBox">
                <div class = "inputDivBoxDiv">
                    <input class = "inputBox recipe_name" type="text" required>
                    <label class = "inputLabelTag">레시피명</label>
                    <span class = "inputSpanTag"></span>
                </div>
            </div>


    <!-- Modal 공간 -->
    <div class="modal fade" id="modalArea" tabindex="-1" data-bs-backdrop = "static" aria-labelledby="modalArea" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <!-- modal-content -->
                <!-- Modal header -->
                <div class="modal-header">
                    <h5>Modal Test</h5>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <div class="row">
                        <div class= "inputFullBox">
                            <div class = "inputFullBoxTitle">
                                <div class= "modalTitle">제목넣을공간</div>
                            </div>
                        <form action="/recipe/upload" method="post" id="form1" enctype="multipart/form-data" onSubmit="return false">
                            <div class = "inputDivBox">
                                <div class = "inputDivBoxDiv">
                                    <input class = "inputBox recipe_name" type="text" name ="recipeName" id ="recipeInsertName" required>
                                    <label class = "inputLabelTag">레시피명</label>
                                    <span class = "inputSpanTag"></span>
                                </div>
                            </div>

                            <div class="form__input--file_wrap">
                              <input class="form__input--file" id="upload1" type="file" multiple>
                              <label class="form__label--file" for="upload1">파일선택</label>
                              <span class="form__span--file">선택된 파일이 없습니다.</span>
                            </div>
                        </form>
                        </div>
                        <div class= "inputFullPhotoBox">
                            <div class = "inputLittlePhotoBox">

                            </div>
                        </div>

                    </div>
                </div>

                <!-- Modal footer -->
                <div class="footer">
                    <div class="float-right" style="text-align: right;">
                        <!-- 종료 버튼 -->
                        <!--
                            btn : [bootstrap] 부트 스트랩 버튼 사용
                            mr-2 : [bootstrap] margin right를 2만큼
                            bm-2 : [bootstrap] margin bottom을 2만큼
                        -->
                        <button type="button" class="btn mr-2 mb-2" id="closeBtn">닫기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="pagination__wrapper">
        <ul class="pagination">
            <li class="pagelist"><button class="pagebtn prev">&#10094;</button></li><!--이전버튼-->

            <li class="pagelist">
                <button class="pagebtn pagenum active">1</button><!--현재 위치-->
            </li>
            <li class="pagelist">
                <button class="pagebtn pagenum">2</button>
            </li>
            <li class="pagelist">
                <button class="pagebtn pagenum">3</button>
            </li>

            <li class="pagelist"><button class="pagebtn next" title="next page">&#10095;</button></li><!--다음버튼-->
        </ul>
    </div>


<%@ include file="../includes/footer.jsp" %>
<script>
$(function(){
    // 모달 오픈 (show)
    $(document).on('click', '.modalBtn', function(){
        $('#modalArea').modal('show');
    });

    // 모달 종료 (hide)
    $(document).on('click', '#closeBtn', function(){
        $('#modalArea').modal('hide');
    });
})
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
let  pagenum = document.querySelectorAll('.pagenum');
pagenum.forEach((target) => target.addEventListener("click", function(){
    pagenum.forEach((e)=>{
        e.classList.remove('active');
    })
        target.classList.add('active');
    })
);
</script>