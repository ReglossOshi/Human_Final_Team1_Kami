<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link href="/resources/css/default/fullpage/jquery.fullpage.css" rel="stylesheet" />

<style>
    .goods-modal{
        height:300px;
    }

    .rwd-table{
        margin:0;
        padding:0;
        text-align:left;
    }

    .containerdiv{
        display:flex;
        flex-direction:column;
        justify-content:center;
        align-items:center;
        padding:30px;
        border:1px solid rgba(0,0,0,0.18);
        background-color:white;
        border-radius:10px;
        width:80%;
        height:auto;
    }
    .containerGoods{
        display:flex;
        justify-content:center;
        margin:10px;
        margin-bottom:100px;
        height:auto;
    }

    .title-name{
        display:flex;
        justify-content:center;
        align-items:center;
        width:100%;
    }

    .title-name, .modal-header, #closeBtn{
        font-family: 'PuradakGentleGothicR';
    }

    .goodstitle{
        display:flex;
        justify-content:space-between;
        align-items:center;
        width:100%;
        margin:20px 0;
        padding:10px;
        padding-top:30px;
        border:1px solid rgba(0,0,0,0.18);
    }

    .goodsfooter{
        display:flex;
        justify-content:center;
        align-items:center;
        margin-top:50px;
    }
    .table-height{
        height:auto;
    }

    .goods-btn{
        display:flex;
        justify-content:flex-end;
        align-items:center;
    }

    .select-div{
        display:flex;
        justify-content:space-between;
        align-items:center;
        width:100%;
    }
    .inputDivBox{
        margin:0;
        padding:0;
    }

    #search-input{
        width:200px;
        margin:0 20px;
    }

    .select-box{
        display:flex;
    }
    .rwd-table, .goodsfooter, .select-div{
        font-family: 'Pretendard-Regular';
    }

    .modal-input{
        margin-top:40px;
    }
    .modal-input:first-child{
        margin-top:20px;
    }

    .modal-input-box{
        border:1px solid rgba(0,0,0,0.18);
        padding:20px;
        width:50%;
    }

    .modal-input-box:nth-child(2){
        background-image:url('/resources/img/mainimg/chicken2.png');
        background-repeat:no-repeat;
        background-size:contain;
    }

    .goods-insert{
        display:flex;
    }

    .float-right{
        margin-top:20px;
    }

    #goods-status .sel{
        width:90px;
    }
</style>

<div class="fullpage">
    <div class="section">
        <div>
            <div class="scroll">
                <div class="containerGoods">
                    <div class="containerdiv">
                        <div class="goodscontents">
                        <div class="title-name"><h1>제품 관리</h1></div>
                        <div class="goodstitle">
                            <div class="select-div">
                                <div class="select-box">
                                    <div id="goods-status">
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
                                    <div id="search-input" class = "inputDivBox">
                                        <input class = "inputBox" type="text" required>
                                        <label class = "inputLabelTag">검색</label>
                                        <span class = "inputSpanTag"></span>
                                    </div>
                                    <button class="btn btn-sm btn-secondary ml-2 mt-2">검색</button>
                                </div>
                                <div class="goods-btn">
                                    <button class="btn btn-sm btn-secondary ml-2 mt-2 modalBtn" id="testModal">추가</button>
                                </div>
                            </div>
                        </div>
                        <div class="table-height">
                                    <table class="rwd-table">
                                                <tbody>
                                                    <tr>
                                                        <th>번호</th>
                                                        <th>제품 번호</th>
                                                        <th>제품 이름</th>
                                                        <th>제품 수량</th>
                                                        <th>제품 가격</th>
                                                        <th>제품 단위</th>
                                                        <th>제품 상태</th>
                                                    </tr>
    
                                                    <c:forEach items="${goodslist}" var="goods" varStatus="status">
                                                        <tr>
                                                           <td data-th="번호"><c:out value="${status.count}" /></td>
                                                           <td data-th="제품 번호"><c:out value="${goods.finishedgoods_id}" /></td>
                                                           <td data-th="제품 이름"><c:out value="${goods.finishedgoods_name}" /></td>
                                                           <td data-th="제품 수량"><c:out value="${goods.finishedgoods_quantity}" /></td>
                                                           <td data-th="제품 가격"><c:out value="${goods.finishedgoods_price}" /></td>
                                                           <td data-th="제품 단위"><c:out value="${goods.quantity_units}" /></td>
                                                           <td data-th="제품 상태">
                                                                <c:choose>
                                                                    <c:when test="${goods.finishedgoods_status == 0}">
                                                                        미판매
                                                                    </c:when>
                                                                    <c:when test="${goods.finishedgoods_status == 1}">
                                                                        판매중
                                                                    </c:when>
                                                                    <c:when test="${goods.finishedgoods_status == 2}">
                                                                        품절
                                                                    </c:when>
                                                                </c:choose>
                                                           </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                        </div>
                                <div class="goodsfooter">
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
                                            <li class="pagelist">
                                                <button class="pagebtn pagenum">4</button>
                                            </li>
                                            <li class="pagelist">
                                                <button class="pagebtn pagenum">5</button>
                                            </li>
    
                                            <li class="pagelist"><button class="pagebtn next" title="next page">&#10095;</button></li><!--다음버튼-->
                                        </ul>
                                    </div>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="section">
        <div>

        </div>
    </div>
    <div class="section">
        <div>
            컨텐츠 작성
        </div>
    </div>
</div>

<!-- Modal 공간 -->
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







<script src="/resources/js/default/fullpage/jquery.fullpage.js"></script>
<script src="/resources/js/default/fullpage/scrolloverflow.js"></script>


<script>
document.title="완제품 관리";
window.addEventListener("resize", function() {
    if(document.getElementsByClassName('containerdiv')[0].getBoundingClientRect().width<463){
        document.getElementsByClassName('goodstitle')[0].style.display="none";
    } else{
        document.getElementsByClassName('goodstitle')[0].style.display="flex";
    }
});


var checkindex = document.querySelectorAll('.modal-input .sel__box__options');
var modalindex;
checkindex.forEach((target, index) => target.addEventListener('click',function(){
    modalindex=index;
}));

const goodsInsert = document.getElementById('goods-insert-btn');

goodsInsert.addEventListener('click', function(){
    var goodsPrice = document.getElementById('goods-price');
    const goodsInsert = document.getElementById('goods-insert');
    var option = goodsInsert.options[goodsInsert.selectedIndex];
    if(modalindex==null){
        modalindex=0;
    }
    document.querySelectorAll('.modal-input .sel__box__options')[modalindex].classList.remove('selected');
    document.querySelectorAll('.modal-input .sel__placeholder')[0].textContent="제품 이름";


    goodsInsert.options[0].selected = true;
    goodsPrice.value=null;
});

$(function() {
    var page = $('.fullpage').fullpage({
        menu:'.sb-topnav',
        anchors: ['firstPage', 'secondPage', '3rdPage'],

        // 1. 네비게이션 보이기
        navigation : true,

        // 2. 네비게이션 위치 지정
        navigationPosition : 'right',

        // 3. 각 섹션의 배경색상 지정 (6자의 핵사코드 작성가능)
        sectionsColor : ['#E5DDC5', 'pink', 'gray'],



        // 스크롤 허용을 원하는 요소의 클래스
        scrollOverflow: true,
        scrollOverflowReset: true,

    });
});
</script>

<%@ include file="../includes/footer.jsp" %>