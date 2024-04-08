<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

<button class="btn btn-sm btn-secondary ml-2 mt-2 modalBtn" id="testModal"></button>

<!-- Modal 공간 -->
<div class="modal fade" id="modalArea1" tabindex="-1" data-bs-backdrop = "static" aria-labelledby="modalArea" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5>모달 제목</h5>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div>
                        <div class = "inputDivBox">
                        	<input class = "inputBox" type="text" required>
                        	<label class = "inputLabelTag">Name</label>
                        	<span class = "inputSpanTag"></span>
                        </div>
                        <div class = "inputDivBox">
                        	<input class = "inputBox" type="text" required>
                        	<label class = "inputLabelTag">Name</label>
                        	<span class = "inputSpanTag"></span>
                        </div>
                        <div class = "inputDivBox">
                        	<input class = "inputBox" type="text" required>
                        	<label class = "inputLabelTag">Name</label>
                        	<span class = "inputSpanTag"></span>
                        </div>
                    </div>
                    <button class="btn btn-sm btn-secondary ml-2 mt-2 modalBtn2" id="testModal2"></button>
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

<!-- Modal 공간 -->
<div class="modal fade" id="modalArea2" tabindex="-1" data-bs-backdrop = "static" aria-labelledby="modalArea" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5>모달 제목</h5>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class = "inputDivBox">
                    	<input class = "inputBox" type="text" required>
                    	<label class = "inputLabelTag">Name</label>
                    	<span class = "inputSpanTag"></span>
                    </div>
                    <div class = "inputDivBox">
                    	<input class = "inputBox" type="text" required>
                    	<label class = "inputLabelTag">Name</label>
                    	<span class = "inputSpanTag"></span>
                    </div>
                    <div class = "inputDivBox">
                    	<input class = "inputBox" type="text" required>
                    	<label class = "inputLabelTag">Name</label>
                    	<span class = "inputSpanTag"></span>
                    </div>
                    화면 두번째
                </div>
            </div>
            <!-- Modal footer -->
            <div class="footer">
                <div class="float-right" style="text-align: right;">

                    <button type="button" class="btn mr-2 mb-2" id="closeBtn2">닫기</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(function(){
        // 모달 오픈 (show)
        $(document).on('click', '.modalBtn', function(){
            $('#modalArea1').modal('show');
        });

        // 모달 종료 (hide)
        $(document).on('click', '.modalBtn2', function(){
            $('#modalArea1').modal('hide');
        });

        // 모달 종료 (hide)
        $(document).on('click', '#closeBtn', function(){
            $('#modalArea1').modal('hide');
        });
    });

    $(function(){
        // 모달 오픈 (show)
        $(document).on('click', '.modalBtn2', function(){
            $('#modalArea2').modal('show');
        });

        // 모달 종료 (hide)
        $(document).on('click', '#closeBtn2', function(){
            $('#modalArea2').modal('hide');
        });
    });

</script>

<%@ include file="../includes/footer.jsp" %>