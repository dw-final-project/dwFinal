<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css" rel="stylesheet">

<div style="min-height: 800px;">
	<%-- <jsp:include page="/WEB-INF/views/content_header.jsp">
		<jsp:param value="자유게시판" name="subject"/>
		<jsp:param value="등록" name="item"/>
	</jsp:include> --%>
	
	<section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-9" style="max-width: 950px;">
				<div class="card card-outline card-info">
					<div class="card-header">
						<h3 class="card-title p-1">주문 등록</h3>
					</div>
					<div class="card-body pad">
						<form role="form" method="post" action="regist.do" name="registForm">
							<div class="form-group col-sm-12 row">
								<label for="pc_no" class="col-sm-4">주문 번호</label>
								<input type="text" id="pc_no" name="pc_no" class="form-control col-sm-8" placeholder="주문번호를 입력하세요.">
							</div>
							<div class="form-group col-sm-12 row" >
								<label for="pc_name" class="col-sm-4">상품 코드</label>
								<input type="text" id="pc_name" name="pc_name" class="form-control col-sm-8" value="" placeholder="상품코드를 입력하세요.">
							</div>
							<div class="form-group col-sm-12 row">
								<label for="pc_name" class="col-sm-4">수취인 이름</label>
								<input type="text" id="pc_name" name="pc_name" class="form-control col-sm-8" value="" placeholder="수취인이름을 입력하세요.">
							</div>
							<div class="form-group col-sm-12 row">
								<label for="pc_name" class="col-sm-4">수취인 연락처</label>
								<input type="text" id="pc_name" name="pc_name" class="form-control col-sm-8" value="" placeholder="수취인연락처를 입력하세요.">
							</div>
							<div class="form-group col-sm-12 row">
								<label for="pc_name" class="col-sm-4">주소</label>
								<input type="text" id="pc_name" name="pc_name" class="form-control col-sm-8" value="" placeholder="주소를 입력하세요.">
							</div>
							<div class="form-group col-sm-12 row">
								<label for="pc_name" class="col-sm-4">주문수량</label>
								<input type="text" id="pc_name" name="pc_name" class="form-control col-sm-8" value="" placeholder="주문수량을 입력하세요.">
							</div>
							<div class="form-group col-sm-12 row">
								<label for="pc_name" class="col-sm-4">주문일</label>
								<input type="text" id="pc_name" name="pc_name" class="form-control col-sm-8" value="" placeholder="주문일을 입력하세요.">
							</div>
							<div class="form-group col-sm-12 row">
								<label for="pc_name" class="col-sm-4">배송방법</label>
								<input type="text" id="pc_name" name="pc_name" class="form-control col-sm-8" value="" placeholder="배송방법을 입력하세요.">
							</div>
							<div class="form-group col-sm-12 row">
								<label for="pc_name" class="col-sm-4">배송요청사항</label>
								<input type="text" id="pc_name" name="pc_name" class="form-control col-sm-8" value="" placeholder="배송요청사항을 입력하세요.">
							</div>
							<div class="form-group col-sm-12 row">
								<label for="pc_name" class="col-sm-4">송장번호</label>
								<input type="text" id="pc_name" name="pc_name" class="form-control col-sm-8" value="" placeholder="송장번호를 입력하세요.">
							</div>
							<div class="form-group col-sm-12 row">
								<label for="pc_name" class="col-sm-4">배송비</label>
								<input type="text" id="pc_name" name="pc_name" class="form-control col-sm-8" value="" placeholder="배송비를 입력하세요.">
							</div>
							<div class="form-group col-sm-12 row">
								<label for="pc_name" class="col-sm-4">배송시작일</label>
								<input type="text" id="pc_name" name="pc_name" class="form-control col-sm-8" value="" placeholder="배송시작일을 입력하세요.">
							</div>
							<div class="form-group col-sm-12 row">
								<label for="pc_name" class="col-sm-4">배송종료일</label>
								<input type="text" id="pc_name" name="pc_name" class="form-control col-sm-8" value="" placeholder="배송종료일을 입력하세요.">
							</div>
							<div class="form-group col-sm-12 row">
								<label for="pc_name" class="col-sm-4">실패사유</label>
								<input type="text" id="pc_name" name="pc_name" class="form-control col-sm-8" value="" placeholder="실패사유를 입력하세요.">
							</div>
							<div class="form-group col-sm-12 row">
								<label for="pc_name" class="col-sm-4">진행상태</label>
								<input type="text" id="pc_name" name="pc_name" class="form-control col-sm-8" value="" placeholder="진행상태를 입력하세요.">
							</div>
						</form>
					</div>
					<div class="card-footer card-tools">
						<button type="button" class="btn btn-primary" id="registBtn" >등 록</button>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-warning" id="cancelBtn">취 소</button>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>

<script>
	window.onload = function(){
		/* SmartEditor_summernote($('#content')); */
		
		// 등록버튼 클릭
		$('#registBtn').on('click', function() {
			let form = $('form[role="form"]');
			
			if($('#pc_no').val() == "") {
				alert("제목을 입력하시게..");
				return;
			}
			
			if($('#pc_order').length > 1000){
				alert("글자수가 100자를 초과할 수 없습니다.");
				return;
			}
			
			form.submit();
		});
		
		// 취소버튼 클릭
		$('#cancelBtn').on('click', function() {
			window.opener.location.href="list.do" 	// 윈도우 창을 띄운 부모 페이지를 list.do로 향하게 한다.
			window.close();							// 윈도우 창을 닫는다.
		});
	}
</script>

<script src="<%= request.getContextPath()%>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>