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

    .title-name, .modal-header, .float-right{
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
    .inputBox{
    }

    #search-input{
        width:200px;
        margin: 0 20px;
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

    .modal-input .inputDivBox{
        width:100%;
    }

    #selectbox .sel{
        width:100%;
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

    #goods-table{
        user-select:none;
    }
    #goods-table td{
        cursor:pointer;
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
                                        <input id="search-goods" class = "inputBox" type="text" required>
                                        <label class = "inputLabelTag">검색</label>
                                        <span class = "inputSpanTag"></span>
                                    </div>
                                    <button class="btn btn-sm btn-secondary ml-2 mt-2" onclick="showGoodsList(1)">검색</button>
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

<!-- 모달 창 추가 -->
<%@ include file="../finishedgoods/goodsmodal.jsp" %>


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

    var name = option.text;
    var price = goodsPrice.value;

    goodsStatusChange(name, price);

    var rowIndex = document.getElementById('goods-table').rows;

    for(i=1;i<rowIndex.length;i++){
        var selectName = document.getElementById('goods-table').getElementsByTagName("tr")[i].getElementsByTagName("td")[2].innerHTML;
        var changePrice = document.getElementById('goods-table').getElementsByTagName("tr")[i].getElementsByTagName("td")[4];
        var changeStatus = document.getElementById('goods-table').getElementsByTagName("tr")[i].getElementsByTagName("td")[6];

        if(name==selectName){
            changePrice.innerHTML=price;
            changeStatus.innerHTML='판매중';
        }
    }

    document.querySelectorAll('.modal-input .sel__box__options')[modalindex].remove();
    document.querySelectorAll('.modal-input .sel__placeholder')[0].textContent="제품 이름";

    goodsInsert.options[0].selected = true;
    option=null;
    goodsPrice.value=null;
    $('#modalArea').modal('hide');
});






// Ajax 값 넣는 부분
var goodsService = (function() {
    //제품 추가
    function update(goodsplus,callback,error){
        $.ajax({
            type:'put',
            url:'/goodsrest/name/'+goodsplus.name+'/price/'+goodsplus.price,
            data:JSON.stringify(goodsplus),
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

    var pageSizeNum=3;

    //상품 조회
    function getGoods(goodsSearch, callback, error){
        var search = goodsSearch.search || "없음";
        var status = goodsSearch.status;
        var page = goodsSearch.page || 1;
        $.getJSON("/goodsrest/search/"+search+"/status/"+status+"/page/"+page+"/pagesize/"+pageSizeNum,
            function(data){
                if(callback){
                    callback(data);
                }
        }).fail(function(xhr,status,err){
            if(error){
                error();
            }
        });
    }

    function maxPage(goodsSearch, callback, error){
        var search = goodsSearch.search || "없음";
        var status = goodsSearch.status;

        $.getJSON("/goodsrest/"+search+"/"+status+"/pageSize/"+pageSizeNum,
            function(data){
                if(callback){
                    callback(data);
                }
        }).fail(function(xhr,status,err){
            if(error){
                error();
            }
        });
    }

    return {
        update: update,
        getGoods:getGoods,
        maxPage:maxPage
    };
})();

function goodsStatusChange(name, price){
    goodsService.update(
        {
            name:name,
            price:price
        }, function(result){
            alert("수정 완료");
        }
    );
}

var goodsTableUL = $("#goods-table tbody");
function showGoodsList(pageNum) {
    var goodsStatus = document.getElementById('select-status');
    var goodsSearch = document.getElementById('search-goods');
    var option = goodsStatus.options[goodsStatus.selectedIndex];
    var status = option.value;
    var search = goodsSearch.value;

    goodsService.getGoods(
    { status: status, search: search , page: pageNum || 1 },
        function(list) {


            var str = "";
            str+="<tr>";
            str+="<th>번호</th>";
            str+="<th>제품 번호</th>";
            str+="<th>제품 이름</th>";
            str+="<th>제품 수량</th>";
            str+="<th>제품 가격</th>";
            str+="<th>제품 단위</th>";
            str+="<th>제품 상태</th>";
            str+="</tr>";

            if(list == null || list.length == 0){
                goodsTableUL.html(str);
                return;
            }

            for(var i = 0, len = list.length || 0; i < len; i++) {
                str += "<tr onclick='rowClicked()'>";
                str += "<td data-th='번호'>"+list[i].rownum+"</td>";
                str += "<td data-th='제품 번호'>"+list[i].finishedgoods_id+"</td>";
                str += "<td data-th='제품 이름'>"+list[i].finishedgoods_name+"</td>";
                str += "<td data-th='제품 수량'>"+list[i].finishedgoods_quantity+"</td>";
                str += "<td data-th='제품 가격'>"+list[i].finishedgoods_price+"</td>";
                str += "<td data-th='제품 단위'>"+list[i].quantity_units+"</td>";
                if(list[i].finishedgoods_status==0){
                    str += "<td data-th='제품 상태'>미판매</td>";
                } else if(list[i].finishedgoods_status==1){
                    str += "<td data-th='제품 상태'>판매중</td>";
                } else if(list[i].finishedgoods_status==2){
                    str += "<td data-th='제품 상태'>품절</td>";
                }
                str += "</tr>";
            }
            goodsTableUL.html(str);
            createPage(search, status, pageNum);
        }
    );
}
showGoodsList(1);

function createPage(search,status,pageNum){
    var pageUL = $(".pagination");
    goodsService.maxPage(
        { status: status, search: search},
        function(list) {
            var str2="";
            var prevInt;
            if(pageNum==1){
                prevInt=1;
            } else{
                prevInt=(pageNum-1);
            }
            var currentPageSize = 5;
            var currentPageList = Math.ceil(pageNum/currentPageSize);
            var currentMaxPage = currentPageList*currentPageSize;

            var currentMaxPageReal;

            if(currentMaxPage>=list){
                currentMaxPageReal=list;
            }
            var currentMinPage = currentMaxPage-(currentPageSize-1);

            str2+="<li class='pagelist'><button class='pagebtn prev' onclick='showGoodsList("+prevInt+")'>&#10094;</button></li>";
            for(var i=currentMinPage; i <= currentMaxPageReal; i++) {
                if(i==pageNum){
                    str2+="<li class='pagelist'><button class='pagebtn pagenum active' onclick='showGoodsList("+i+")'>"+i+"</button></li>";
                } else {
                    str2+="<li class='pagelist'><button class='pagebtn pagenum' onclick='showGoodsList("+i+")'>"+i+"</button></li>";
                }
            }
            var nextInt;
            if(pageNum==list){
                nextInt=list;
            } else{
                nextInt=(pageNum+1);
            }
            str2+="<li class='pagelist'><button class='pagebtn next' title='next page' onclick='showGoodsList("+nextInt+")'>&#10095;</button></li>";
            pageUL.html(str2);

        }
    );
}


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
//window.onload = rowClicked();

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
</script>

<%@ include file="../includes/footer.jsp" %>