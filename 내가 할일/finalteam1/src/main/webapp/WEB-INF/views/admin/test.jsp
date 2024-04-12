<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
    .white{
        width:500px;
        height:500px;
        background-color:yellow;
        z-index:1;
    }
</style>

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

                <div class="white">

                </div>

                <div>
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
</script>

<%@ include file="../includes/footer.jsp" %>