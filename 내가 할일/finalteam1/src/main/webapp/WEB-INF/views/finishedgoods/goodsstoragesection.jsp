<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="scroll"> <!-- 섹션 구간에 스크롤 지정 -->
    <div class="containerGoods">
        <div class="containerdiv">
            <div class="goodscontents">
                <div class="title-name"><h1>창고 관리</h1></div> <!-- 제목 -->
                <!-- 검색 및 추가하는 상단 구간 -->
                <div class="goodstitle">
                    <div class="select-div">
                        <div class="select-box">
                            <div id="goods-status">
                                <div class="sel sel--black-panther">
                                    <select name="select-profession" id="select-status">
                                        <option disabled>상태</option>
                                        <option value="3">All</option>
                                        <option value="0">Empty</option>
                                        <option value="1">Full</option>
                                    </select>
                                </div>
                            </div>
                            <div id="search-input" class = "inputDivBox">
                                <input id="search-goods" class = "inputBox" type="text" required>
                                <label class = "inputLabelTag">검색</label>
                                <span class = "inputSpanTag"></span>
                            </div>
                            <button class="btn btn-sm btn-secondary ml-2 mt-2" onclick="showGoodsList(1)">검색</button>
                        </div>
                        <div class="goods-btn">
                            <button class="btn btn-sm btn-secondary ml-2 mt-2" id="createStorage">창고 추가</button>
                        </div>
                    </div>
                </div>
                <!-- 테이블 영역 -->
                <div class="table-height">
                    <table id="goods-inven-table" class="rwd-table">
                        <tbody>
                            <tr>
                                <th>창고 번호</th>
                                <th>창고 이름</th>
                                <th>창고 주소</th>
                                <th>적재량</th>
                                <th>수용량</th>
                            </tr>
                            <tr>
                                <td>120000</td>
                                <td>(주)창구식품</td>
                                <td>경기도 남양주시 진접읍 팔야리 592-1</td>
                                <td>0</td>
                                <td>500</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- 페이징 보여지는 구간 -->
                <div class="goodsfooter">
                    <div class="pagination__wrapper">
                        <ul class="pagination">

                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
$(function(){
    // 모달 오픈 (show)
    $(document).on('click', '#createStorage', function(){
        $('#storage-create-modal').modal('show');
        $('body').on('scroll touchmove mousewheel', function(event) {
            event.preventDefault();
            event.stopPropagation();
            return false;
        });
        setTimeout(function(){
            map.relayout();
        }, 4000);
    });

    // 모달 종료 (hide)
    $(document).on('click', '#storageClose', function(){
        $('#storage-create-modal').modal('hide');
        $('body').off('scroll touchmove mousewheel');
    });
});
</script>