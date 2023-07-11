<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css" rel="stylesheet">
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<div style="min-width: 420px; min-height: 800px; margin: 0 auto;">
	
	<section class="content container-fluid">
		<div class="row">	<!-- row Start -->
			<div class="col-md-12">
				<div class="card card-outline card-info">
					<div class="card-header">
						<h3 class="card-title">공정 상세보기</h3>
					</div>
					<div class="card-body">	<!-- card body Start -->
						<div class="form-group col-sm-12 row">
							<label for="title" class="col-sm-2">코드</label>
							<input type="text" class="col-sm-10 form-control" id="pc_code" name="pc_code" value="${process.pc_code }" readonly>
						</div>
						<div class="form-group col-sm-12 row">
							<label for="writer" class="col-sm-2">공정명</label>
							<input type="text" class="col-sm-10 form-control" id="pc_name" name="pc_name" value="${process.pc_name }" readonly>
						</div>
						<div class="form-group col-sm-12 row">
							<label for="regdate" class="col-sm-2">순번</label>
							<input type="text" class="col-sm-10 form-control" id="pc_order" name="pc_order" value="${process.pc_order }" readonly>
						</div>
					</div>	<!-- card body End -->
					<div class="card-footer">
						<button type="button" id="modifyBtn" class="btn btn-warning">수정</button>
						<button type="button" id="removeBtn" class="btn btn-danger">삭제</button>
						<button type="button" id="listBtn" class="btn btn-primary">닫기</button>
					</div>	<!-- card footer End -->
				</div>
			</div>
		</div>	<!-- row End -->
	</section>
</div>

<form role="form">
	<input type="hidden" name="pc_code" value="${process.pc_code }">
</form>

<script>
window.onload = function(){

	let formObj = $('form[role="form"]');

	$('button#modifyBtn').on('click', function(){
		formObj.attr({
			'action' : 'modifyForm.do',
			'method' : 'post' 
		});
		formObj.submit();
	});
	
	$('button#removeBtn').on('click', function(){
		if(confirm("정말 삭제하시겠습니까?")){
			formObj.attr({
				'action' : 'remove',
				'method' : 'post' 
			});
			formObj.submit();
		};
	});
	
	$('button#listBtn').on('click', function(){
		window.opener.location.reload(true);
		window.close();
	});
}
</script>

<%-- <%@ include file="reply_js.jsp" %> --%>
