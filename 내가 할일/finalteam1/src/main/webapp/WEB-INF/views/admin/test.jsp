<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<button class="btn btn-sm btn-info ml-2 mt-2 modalBtn" id="testModal">open?</button>
<!-- Modal 공간 -->
<div class="modal fade" id="modalArea" tabindex="-1" data-bs-backdrop = "static" aria-labelledby="modalArea" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5>모달 제목</h5>
            </div>
     <!-- Modal body -->
            <div class="modal-body">
                <div class="row">
    <div id="map" style="width:500px;height:400px;"></div>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=07f6a37e12a726e6176ae587829db214"></script>
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

<script>
    var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
    var options = { //지도를 생성할 때 필요한 기본 옵션
    	center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
    	level: 3 //지도의 레벨(확대, 축소 정도)
    };

    var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

    setTimeout(function(){
        map.relayout();
    }, 4000);
</script>
<%@ include file="../includes/footer.jsp" %>