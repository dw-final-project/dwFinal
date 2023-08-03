<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css" rel="stylesheet">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div style="margin: 1em;">
	<section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-9" style="max-width: ;">
				<div class="card card-outline card-info">
					
					<div class="card-header">
						<h3 class="card-title p-1">쇼핑몰 등록</h3>
					</div>
					
					<div class="card-body pad">
						<form role="form" method="post" action="regist.do" name="registForm">
							<div class="form-group col-sm-12 row">
								<label for="sp_no" class="col-sm-3">생산공정 코드</label>
								<input type="text" id="pc_code" name="pc_code" class="form-control col-sm-9" placeholder="코드는 자동으로 입력됩니다." readonly>
							</div>
							<div class="form-group col-sm-12 row">
								<label for="s_name" class="col-sm-3">생산공정 이름</label>
								<input type="text" id="pc_name" name="pc_name" class="form-control col-sm-9" value="" placeholder="공정명을 입력하세요.">
							</div>
							<div class="form-group col-sm-12 row">
								<label for="pc_order" class="col-sm-3">순번</label>
								<input type="text" id="pc_order" name="pc_order" class="form-control col-sm-9" value="" placeholder="쇼핑몰명을 입력하세요.">
							</div>
							<div class="form-group col-sm-12 row">
								<label for="pc_content" class="col-sm-3">내용</label>
								<input type="text" id="pc_content" name="pc_content" class="form-control col-sm-9" value="" placeholder="해당 공정에 대한 내용을 입력하세요.">
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