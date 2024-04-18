<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
    #inven-status .sel{
        width:90px;
    }
</style>

<div class="scroll"> <!-- 섹션 구간에 스크롤 지정 -->
    <div class="containerGoods">
        <div class="containerdiv">
            <div class="goodscontents">
                <div class="title-name"><h1>제품 재고 현황</h1></div> <!-- 제목 -->
                <!-- 검색 및 추가하는 상단 구간 -->
                <div class="goodstitle">
                    <div class="select-div">
                        <div class="select-box">
                            <div id="inven-status">
                                <div class="sel sel--black-panther">
                                    <select name="select-profession" id="select-status">
                                        <option disabled>상태</option>
                                        <option value="3">전체</option>
                                        <option value="0">입고</option>
                                        <option value="1">출고</option>
                                    </select>
                                </div>
                            </div>
                            <div class = "inputDivBox">
                                <input id="search-inven" class = "inputBox" type="text" required>
                                <label class = "inputLabelTag">검색</label>
                                <span class = "inputSpanTag"></span>
                            </div>
                            <button class="btn btn-sm btn-secondary ml-2 mt-2" onclick="">검색</button>
                        </div>
                        <div class="goods-btn">
                            <button class="btn btn-sm btn-secondary ml-2 mt-2" id="goods-inven-release" onclick="invenGoodsList()">출고</button>
                        </div>
                    </div>
                </div>
                <!-- 테이블 영역 -->
                <div class="table-height">
                    <table id="goods-inven-table" class="rwd-table">
                        <tbody>
                            <tr>
                                <th>재고 번호</th>
                                <th>재고 구분</th>
                                <th>제품 번호</th>
                                <th>제품 이름</th>
                                <th>수량</th>
                                <th>적재 창고</th>
                                <th>재고 날짜</th>
                            </tr>
                            <tr>
                                <td>130000</td>
                                <td>출고</td>
                                <td>12000</td>
                                <td>양념 치킨</td>
                                <td>200</td>
                                <td>(주)창구식품</td>
                                <td>2024-04-16</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- 페이징 보여지는 구간 -->
                <div class="goodsfooter">
                    <div class="pagination__wrapper">
                        <ul class="pagination sectionTwoPage">

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
    $(document).on('click', '#goods-inven-release', function(){
        $('#inven-modal').modal('show');
    });

    // 모달 종료 (hide)
    $(document).on('click', '#invenCloseBtn', function(){
        $('#inven-modal').modal('hide');
    });
});
</script>