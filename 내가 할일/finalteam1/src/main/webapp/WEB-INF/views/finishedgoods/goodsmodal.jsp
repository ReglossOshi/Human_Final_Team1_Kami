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
        height:500px;
    }
</style>

<!-- 테이블 선택 시 나오는 모달 -->
<div class="modal fade" id="goods-row-modal" tabindex="-1" data-bs-backdrop = "static" aria-labelledby="modalArea" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5>제품 상세 내용</h5>
            </div>
     <!-- Modal body -->
            <div class="modal-body">
                <div class="row">

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