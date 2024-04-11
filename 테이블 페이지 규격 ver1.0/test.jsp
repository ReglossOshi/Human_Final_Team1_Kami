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
            <div class="scroll"> <!-- 섹션 구간에 스크롤 지정 -->
                <div class="containerGoods">
                    <div class="containerdiv">
                        <div class="goodscontents">
                        <div class="title-name"><h1>제품 관리</h1></div> <!-- 제목 -->
<!-- 검색 및 추가하는 상단 구간 -->
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
<!-- 테이블 영역 -->
                        <div class="table-height">
                                    <table id="goods-table" class="rwd-table">
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
                                                           <td data-th="제품 상태"><c:choose><c:when test="${goods.finishedgoods_status == 0}">미판매</c:when><c:when test="${goods.finishedgoods_status == 1}">판매중</c:when><c:when test="${goods.finishedgoods_status == 2}">품절</c:when></c:choose></td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                        </div>
<!-- 페이징 보여지는 구간 -->
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
<!-- 2번째 섹션 -->
    <div class="section">
        <div>

        </div>
    </div>
<!-- 3번째 섹션  -->
    <div class="section">
        <div>
            컨텐츠 작성
        </div>
    </div>
</div>

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

<!-- 테이블 선택 시 나오는 모달 -->
<div class="modal fade" id="goods-row-modal" tabindex="-1" data-bs-backdrop = "static" aria-labelledby="modalArea" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5>모달 제목</h5>
            </div>
     <!-- Modal body -->
            <div class="modal-body">
                <div class="row">
    모달 내용
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





<script src="/resources/js/default/fullpage/jquery.fullpage.js"></script>
<script src="/resources/js/default/fullpage/scrolloverflow.js"></script>


<script>
document.title="완제품 관리"; //화면 위에 title 이름 변경

//특정 구간을 넘으면 검색 바 사라지는 로직
window.addEventListener("resize", function() {
    if(document.getElementsByClassName('containerdiv')[0].getBoundingClientRect().width<463){
        document.getElementsByClassName('goodstitle')[0].style.display="none";
    } else{
        document.getElementsByClassName('goodstitle')[0].style.display="flex";
    }
});



//모달 안에 select의 인덱스 값 가져오기
var checkindex = document.querySelectorAll('.modal-input .sel__box__options');
var modalindex;
checkindex.forEach((target, index) => target.addEventListener('click',function(){
    modalindex=index;
}));

const goodsInsert = document.getElementById('goods-insert-btn');


// 추가 선택 시 선택 되어 있는 값들 초기화
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

        // 1. 네비게이션 보이기 옆에 생기는 선택 버튼 허용
        navigation : true,

        // 2. 네비게이션 위치 지정 옆에 생기는 선택 버튼
        navigationPosition : 'right',

        // 3. 각 섹션의 배경색상 지정 (6자의 핵사코드 작성가능)
        sectionsColor : ['#E5DDC5', 'pink', 'gray'],

        // 스크롤 허용을 원하는 요소의 클래스
        scrollOverflow: true, //섹션 내용이 커지면 저절로 섹션 구간에 스크롤 생김

    });
});


//테이블 행 클릭 시 동작하는 구간
function rowClicked() {
    var table = document.getElementById('goods-table');
    var rowList = table.rows;

    for(i=1;i<rowList.length;i++){
        var row = rowList[i];
        var tdsNum = row.childElementCount;

        row.onclick = function(){
            return function(){
                goodsModal();
            };
        }(row);
    }
}
window.onload = rowClicked();

//테이블 행 클릭 시 화면에 나오는 모달
function goodsModal(){
    $('#goods-row-modal').modal('show');
}
//테이블 행 클릭 시 나온 모달 닫는 버튼
$(function(){
    // 모달 종료 (hide)
    $(document).on('click', '#goodsCloseBtn', function(){
        $('#goods-row-modal').modal('hide');
    });
})



// Ajax 값 넣는 부분
var goodsService = (function() {
    //제품 추가
    function update(goodsplus,callback,error){
        $.ajax({
            type:'put',
            url:'/replies/'+reply.rno,
            data:JSON.stringify(reply),
            contentType:"application/json; charset=utf-8",
            success:function(result,status,xhr){
                if(callback){
                    callback(result);
                }
            },
            error:function(xhr,status,er){
                if(error){
                    error(er);
                }
            }
        });
    }

    return {
        update: update
    };
})();

function goodsStatusChange(){
    goodsService.update(
        {
            rno:rno,
            bno:bnoValue,
            reply:text1
        }, function(result){
            alert("수정 완료");
        }
    );
}

</script>

<%@ include file="../includes/footer.jsp" %>