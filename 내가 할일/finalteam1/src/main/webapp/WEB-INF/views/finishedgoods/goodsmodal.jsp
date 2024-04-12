<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- 추가 버튼 누를 시 나오는 모달 -->
<div class="modal fade" id="modalArea" tabindex="-1" data-bs-backdrop = "static" aria-labelledby="modalArea" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5>제품 추가</h5>
            </div>
     <!-- Modal body -->
            <div class="modal-body">
                <div class="row">
                    <div class="goods-modal">
                        <div class="goods-insert">
                            <div class="modal-input-box">
                                <div class="modal-input">
                                    <div id="selectbox">
                                        <div class="sel sel--black-panther">
                                            <select name="select-profession" id="goods-insert">
                                                <option value="1" disabled selected>제품 이름</option>
                                                <c:forEach items="${recipelist}" var="recipe">
                                                    <option><c:out value="${recipe.finishedgoods_name}" /></option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-input">
                                    <div class = "inputDivBox">
                                        <input class = "inputBox" type="text" id="goods-price" required>
                                        <label class = "inputLabelTag">제품 가격</label>
                                        <span class = "inputSpanTag" id="inputtext"></span>
                                    </div>
                                </div>
                                <div class="modal-input">
                                    <button class="btn btn-sm btn-secondary ml-2 mt-2" id="goods-insert-btn">추가</button>
                                </div>
                            </div>
                            <div class="modal-input-box">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal footer -->
            <div class="footer">
                <div class="float-right" style="text-align: right;">
                    <button type="button" class="btn mr-2 mb-2" id="closeBtn">닫기</button>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
    #goods-row-modal .row{
        height:400px;
    }

    #goods-detail{
        border:1px solid rgba(0,0,0,0.18);
        display:flex;
        flex-direction:column;
        align-items:center;
        padding:20px;
    }

    .goods-contents{
        display:flex;
        justify-content:center;
        align-items:center;
        width:100%;

    }
    .goods-contents:nth-child(1){
        height:400px;
    }
    .goods-contents:nth-child(2){
        height:100px;
    }

    .goods-inner{
        display:flex;
        flex-direction:column;
        width:100%;
        height:100%;
        padding:0 30px;
        border:1px solid rgba(0,0,0,0.18);
    }
    .goods-inner .inputDivBox{
        width:100%;
        margin-top:40px;
        pointer-events:none;
    }
    .goods-detail-btn{
        display:flex;
        justify-content:center;
        align-items:flex-end;
        height:100%;
        margin-bottom:20px;
    }

    .goods-detail-btn .btn{
        margin-right:20px;
    }
    #goods-detail-status{
        margin-top:40px;
    }
</style>

<!-- 테이블 선택 시 나오는 모달 -->
<div class="modal fade" id="goods-row-modal" tabindex="-1" data-bs-backdrop = "static" aria-labelledby="modalArea" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5>제품 상세 관리</h5>
            </div>
     <!-- Modal body -->
            <div class="modal-body">
                <div class="row">
                    <div id="goods-detail">
                        <div class="goods-contents">
                            <div class="goods-inner">
                                <div class = "inputDivBox">
                                	<input class = "inputBox" type="text" value="1882" required>
                                	<label class = "inputLabelTag">제품 번호</label>
                                	<span class = "inputSpanTag"></span>
                                </div>
                                <div class = "inputDivBox">
                                	<input class = "inputBox" type="text" required>
                                	<label class = "inputLabelTag">제품 이름</label>
                                	<span class = "inputSpanTag"></span>
                                </div>
                                <div class = "inputDivBox">
                                	<input class = "inputBox" type="text" required>
                                	<label class = "inputLabelTag">제품 수량</label>
                                	<span class = "inputSpanTag"></span>
                                </div>
                                <div class = "inputDivBox">
                                	<input class = "inputBox" type="text" required>
                                	<label class = "inputLabelTag">제품 단위</label>
                                	<span class = "inputSpanTag"></span>
                                </div>
                            </div>
                            <div class="goods-inner">
                                <div id="goods-detail-status">
                                    <div class="sel sel--black-panther">
                                        <select name="select-profession" id="select-status">
                                            <option disabled>상태</option>
                                            <option value="3">전체</option>
                                            <option value="0">미판매</option>
                                            <option value="1">판매중</option>
                                            <option value="2">품절</option>
                                        </select>
                                    </div>
                                </div>
                                <div class = "inputDivBox">
                                    <input class = "inputBox" type="text" required>
                                    <label class = "inputLabelTag">제품 수량</label>
                                    <span class = "inputSpanTag"></span>
                                </div>
                                <div class="goods-detail-btn">
                                    <div id="goods-detail-btnmenu">
                                        <button class="btn btn-sm btn-secondary ml-2 mt-2" onclick="goodsUpdate()">수정</button>
                                        <button class="btn btn-sm btn-danger ml-2 mt-2">삭제</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
    </div>
            <!-- Modal footer -->
            <div class="footer">
                <div class="float-right" style="text-align: right;">

                    <button type="button" class="btn mr-2 mb-2" id="goodsCloseBtn">닫기</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
function goodsUpdate(){



    var goodsBtnUL = $("#goods-detail-btnmenu");
    str="<button class='btn btn-sm btn-dark ml-2 mt-2'>수정</button>";
    str+="<button class='btn btn-sm btn-warning ml-2 mt-2' onclick='resetUpdate()'>취소</button>";
    goodsBtnUL.html(str);
}

function resetUpdate(){
    var goodsBtnUL = $("#goods-detail-btnmenu");
    str="<button class='btn btn-sm btn-secondary ml-2 mt-2' onclick='goodsUpdate()'>수정</button>";
    str+="<button class='btn btn-sm btn-danger ml-2 mt-2'>삭제</button>";
    goodsBtnUL.html(str);
}

</script>